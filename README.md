# Azure AI 

This project builds a reproducible Azure-based AI security lab for: 

- Forensics
- Penetration testing

- Reverse engineering
- Claude CLI / Claude Code
- MCP servers
- Remote access through Tailscale


## Goals

- Fully reproducible infrastructure
- Portable between Azure accounts
- Managed with Terraform
- Tooling managed through scripts and configuration
- Secure remote access without exposing SSH/RDP publicly

## Structure

- `terraform/` - Azure infrastructure
- `cloud-init/` - VM bootstrap configuration
- `scripts/` - Installation scripts
- `mcp/` - MCP server profiles
- `docker/` - Tool containers
- `docs/` - Architecture and operating notes

## Steps 

### 1. Terraform

#### 1. Create storage

In azure CLI clone this repository and run the following commands:

```
cd terraform/bootstrap/backend
terraform init
```

Make sure everything works correctly:

```
terraform fmt
terraform validate
```

Apply the config and type `yes`. 

```
terraform apply
```

This will output some backend value, note them down:

Exmaple:

```
resource_group_name  = "rg-ai-sec-lab-tfstate"
storage_account_name = "sttfstateabc123"
container_name       = "tfstate"
```

Now we can check that the storage has been created with this command:

```
az storage account list --resource-group rg-ai-sec-lab-tfstate --output table
```

#### 2. Create dev backend config 

Replace the value of the file `azure-ai/terraform/environments/dev/backend.hcl`, with the values we saved from the previous step.

Run the following commands:

```
cd terraform/environments/dev/
terraform init -backend-config=backend.hcl
```
You should get: `Terraform has been successfully initialized`

Now format and validate:
```
terraform fmt
terraform validate
```

now plan, apply and type yes to continue:

```
terraform plan
terraform apply
```

We can now verify azure resource group:

```
az group show --name rg-azure-ai-dev --output table
```
#### 3. Create the network module ???


#### 4. Create the VM 

We use a kali 2026 vm for this. If you want to change the VM version first you need to check which version you would like to use 

```
az vm image list --location westeurope --all --output table | grep -i kali
```

Once found the correct VM version we want to use we need to note down: 

- publisher
- offer
- sku
- version

Now we need to check if we need to accept the terms:

```
az vm image terms show --publisher PUBLISHER --offer OFFER --plan SKU
```

And if needed accept them 


```
az vm image terms accept --publisher PUBLISHER --offer OFFER --plan SKU
```

Now we need to modify the details of the file `/azure-ai/terraform/modules/linux-operator-vm/variables.tf` with the VM information