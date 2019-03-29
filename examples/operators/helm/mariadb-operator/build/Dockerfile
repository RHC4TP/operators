FROM quay.io/operator-framework/helm-operator:v0.6.0

# Required OpenShift Labels
LABEL name="MariaDB Example Operator" \
      vendor="Red Hat Connect" \
      version="v0.0.4" \
      release="1" \
      summary="This is an example operator." \
      description="This operator will deploy a single instance of MariaDB with ephemeral storage."

# Required Licenses
COPY licenses /licenses

COPY helm-charts/ ${HOME}/helm-charts/
COPY watches.yaml ${HOME}/watches.yaml
