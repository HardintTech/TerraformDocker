#!/bin/bash

# Définition des variables Terraform
TF_DIR="./"

# Étape 1 : Se rendre dans le répertoire Terraform
cd $TF_DIR

# Étape 2 : Utiliser Terraform pour détruire l'infrastructure
terraform destroy -auto-approve

# Étape 3 : Réinitialiser les variables d'environnement Docker
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH

# Étape 4 : Afficher un message indiquant que l'infrastructure a été détruite
echo "L'infrastructure Docker a été détruite."
