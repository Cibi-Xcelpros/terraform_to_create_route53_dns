# Deployment Script for Azure Infrastructure

## Prerequisites

Install the following cli tools before running the script.

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Steps to run the script

1. **Login to Azure CLI**: Ensure that you are logged in with an account that has Contributor access.
    
    ```bash
    az login
    ```
    
2. **Checkout New Branch:** Create a new local git branch with the **tenant name**
    
    ```bash
    Git checkout <tenant_name> # Replce the <tenant_name> with actuals
    ```
    
3. **Initialize the Script**:
    
    ```bash
    terraform init
    ```
    
4. **Custom Variables**: Duplicate the  `dev.tfvars` file as needed.
    
    ```bash
    cp dev.tfvars <tenant_name>_prod.tfvars # Replce the <tenant_name> with actuals
    ```
    
    Modify the values as per following guidelines. 
    
    | Key | Value | Exaple |
    | --- | --- | --- |
    | tenant_name | Enter the tenant’s name with no spaces or special characters. Make sure the tenant names are unique. | cipla |
    | location | Enter azure cloud region closer to the tenant’s location. | East US |
    | vm_size | Enter Vm size as per azure’s naming convention. Recommended to have at least 8gb ram & 2 vCPU | Standard_D2as_v4 |
    | vm_disk_size | Enter value in integer format in gigabytes. Recommended to have at lest 50 for prod. | 30 |
    | git_pat | Personal access token for cloning git repo.  |  |
    | git_branch | Enter the respective branch to deployed. | dev-deploy |
    | shutdown_time | Soft-shut down period, Enter integer value in minutes. | 600 |
    | expiration_hours | Self termination period, Enter integer value in hours. | 48 |
    | nginx_server_ip | Enter the IP address of the VM hosting the Nginx reverse proxy. | 20.118.207.176 |
5. **Create Environment File**: Add an environment file inside the `env` folder.
6. **Generate SSH Key**: The file should be in PEM format and pasted inside the `keys` folder.
    1. SSH keys of both Nginx MV & tenant’s VM should be placed inside keys folder.
    2. Make sure the file names as per variable names mentioned in script.
7. **Run Terraform Plan**: Verify the deployment components.
    
    ```bash
    terraform plan -var-file="<tenant_name>_prod.tfvars" # Replce the <tenant_name> with actuals
    ```
    
8. **Apply Infrastructure Changes**: Apply the desired infrastructure changes.
Note: You'll be prompted to confirm the deployment. Type "yes" when asked.
    
    ```bash
    terraform apply -var-file="<tenant_name>_prod.tfvars" # Replce the <tenant_name> with actuals
    ```
    
9. **Wait for Deployment**: The script will run for approximately 10 to 15 minutes.