# Project Configuration
project_name        = "timeapi-devops"
environment         = "dev"
location            = "North Europe"
resource_group_name = "timeapi-devops-rg"

# AKS Configuration
aks_cluster_name   = "timeapi-devops-aks"
kubernetes_version = "1.30.14"
node_count         = 2
node_vm_size       = "Standard_D2s_v3"

# ACR Configuration
acr_name = "timeapidevopsacr"
acr_sku  = "Basic"

# Network Configuration
vnet_address_space    = ["10.0.0.0/16"]
subnet_address_prefix = "10.0.1.0/24"

# Tags
tags = {
  Project     = "TimeAPI-DevOps"
  ManagedBy   = "Terraform"
  Environment = "Development"
  Owner       = "cloudwithoyindamola"
}