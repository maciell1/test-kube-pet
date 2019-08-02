# Desafio 02: Kubernetes

## Motivação

Este exemplo foi criado utilizando o [minikube](https://kubernetes.io/docs/setup/minikube/), para que seja possível executa-lo em um cluster não gerenciado pelo minikube, é necessário alterar alguns passos no [script de inicialização](https://github.com/maciell1/desafios-devops/blob/master/kubernetes/minikube-deploy-with-helm.sh).

A inicialização da aplicação de se dá com as informações, que são preenchidas no arquivo [values.yaml](https://github.com/maciell1/desafios-devops/blob/0.2/kubernetes/petest/values.yaml), como nome da aplicação, porta do container, nome da imagem, tag, etc.


## Dependências
Para que seja possível executar o projeto utilizando o minikube, é preciso baixá-lo, juntamente com o [kubectl]() e também é preciso ter um virtualizador ([Virtualbox](https://www.virtualbox.org/wiki/Downloads), [KVM](http://www.linux-kvm.org/), [VMware](https://www.vmware.com/products/fusion), etc) em sua instância/notebook.

* Instalação do _kubectl_: https://kubernetes.io/docs/tasks/tools/install-kubectl/
* Instalação do Minikube: https://kubernetes.io/docs/tasks/tools/install-minikube/


**Obs:** Antes de iniciar o processo de deploy, através do script, execute o comando abaixo para capturar o endereço ip do seu cluster e inclua a seguinte entrada no seu arquivo **/etc/hosts/**
