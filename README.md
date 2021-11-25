<h1 align="center"><img src="https://i.imgur.com/nwfkVsb.png" title="Clínica Pomarola" /></h1>
<h3 align="center">  Desafio Treinamento Devops</h3>
<p align="center">  <a href="#sobre o projeto">Sobre o projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <a href="#tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <a href="#iniciando">Iniciando</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <a href="#funcionalidades">Funcionalidades</a></p>
##   Sobre o projeto
**Objetivo:** Exercitar os conhecimentos adquiridos do treinamentoeta:- Criar uma **rede isolada** para esta aplicação- Criar uma **pipeline** de infraestrutura para provisionar uma imagem que será utilizada em um cluster kubernetes (single master)- Criar uma **pipeline** para provisionar um cluster Kubernetes multi master utilizando a imagem criada na pipeline de infraestrutura - Criar uma pipeline para provisionar o banco de dados (dev, stage, prod) que será utilizado nas aplicações que estarão no kubernetes. Esta base de dados, será provisionada em uma instância privada, com acesso a Internet via Nat Gateway na mesma vpc do kubernetes multi master - Criar uma **pipeline** de desenvolvimento para deployar os ambientes de uma aplicação Java (dev, stage, prod) com ligação a um banco de dados mysql-server (utilizar o cluster kubernetes(multi master) provisionado pela pipeline de infraestrutura 
Para ver o **Repositório do projeto**, clique aqui: [repo-desafio-final-devops](https://github.com/weslleyfs/Wes-Desafio-Final-Devops)</br>
###   Desenvolvedores- [Ricardo Bastos Natalino](https://github.com/)- [Ronaldo Yudi Endo](https://github.com/ryudik)- [Tiago R. Sartorato](https://github.com/)- [Vinicius Faraco Gimenes](https://github.com/)- [Weslley Ferreira Dos Santos](https://github.com/weslleyfs)
##   Tecnologias
Plataformas e Tecnologias que utilizamos para desenvolver este projeto:
- [AWS](https://aws.amazon.com/)- [Linux (Ubuntu)](https://ubuntu.com/)- [Shell Script](https://www.gnu.org/software/bash/)- [Terraform](https://www.terraform.io/)- [Ansible](https://www.ansible.com/)- [Docker](https://www.docker.com/)- [Kubernetes](https://kubernetes.io/)- [Jenkins](https://www.jenkins.io/)- [Mysql](https://www.mysql.com//)- [Java](https://www.java.com/)

##   Descrição do Projeto
- A seguir a descrição resumida das Pipelines e soluções adotadas em cada  parte do projeto.
### Pré-requisitos
Configure um banco de dados [PostgreSQL](https://www.postgresql.org/) na sua máquina e crie um novo banco.
#### Criação da pipeline de infraestrutura para provisionar e guardar uma imagem**- [Repositório](hhttps://github.com/weslleyfs/Wes-Desafio-Final-DEVOPS/tree/main/Build_AMI_AWS)Edite o arquivo "env_example" com as configurações do seu banco de dados:
```DB_USER=seu_usuarioDB_PASSWORD=sua_senhaDB_HOST=seu_hostDB_PORT=sua_portDB_NAME=nome_do_bancoJWT_SECRET=seu_segredo
```
#### Criação da pipeline para provisionar um cluster Kubernetes multi master**- [Repositório](https://github.com/weslleyfs/Wes-Desafio-Final-DEVOPS/tree/main/Build-k8s-mult-master)
Edite o arquivo "env_example" com as configurações do seu banco de dados:
```DB_USER=seu_usuarioDB_PASSWORD=sua_senhaDB_HOST=seu_hostDB_PORT=sua_portDB_NAME=nome_do_bancoJWT_SECRET=seu_segredo
```
#### Criação da pipeline para provisionar mysqls externos em redes isoladas (dev, stage, prod)**

Edite o arquivo "env_example" com as configurações do seu banco de dados:
```DB_USER=seu_usuarioDB_PASSWORD=sua_senhaDB_HOST=seu_hostDB_PORT=sua_portDB_NAME=nome_do_bancoJWT_SECRET=seu_segredo
```
####  Criação da pipeline de de desenvolvimento para deploy de uma aplicação Java nos ambientes (dev, stage, prod)**
Edite o arquivo "env_example" com as configurações do seu banco de dados:
```DB_USER=seu_usuarioDB_PASSWORD=sua_senhaDB_HOST=seu_hostDB_PORT=sua_portDB_NAME=nome_do_bancoJWT_SECRET=seu_segredo

##   FuncionalidadesFuncionalidades que o sistema oferece:- Cadastro e Login de Usuários- Cadastro de Clientes e Especialistas- Cadastro de Atendimentos e de Históricos de Prontuários- Pesquisa  - Busca de atendimentos por Status, Paciente, Especialista, Data de agendamento ou de atendimento- Criação de Agendamentos- Criptografia de senhas- Sistema de autenticação de usuário- Validação de requisições- Mensagens de erro customizadas *user friendly*- Documentação dos endpoints
##   Licença
Este projeto está sob a licença de (PomaLabs).

> Written with [StackEdit](https://stackedit.io/).
-- 
Weslley Ferreira dos SantosTel.: (11) 96311 1515E-mail: weslley2404@gmail.com