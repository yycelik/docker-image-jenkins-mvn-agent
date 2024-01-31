export REGISTRY_URL="docker-r.nexus.s3t.co"
export REGISTRY_USERNAME="xxx"
export REGISTRY_PASSWORD="xxx"

docker system prune

docker login -u $REGISTRY_USERNAME -p $REGISTRY_PASSWORD $REGISTRY_URL

docker build -t smart-mvn-agent:latest .

docker tag smart-mvn-agent:latest $REGISTRY_URL/smart-mvn-agent:latest

docker push $REGISTRY_URL/smart-mvn-agent:latest
