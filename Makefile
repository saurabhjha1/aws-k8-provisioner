# Makefile to run Ansible playbooks

.PHONY: create delete 

help:
	@echo "Makefile commands:"
	@echo "test   - Run the test playbook"
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