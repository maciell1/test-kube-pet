#!/bin/bash
APP="petest"
NAMESPACE="idwall-ns"
DOCKER_IMAGE_NAME="petest-image:latest"

echo "--------------------------------"
echo -e "Hello!\n"

echo -e "Iniciando minikube:"
minikube start > /dev/null 2>&1

echo -ne "Aguarde.\r"
sleep 3
echo -ne "Aguarde..\r"
sleep 3
echo -ne "Aguarde...\r"
sleep 3
echo -ne "Aguarde....\r"
sleep 3
echo -ne "Aguarde.....\r"
sleep 3
echo -ne "Aguarde.....\r"

echo -ne "Instalando o helm...\n"
curl -s https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash > /dev/null 2>&1
echo -ne "Iniciando o helm...\n"
helm init > /dev/null 2>&1
# Habilitar as variaveis do docker 
eval $(minikube docker-env)
# Docker pull das imagens do ingress 
docker pull quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.23.0 > /dev/null 2>&1 && \
docker pull gcr.io/google_containers/defaultbackend:1.4 > /dev/null 2>&1

# Habilitar o nginx como ingress  
echo -e "Instalando addon de ingress\n"
minikube addons enable ingress > /dev/null 2>&1
sleep 15
echo -e "Executando o build da imagem...\n"
sleep 3
docker build -t $DOCKER_IMAGE_NAME  .
echo -e "Executando o deploy da app...\n"
eval $(minikube docker-env)
helm install --name "${APP}" ./"${APP}" --namespace="${NAMESPACE}"
# Mudando para o namespace criado
kubectl config set-context --current --namespace="${NAMESPACE}"
echo "--------------------------------"