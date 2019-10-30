---
title: "Build training container image and push it to ECR"
date: 2019-10-28T16:51:02-07:00
weight: 7
---

#### Build a custom docker image with our training code

In our Dockerfile we start with an AWS Deep Learning TensorFlow container and copy our training code into the container.

```
cd ~/SageMaker/distributed-training-workshop/notebooks/part-3-kubernetes/
cat Dockerfile.cpu
```
`Dockerfile.cpu` Output:
```
FROM 763104351884.dkr.ecr.us-west-2.amazonaws.com/tensorflow-training:1.14.0-cpu-py36-ubuntu16.04
COPY code /opt/training/
WORKDIR /opt/training
```

{{% notice tip %}}
Replace with `Dockerfile.gpu` if you're going to be running training on a GPU cluster.
{{% /notice %}}

#### Build and push a custom Docker container

* Navigate to [ECR and create a new repository](https://console.aws.amazon.com/ecr/home)
* Click create repository
* Provide a repository name
* Click create

{{% notice tip %}}
By clicking on **View push commands** button below, you can get access to docker build and push commands, so you don't have to remember them.
{{% /notice %}}
![create repo](/images/eks/create_repo.png)
![push commands](/images/eks/push_commands.png)
#### Create a new Elastic Container Registry repository

* Head over to the terminal on JupyterLab and log-in to the AWS Deep Learning registry
```
$(aws ecr get-login --no-include-email --region us-west-2 --registry-ids 763104351884)
```
* Run `docker build` command in **Step 2** from the Docker push commands menu. Make sure to update it with the correct Docker file name for CPU or GPU:
  * For CPU container: `docker build -t <your_docker_repo_name> -f Dockerfile.cpu .`
  * For GPU container: `docker build -t <your_docker_repo_name> -f Dockerfile.gpu .`
* Run the `docker tag` command in **Step 3** from the Docker push commands menu

* Log in to your docker registry
 * `$(aws ecr get-login --no-include-email --region us-west-2)`

* Run `docker push` command in **Step 4** from the Docker push commands menu

{{% notice tip %}}
What happened?
(1) You first logged into the AWS Deep Learning container registry in order to pull the deep learning container (2) You then built your container. (3) After the container is built, you added the appropriate tag needed to push it to ECR. (4) Then you login to your own registry. (4) Then you push the container to your registry

{{% /notice %}}
