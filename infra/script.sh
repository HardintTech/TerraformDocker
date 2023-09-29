#!/bin/bash

# Variables Terraform
TF_BIN="/usr/bin/terraform"  # Chemin vers l'exécutable Terraform
TF_WORKSPACE="terraform"       # Nom de l'espace de travail Terraform (facultatif)

# Initialisation de Terraform
$TF_BIN init

# Sélection de l'espace de travail Terraform (facultatif)
# $TF_BIN workspace select $TF_WORKSPACE

# Plan Terraform (vérifiez les changements)
$TF_BIN plan

# Appliquer les changements Terraform
$TF_BIN apply -auto-approve

# Si vous avez des étapes supplémentaires après le déploiement, vous pouvez les ajouter ici

# Exemple : Redémarrage du conteneur Docker (si nécessaire)
docker restart mycontainer

# Nettoyage des ressources Terraform (facultatif)
$TF_BIN destroy -auto-approve

echo "L'infrastructure a été déployée avec succès."
