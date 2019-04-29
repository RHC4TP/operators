FROM quay.io/operator-framework/helm-operator:v0.7.0 
LABEL name="Sematext Operator" \ 
      vendor="Sematext" \
      version="latest" \
      release="1.0" \
      summary="Sematext Docker Agent - Simple logging and monitoring" \
      description="Sematext Agent is a modern, open-source, container-native metrics and log collection agent for Docker. It runs as a tiny container on every node and provides automatic collection and processing of container logs, metrics and events for all cluster nodes and all auto-discovered containers."

COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
