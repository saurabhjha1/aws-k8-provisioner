The script only works on ubuntu/macosx and tested with ubuntu 22.04/sonoma

* create conda/py env and activate it
```shell
conda create -n aws python=3.11
conda activate aws
```

* update variables to point to this environment (`shell which python`) and modify the line to  

    ansible_python_interpreter: "/home/\<username\>/anaconda3/envs/aws/bin/python"
* modify vars and secret.yaml file. You need to create secret.yaml file by `shell mv secret.yaml.example secret.yaml`
* Install ansible
```shell
ansible-galaxy collection install amazon.aws
```

* install python libraries
```shell
python -m pip install -r requirements.txt
```

Makefile help
====
run make with following options

* configure_localmachine -- [onetime] configures the localmachine to run this repository
* configure_aws_access -- [onetime] configure aws creddentials
* create -- creates the cluster
* delete -- deletes the clister
* destroy_all_clusters -- destroys all clusters stored in s3 bucket
* get_kcfg -- gets the kubeconfig file in /tmp/<cluster-name>
* list_clusters -- lists the clusters stored in s3
* start/suspend/resize -- resize, start or suspend the cluster
* install_istio_monitoring -- install istio/prometheus/cadvisor monitoring
* help   - Display this help information
