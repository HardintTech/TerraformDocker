#!/bin/bash

# Définition des variables Terraform
TF_DIR="./"
TF_STATE_FILE="terraform.tfstate"

# Étape 1 : Initialiser Terraform
cd $TF_DIR
terraform init

# Étape 2 : Créer l'infrastructure avec Terraform
terraform apply -auto-approve

# Étape 3 : Récupérer les informations nécessaires pour configurer Docker
DOCKER_HOST=$(terraform output docker_host)
DOCKER_CERT_PATH=$(terraform output docker_cert_path)

# Étape 4 : Configurer Docker pour utiliser l'infrastructure Terraform
export DOCKER_HOST=$DOCKER_HOST
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=$DOCKER_CERT_PATH

# Étape 5 : Votre infrastructure Docker est prête
echo "L'infrastructure Docker est prête à être utilisée."

# Étape 6 : Pour détruire l'infrastructure lorsque vous avez terminé
# Décommentez la ligne suivante et exécutez le script :
# terraform destroy -auto-approve
