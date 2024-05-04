# This is the bucket for your state files
resource "google_storage_bucket" "raw" {
  project = var.project
  name = "${var.data-project}-raw"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}



terraform {
    backend "gcs" { 
      bucket  = “Lizzo_bucket”
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region = var.region
}

locals {
    labels = {
        "data-project" = var.data-project
    }
}

variable "project" {
    type= string
    description = "ID Google project"
}

variable "region" {
    type= string
    description = "Region Google project"
}

variable  "data-project" {
    type = string
    description = "Name of data pipeline project to use as resource prefix"
}







