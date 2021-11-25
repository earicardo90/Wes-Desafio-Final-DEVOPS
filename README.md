# Desafio Treinamento Devops
</h3>
<p align="center">
  <a href="#sobreoprojeto">Sobre o projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#desenvolvedores">Desenvolvedores</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#descriçãodoprojeto">Descrição do projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#prerequisitos">Pré requisitos</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<a href="#utilização">Utilização</a>
</p>

## Sobre o projeto

**Objetivo:** Exercitar os conhecimentos adquiridos do treinamento:

-  Criar uma **rede isolada** para a aplicação;
-  Criar uma **pipeline** de infraestrutura para provisionar uma imagem que será utilizada em um cluster kubernetes (single master);
-  Criar uma **pipeline** para provisionar um cluster Kubernetes multi master utilizando a imagem criada na pipeline de infraestrutura;
- Criar uma pipeline para provisionar o banco de dados (dev, stage, prod) que será utilizado nas aplicações que estarão no kubernetes. Esta base de dados, será provisionada em uma instância privada, com acesso a Internet via Nat Gateway na mesma vpc do kubernetes multi master;
-  Criar uma **pipeline** de desenvolvimento para deployar os ambientes de uma aplicação Java (dev, stage, prod) com ligação a um banco de dados mysql-server (utilizar o cluster kubernetes(multi master) provisionado pela pipeline de infraestrutura.
  
Para ver o **Repositório do projeto**, clique aqui: [repo-desafio-final-devops](https://github.com/weslleyfs/Wes-Desafio-Final-Devops)</br>

### Desenvolvedores

- [Ricardo Bastos Natalino](https://github.com/)
- [Ronaldo Yudi Endo](https://github.com/ryudik)
- [Tiago R. Sartorato](https://github.com/tgosartorato)
- [Vinicius Faraco Gimenes](https://github.com/vinigim)
- [Weslley Ferreira Dos Santos](https://github.com/weslleyfs)

## Tecnologias

Plataformas e Tecnologias que utilizamos para desenvolver este projeto:

- [AWS](https://aws.amazon.com/)
- [Linux (Ubuntu)](https://ubuntu.com/)
- [Shell Script](https://www.gnu.org/software/bash/)
- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)
- [Jenkins](https://www.jenkins.io/)
- [Mysql](https://www.mysql.com//)
- [Java](https://www.java.com/)

## Descrição do Projeto

  - A seguir a descrição resumida das Pipelines e soluções adotadas em cada  parte do projeto.
  
### Pré-requisitos

- Ter acesso ao Jenkins onde serão executadas as Pipelines [Jenkins](http://18.230.108.101:8080/);
- Ter acesso a console [AWS](https://console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin);
- Ter uma VPC com Internet Gataway criados e uma Key pair.
> Obs: será necessário fornecer os IDs da VPC, Internet Gataway e Key Pair para as variaveis do terraform

### Utilização:

**1.** Faça o clone do repositorio para sua maquina;

~~~~
git clone https://github.com/weslleyfs/Wes-Desafio-Final-DEVOPS.git
~~~~

**2.** Altere os arquivos de variaveis dentro de cada pasta terraform colocando os IDs da VPC, Internet Gataway e Key Pair;

**3.** Acesse o [Jenkins](http://18.230.108.101:8080/) para iniciar a contrução das Pipelines;

> **IMPORTANTE: A sequencia de criação e execução das Pipelines devem ser respeitadas pois o output de cada Pipeline serão necessários para a contrução da proxima Pipeline:**
>> **1º Build_AMI_AWS**
>>> **2º Build-k8s-mult-master**
>>>> **3º Create-EC2_mysql**
>>>>> **4º Delivery_and_Deployment_Java_app**


* Logado no [Jenkins](http://18.230.108.101:8080/) selecione **New Item** **>** Digite um nome para sua Pipeline **>** Selecione a opção **Pipeline** **>** **OK**
* Dentro de cada pasta do projeto existe um arquivo chamado "jenkinsfile" que deve ser utilizado para construção das respectivas Pipelines, copie seu conteudo para o campo **Script** **>** **SAVE**
* Selecione a opção **Build Now** e após finalizar, atualize sua pagina e selecione a opção **Build with Parameters**
* Digite os parametros necessários conforme descrição de cada etapa.