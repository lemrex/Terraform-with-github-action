terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.36.0"
    }
  }
}

# Configure the HuaweiCloud Provider
provider "huaweicloud" {
  region     = "af-south-1"
  access_key = " ${{ secrets.ACCESSKEY }}"
  secret_key = "${{ secrets.SECRETACCESSKEY }}"
}
