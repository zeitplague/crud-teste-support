## Descrição do Projeto
Este projeto é um sistema de gerenciamento de veículos que implementa operações de CRUD (Create, Read, Update, Delete) utilizando Java Server Pages (JSP) para a camada de apresentação e MySQL para o banco de dados. O sistema permite o cadastro, consulta, atualização e exclusão de veículos.

## Funcionalidades
- Cadastro de Veículos: O sistema permite adicionar novos veículos com informações como placa, marca, modelo e tipo.
- Consulta de Veículos: É possível buscar veículos pelo número da placa.
- Alteração de Veículos: Os dados de um veículo podem ser atualizados.
- Exclusão de Veículos: Veículos podem ser removidos do sistema.
## Tecnologias Utilizadas
- Backend: JSP (Java Server Pages), JDBC (Java Database Connectivity)
Frontend: HTML5, CSS
- Banco de Dados: MySQL
- Servidor: Apache Tomcat
## Requisitos de Instalação
- Java Development Kit 20
- Apache Tomcat 9
- MySQL 8.0.40
- Driver JDBC para MySQL (mysql-connector-java 9.1.0)

## sql

```sql
CREATE DATABASE portarius;
CREATE TABLE veiculos (
    placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    tipo_veiculo VARCHAR(20) NOT NULL
);
```

## Configuração do Projeto
1. Clone o projeto ou faça o download dos arquivos.

2. Altere essa parte de acordo com as configurações do seu banco:
Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/portarius", "root", "root123");

3. Coloque o driver JDBC no diretório lib do Apache Tomcat:

4. Baixe o driver mysql-connector-java e coloque-o na pasta WEB-INF/lib.

5. Compile o Projeto

6. Coloque a pasta do projeto no diretório webapps do Tomcat.

7. Inicie o servidor Tomcat e acesse a aplicação via navegador: http://localhost:8080/crud/

## Alternativa Caso Não Rode

Nesse link tem uma demonstração do funcionamento do CRUD: https://youtu.be/hPh1-s0kyF0
