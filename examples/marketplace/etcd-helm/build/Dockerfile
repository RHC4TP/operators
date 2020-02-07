FROM quay.io/operator-framework/helm-operator:v0.13.0

LABEL name="etcd Operator" \
      vendor="name" \
      version="v0.0.1" \
      release="1" \
      summary="This is an example of an etcd helm operator." \
      description="This operator will deploy etcd to the cluster."

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
