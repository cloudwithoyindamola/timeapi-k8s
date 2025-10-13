#  **Infrastructure Setup (Terraform + Azure)**

This folder contains the Terraform configuration files used to provision and manage the cloud infrastructure for this project.

##  **Resources Provisioned by Terraform**
This Terraform configuration provisions a complete Azure Kubernetes infrastructure along with its supporting network and security components.

- Resource Group
- Virtual Network and Subnet
- NAT Gateway and Public IP
- Network Security Group (NSG)
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS) Cluster
- Role Assignment :- Grants the AKS cluster permission to pull container images from ACR.
- Kubernetes Namespaces :- Creates dedicated namespaces within the AKS cluster for Dev, Staging, and Production deployments.

##  **Folder Structure**

infra/
│── main.tf                   # Main Terraform configuration (resource definitions)
│── variables.tf              # Variable definitions for customization
│── outputs.tf                # Outputs of created resources
│── providers.tf              # Provider configuration (AzureRM & Kubernetes)
│── terraform.tfvars.example  # Example variables file (safe for version control)

##  **Prerequisites**

Before deploying the infrastructure, ensure you have the following installed and configured:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) 
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Access to an Azure subscription
- Proper permissions to create and manage resources

## **Setup Instructions**

### **Clone the Repository**
```bash
git clone https://github.com/cloudwithoyindamola/timeapi-k8s/tree/dev/infra
cd infra
```
### **NOTE:- Variables Management**
All sensitive or environment-specific variables should not be committed,Instead use a .tfvars file locally (e.g terraform.tfvars)
An example file terraform.tfvars.example is provided to show the required variable names and formats.
### **Authenticate with Azure**
This opens a browser window where you can sign into your Azure account.
```bash
az login
```
### **Initialize Terraform**
Run the following command to initialize the working directory and download necessary providers:
```bash
terraform init
```
### **Plan Infrastructure Changes**
Generate and saves an execution plan to review the re4sources that will be created or modified;This creates a tfplan file that can be applied later.
```bash
terraform plan -out=tfplan
```
### **Apply the Plan**
Deploy the infrastructure using the previously generated plan:This step will create all the defined Azure resources.
```bash
terraform apply "tfplan"
```
### **Destroy Resources (if needed)**
To tear down the infrastructure when no longer needed:
```bash
terraform destroy
```
### **Outputs**
After applying, Terraform will display output values such as:
- Resource group name
- Public IP address
- Kubernetes cluster endpoint (if applicable)

You can also view outputs later with:
```bash
terraform output
```

## **Notes**
- The infrastructure is currently managed manually (not through CI/CD).
- Future improvements may include:
  - Integrate Terraform with CI/CD for automated infrastructure deployment.
  - Adding state file storage in a remote backend (e.g., Azure Storage).
  - Implement environment-specific workspaces (dev, staging, prod).
  - Add output references for easier integration with GitHub Actions.    