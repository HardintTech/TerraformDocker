provider "docker" {
  host = "unix:///var/run/docker.sock" # Chemin du socket Docker local
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "myimage" {
  name = "myimage:latest" # Nom et tag de l'image Docker
  build {
    context    = ".."           # Chemin vers le répertoire contenant le Dockerfile
    dockerfile = "../Dockerfile" # Chemin complet vers le Dockerfile
  }
}

resource "docker_container" "mycontainer" {
  name  = "mycontainer1"      # Nom de votre conteneur Docker
  image = docker_image.myimage.name

  # Vous pouvez ajouter d'autres configurations du conteneur ici, comme les ports, les volumes, etc.
}
