# Trabajo Práctico Integrador - Computación Aplicada - Universidad de Palermo

## Integrantes del grupo
- Franco Schwab
- Joaquin Muleiro
  
## Descripción
Este repositorio contiene los archivos y configuraciones correspondientes al Trabajo Práctico Integrador. El objetivo del proyecto es configurar una máquina virtual con Debian GNU/Linux para brindar servicios de red, web, base de datos, almacenamiento y automatización de backups.

Durante el desarrollo del proyecto se realizaron las siguientes tareas:

- **Configuración de entorno:** cambio de contraseña del usuario root, establecimiento del hostname (`TPServer`) y configuración inicial del sistema.
- **Servicios instalados:**
  - **SSH** configurado para acceso remoto mediante clave pública/privada.
  - **Servidor Apache** con soporte para PHP 7.3+, sirviendo contenido desde una partición dedicada.
  - **Servidor MariaDB** con una base de datos precargada a partir del script `db.sql`.
- **Red:** configuración de IP estática y parámetros de red en el archivo correspondiente.
- **Almacenamiento adicional:** adición de un disco virtual con dos particiones estándar para el alojamiento del sitio web y los backups automáticos.
- **Automatización de Backups:**
  - Script `backup_full.sh` desarrollado para realizar copias de seguridad diarias y programadas según frecuencia requerida.
  - Validaciones de sistema de archivos, uso de parámetros dinámicos y mensajes de ayuda integrados.
  - Agregado al cron para ejecución automática.


