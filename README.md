# Azure Enterprise Landing Zone using Terraform

## Project Overview

This project demonstrates how to provision enterprise-grade Azure infrastructure using Terraform with reusable modules, remote state management, and production-ready best practices.

## Technologies

- Microsoft Azure
- Terraform
- Azure CLI
- Git
- Visual Studio Code

## Architecture

                                    GitHub
                                       │
                                       │
                          Azure DevOps Pipeline (Later)
                                       │
                                       ▼
                             Terraform Root Module
                                       │
     ┌────────────────────────────────────────────────────┐
     │                                                    │
     ▼                                                    ▼
Remote Backend                                   Azure Provider
(Storage Account)
     │
     ▼
terraform.tfstate
     │
────────────────────────────────────────────────────────────────

                    Resource Group
                           │
        ┌──────────────────┼──────────────────────┐
        │                  │                      │
        ▼                  ▼                      ▼
   Networking          Security              Monitoring
        │                  │                      │
        ▼                  ▼                      ▼
      VNet              NSG                 Log Analytics
        │
        ▼
      Subnet
        │
        ▼
    Route Table
        │
        ▼
    Bastion Host
        │
        ▼
     Windows VM
        │
        ▼
     Linux VM
        │
        ▼
 Key Vault + Managed Identity

## Author

## Author

**Sai Krishna**
Azure Cloud | Terraform | DevOps Engineer

GitHub: https://github.com/saikrishna844
LinkedIn: www.linkedin.com/in/saikrishna-vempati