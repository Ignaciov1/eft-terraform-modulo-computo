# ==============================================================================
# Ejemplo de Despliegue - Módulo de Cómputo
# ==============================================================================

terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Instanciación del módulo de cómputo
module "ec2_ejemplo" {
  # Apunta al directorio raíz del repositorio
  source = "../"

  # Variables obligatorias (Dependencias de red)
  # ATENCIÓN: Reemplaza estos valores con IDs reales de tu cuenta AWS
  subnet_id         = "subnet-0123456789abcdef0"
  security_group_id = "sg-0123456789abcdef0"

  # Variables opcionales
  ami_id        = "ami-0ec10929233384c7f"
  instance_type = "t2.micro"
  instance_name = "AUY1105-ejemplo-ec2"
}

# ==============================================================================
# Outputs de Prueba
# ==============================================================================

output "test_instance_id" {
  description = "ID de la instancia EC2 de prueba generada"
  value       = module.ec2_ejemplo.instance_id
}

output "test_instance_ip" {
  description = "Dirección IP pública de la instancia de prueba"
  value       = module.ec2_ejemplo.instance_ip
}