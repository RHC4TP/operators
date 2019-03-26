# This document is a guide to prepare you for Operator Image Certification.

Prior to pushing your operator container image, please make sure that you have completed these tasks.

- [ ] Your image must use a Red Hat base image variant (RHEL7, UBI)
- [ ] All required tags must be found within the Dockerfile
- [ ] You must have a `licenses` directory found within the root of your project


[Here]() is an example of an operator that will pass image certification. If your project follows the same format/layout, it should pass certification.


## Dockerfile for a Helm Operator

```bash
FROM quay.io/operator-framework/helm-operator:v0.6.0

### Required OpenShift Labels
LABEL name="Memcached Operator" \
      vendor="Awesome Tech LLC" \
      version="v0.0.1" \
      release="3" \
      summary="This is an example operator." \
      description="This operator will deploy 3 instances of memcached to the cluster."

# Required Licenses
COPY licenses /licenses

COPY helm-charts/ ${HOME}/helm-charts/
COPY watches.yaml ${HOME}/watches.yaml

```

## Dockerfile for an Ansible Operator
```bash
FROM quay.io/operator-framework/ansible-operator:v0.6.0

### Required OpenShift Labels
/ContainerApplicationGenericLabels#####
LABEL name="Memcached Operator" \
      vendor="Awesome Tech LLC" \
      version="v0.0.1" \
      release="3" \
      summary="This is an example operator." \
      description="This operator will deploy 3 instances of memcached to the cluster."

# Required Licenses
COPY licenses /licenses

COPY helm-charts/ ${HOME}/helm-charts/
COPY watches.yaml ${HOME}/watches.yaml


```


## Required Tags
