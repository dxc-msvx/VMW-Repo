provider "azurerm" {
  features {}
}

resource "azurerm_template_deployment" "terraform-arm" {
  name                = "terraform-arm-01"
  resource_group_name = azurerm_resource_group.terraform-arm.name

  template_body = file("template.json")

  parameters = {
    "storageAccountName" = "terraformarm"
    "storageAccountType" = "Standard_LRS"

  }

  deployment_mode = "Incremental"
}
