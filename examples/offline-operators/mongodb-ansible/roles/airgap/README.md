MongoDB K8s Role
=========

A simple role for deploying an ephemeral instance of MongoDB to Kubernetes.
This role defaults to deploying MongoDB v3.6 from Red Hat Software Collections.
It uses the `k8s` module for Ansible, and can be used in an Ansible Operator.

Requirements
------------

* A Red Hat account for authentication to registry hosting the image (registry.redhat.io)
* The `k8s` modules requires the following python packages to run (for RHEL/CentOS/Fedora)
 * `python-kubernetes`
 * `python-openshift`
* It is *highly* recommended to change the default password values by providing the respective variables at role invocation
* You must have access (and an active login session) to a Kubernetes cluster to use this role.

Role Variables
--------------

This role supports the following variables, all of which have default values within the role:
* *mongodb_user* - username that will be used to authenticate (default: `exampleusr`)
* *mongodb_password* -  password that will be used to authenticate (default: REDACTED)
* *mongodb_database* - name of the database that will be instantiated (default: `exampledb`)
* *mongodb_admin_password* - password used to protect the admin account (default: REDACTED)
* *memory_limit* - memory limit imposed by kubernetes to the pod (default: `512Mi`)
* *name* - name to use for the created resources (default: `mongodb`)
* *namespace* - namespace where the resources will be created (default: `mongodb`)

NOTE: Neither Ansible Vault nor Kubernetes Secrets are currently utilized to secure the values of password variables. Consider this a security risk and proceed with caution.

Dependencies
------------

This role has no role dependencies

Example Playbook
----------------

The playbook should be run against `localhost` with `gather_facts` disabled (as this has no effect but to lengthen playbook run time). An example invocation is below (shown with optional variable overrides):
```
    - hosts: localhost
      gather_facts: no
      roles:
         - { role: jsm84.mongodb, mongodb_user: exampleusr, mongodb_password: examplepasswd, mongodb_database: exampledb, mongodb_admin_password: exampleadminpasswd, memory_limit: 1024Mi }
```
License
-------

BSD

Author Information
------------------

Josh Manning (@jsm84)

*Red Hat Partner Connect*: https://connect.redhat.com

*GitHub*: https://github.com/jsm84/mongodb-k8s-ansible-role
