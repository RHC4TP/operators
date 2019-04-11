FROM quay.io/operator-framework/helm-operator:v0.7.0 
LABEL name="Sematext Operator" \ 
      vendor="Sematext" \
      version="latest" \
      release="1.0" \
      summary="This is a test operator for Sematext" \
      description="This operator is from Sematext"

COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
