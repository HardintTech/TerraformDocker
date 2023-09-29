provider "docker" {
  host = "unix:///var/run/docker.sock" # Chemin du socket Docker local
}

resource "docker_image" "build" {
  name         = "nom-de-votre-image:tag" # Nom et tag de l'image Docker
  build        = {
    context    = "${path.module}/chemin-vers-votre-dockerfile" # Chemin vers le Dockerfile
    dockerfile = "${path.module}/chemin-vers-votre-dockerfile/Dockerfile" # Chemin complet vers le Dockerfile
  }
}

resource "docker_container" "container" {
  name  = "nom-de-votre-container" # Nom de votre conteneur Docker
  image = docker_image.build.name

  # Vous pouvez ajouter d'autres configurations du conteneur ici, comme les ports, les volumes, etc.
}
