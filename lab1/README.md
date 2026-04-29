Lab 1: Automated Provisioning and Disaster Recovery (Terraform + SaltStack)

The Setup: Use Terraform to provision a small virtual private cloud (VPC) with three basic instances. Once provisioned, use a bootstrap script or Terraform provisioner to install the Salt Minion daemon on the instances and connect them to a Salt Master.  

The Drill: Simulate a disaster by manually deleting a critical networking component or running an accidental terraform destroy on a specific resource. Practice detecting the outage and using your Terraform state and Salt states to completely rebuild and reconfigure the environment from scratch.