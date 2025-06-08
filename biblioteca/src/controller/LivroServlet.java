package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import model.Livro;

public class LivroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static ArrayList<Livro> livros = new ArrayList<>();

    // post para fazer o cadastro do livro
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoStr = request.getParameter("ano");
        String isbn = request.getParameter("isbn");

        String erro = null;

        if (titulo == null || titulo.trim().isEmpty() ||
            autor == null || autor.trim().isEmpty() ||
            anoStr == null || anoStr.trim().isEmpty() ||
            isbn == null || isbn.trim().isEmpty()) {
            erro = "Todos os campos sao obrigatorios.";
        } else {
            try {
                int ano = Integer.parseInt(anoStr);

                if (!isbn.matches("\\d{10}|\\d{13}")) {
                    erro = "ISBN invalido. Deve conter 10 ou 13 digitos numericos.";
                } else {
                    livros.add(new Livro(titulo.trim(), autor.trim(), ano, isbn.trim()));
                }

            } catch (NumberFormatException e) {
                erro = "Ano deve ser numerico.";
            }
        }

        if (erro != null) {
            request.setAttribute("erro", erro);
        }
        request.setAttribute("livros", livros);
        request.getRequestDispatcher("view/lista.jsp").forward(request, response);
    }

    // get para listar os livros
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbnExcluir = request.getParameter("excluir");
        if (isbnExcluir != null && !isbnExcluir.trim().isEmpty()) {
            livros.removeIf(l -> l.getIsbn().equals(isbnExcluir));
        }
        request.setAttribute("livros", livros);
        request.getRequestDispatcher("view/lista.jsp").forward(request, response);
    }
}
