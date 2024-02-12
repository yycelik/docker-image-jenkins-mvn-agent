# info
	kaniko build image on kubernetes cluster
	
# step-1 kubernetes secrets
	create secret on kubernates cluster for private repository credentials and environment variables
	
	Windows: k8s-secret/create-secret.ps1
	Linux: k8s-secret/create-secret.sh

# step-2 build on Jenkins
	image info
	base image : jenkins/inbound-agent:latest
	installed apps : mvn, openjdk17, settings.xml
	
	
	create-secret.sh required on jenkins-mvn-agent. Setting.xml get parameters from that secret.