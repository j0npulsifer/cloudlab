provider "vault" {
  version = "~> 1.5"
  address = "https://vault.k8s.lolwtf.ca"
}

terraform {
  backend "gcs" {
    bucket         = "kubesec"
    prefix         = "state/vault"
    project        = "kubesec"
    encryption_key = ""
  }

  version = "0.11.11"
}