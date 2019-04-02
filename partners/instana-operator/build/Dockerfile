FROM quay.io/operator-framework/helm-operator:v0.6.0

LABEL name="Instana Operator" \
      vendor="Red Hat Connect" \
      version="v0.0.2" \
      release="1" \
      summary="This is the instana-agent helm operator" \
      description="This operator will deploy the instana-agent helm chart borrowed from https://github.com/instana/instana-agent-helm-chart."

COPY licenses /licenses

COPY helm-charts/ ${HOME}/helm-charts/
COPY watches.yaml ${HOME}/watches.yaml
