FROM quay.io/operator-framework/helm-operator:v0.7.0
LABEL name="NewRelic Operator" \
      vendor="NewRelic" \
      version="v0.0.1" \
      release="1" \
      summary="This is an example operator." \
      description="This is a basic NewRelic operator."

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
