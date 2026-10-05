# Azure Databricks Production Platform

A production-style **Azure Databricks data platform** built using Infrastructure as Code (IaC), Terraform, Azure, Unity Catalog, GitHub Actions, and workload identity federation.

The project demonstrates how a modern data platform can be provisioned and managed using repeatable, version-controlled infrastructure rather than manually creating resources through the Azure or Databricks UI.

---

## Project Overview

This project builds the **platform infrastructure required to support a Bronze/Silver/Gold data engineering architecture on Azure Databricks**.

The main focus is the **Data Platform / Platform Engineering layer**, rather than the actual data transformation logic.

The platform provides:

- Azure infrastructure
- Azure Data Lake Storage Gen2
- Azure Databricks workspace
- Databricks Access Connector
- Managed identity authentication
- Unity Catalog
- Storage credentials
- External locations
- Catalogs and schemas
- Databricks SQL Warehouse
- Databricks Jobs
- Terraform Infrastructure as Code
- Remote Terraform state
- GitHub Actions
- GitHub OpenID Connect (OIDC)
- Azure Workload Identity Federation
- CI/CD foundations

---

# 🏗️ Architecture

```text
                         ┌──────────────────────────┐
                         │        Developer         │
                         │        VS Code           │
                         └────────────┬─────────────┘
                                      │
                                      │ Git
                                      ▼
                         ┌──────────────────────────┐
                         │         GitHub           │
                         │      Repository          │
                         └────────────┬─────────────┘
                                      │
                                      │ GitHub Actions
                                      ▼
                         ┌──────────────────────────┐
                         │     GitHub OIDC Token    │
                         └────────────┬─────────────┘
                                      │
                                      ▼
                         ┌──────────────────────────┐
                         │      Microsoft Entra ID  │
                         │   Workload Federation    │
                         └────────────┬─────────────┘
                                      │
                                      ▼
                         ┌──────────────────────────┐
                         │ Azure User Assigned      │
                         │ Managed Identity         │
                         └────────────┬─────────────┘
                                      │
                                      ▼
                    ┌──────────────────────────────────┐
                    │             Azure                │
                    │                                  │
                    │  ┌────────────────────────────┐  │
                    │  │ Resource Group              │  │
                    │  │                            │  │
                    │  │  ┌──────────────────────┐  │  │
                    │  │  │ ADLS Gen2            │  │  │
                    │  │  │                      │  │  │
                    │  │  │ datalake filesystem  │  │  │
                    │  │  └──────────────────────┘  │  │
                    │  │                            │  │
                    │  │  ┌──────────────────────┐  │  │
                    │  │  │ Azure Databricks      │  │  │
                    │  │  │ Workspace             │  │  │
                    │  │  └───────────┬──────────┘  │  │
                    │  │              │             │  │
                    │  │              ▼             │  │
                    │  │  ┌──────────────────────┐  │  │
                    │  │  │ Unity Catalog        │  │  │
                    │  │  │                      │  │  │
                    │  │  │ Bronze               │  │  │
                    │  │  │ Silver               │  │  │
                    │  │  │ Gold                 │  │  │
                    │  │  └──────────────────────┘  │  │
                    │  └────────────────────────────┘  │
                    └──────────────────────────────────┘

                         ┌──────────────────────┐
                         │ Terraform Remote     │
                         │ State                │
                         │                      │
                         │ Azure Blob Storage   │
                         └──────────────────────┘