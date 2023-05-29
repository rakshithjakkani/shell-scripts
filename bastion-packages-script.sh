#!/bin/bash
############################----kubectl------####################
#manually enter the kube
read -p "Enter the kubectl version to install: " version
# Check if version is provided
if [ -z "$version" ]; then
  echo "Please provide a kubectl version."
  exit 1
fi
#download terragrunt 
echo "Downloading kubectl v${version}..."
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/${version}/2023-05-11/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
kubectl version --short --client

############################----terraform------####################
# Prompt for Terraform version
read -p "Enter the Terraform version to install: " version

# Check if version is provided
if [ -z "$version" ]; then
  echo "Please provide a Terraform version."
  exit 1
fi

# Download Terraform
echo "Downloading Terraform v${version}..."
curl -LO "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip"

# Unzip and install Terraform
unzip "terraform_${version}_linux_amd64.zip"
chmod +x terraform
sudo mv terraform /usr/local/bin/

# Verify installation
echo "Terraform v${version} installed successfully."
terraform version

############################----helm------####################

# Prompt for Helm version
read -p "Enter the Helm version to install: " version

# Check if version is provided
if [ -z "$version" ]; then
  echo "Please provide a Helm version."
  exit 1
fi

# Download Helm
echo "Downloading Helm v${version}..."
curl -LO "https://get.helm.sh/helm-v${version}-linux-amd64.tar.gz"
# Extract Helm
tar xvzf "helm-v${version}-linux-amd64.tar.gz"

# Move Helm binary to /usr/local/bin
chmod +x linux-amd64/helm
sudo mv linux-amd64/helm /usr/local/bin/

# Verify installation
echo "Helm v${version} installed successfully."
helm version --short

############################----terragrunt------####################

#install terragrunt v0.31.1
read -p "Enter the Terragrunt version to install: " version
if [ -z "$version" ]; then
echo "Please provide a Terragrunt version."
exit 1
fi
# download terragrunt 
echo "Downloading Terragrunt v${version}..."
wget https://github.com/gruntwork-io/terragrunt/releases/download/v${version}/terragrunt_linux_amd64
mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
chmod +x /usr/local/bin/terragrunt
terragrunt --version 