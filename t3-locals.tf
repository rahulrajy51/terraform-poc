#Define resource_name_prefix and comman_tags only

locals {
  owner=var.business_divsion
  environment=var.environment
  resource_name_prefix="${var.business_divsion}-${var.environment}"          #sap-dev
  common_tags = {
    owner = local.owner
    environment   = local.environment
  }

}