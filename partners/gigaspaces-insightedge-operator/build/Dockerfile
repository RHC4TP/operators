FROM quay.io/operator-framework/helm-operator:v0.7.0
LABEL name="InsightEdge Operator" \
      vendor="Gigaspaces" \
      version="v14.0.1" \
      release="1" \
      summary="This is an example operator" \
      description="This is a basic InsightEdge operator." 

# Required Licenses
COPY licenses /licenses 

COPY helm-charts/ ${HOME}/helm-charts/
COPY watches.yaml ${HOME}/watches.yaml
