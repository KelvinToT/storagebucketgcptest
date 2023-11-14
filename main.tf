terraform {
      required_providers {
        google = {
          source = "hashicorp/google"
          version = "4.51.0"
        }
      }
    }
    
    provider "google" {
        version = "4.51.0"
        credentials = file("/Users/johnf/School/learn-terraform-gcp/terraform-gcp-test-12345-37f477c5d787.json")
        project = "terraform-gcp-test-12345"
        region = "us"
        zone = "s-central1-a"
    }

    resource "google_storage_bucket" "my_bucket" {
      name          = "storagebucketgcptest-11-7-2023-10-20am"
      location      = "US"
      force_destroy = true
    
      storage_class = "STANDARD"

      lifecycle_rule {
        condition {
          age = 365
        }
        action {
          type = "Delete"
        }
      }

    }