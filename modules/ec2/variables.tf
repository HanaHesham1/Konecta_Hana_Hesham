module "arch2" {
  source   = "./modules/ec2"
  filename = "arch2.txt"
  content  = "This is Arch2, managed using Terraform!"
}
