# Makefile to run Ansible playbooks

.PHONY: create delete 

help:
	@echo "Makefile commands:"
	@echo "configure_localmachine -- [onetime] configures the localmachine to run this repository"
	@echo "configure_aws_access -- [onetime] configure aws creddentials"
	@echo "create -- creates the cluster"
	@echo "delete -- deletes the clister"
	@echo "destroy_all_clusters -- destroys all clusters stored in s3 bucket"
	@echo "get_kcfg -- gets the kubeconfig file in /tmp/<cluster-name>"
	@echo "list_clusters -- lists the clusters stored in s3"
	@echo "start/suspend/resize -- resize, start or suspend the cluster"
	@echo "install_istio_monitoring -- install istio/prometheus/cadvisor monitoring"
	@echo "help   - Display this help information"


configure_localmachine:
	@echo "configure playbooks/variables.yaml and playbooks/secret.yaml"
	ansible-playbook playbooks/configure_localmachine.yaml

configure_aws_access:
	ansible-playbook playbooks/configure_aws_user_and_storage.yaml

create:
	ansible-playbook playbooks/create_cluster.yaml

delete: list_clusters
	ansible-playbook playbooks/delete_cluster.yaml

destroy_all_clusters:
	ansible-playbook playbooks/destroy_all_clusters.yaml

get_kcfg: list_clusters
	@echo "exports /tmp/ directory"
	ansible-playbook playbooks/get_kcfg.yaml

list_clusters:
	ansible-playbook playbooks/list_clusters.yaml

start: list_clusters
	@echo "edit the file to set size both controller and workers to the desired value with min = max values = desired value"
	ansible-playbook playbooks/edit_clustersize.yaml

stop: list_clusters
	@echo "edit the file to set size both controller and workers to be zero for min and max values"
	ansible-playbook playbooks/edit_clustersize.yaml

resize: list_clusters
	@echo "edit the file to set size both controller and workers to the desired value with min = max values = desired value"
	ansible-playbook playbooks/edit_clustersize.yaml 

install_istio_monitoring: list_clusters
	ansible-playbook playbooks/install-istio-based-monitoring.yaml
