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
# 🏗 Azure Enterprise Landing Zone Architecture

```text
                                      GitHub Repository
                                             │
                                             │
                                      Git Push / PR
                                             │
                                             ▼
                                 GitHub Actions Workflow
                                             │
             ┌───────────────────────────────┼───────────────────────────────┐
             │                               │                               │
             ▼                               ▼                               ▼
      Terraform Format                Terraform Validate             Azure Login
             │                               │                               │
             └───────────────────────────────┼───────────────────────────────┘
                                             │
                                             ▼
                                 Terraform Remote Backend
                                             │
                    Azure Storage Account (terraform.tfstate)
                                             │
                                   State Lock (Blob Lease)
                                             │
                                             ▼
                                      Terraform Plan
                                             │
                                             ▼
                              Production Approval (GitHub)
                                             │
                                             ▼
                                      Terraform Apply
                                             │
                                             ▼
================================================================================
                              AZURE SUBSCRIPTION
================================================================================
                                             │
                                             ▼
                          Resource Group (rg-enterprise-dev)
                                             │
      ┌──────────────────────────────┬──────────────────────────────┐
      │                              │                              │
      ▼                              ▼                              ▼
  Networking                     Security                     Monitoring
      │                              │                              │
      ▼                              ▼                              ▼
 Virtual Network                 Network Security              Log Analytics
      │                               Groups                     Workspace
      │                                  │                            │
      │                                  │                            │
      ▼                                  ▼                            ▼
 ┌───────────────┐                Azure Key Vault             Diagnostic Settings
 │               │                       │                            │
 ▼               ▼                       ▼                            ▼
Web Subnet   App Subnet           Managed Identity             Azure Monitor
 │               │                                                 │
 ▼               ▼                                                 ▼
Windows VM    Linux VM                                   Action Groups
 │               │
 └───────┬───────┘
         │
         ▼
   Azure Bastion
         │
         ▼
 Secure RDP / SSH Access

──────────────────────────────────────────────────────────────────────────────

Azure Storage
      │
      ▼
Private Endpoint
      │
      ▼
Private DNS Zone

──────────────────────────────────────────────────────────────────────────────

Recovery Services Vault
      │
      ▼
VM Backup Policy
      │
      ▼
Windows VM + Linux VM
```
 
## CI Pipeline
1. Checkout Repository
2. Setup Terraform
3. Azure Login
4. Terraform fmt
5. Terraform Init
6. Terraform Validate

## CD Pipeline
1. Terraform Plan
2. Review Plan
3. Manual Approval
4. Terraform Apply
5. Production Deployment

## Security
- GitHub Secrets
- Azure Service Principal
- Remote Backend Access Key
- Protected Production Environment

## Resume Highlights
- Built Azure Enterprise Landing Zone using Terraform.
- Designed reusable Terraform modules.
- Implemented GitHub Actions CI/CD.
- Configured Azure remote backend.
- Secured deployments using approval gates.

## STAR Interview Story
**Situation:** Manual deployments were inconsistent.
**Task:** Automate Azure infrastructure.
**Action:** Implemented Terraform with GitHub Actions CI/CD and approvals.
**Result:** Repeatable, secure enterprise deployments.

## Top 20 Interview Questions
1. What is an Azure Landing Zone?
2. Why Terraform?
3. What is Terraform State?
4. Why Remote Backend?
5. What is State Locking?
6. CI vs CD?
7. terraform init?
8. terraform fmt?
9. terraform validate?
10. terraform plan?
11. terraform apply?
12. Service Principal?
13. GitHub Secrets?
14. Terraform Modules?
15. Azure RBAC?
16. Manual Approval?
17. Management Groups?
18. Resource Groups?
19. GitHub Actions workflow?
20. Explain your project end-to-end.

## Future Improvements
- Azure DevOps
- OIDC
- Key Vault
- Terratest
- Multi-environment deployment
- Monitoring


## Author

**Vempati Sai Krishna**

Azure Cloud Infra Admin | Terraform | DevOps Engineer

GitHub: https://github.com/saikrishna844
LinkedIn: www.linkedin.com/in/saikrishna-vempati
