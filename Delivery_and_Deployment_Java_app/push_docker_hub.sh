tag=$(git describe --tags $(git rev-list --tags --max-count=1))

docker tag weslleyf/crud-java-login:$tag hub.docker.com/r/weslleyf/crud-java-login:$tag
docker push weslleyf/crud-java-login:$tag