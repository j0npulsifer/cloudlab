provider "google" {
  credentials = "${file("credentials.json")}"
  project     = "${var.gcp_config["project"]}"
  region      = "${var.gcp_config["region"]}"
  zone        = "${var.gcp_config["zone"]}"
  version     = "~> 1.14"
}

resource "google_project" "trusted-builds" {
  name                = "builds"
  billing_account     = "${var.gcp_config["billing_account"]}"
  folder_id           = "${var.gcp_config["folder"]}"
  project_id          = "${var.gcp_config["project"]}"
  skip_delete         = true
  auto_create_network = "${var.gcp_config["auto_create_network"]}"
}

module "iam" {
  source     = "iam"
  gcp_config = "${var.gcp_config}"
}

module "network" {
  source     = "network"
  gcp_config = "${var.gcp_config}"
}

# build triggers
resource "google_cloudbuild_trigger" "linux-build" {
  trigger_template {
    project     = "trusted-builds"
    repo_name   = "github-j0npulsifer-cloudlab-linux-build"
    branch_name = ".*"
  }

  filename = "cloudbuild.yaml"
}
