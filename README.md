For Megaport provider v1.0.0-rc1

This example deploys end-to-end multicloud connectivity between an AWS VPC and Azure VNet using the Megaport Cloud Router (MCR). The following resources are deployed:

* Megaport Cloud Router (MCR)
* Megaport Virtual Cross Connect (VXC) to AWS Direct Connect
* AWS Direct Connect Hosted VIF
* AWS Direct Connect Gateway
* AWS Virtual Private Gateway
* AWS Direct Connect to Virtual Private Gateway Association
* AWS VPC
* AWS VPC Subnet
* Megaport Virtual Cross Connect (VXC) to Azure ExpressRoute
* Azure Resource Group
* Azure ExpressRoute Circuit
* Azure ExpressRoute Virtual Gateway
* Azure ExpressRoute to ExpressRoute Virtual Gateway Connection
* Azure VNet
* Azure VNet Subnet

### Prerequisites

* Install Terraform locally on Mac, Linux, or Windows: [Link](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli)
* Create Megaport API Key: [Link](https://docs.megaport.com/api/api-key/)
* Create AWS Access Key: [Link](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)
* Install Azure CLI Tools: [Link](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)

### Deployment Instructions

* Download or Clone this Terraform example.
* Modify the provider.tf file with your own Megaport API Key/API Key Secret and AWS Access Key/Secret Key.
* Modify the variables.tf file with your own AWS Account ID.
* The variables.tf file is configured for deployment in Singapore, it can be adjusted for other locations and regions as required.
* Authenticate to your Azure tenant using the Azure CLI: [Link](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build#authenticate-using-the-azure-cli)
* Save the Azure tenant credentials locally as environment variables for use by Terraform: [Link](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build#set-your-environment-variables)
* From the command line change to the directory containing the Terraform files.
* Run `terraform init` to initialise Terraform and the providers.
* Run `terraform apply` to deploy this example.

### Notes

* This example will not work on the Megaport Staging environment. This is because it requires
real connections to AWS and Azure.
* It helps if you're not logged into mutliple Microsoft accounts while running this.
* The Azure ExpressRoute Gateway can take up to 20 minutes to deploy.
* When you have completed, use `terraform destroy` so that you will stop incurring costs for the resources.
* When destroying the deployment Terraform will prompt one two errors:
  * ExpressRoute Private Peering exists - login to the Azure console > ExpressRoute circuit > using the ... option next to the Private Peering configuration delete the Private Peering. When deletion is complete re-run `terraform destory`.
  * AWS Virtual Gateway removal pending another operation - the re-run of `terraform destroy` will clear this.

### Testing

* As this is a baseline networking deployment I haven't included VMs but you can add these as required to run connectivity checks/tests.
* Route advertisment between clouds can be checked using the Megaport MCR Looking Glass - BGP neighbours to both AWS and Azure should be up and 10.0.0.0/16 from AWS and 10.1.0.0/16 from Azure received.





