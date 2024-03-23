resource "google_storage_bucket" "gcs_bucket" {
  name          = "gcs-bucket-078"
  storage_class = "STANDARD"
  location      = "US"
  force_destroy = true
}