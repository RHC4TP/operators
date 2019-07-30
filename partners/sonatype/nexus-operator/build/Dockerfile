FROM quay.io/operator-framework/ansible-operator:master

### Required OpenShift Labels
LABEL name="Nexus Operator" \
      vendor="RHSCL" \
      version="v0.0.1" \
      release="1" \
      summary="This is an example of a nexus ansible operator." \
      description="This operator will deploy nexus repository manager to the cluster."

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml

COPY roles/ ${HOME}/roles/
