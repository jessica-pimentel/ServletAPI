# 📚 Sistema Web - Biblioteca (**Java, Servlets, JSP, JSF**)

## 🎯 Objetivo

Desenvolver um sistema web em Java utilizando Servlets, JSP e JSF, aplicando os conceitos de orientação a objetos e o padrão arquitetural MVC (Model-View-Controller). O sistema permite gerenciar um acervo de livros de forma simples e eficaz.

---

## ✅ Funcionalidades

- **Cadastro de Livros**
  - Campos obrigatórios: Título, Autor, Ano de publicação, ISBN.
  - Validações de entrada (sem letras em campos numéricos, obrigatoriedade, etc.).

- **Listagem de Livros**
  - Exibição clara e organizada de todos os livros cadastrados.

- **Exclusão de Livros**
  - Permite excluir livros da lista com base no ISBN (ou ID futuro).

---

## 🛠️ Requisitos Técnicos

- Linguagem: Java
- Tecnologias:
  - **Servlets** para controle e lógica do sistema.
  - **JSP/JSF** para construção das interfaces.
- Padrão de Projeto: **MVC**
- Estrutura:
  - `model/` → classes de domínio
  - `controller/` → Servlets
  - `view/` → arquivos JSP
- Não são utilizados frameworks externos ou IDEs visuais (código autoral).
- Tratamento de erros comuns (ex: campos vazios, ISBN inválido, etc.).

---

## 📂 Estrutura do Projeto

````` 
biblioteca/
│
├── src/
│   ├── model/
│   │   └── Livro.java
│   └── controller/
│       └── LivroServlet.java
│
├── WebContent/
│   └── view/
│       ├── index.jsp
│       └── lista.jsp
│
└── webapps/
    └── biblioteca/
        └── WEB-INF/
            └── classes/
````` 
---

## ⚙️ Instruções de Execução

### 1. Compilar o arquivo `Livro.java`

Para compilar a classe modelo `Livro.java`, execute o comando:

    javac -d "C:\apache-tomcat-10.1.41\webapps\biblioteca\WEB-INF\classes" ^
    "C:\Users\jppim\source\Trabalhos\Faculdade\fabrica_software\biblioteca\src\model\Livro.java"

### 2. Compilar o arquivo `LivroServlet.java`

Para compilar o servlet `LivroServlet.java`, execute:

    javac -cp "C:\apache-tomcat-10.1.41\lib\servlet-api.jar;C:\apache-tomcat-10.1.41\webapps\biblioteca\WEB-INF\classes" ^
    -d "C:\apache-tomcat-10.1.41\webapps\biblioteca\WEB-INF\classes" ^
    "C:\Users\jppim\source\Trabalhos\Faculdade\fabrica_software\biblioteca\src\controller\LivroServlet.java"

### 3. Reiniciar o Apache Tomcat

Navegue até o diretório do Tomcat e reinicie o servidor:

    cd C:\apache-tomcat-10.1.41\bin
    .\shutdown.bat & .\startup.bat

### 4. Copiar arquivos JSP para a pasta do Tomcat

Copie os arquivos JSP para o diretório do Tomcat para que fiquem disponíveis no deploy:

    copy "C:\Users\jppim\source\Trabalhos\Faculdade\fabrica_software\biblioteca\WebContent\view\index.jsp" ^
    "C:\apache-tomcat-10.1.41\webapps\biblioteca\view\index.jsp"

    copy "C:\Users\jppim\source\Trabalhos\Faculdade\fabrica_software\biblioteca\WebContent\view\lista.jsp" ^
    "C:\apache-tomcat-10.1.41\webapps\biblioteca\view\lista.jsp"

## 🌐 Acessando o Sistema

Abra o navegador em modo anônimo e acesse as URLs abaixo para usar o sistema:

- Tela de Cadastro:  
  http://localhost:8080/biblioteca/view/index.jsp

- Listagem de Livros:  
  http://localhost:8080/biblioteca/

