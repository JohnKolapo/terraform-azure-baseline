## Terraform Azure Baseline

Secure, scalable, and modular Terraform codebase for deploying enterprise-ready Azure landing zones—designed for real-world infrastructure teams.

---

## Why This Project Exists

This is a tactical, reusable blueprint for building Azure environments aligned with best practices from:

- Microsoft Cloud Adoption Framework (CAF)
- CIS Benchmarks
- Enterprise security policies

Whether you're setting up dev/test or production, this baseline gives you a hardened starting point—with flexibility baked in.

---

## What This Repo Does

This repo includes modular Terraform code to:

- Create Azure resource groups  
- Configure role-based access control (RBAC)  
- Deploy secure virtual networks with subnets  
- Set up Network Security Groups (NSGs)  
- Define Azure Policies and naming conventions  
- Implement diagnostics + log forwarding (via Log Analytics)  
- Support tagging for cost management + governance

---

## Tools + Tech Stack

- Terraform v1.4+
- Azure Provider (`azurerm`)
- GitHub Actions (for CI/CD automation – coming soon)
- Optional: Remote state backend via Azure Storage

---

## Project Structure

```bash
terraform-azure-baseline/
├── modules/
│   ├── rg/
│   ├── networking/
│   ├── nsg/
│   ├── policies/
├── main.tf
├── variables.tf
├── outputs.tf
├── backend.tf (optional)
├── README.md
└── LICENSE
# terraform-azure-baseline
Terraform code for deploying secure and scalable Azure environments using modular architecture.
#   r e - r u n

---

## Setup Instructions

1. Clone the Repository

```bash
git clone https://github.com/JohnKolapo/terraform-azure-baseline.git
cd terraform-azure-baseline
```

2. Create an Azure Service Principal

```bash
az ad sp create-for-rbac   --name "tf-bumima-sp"   --role="Owner"   --scopes="/subscriptions/<your-subscription-id>"   --sdk-auth
```

Save the output values (`clientId`, `clientSecret`, `subscriptionId`, `tenantId`).

3. Configure GitHub Secrets

Go to GitHub → Settings → Secrets and add:

| Name                    | Value                       |
|-------------------------|-----------------------------|
| `ARM_CLIENT_ID`         | `<clientId>`                |
| `ARM_CLIENT_SECRET`     | `<clientSecret>`            |
| `ARM_SUBSCRIPTION_ID`   | `<subscriptionId>`          |
| `ARM_TENANT_ID`         | `<tenantId>`                |


---
Terraform Backend Setup

In Azure:

```bash
az group create --name rg-bumima-dev --location canadacentral
az storage account create --name tfstatejohnkolapo03 --resource-group rg-bumima-dev --sku Standard_LRS
az storage container create --name tfstate --account-name tfstatejohnkolapo03
```

Backend configuration is handled dynamically via the GitHub Actions pipeline.


CI/CD Pipeline Summary

 GitHub Actions (`.github/workflows/terraform.yml`)

| Step                        | Purpose                                       |
|----------------------------|-----------------------------------------------|
| Checkout Code              | Clones the repo into the runner               |
| Setup Terraform            | Installs Terraform 1.5.7                      |
| Terraform Init             | Initializes backend with Azure configuration |
| Terraform Validate         | Validates syntax and configuration            |
| Terraform Format Check     | Checks linting and formatting                 |
| tfsec                      | Scans for Terraform security misconfigs       |
| Terraform Plan             | Dry-run of changes                            |
| Terraform Apply            | Applies changes (auto-approved on main)       |



Local Usage (Optional)

Initialize Terraform

```powershell
terraform init -reconfigure `
  -backend-config="resource_group_name=rg-bumima-dev" `
  -backend-config="storage_account_name=tfstatejohnkolapo03" `
  -backend-config="container_name=tfstate" `
  -backend-config="key=terraform.tfstate"
```

Plan and Apply

```powershell
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

---

Next Steps

- [ ] Add support for additional Azure resources (e.g., NSG, Route Table)
- [ ] Add PR-based plan only (apply on merge to `main`)
- [ ] Integrate Slack/Microsoft Teams notification on deployment
- [ ] Expand tfsec with custom policy exceptions
- [ ] Add unit testing using `terratest` or `infratests`

---

License

MIT



 


 
 
