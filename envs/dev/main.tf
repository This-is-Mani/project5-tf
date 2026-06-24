module "vpc" {
  source             = "../../modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone  = var.az
  environment        = "dev"
}

module "ec2" {
  source             = "../../modules/ec2"
  ami                = var.ami
  instance_type      = var.instance_type
  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.vpc.ssh_sg_id]
  environment        = "dev"
}
