# etcd-helm
Sample etcd operator using environment variables for the image location


## Update your Helm operator

Make sure your Helm chart only references the values file for images. Each image should be a single value (it can't be split into repository and tag, for example).

      containers:
      - name: {{ template "etcd.fullname" . }}
        image: "{{ .Values.image.image }}"
        imagePullPolicy: "{{ .Values.image.pullPolicy }}"

A great way to find all the parts of your helm chart that will need to be updated is to recursively search your project's template folder for "image:"

    $ grep -r 'image:' ./helm-charts/etcd/templates/*
      ./helm-charts/etcd/templates/statefulset.yaml:        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"

Here we see that the image is split into two values - repository and tag. This won't work because we need to have a single variable to override. Replace this line with a new, single variable:

    $ grep -r 'image:' ./helm-charts/etcd/templates/*
      ./helm-charts/etcd/templates/statefulset.yaml:        image: "{{ .Values.image.image }}"

Don't forget to add this new value to your Values.yaml file!

## Override the image variable

In the watches.yaml file, add a field for overrideValues. It should contain each image value, should be set to an environment variable

    overrideValues:
      image.image: $RELATED_IMAGE_STATEFULSET

NOTE: the variable name MUST follow the pattern RELATED_IMAGE_<identifier>. There is code looking for that string in your operator.

Using operator-sdk version 0.14.0 or later, build the updated operator image.

Define the environment variables in the operator container and CSV. Declare the variable and set it to a default value.

          env:
            - name: RELATED_IMAGE_STATEFULSET
              value: k8s.gcr.io/etcd-amd64:3.2.26

## OTHER THINGS TO WATCH FOR

If you're in the habit of using the "latest" tag for your images, make sure you specify it. Because of how the automation is written that picks up these images, we need a tag to be present.

All images must be certified in the registry.connect.redhat.com registry (The examples are in quay, but that won't work for the marketplace).
