# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Enable ssh
sudo apt install openssh-server -y

# Set Madrid timezone
sudo timedatectl set-timezone Europe/Madrid

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install otros paquetes necesarios
sudo apt-get install -y net-tools nano unzip

# Crear servicio
sudo service docker start

# Descargar imagenes necesarias

docker image pull php:8-fpm
docker image pull mysql:8.0
docker image pull frreimon/pavener_tv:1.0
docker image pull nginx:latest
