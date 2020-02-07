# airgapped-operator
POC for an ansible-based operator using env vars for images to be used in an airgapped environment

This is an example of a mongoDB k8s operator that
 1) uses Ansible
 2) passes an environment variable as the image used by the deployment
 
## Update your Ansible operator

Make sure your role is using enviroment variables for images instead of hard-coded or regular variables. If it's not, update it:

    containers:
    - name: mongodb
      image: "{{ 'dbImage' | quote }}"

Above you can see a reference to a image that's likely defined in either the CR or the role's defaults/main.yaml file. Instead, use Ansible's lookup module to reference an environment variable:

            containers:
            - name: mongodb
              image: "{{ lookup('env','RELATED_IMAGE_DB') | quote }}"

NOTE: Your environment variables need to follow the RELATED_IMAGE_<identifier> format, as there is code looking for this pattern.

Build your updated operator image.

Define the environment variables in the operator container. In the CSV and operator.yaml, declare the variable and set to a default value.

          env:
            - name: RELATED_IMAGE_DB
              value: "registry.access.redhat.com/rhscl/mongodb-36-rhel7:latest"
