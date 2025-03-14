provider "aws" {
  region = var.region
}

resource "local_file" "arch2_file" {
  filename = var.filename
  content  = var.content

  lifecycle {
    prevent_destroy = true
  }
}



