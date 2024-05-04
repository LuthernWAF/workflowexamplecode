# This is the bucket for your state files
resource "google_storage_bucket" "raw" {
  project = var.project
  name = "${var.data_project}-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}



terraform {
    backend "gcs" { 
      bucket  = "Lizzo_bucket"
      credentials = "lizzo.json"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region = var.region
}

locals {
    labels = {
        "data-project" = var.data_project
    }
}

variable "project" {
    type= string
    default = "lizzo.lizzo"
    description = "ID Google project"
}

variable "region" {
    type= string
    default = "lizzo.lizzo"
    description = "Region Google project"
}

variable  "data_project" {
    type = string
    default = "lizzo.lizzo"
    description = "Name of data pipeline project to use as resource prefix"
}







