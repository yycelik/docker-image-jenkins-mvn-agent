# add nexus mvn-url as secret which we will use from setting.xml on build
kubectl create secret generic -n devops-tools jenkins-mvn-agent-env --from-literal=public=https://nexus.s3t.co/repository/maven-public/ --from-literal=release=https://nexus.s3t.co/repository/maven-releases/ --from-literal=snapshoot=https://nexus.s3t.co/repository/maven-snapshots/

# add nexus credentials as secret which we will use from setting.xml on build
kubectl create secret generic -n devops-tools jenkins-mvn-agent-nexus-secret --from-literal=username=xxxxxx --from-literal=password=xxxxxx