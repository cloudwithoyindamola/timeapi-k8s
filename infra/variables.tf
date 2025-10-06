variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# AKS Variables
variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

# ACR Variables
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
}

# Network Variables
variable "vnet_address_space" {
  description = "Address space for VNet"
  type        = list(string)
}

variable "subnet_address_prefix" {
  description = "Address prefix for AKS subnet"
  type        = string
}

# NAT Gateway Variables
variable "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  type        = string
}

# NSG Variables
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

# Tags
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}