resource "google_project_iam_policy" "explicit" {
  project     = "${data.google_client_config.current.project}"
  policy_data = "${data.google_iam_policy.explicit.policy_data}"
}

data "google_iam_policy" "explicit" {
  binding {
    members = ["serviceAccount:attestor@trusted-builds.iam.gserviceaccount.com"]
    role    = "roles/binaryauthorization.attestorsAdmin"
  }

  binding {
    members = ["serviceAccount:attestor@trusted-builds.iam.gserviceaccount.com"]
    role    = "roles/binaryauthorization.policyAdmin"
  }

  binding {
    members = [
      "serviceAccount:attestor@trusted-builds.iam.gserviceaccount.com",
      "serviceAccount:service-${data.google_project.trusted-builds.number}@gcp-sa-binaryauthorization.iam.gserviceaccount.com",
    ]

    role = "roles/binaryauthorization.serviceAgent"
  }

  binding {
    members = ["serviceAccount:${data.google_project.trusted-builds.number}@cloudbuild.gserviceaccount.com"]
    role    = "roles/cloudbuild.builds.builder"
  }

  binding {
    members = ["serviceAccount:${data.google_project.trusted-builds.number}@cloudbuild.gserviceaccount.com"]
    role    = "roles/compute.instanceAdmin"
  }

  binding {
    members = ["serviceAccount:service-${data.google_project.trusted-builds.number}@compute-system.iam.gserviceaccount.com"]
    role    = "roles/compute.serviceAgent"
  }

  binding {
    members = ["serviceAccount:${data.google_project.trusted-builds.number}@cloudbuild.gserviceaccount.com"]
    role    = "roles/compute.storageAdmin"
  }

  binding {
    members = ["serviceAccount:service-${data.google_project.trusted-builds.number}@container-engine-robot.iam.gserviceaccount.com"]
    role    = "roles/container.serviceAgent"
  }

  binding {
    members = ["serviceAccount:attestor@trusted-builds.iam.gserviceaccount.com"]
    role    = "roles/containeranalysis.admin"
  }

  binding {
    members = [
      "serviceAccount:${data.google_project.trusted-builds.number}-compute@developer.gserviceaccount.com",
      "serviceAccount:${data.google_project.trusted-builds.number}@cloudservices.gserviceaccount.com",
      "serviceAccount:attestor@trusted-builds.iam.gserviceaccount.com",
      "serviceAccount:service-${data.google_project.trusted-builds.number}@containerregistry.iam.gserviceaccount.com",
      "serviceAccount:trusted-builds@appspot.gserviceaccount.com",
    ]

    role = "roles/editor"
  }

  binding {
    members = ["serviceAccount:service-${data.google_project.trusted-builds.number}@cloud-filer.iam.gserviceaccount.com"]
    role    = "roles/file.serviceAgent"
  }

  binding {
    members = ["serviceAccount:service-${data.google_project.trusted-builds.number}@sourcerepo-service-accounts.iam.gserviceaccount.com"]
    role    = "roles/sourcerepo.serviceAgent"
  }

  binding {
    members = ["serviceAccount:gke-nodes-cloudlab@kubesec.iam.gserviceaccount.com"]
    role    = "roles/storage.objectViewer"
  }
}