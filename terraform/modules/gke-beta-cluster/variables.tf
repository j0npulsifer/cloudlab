variable "name" {
  description = "Prefix of the cluster resources"
  default     = "lab"
}

variable "cluster_config" {
  type = "map"

  default = {
    online               = false
    beta                 = true
    node_count           = 1
    image_type           = "COS_CONTAINERD"
    machine_type         = "n1-standard-1"
    alpha                = false
    preemptible          = true
    metadata_proxy       = true
    network_policy       = true
    istio                = true
    binary_authorization = true
    node_cidr            = "10.0.0.0/24"
    service_cidr         = "10.1.0.0/24"
    pod_cidr             = "10.2.0.0/19"
  }
}
