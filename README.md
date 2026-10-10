# Práctica Terraform 3

Alumno: Felipe de Jesús Serrano Hurtado.
Repositorio de entrega: https://github.com/al222311440-source/terraform-3
Base: https://github.com/jorgealmeidamontiel/terraform-laboratories/tree/main/tercer-programa

## Auditoría y configuración

La carpeta original contiene solamente main.tf, variables.tf y Recursos importantes.txt. Define cinco recursos QA, pero omite provider, versiones y los locales utilizados. El valor GATO no es una suscripción válida.

Se conservaron los cinco recursos y su configuración de seguridad. Se añadieron AzureRM, versiones, locales, salidas de nombres y URL, y .gitignore. El sufijo utvt-integradora-web-qa-mxc-001 procede del nombre original de la Web App; México Central se infiere de mxc y de la práctica previa. La Web App incorpora al222311440 para personalizar su nombre global. Las referencias originales recomiendan rg, log, appi, asp y app.

AzureRM 5.9.0 admite Node 24-lts. El plan Linux permanece F1, always_on=false. El Workspace mantiene PerGB2018, retención de 30 días y cuota diaria 0.1 GB. Application Insights se enlaza al Workspace y conserva su límite 0.1 GB. HTTPS es obligatorio, TLS mínimo 1.2 y FTPS deshabilitado.

## Ejecución

En Azure Cloud Shell Bash, verificar primero la cuenta universitaria y la suscripción activa. Registrar únicamente Microsoft.Web, Microsoft.OperationalInsights y Microsoft.Insights cuando sean necesarios.

```bash
export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
export TF_VAR_subscription_id="$ARM_SUBSCRIPTION_ID"
terraform fmt -check
terraform init
terraform validate
terraform plan -out=practice.tfplan
# Revisar contexto, cuotas y exactamente cinco altas antes de aplicar.
terraform apply practice.tfplan
terraform plan
```

No publicar estados, planes, valores de conexión ni identificadores privados. Guardar el estado por separado para futuras operaciones. No se incluye código de aplicación: la práctica provisiona infraestructura, no demuestra una aplicación Node desplegada ni ingesta de telemetría real.

## Costos y limpieza

F1 es gratuito. Log Analytics y Application Insights pueden facturar ingesta; sus topes diarios no garantizan ausencia de cargos. Tras la evaluación, conviene eliminar únicamente esta práctica usando su estado y terraform destroy, previa revisión del plan de destrucción. No ejecutar automáticamente.

## Estado de ejecución

Despliegue completado en Azure Cloud Shell Bash: Terraform 1.16.0, Azure CLI 2.90.0 y AzureRM 5.9.0. fmt e init correctos; validate válido; plan inicial de 5 altas. El nombre global estaba disponible.

La cuota Total Regional VMs informó límite cero. Se aplicó excepcionalmente un plan dirigido a service_plan y su grupo para comprobar F1 antes de crear monitoreo. El resultado real fue 2 altas correctas. Después se generó y aplicó un plan completo sin -target: 3 altas, sin cambios ni eliminaciones. No se utilizó el plan inicial después de cambiar el estado.

Azure confirmó los cinco recursos, Linux F1/Free, Workspace PerGB2018, retención 30 días y ambos topes diarios 0.1 GB. Se comprobaron HTTPS obligatorio, NODE|24-lts, TLS 1.2, FTPS Disabled y alwaysOn=false. La conexión de Insights coincide con la configuración de Web App y el componente apunta al Workspace correcto. El agente está configurado en ~3. No se publicaron valores de conexión ni claves.

La Web App respondió HTTP 200 con la página inicial de Azure App Service, esperando contenido. No se desplegó código de aplicación ni se afirmó ingesta real de telemetría Node.

El plan final completo mostró No changes. Your infrastructure matches the configuration., con código de salida 0. Los registros originales y el estado real se conservaron en un respaldo privado. Las evidencias de este repositorio ocultan el identificador de suscripción y la cuenta institucional. Los archivos de Terraform coinciden con los aplicados.
