#Declarar un proveedor de nube
provider "aws" {
  region = "us-east-1"
  profile = "aws_icesi"
}
#Recursos declaraciones de componentes
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default VPC"
  }
}

data "aws_vpc" "default" {
    default = true
}

resource "aws_instance" "web" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t3.micro"

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "bd" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "bd"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "backend"
  }
}

#Consultas de datos (opcional)

#Ciclo de vida Terraform

#inicializar: terraform init

#verificar el diseño: terraform plan

#aplicar el diseño: terraform apply

#Destruir una infraestructura: terraform destroy