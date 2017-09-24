if [ -z "$CC_URL" ]; then
  echo no CC_URL set, use default http://web:8080
  export CC_URL=http://web:8080
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
  export CC_TEAM=main
fi

if [ -z "$CC_COMMAND" ]; then
  echo no CC_COMMAND set, exit
  exit
fi

if [ -z "$CC_OPTIONS" ]; then
  echo no CC_OPTIONS set, exit
  exit
fi

fly -t default login -c $CC_URL -u $CC_USER -p $CC_PASS -n $CC_TEAM
fly -t default  sync

if [ "$GIT_URL" ]; then
  echo start cloning git
  git clone $GIT_URL pipeline
fi

fly $CC_COMMAND -t default $CC_OPTIONS
