fly -t main login -c $CC_URL -u $CC_USER -p $CC_PASS -n main
git clone $GIT_URL git_repo
fly set-pipeline -t main --config git_repo/$CC_CONFIG_FILE --pipeline $CC_PIPELINE --non-interactive
