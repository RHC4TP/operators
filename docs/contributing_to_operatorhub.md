# OperatorHub.io Community Operators

> **NOTE:** This guide is not yet complete.

## About
This guide is for anyone who would like to publish their Operator. As of now, here is the understood workflow from not having an operator to publishing your Operator onto [operatorhub.io](https://www.operatorhub.io/).

Steps:
* Build Operator
* Test Operator locally
* Clone the community repository
* Add your Operator to the community repository ()
* Create a pull request
* Wait for pull request to get merged.
* .....
* Profit

## Adding Your Operator

Adding your operator to operatorhub.io will require you to submit a PR with your Operator resources in a new directory named after your Operator within the `community-operators/` directory:

To begin, first clone this repository:

```bash
$ git clone https://github.com/operator-framework/community-operators.git
```
Create a new directory in `community-operators/` with your project name:

```bash
$ mkdir community-operators/my-operator/
```

Then, create a new branch and include the required project files:

```bash
# Create a new branch
$ git checkout -b my-operator
# Include your project files in your directory
$ ls community-operators/my-operator/
my-operator.v1.0.0.clusterserviceversion.yaml
my-operator-crd1.crd.yaml
my-operator-crd2.crd.yaml
my-operator.package.yaml

```
Finally, commit your work to your new branch. Go to the GitHub repository page and click on the "Pull Request" button in the repo header.

```bash
$ git commit -m "[community] Add my-operator"
$ git push origin my-operator
# Then go to the GitHub page and submit the pull request.
```
Please note that the directory name should match the name of your operator in it's package.yaml.

Each OperatorHub entry contains all of the Custom Resource Definitions (CRDs), access control rules and references to the container image needed to install and securely run your Operator, plus other info like a description of its features and supported Kubernetes versions. [Follow this guide to create an OLM-compatible CSV for your operator](https://github.com/operator-framework/operator-lifecycle-manager/blob/master/Documentation/design/building-your-csv.md), CRDs, and the package.yaml file for your operator.

An Operator's CSV must contain the annotations mentioned [here](https://github.com/operator-framework/community-operators/blob/master/docs/required-fields.md) for it to be displayed properly within the OperatorHub.io UI.


Finally, commit your files

```bash


```

## Updating your Operator

Similarly, to update your operator you need to submit a PR with any changes to your Operator resources. Within your CSV, add the additional `replaces: my-operator.v1.0.0` parameter which indicates that existing installations of your Operator may be upgraded seamlessly to the new version. It is encouraged to use continuous delivery to update your Operator often as new features are added and bugs are fixed.

[Read more about testing your Operator](https://github.com/operator-framework/community-operators/blob/master/docs/testing-operators.md)

## Future Automation

New Operators are reviewed manually by the maintainers to ensure that they contain all [required information][https://github.com/operator-framework/community-operators/blob/master/docs/required-fields.md]. In the near future, automation will be added to check for required values and run a suite of automated tests against a live cluster.

## Reporting Bugs

Report bugs using the project issue tracker.

[required-fields]: https://github.com/operator-framework/community-operators/blob/master/docs/required-fields.md
