<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String contextPath = request.getContextPath();

    String titulo = request.getParameter("titulo") != null ? request.getParameter("titulo") : "";
    String autor = request.getParameter("autor") != null ? request.getParameter("autor") : "";
    String ano = request.getParameter("ano") != null ? request.getParameter("ano") : "";
    String isbn = request.getParameter("isbn") != null ? request.getParameter("isbn") : "";

    String erro = (String) request.getAttribute("erro");
%>
<html>
<head>
    <title>Cadastro de Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 40px;
        }
        h2 {
            color: #2f3640;
            margin-left: 130px;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            max-width: 400px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #2d3436;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-transform: capitalize;
        }
        input[type="submit"] {
            background-color: #0984e3;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover:not(:disabled) {
            background-color: #74b9ff;
        }
        input[type="submit"]:disabled {
            background-color: #b2bec3;
            cursor: not-allowed;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            margin-left: 150px;
            color: #0984e3;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .erro {
            color: red;
            margin-bottom: 20px;
            margin-left: 130px;
        }
    </style>

    <script>
        function capitalizeInput(id) {
            let input = document.getElementById(id);
            input.value = input.value.replace(/\b\w/g, function(char) {
                return char.toUpperCase();
            });
        }

        function onSubmitForm() {
            capitalizeInput('titulo');
            capitalizeInput('autor');
            return true; 
        }

        function validarCampos() {
            const titulo = document.getElementById('titulo').value.trim();
            const autor = document.getElementById('autor').value.trim();
            const ano = document.getElementById('ano').value.trim();
            const isbn = document.getElementById('isbn').value.trim();

            const btn = document.getElementById('btnCadastrar');

            if(titulo && autor && ano && isbn) {
                btn.disabled = false;
            } else {
                btn.disabled = true;
            }
        }

        window.onload = function() {
            validarCampos(); 
            document.getElementById('titulo').addEventListener('input', validarCampos);
            document.getElementById('autor').addEventListener('input', validarCampos);
            document.getElementById('ano').addEventListener('input', validarCampos);
            document.getElementById('isbn').addEventListener('input', validarCampos);
        }
    </script>
</head>
<body>

    <h2>Cadastrar Livro</h2>

    <% if (erro != null) { %>
        <p class="erro"><%= erro %></p>
    <% } %>

    <form action="<%= contextPath %>/livro" method="post" onsubmit="return onSubmitForm();">
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" id="titulo" value="<%= titulo %>">

        <label for="autor">Autor:</label>
        <input type="text" name="autor" id="autor" value="<%= autor %>">

        <label for="ano">Ano:</label>
        <input type="text" name="ano" id="ano" value="<%= ano %>">

        <label for="isbn">ISBN:</label>
        <input type="text" name="isbn" id="isbn" value="<%= isbn %>">

        <input type="submit" id="btnCadastrar" value="Cadastrar" disabled>
    </form>

    <a href="<%= contextPath %>/livro">Ver lista de livros</a>

</body>
</html>
