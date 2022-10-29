provider "azurerm" {
features {}
}
resource "azurerm_resource_group" "TF-AKS" {
name = "TF-AKS-resources"
location = "West US"
}

resource "azurerm_kubernetes_cluster" "TF-AKS" {
name = "aks"
location = azurerm_resource_group.TF-AKS.location
resource_group_name = azurerm_resource_group.TF-AKS.name
dns_prefix = "aks"

default_node_pool {
name = "default"
node_count = 1
vm_size = "Standard_D2_v2"
}

identity {
type = "SystemAssigned"
}

tags = {
Environment = "Production"
}
}

output "client_certificate" {
value = azurerm_kubernetes_cluster.TF-AKS.kube_config.0.client_certificate
}

output "kube_config" {
value = azurerm_kubernetes_cluster.TF-AKS.kube_config_raw
}
