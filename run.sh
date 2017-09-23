if [ -z "$CC_URL" ]; then
  echo no CC_URL set, use default http://web:8080
  export CC_URL=http:/web:8080
fi

if [ -z "$CC_USER" ]; then
  echo no CC_USER set, use default "concourse"
  export CC_USER=concourse
fi

if [ -z "$CC_PASS" ]; then
  echo no CC_PASS set, use default "concourse"
  export CC_PASS=concourse
fi

if [ -z "$CC_TEAM" ]; then
  echo no CC_TEAM set, use default "main"
  export CC_USER=main
fi

if [ -z "$CC_CONFIG_FILE" ]; then
  echo no CC_CONFIG_FILE set, use default "config.yml"
  export CC_CONFIG_FILE=config.yml
fi

if [ -z "$CC_PIPE_FILE" ]; then
  echo no CC_PIPE_FILE set, use default "pipeline.yml"
  export CC_PIPE_FILE=pipeline.yml
fi

if [ -z "$CC_PIPELINE" ]; then
  echo no CC_PIPELINE set, use default "flyingit"
  export CC_PIPELINE=fylingit
fi

fly -t $CC_TEAM login -c $CC_URL -u $CC_USER -p $CC_PASS
fly -t  sync

if [ "$GIT_URL" ]; then
  echo start cloning git
  git clone $GIT_URL pipeline
fi

fly set-pipeline -t $CC_TEAM --config pipeline/$CC_PIPE_FILE --load-vars-from pipeline/$CC_CONFIG_FILE --pipeline $CC_PIPELINE --non-interactive
