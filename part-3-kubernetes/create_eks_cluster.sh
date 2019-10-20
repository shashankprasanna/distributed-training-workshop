eksctl create cluster \
	--name tfworld19-k8s-cluster \
	--version 1.13 \
	--region us-west-2 \
	--nodegroup-name gpu-nodes \
	--node-type p3.2xlarge \
	--nodes 2 \
	--timeout=40m \
	--ssh-access \
	--ssh-public-key=shshnkp-oregon \
	--auto-kubeconfig \
	--zones=us-west-2a,us-west-2b,us-west-2c

