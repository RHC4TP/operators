FROM quay.io/operator-framework/ansible-operator:v0.8.0

LABEL name="airgap operator" \
      vendor="RH" \
      version="v0.0.1" \
      release="1" \
      summary="operator for airgapped environment" \
      description="Test for an ansible operator for an airgapped environment"

COPY licenses /licenses
COPY watches.yaml ${HOME}/watches.yaml

COPY roles/ ${HOME}/roles/
