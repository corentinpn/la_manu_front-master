terraform {
  required_version = ">= 1.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }

    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "local" {}

provider "virtualbox" {}

# Création fichier local
resource "local_file" "exemple" {
  content  = "Bravo Corentin ! Ceci est ton fichier généré avec Terraform local "
  filename = "${path.module}/hello.txt"
}
resource "virtualbox_vm" "ubuntu_vm" {
  name   = "ubuntu-ci-vm"
  image  = "${path.module}/ubuntu.box"  
  cpus   = 2
  memory = 2048

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}

