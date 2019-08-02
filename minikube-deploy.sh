#!/bin/bash
echo "--------------------------------"
echo -e "Seja bem vindo!\n"

echo -e "Iniciando minikube :)"
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

# Habilitar as variaveis do docker 
eval $(minikube docker-env)
# Docker pull das imagens do ingress 
docker pull quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.23.0 > /dev/null 2>&1 && \
docker pull gcr.io/google_containers/defaultbackend:1.4 > /dev/null 2>&1

# Habilitar o nginx como ingress  
echo -e "Instalando addon de ingress\n"
minikube addons enable ingress > /dev/null 2>&1
sleep 15
DOCKER_IMAGE_NAME="petest-image:latest"
NAMESPACE=$(grep -i 'namespace:' manifests/app.yml | uniq | awk -F " " '{print$2}')
SERVICE=$(kubectl get svc | awk '{print$1}' | grep -iv 'name')

echo -e "Executando o build da imagem...\n"
sleep 3
eval $(minikube docker-env)
docker build -t $DOCKER_IMAGE_NAME  .
echo -e "Executando o deploy da app...\n"
kubectl apply -f manifests/app.yml
sleep 2
echo -e "\n"
## Alterando para o novo namespace
kubectl config set-context --current --namespace="${NAMESPACE}"  > /dev/null 2>&1

## Deletando imagem do host ##
docker rmi -f $DOCKER_IMAGE_NAME > /dev/null 2>&1

sleep 5

## Acessando url via curl 
echo -e "Vamos acessar a app utilizando o curl :)"
echo -e "curl hello-idwall.challenge\n"
curl hello-idwall.challenge
echo ""
echo -e "Pode ser testado via browser também, obrigado!\n"

echo "--------------------------------"