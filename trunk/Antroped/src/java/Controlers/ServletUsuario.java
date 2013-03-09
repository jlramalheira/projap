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
        DaoUsuario daoUsuario = new DaoUsuario();
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String operacao;
        operacao = request.getParameter("operacao");

        if (operacao.equalsIgnoreCase("cadastrar")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            List<Usuario> usuarios = (daoUsuario.listByLoginOrEmail(login, email));


            if (!usuarios.isEmpty()) {
                session.setAttribute("mensagem", "O usuário já cadastrado!");

                response.sendRedirect("usuarioCadastrar.jsp");
            } else {
                Usuario usuario = new Usuario(login, senha, nome, email);
                daoUsuario.insert(usuario);
                
                session.setAttribute("mensagem", "Usuario cadastrado com sucesso!");
                response.sendRedirect("usuarioIndex.jsp");
            }
        } else if (operacao.equalsIgnoreCase("entrar")) {
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            if ((daoUsuario.listByLogin(login)).isEmpty()) {
                session.setAttribute("mensagem", "Login incorreto");

                response.sendRedirect("usuarioLogin.jsp");
            } else {
                Usuario usuario = (daoUsuario.listByLogin(login)).get(0);
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

            if (!(daoUsuario.listByEmail(email).isEmpty())) {
                Usuario usuario = daoUsuario.listByEmail(email).get(0);
                try {
                    //Opcao em html para enviar imagem
                    String caminho = "caminho da imagem aqui";
                    Email.sendEmail(email, "Recuperação de Login e Senha",
                            "<img src=\""+caminho+"\" alt=\"Logo\" /> <br/>"
                            + "Olá " + usuario.getNome() + ", <br/><br/>"
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
        } else if (operacao.equalsIgnoreCase("editar")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senhaAtual = request.getParameter("senhaAtual");
            String senhaNova = request.getParameter("senhaNova");

            Usuario usuario = (Usuario) session.getAttribute("usuario");

            if (!usuario.getEmail().equalsIgnoreCase(email)) {
                List<Usuario> usuarios = daoUsuario.listByEmail(email);
                if (!usuarios.isEmpty()) {
                    session.setAttribute("mensagem", "Email já cadastrado!");
                    response.sendRedirect("usuarioEditar.jsp");
                }
            } else {
                if (usuario.getSenha().equals(senhaAtual)) {
                    usuario.setEmail(email);
                    usuario.setNome(nome);
                    usuario.setSenha(senhaNova);
                    
                    daoUsuario.update(usuario);
                    session.setAttribute("mensagem", "Sucesso na alteração!");
                    response.sendRedirect("usuarioIndex.jsp");
                } else {
                    session.setAttribute("mensagem", "Senha invalida");
                    response.sendRedirect("usauarioEditar.jsp");
                }
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
