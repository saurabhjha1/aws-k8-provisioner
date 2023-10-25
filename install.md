The script only works on ubuntu/macosx and tested with ubuntu 22.04/sonoma

* create conda/py env and activate it
```shell
conda create -n aws python=3.11
conda activate aws
```

* update variables to point to this environment and modify the line to  

    ansible_python_interpreter: "/home/\<username\>/anaconda3/envs/aws/bin/python"

* Install ansible
```shell
ansible-galaxy collection install amazon.aws
```

* install python libraries
```shell
python -m pip install -r requirements.txt
```

* **one time setup** set up the machine. Sets the localhost machine from which you plan to run aws-cli, kops and kubectl commands

```shell
ansible-playbook -i localhost, playbooks/configure_localmachine.yaml -K
```

* configure secret.yaml file by copying the secret.yaml.example file and filling in the values
```shell
mv playbooks/secret.yaml.example playbooks/secret.yaml
```
* **one time setup** configure aws user on the localhost machine.
```shell 
ansible-playbook -i localhost, playbooks/configure-aws-user-and-storage.yaml -K
```

* create a cluster
```shell
ansible-playbook -i localhost, playbooks/create-ec2-k8-cluster.yaml -K
```

* other commands can be launched similarly by running other playbooks such as list_clusters, destroy_all_clusters, delete_cluster, export_kubeconfig etc.
