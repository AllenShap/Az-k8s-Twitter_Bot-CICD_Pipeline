This project provides a fully automated, one-click deployment of a secure and robust Twitter bot on Azure Kubernetes Service (AKS).

Triggered by a single action, the CI/CD pipeline provisions an Azure infrastructure, including:
- **An AKS cluster hosting the Twitter bot application** (cluster mainly consists of a VPN Client, FastAPI, and application container).
- **A Linux VM acting as a WireGuard VPN server** (dynamically generates connection details on first boot and stores them securely).
- **Supporting Azure resources like a Key Vault and Storage Account** (for SSH key storage and build artifacts).
- **A CosmosDB Serverless NoSQL database** (for backend application data). 

The AKS cluster's internet access is exclusively routed through an established WireGuard VPN tunnel, ensuring enhanced security.

This project is backed by a comprehensive CI/CD pipeline, driven by GitHub Actions, it automates image building, tagging with commit SHAs, and Helm chart updates following semantic versioning.

This streamlined approach enables rapid development and deployment of a secure and scalable Twitter bot solution on Azure.

**To understand this project and it's outcomes better the following information could be beneficial:**
- [Infrastructure, workflow, and CI/CD diagrams.](https://github.com/AllenShap/Az-k8s-Twitter_Bot-CICD_Pipeline/blob/main/Infrastructure_Diagrams.md)
- [Comprehensive list of project features.](https://github.com/AllenShap/Az-k8s-Twitter_Bot-CICD_Pipeline/blob/main/Features_Of_Project.md)
- [Instructions to successfully deploy this project.](https://github.com/AllenShap/Az-k8s-Twitter_Bot-CICD_Pipeline/blob/main/Deployment_Instructions.md)

<p align="center">
      <em>Below is the final outcome of this project and the resulting network flow</em>
  <br>
</p>


<p align="center">
      <em>This is the final state of the Azure environment upon successful implementation of this project.</em>
  <img src="https://github.com/user-attachments/assets/74c17a8b-3cab-48ac-9d15-c196d37c8e82">
  <br>
</p>
<p align="center">
  <em>Below is an *extremely* simple diagram of the final network flow in AKS upon successful implementation of this project.</em>
  <img src="https://github.com/user-attachments/assets/0f4697f4-bb76-4a25-a827-cd9cae09d46f">
  <br>
</p>
