kubectl create secret generic nexus-registry-cred -n devops-tools --from-file=.dockerconfigjson=config.json --type=kubernetes.io/dockerconfigjson