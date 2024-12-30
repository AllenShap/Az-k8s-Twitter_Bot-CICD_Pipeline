# Deployment Instructions

For brevity, the aspects of the tfstate file, and creation of a priveleged enough account to run this workflow is withheld.

Prerequisites: 
- An X(formerly Twitter) developer account which has an app created -- Can sign up and create one here: https://developer.x.com/en
- An existing .tfstatefile in a backend Azure Storage Account Container
- An existing Azure Service Principal to function as the IAC provisioner of all Azure Resources
- A Global Administrator account is ideal
- An Azure Tenant and Subscription

**1.** Clone Repo with workflows

**2.** In order for this reposity to be run successfully as-is, the GitHub Actions repository secrets listed below need to be set

**3.** Run GitHub Actions Workflow named "Terraform Build & Deploy"

**4.** Deployment is Successful and complete!


Unfortunately, since this is a public repo, a big long ugly list of secrets needs to be created and set in order for anyone to replicate the project deployment ( never store secrets in code! ).


The following values should be pasted with the values quoted (ex. "secret_value") into the GitHub secret values:

- RESOURCE_GROUP_LOCATION  -- Geographical location of where all resources will be deployed
- RESOURCE_GROUP_NAME  -- Name of the resource group which will contain the Wireguard VPN Server and associated resources
- AKS_RESOURCE_GROUP_NAME  -- Name of the resource group which will contain the Azure Kubernetes Cluster and Azure Container Registry 
- CONTAINER_REGISTRY_NAME  -- Name of the Azure Container Registry which will contain the AKS images and Helm chart
- KUBERNETES_CLUSTER_NAME  -- Name of the Azure Kubernetes Cluster
- BACKEND_RESOURCES_RG_NAME  -- Name of the resource group which will contain backend resources for the entire deployment to function (AI, DB, Metrics Logging)
- AZURERM_COSMOSDB_ACCOUNT_NAME  -- Name of Cosmos DB Account to create
- AZURERM_COSMOSDB_SQL_DATABASE_NAME  -- Name of Cosmos DB SQL Database to create
- AZURERM_COSMOSDB_SQL_CONTAINER_NAME  -- Name of Cosmos DB SQL Database Container to create
- AZURERM_COGNITIVE_ACCOUNT_NAME   -- Name of Azure Cognitive Account to create
- AZURERM_SEARCH_SERVICE_NAME  -- Name of Azure Cognitive Search Service to create
- AZURERM_LOG_ANALYTICS_WORKSPACE_NAME  -- Name of Azure Log Analytics Workspace to create
- AZURERM_APPLICATION_INSIGHTS_NAME  -- Name of Azure Application Insights to create
- ADDITIONAL_OBJECT_ID_FOR_KEYVAULT_ACCESS  -- Object ID which will provide an additional user to access the provisioned Azure Keyvault and Storage Account
- TWITTER_ACCESS_TOKEN  -- This value can be retrieved from https://developer.x.com/en/portal/dashboard under "Keys and tokens"
- TWITTER_ACCESS_TOKEN_SECRET  -- This value can be retrieved from https://developer.x.com/en/portal/dashboard under "Keys and tokens"
- TWITTER_CONSUMER_KEY  -- This value can be retrieved from https://developer.x.com/en/portal/dashboard under "Keys and tokens"
- TWITTER_CONSUMER_SECRET  -- This value can be retrieved from https://developer.x.com/en/portal/dashboard under "Keys and tokens"


The following values should be pasted raw (without quotes) into the GitHub secret values:

- TF_VAR_AZURE_ACCESS_KEY  -- This value is the Azure Access Key to where the pre-existing Terraform State file is located
- TF_VAR_AZURE_STORAGE_ACCOUNT_NAME  -- This value is the Storage Account name where the pre-existing Terraform State file is located
- TF_VAR_AZURE_CONTAINER_NAME  -- This value is the Storage Account Container name to where the pre-existing Terraform State file is located
- ARM_SUBSCRIPTION_ID  -- This value is the Subscription ID where the IAC provisioner is located in and where all Azure resources will be deployed
- Storage_Account_Name_for_WireGuard_VPN_Configs   -- This value is the Storage Account name where Wireguard Configuration information & build artifacts will be uploaded and pulled from.
- STORAGE_CONTAINER_NAME_FOR_WIREGUARD_VPN_CONFIGS  -- This value is the Storage Account Container name where Wireguard Configuration information & build artifacts will be uploaded and pulled from.
- AZURE_APPID  -- This value is the Application ID of the IAC provisioner which will deploy all Azure resources
- AZURE_PASSWORD  -- This value is the password of the IAC provisioner which will deploy all Azure resources
- AZURE_SUBSCRIPTION  -- This value is the Subscription ID of the IAC provisioner which will deploy all Azure resources
- AZURE_TENANT  -- This value is the Tenant ID of the IAC provisioner which will deploy all Azure resources
- MY_PAT_TOKEN -- Github Personal Access Token (This enables calling the GitHub API in the workflow runner). This value can be created and retrieved from https://github.com/settings/personal-access-tokens

Successful deployment of this workflow can be verified by looking at the associated X account. There should be tweets automatically made within 15 minutes of deployment (IF deployed close to after 6PM PST(hour 24 of the day), the delay might be longer as it takes time for NYTimes news article dates to update to the newest date of the week.


Automatic Tweets Look like this:


<p align="center">
  <img src="https://github.com/user-attachments/assets/82ecb804-f66a-4d89-a222-14547c3b4fe8">
</p>
