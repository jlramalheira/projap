/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.DaoUsuario;
import Model.Usuario;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Max
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String operacao = request.getParameter("operacao");

        if (operacao.equalsIgnoreCase("sair")) {
            session.invalidate();
            response.sendRedirect("usuarioLogin.jsp");
        } else if (operacao.equalsIgnoreCase("esqueceuSenha")) {
            response.sendRedirect("usuarioRecuperarLoginSenha.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String operacao;
        operacao = request.getParameter("operacao");

        if (operacao.equalsIgnoreCase("cadastrar")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            List<Usuario> usuarios = (new DaoUsuario().listByLoginEmail(login, email));


            if (!usuarios.isEmpty()) {
                session.setAttribute("mensagem", "O usuário já cadastrado!");

                response.sendRedirect("usuarioCadastrar.jsp");
            } else {
                Usuario usuario = new Usuario(login, senha, nome, email);
                new DaoUsuario().insert(usuario);

                session.setAttribute("usuario", usuario);

                response.sendRedirect("usuarioLogin.jsp");
            }
        } else if (operacao.equalsIgnoreCase("entrar")) {
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            if ((new DaoUsuario().listByLogin(login)).isEmpty()) {
                session.setAttribute("mensagem", "Login incorreto");

                response.sendRedirect("usuarioLogin.jsp");
            } else {
                Usuario usuario = (new DaoUsuario().listByLogin(login)).get(0);
                if ((usuario != null) && (usuario.getSenha().equals(senha))) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("usuarioIndex.jsp");
                } else {
                    session.setAttribute("mensagem", "Senha incorreta");
                    response.sendRedirect("usuarioLogin.jsp");
                }
            }
        } else if (operacao.equalsIgnoreCase("recuperar")) {
            String email = request.getParameter("email");

            if (!(new DaoUsuario().listByEmail(email).isEmpty())) {
                Usuario usuario = new DaoUsuario().listByEmail(email).get(0);
                try {
                    //Opcao em html para enviar imagem
                    Email.sendEmail(email, "Recuperação de Login e Senha",
                            "<img src=\"caminhoLogo\" alt=\"Logo\" /> <br/>"
                            +"Olá " + usuario.getNome() + ", <br/><br/>"
                            + "Seu Login no sistema Antroped é: " + usuario.getLogin()
                            + " <br/>Sua senha é: " + usuario.getSenha() + " <br/><br/>"
                            + "Atenciosamente,<br/>Antroped.");
                } catch (Exception ex) {
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("mensagem", "Email de recuperação enviado com sucesso");
                response.sendRedirect("usuarioLogin.jsp");
            } else {
                session.setAttribute("mensagem", "Usuario não cadastrado");
                response.sendRedirect("usuarioRecuperarLoginSenha.jsp");
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
