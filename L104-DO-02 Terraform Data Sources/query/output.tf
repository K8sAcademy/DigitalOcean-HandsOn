output "data_center" {
  value = data.digitalocean_kubernetes_cluster.example.region
}

output "k8s_version" {
  value = data.digitalocean_kubernetes_cluster.example.version
}

output "default_pool_node_count" {
  value = data.digitalocean_kubernetes_cluster.example.node_pool[0].actual_node_count
}