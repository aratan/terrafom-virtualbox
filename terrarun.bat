@echo off
cls
terraform init -upgrade
terraform providers

if exist .terraform (
    echo Eliminando el directorio .terraform...
    rmdir /s /q .terraform
)

REM 'del' elimina archivos.
if exist .terraform.lock.hcl (
    echo Eliminando el archivo .terraform.lock.hcl...
    del .terraform.lock.hcl
)

terraform init
set PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
echo.

VBoxManage --version

REM Aplicar configuracion sin confirmacion manual
terraform apply -auto-approve

