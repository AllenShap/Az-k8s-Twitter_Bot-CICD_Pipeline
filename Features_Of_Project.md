# Key Features

**Provisioned Wireguard VPN server connection information is dynamically generated.**
 - WireGuard VPN connection information is generated entirely on the VPN server.
 - The WireGuard VM VPN server is provisioned using cloud-init (as opposed to local-exec, which Terraform cannot model as part of a plan due to the unpredictable nature of provisioners).

**The WireGuard VPN server implements whitelisting for enhanced security, allowing only one peer connection at a time (specifically the AKS Cluster pod).**


**AKS Twitter bot functionality depends on having a secure Wireguard VPN connection established.** 
- If there is no connection then the AKS cluster has no internet access.
**The AKS Twitter bot's functionality relies on a stable WireGuard VPN connection. Without this connection, the AKS cluster lacks internet access.**



**An access-restricted Azure Key Vault is created to store VM VPN SSH keys. Access is limited to:**
- The Infrastructure-as-Code (IAC) Service Principal.
- Optionally, the Global Administrator implementing the project.

**An access-restricted Azure Storage Account is created to store build artifacts. Access is similarly restricted to:**
- The IAC Service Principal.
- Optionally, the Global Administrator.



**Azure Application Insights is provisioned as the application logging and monitoring service for the AKS Python Tweet Bot Azure Function.**


**Dynamically generated Helm Charts adhere to Semantic Versioning principles.**
- Every image build and push increments the Patch Version of the associated Helm Chart by 1.
- If all three images are built and deployed, the Minor Version is incremented by 1, and the Patch Version is reset to 0 (e.g., 0.1.4 -> 0.2.0).


**Each Docker image build and deployment is tagged with the latest commit SHA of the repository, ensuring the latest image is always running in the AKS cluster.**

**Docker image version history and Helm Chart version history are preserved in the provisioned Azure Container Registry and Azure Storage Account container.**

**Build artifacts are stored in the access-restricted Azure Storage Account container, organized by the build run ID of the workflow that triggered their upload.**
