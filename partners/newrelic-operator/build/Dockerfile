FROM quay.io/operator-framework/helm-operator:v0.7.0
LABEL name="NewRelic Operator" \
      vendor="NewRelic" \
      version="v0.0.2" \
      release="2" \
      summary="This is the newrelic operator." \
      description="This is a basic NewRelic operator."

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
