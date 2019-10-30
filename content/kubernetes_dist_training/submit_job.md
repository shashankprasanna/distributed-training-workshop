---
title: "Submit distributed training job"
date: 2019-10-28T17:14:05-07:00
weight: 8
---
#### Confirm that you are in the right directory
```
cd ~/SageMaker/distributed-training-workshop/notebooks/part-3-kubernetes/
```
#### Copy the container image name

![copy container](/images/eks/get_container.png?width=60pc)


#### Update the MPIJob spec file

Open `specs/eks_tf_training_job-cpu.yaml` and update `image: <YOUR_DOCKER_IMAGE>` with the name of your container.

![update container](/images/eks/job_yaml_container.png?width=60pc)

#### Submit a job run:
```
kubectl apply -f specs/eks_tf_training_job-cpu.yaml
```
{{% notice tip %}}
For GPU jobs use this instead: `eks_tf_training_job-gpu.yaml`
{{% /notice %}}

You should see an output something like this:
```
mpijob.kubeflow.org/eks-tf-distributed-training created
```
Running `kubectl get pods` will should you the number of workers + 1 number of pods.

```bash
$ kubectl get pods
NAME                                         READY   STATUS    RESTARTS   AGE
eks-tf-distributed-training-launcher-6lgzg   1/1     Running   0          63s
eks-tf-distributed-training-worker-0         1/1     Running   0          66s
eks-tf-distributed-training-worker-1         1/1     Running   0          66s
```

To observer training logs, run `kubectl logs <pod_name>`. Select the launcher pod from the list. You can use tab complete or copy the name of the pod from the output of `kubectl get pods`

```
kubectl logs eks-tf-distributed-training-launcher-<TAB>
```

output:
```
...
Epoch 1/30
Epoch 1/30
 3/78 [>.............................] - ETA: 4:05 - loss: 3.6816 - acc: 0.1172 3/724/78 [========>.....................] - ETA: 1:29 - loss: 2.7493 - acc: 0.161024/778/78 [==============================] - 128s 2s/step - loss: 2.1984 - acc: 0.2268 - val_loss: 2.1794 - val_acc: 0.1699
Epoch 2/30
78/78 [==============================] - 129s 2s/step - loss: 2.2108 - acc: 0.2268 - val_loss: 2.1794 - val_acc: 0.1699
Epoch 2/30
```
