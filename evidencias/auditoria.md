# Auditoría Terraform 3

Base consultada: tercer-programa, commit 9d0eb0eb0ec423248007a0df5e7031c29d138e8f.
Se leyeron completamente main.tf, variables.tf y Recursos importantes.txt.

- Correcto: cinco recursos QA y sus dependencias. Linux F1, Node 24-lts, HTTPS, TLS 1.2, FTPS Disabled y always_on=false. Workspace e Insights con límites diarios 0.1 GB.
- Ajuste: subscription_id=GATO no es utilizable. Se requiere variable de entorno TF_VAR_subscription_id obtenida de la sesión real.
- Faltante: configuración explícita del proveedor, versiones, locals utilizados y exclusiones de Git. Se agregaron salidas sin claves ni conexiones para comprobar los nombres.
- Validación: disponibilidad regional, cuota real de F1, versión Node y unicidad global del nombre de Web App.

El sufijo se dedujo del nombre original app-utvt-integradora-web-qa-mxc-001. México Central es una inferencia de mxc y de la región de Terraform 2; no una definición existente en los archivos originales.

Referencias oficiales del profesor:
- https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

Versión exacta del proveedor: 5.9.0. Su documentación linux_web_app admite Node 24-lts.
No se cambió el repositorio del profesor ni los entregables de Terraform 2.
