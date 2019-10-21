eksctl create cluster \
	--name tfworld19-k8s-cluster \
	--version 1.14 \
	--region us-west-2 \
	--nodegroup-name cpu-nodes \
	--node-type c5.xlarge \
	--nodes 2 \
	--timeout=40m \
	--auto-kubeconfig
