output "bucket_url" {
  value = google_storage_bucket.static-site.url
}

output "external_ip" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}