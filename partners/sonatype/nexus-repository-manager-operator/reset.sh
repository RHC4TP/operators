oc delete nexus nexus-operator
oc delete deployment nexus-operator
git pull
operator-sdk build quay.io/dhoover103/repomgr-operator:v0.0.1
docker push quay.io/dhoover103/repomgr-operator:v0.0.1

