FROM quay.io/operator-framework/helm-operator:v0.7.0

LABEL name="nuodb/nuodb-ce-operator" \
      vendor="NuoDB, Inc." \
      version="v0.0.2" \
      release="1" \
      summary="NuoDB" \
      description="NuoDB is an elastic, relational database that is easy to set up and scale."

COPY licenses /licenses 

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
