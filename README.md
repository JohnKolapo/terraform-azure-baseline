# 🚀 Terraform Azure Baseline

Secure, scalable, and modular Terraform codebase for deploying enterprise-ready Azure landing zones—designed for real-world infrastructure teams, not cloud hobbyists.

---

## Why This Project Exists

Most Terraform repos are toy examples. This isn't one of them.

This is a tactical, reusable blueprint for building Azure environments aligned with best practices from:

- Microsoft Cloud Adoption Framework (CAF)
- CIS Benchmarks
- Enterprise security policies

Whether you're setting up dev/test or production, this baseline gives you a hardened starting point—with flexibility baked in.

---

## What This Repo Does

This repo includes modular Terraform code to:

✅ Create Azure resource groups  
✅ Configure role-based access control (RBAC)  
✅ Deploy secure virtual networks with subnets  
✅ Set up Network Security Groups (NSGs)  
✅ Define Azure Policies and naming conventions  
✅ Implement diagnostics + log forwarding (via Log Analytics)  
✅ Support tagging for cost management + governance

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
