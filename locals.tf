locals {

  common_tags = {

    Project = "Azure Enterprise Landing Zone"

    Owner = "Sai Krishna"

    Environment = "Development"

    ManagedBy = "Terraform"

    CreatedBy = "Terraform"

    CostCenter = "Cloud"

  }
  subnet_nsg_map = {
    "subnet-web" = module.web_nsg.id
    "subnet-app" = module.app_nsg.id
    "subnet-db"  = module.db_nsg.id

  }

}
