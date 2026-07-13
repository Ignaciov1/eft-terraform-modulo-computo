# Ejemplo de Uso: Módulo de Cómputo (EC2)

## Objetivo
Este directorio proporciona un escenario de uso funcional para el Módulo de Cómputo. Su objetivo es demostrar cómo aprovisionar una instancia EC2 parametrizada (AMI, Tamaño, Red), asociando un Perfil de Instancia IAM generado dinámicamente y asegurando el almacenamiento EBS[cite: 20, 22].

## Configuración del Ejemplo
El código en `main.tf` llama al módulo raíz y le proporciona los parámetros necesarios[cite: 23]. Dado que este módulo depende de recursos de red previamente creados[cite: 22], se requiere inyectar obligatoriamente un ID de subred (`subnet_id`) y un ID de grupo de seguridad (`security_group_id`)[cite: 23]. Además, el módulo principal utiliza el proveedor `random` para generar sufijos y evitar colisiones en los nombres de IAM[cite: 20].

## Instrucciones de Despliegue

1. Configura tus credenciales temporales de AWS Academy en tu terminal.
2. Modifica el archivo `main.tf` de esta carpeta reemplazando los valores de `subnet_id` y `security_group_id` con IDs válidos y existentes en tu cuenta de AWS.
3. Ingresa a la carpeta del ejemplo ejecutando:
   `cd examples/`
4. Descarga los proveedores y prepara el entorno ejecutando:
   `terraform init`
5. Visualiza los recursos que se van a crear ejecutando:
   `terraform plan`
6. Confirma y despliega la infraestructura ejecutando:
   `terraform apply -auto-approve`
7. Cuando termines tus validaciones, recuerda limpiar tu entorno ejecutando:
   `terraform destroy -auto-approve`

## Resultados Esperados
Al finalizar el despliegue, Terraform imprimirá en pantalla las siguientes salidas exportadas por el módulo[cite: 21]:
* `test_instance_id`: Identificador único de la instancia EC2 desplegada[cite: 21, 22].
* `test_instance_ip`: Dirección IP pública asignada a la instancia para acceso[cite: 21, 22].