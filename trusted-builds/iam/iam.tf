variable "gcp_config" {
  type = "map"
}

resource "google_project_iam_policy" "project" {
  project     = "${var.gcp_config["project_id"]}"
  policy_data = "${data.google_iam_policy.project.policy_data}"
}

data "google_iam_policy" "project" {
  binding {
    role = "roles/editor"

    members = [
      # make this better
      "serviceAccount:service-821879192255@containerregistry.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/containeranalysis.ServiceAgent"

    members = [
      "serviceAccount:service-821879192255@container-analysis.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/sourcerepo.serviceAgent"

    members = [
      "serviceAccount:service-821879192255@sourcerepo-service-accounts.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/compute.instanceAdmin"

    members = [
      "serviceAccount:821879192255@cloudbuild.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/compute.imageUser"

    members = [
      "serviceAccount:594184039024@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/compute.storageAdmin"

    members = [
      "serviceAccount:821879192255@cloudbuild.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudbuild.builds.builder"

    members = [
      "serviceAccount:821879192255@cloudbuild.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/logging.logWriter"

    members = [
      "serviceAccount:${google_service_account.builder.email}",
    ]
  }

  binding {
    role = "roles/monitoring.metricWriter"

    members = [
      "serviceAccount:${google_service_account.builder.email}",
    ]
  }
}