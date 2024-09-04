# aws-k8-provisioner

Creates a K8 cluster using kOps on AWS. It uses ansbile script to automate the cluster creation and support some of the workflows that I generally run to execute my experiments. 

Steps were borrowed from:
https://aws.amazon.com/blogs/compute/kubernetes-clusters-aws-kops/

# Developer Guide
## Pre-requisites
1. Miniconda / Anaconda (or venv)
2. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) 

## Setup
This setup has been tested on MacOSX, Ubuntu and Fedora.

1. Install Ansible collection `amazon.aws`
```shell
ansible-galaxy collection install amazon.aws
```

2. Create Conda (or venv) virtual environment and activate it
```shell
conda create -n aws python=3.11
conda activate aws
```

3. Install Python dependencies
```shell
python -m pip install -r requirements.txt
```

4. Update the value associated with the key `ansible\_python\_interpreter` to point to this environment (`which python`)
```
    ansible\_python\_interpreter: "/home/\<username\>/anaconda3/envs/aws/bin/python"
```
6. Create `secret.yaml` file by running `cp secret.yaml.example secret.yaml` and update the values there-in.

7. To set up your local machine with the aws-cli, jq, kubectl and kops run
```shell
make configure_localmachine
```

7.Set up AWS credentials by running
```shell
make configure_aws_access
```
and enter the AWS access key ID and security access key when requested.

## Makefile help
Run make with following options

* configure\_localmachine -- [onetime] configures the localmachine to run this repository
* configure\_aws\_access -- [onetime] configure aws creddentials
* create -- creates the cluster
* delete -- deletes the clister
* destroy\_all\_clusters -- destroys all clusters stored in s3 bucket
* get\_kcfg -- gets the kubeconfig file in /tmp/<cluster-name>
* list\_clusters -- lists the clusters stored in s3
* start/suspend/resize -- resize, start or suspend the cluster
* install\_istio\_monitoring -- install istio/prometheus/cadvisor monitoring
* help   - Display this help information
