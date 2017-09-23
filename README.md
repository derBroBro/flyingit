# Image to import git content to concourse
Fly and git is included. On a start, a connection to concourse will be build up, the code will be cloned and a given file will be imported.

## Example usage
```
docker run --rm --name fly --link=web -e CC_URL=http://web:8080 -e CC_USER=concourse -e CC_PASS=concourse -e GIT_URL=https://github.com/starkandwayne/concourse-tutorial.git -e CC_PIPELINE=test derbrobro/flyingit
```

## Parameters
|Variable|Description|
|---|---|
|CC_URL|Concourse URL|
|CC_USER|Concourse User|
|CC_PASS|Concourse Password|
|CC_PIPE_FILE|Concourse pipeline file|
|CC_CONFIG_FILE|Concourse config file|
|CC_PIPELINE|Concourse pipeline name|
|CC_TEAM|Concourse team name|
|GIT_URL|Git repo to clone|
