<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Livro" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>Lista de Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 40px;
        }

        h2 {
            color: #2f3640;
            margin-bottom: 20px;
            margin-left: 190px
        }

        .container {
            width: 620px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
            text-align: center;         
            vertical-align: middle;     
            border-bottom: 1px solid #ddd;
            border-right: 1px solid #ddd;
            text-transform: capitalize;
        }

        th:last-child,
        td:last-child {
            border-right: none;
        }

        th {
            background-color: #0984e3;
            color: white;
        }

        tr:hover {
            background-color: #f1f2f6;
        }

        a {
            color: #0984e3;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .erro {
            color: red;
            margin-bottom: 20px;
        }

        .link-bottom {
            display: inline-block;
            margin-top: 20px;
            margin-left: 225px;
            color: #0984e3;
            text-decoration: none;
        }

        .link-bottom:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Livros Cadastrados</h2>

        <% if (request.getAttribute("erro") != null) { %>
            <p class="erro"><%= request.getAttribute("erro") %></p>
        <% } %>

        <table>
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>ISBN</th>
                <th>Ação</th>
            </tr>
            <%
                List<Livro> livros = (List<Livro>) request.getAttribute("livros");
                if (livros != null && !livros.isEmpty()) {
                    for (Livro l : livros) {
            %>
            <tr>
                <td><%= l.getTitulo() %></td>
                <td><%= l.getAutor() %></td>
                <td><%= l.getAno() %></td>
                <td><%= l.getIsbn() %></td>
                <td><a href="<%= contextPath %>/livro?excluir=<%= l.getIsbn() %>">Excluir</a></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="5">Nenhum livro cadastrado.</td>
            </tr>
            <% } %>
        </table>

        <a class="link-bottom" href="<%= contextPath %>/view/index.jsp">Cadastrar novo livro</a>
    </div>

</body>
</html>
