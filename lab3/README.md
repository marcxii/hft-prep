Lab 3: Unconstrained Orchestration and Dynamic Secrets (Nomad + Vault)

The Setup: Set up a local Nomad and Vault cluster. In Vault, enable the AppRole authentication method and write a strict HashiCorp Configuration Language (HCL) policy granting "read" capabilities to a specific secret path.

The Drill: Write a Nomad job specification using the raw_exec driver, which executes the task directly on the host operating system without container isolation constraints. Configure the job to authenticate with Vault using AppRole, retrieve the secret, and print it to the local logs.