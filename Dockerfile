# Usar Ubuntu 24.01 como base
FROM ubuntu:20.04

# Ejecutar comandos como root
USER root

# Actualizar paquetes e instalar dependencias
RUN apt -y update && \
    apt install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar clave de Docker y repositorio
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Actualizar lista de paquetes e instalar Docker
RUN apt -y update && \
    apt-cache policy docker-ce && \
    apt -y install docker-ce && \
    docker --version

# Instalar Docker Compose
RUN curl -SL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    docker-compose --version

# Exponer el puerto Docker (opcional)
EXPOSE 2375
