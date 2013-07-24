/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.DaoUsuario;
import Model.Usuario;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "Usuario", urlPatterns = {"/Usuario"})
public class ServletUsuario extends HttpServlet {

    DaoUsuario daoUsuario = new DaoUsuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String operacao = request.getParameter("operacao");
        RequestDispatcher rd;

        if (operacao.equalsIgnoreCase("cadastrar")) {
            rd = request.getRequestDispatcher("usuarioCadastrar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("sair")) {
            session.invalidate();

            response.sendRedirect("usuarioLogin.jsp");
        } else if (operacao.equalsIgnoreCase("recuperarSenha")) {
            rd = request.getRequestDispatcher("usuarioRecuperarLoginSenha.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("logar")) {
            rd = request.getRequestDispatcher("usuarioLogin.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("editar")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

            request.setAttribute("idUsuario", idUsuario);
            rd = request.getRequestDispatcher("usuarioEditar.jsp");
            rd.forward(request, response);
        } else {
            response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String operacao = request.getParameter("operacao");

        if (operacao.equalsIgnoreCase("cadastrar")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String sen = request.getParameter("senha");
            String senha = Util.Util.criptografar(sen);

            List<Usuario> usuarios = (daoUsuario.listByEmail(email));


            if (!usuarios.isEmpty()) {
                session.setAttribute("mensagem", "Ja existe um usuário cadastrado com este email");
                response.sendRedirect("Usuario?operacao=cadastrar");
            } else {

                usuarios = daoUsuario.listByLogin(login);
                if (!usuarios.isEmpty()) {
                    session.setAttribute("mensagem", "Ja existe um usuário cadastrado com este login");
                    response.sendRedirect("Usuario?operacao=cadastrar");
                } else {
                    Usuario usuario = new Usuario(login, senha, nome, email);
                    daoUsuario.insert(usuario);
                    
                    session.setAttribute("mensagem", "Usuário cadastrado com sucesso!");
                    response.sendRedirect("Paciente?operacao=listar");
                }
            }
        } else if (operacao.equalsIgnoreCase("logar")) {
            if (session.getAttribute("usuario") != null) {
                response.sendRedirect("Paciente?operacao=listar");
            }
            String login = request.getParameter("login");
            String sen = request.getParameter("senha");
            String senha = Util.Util.criptografar(sen);

            if ((daoUsuario.listByLogin(login)).isEmpty()) { //email incorreto
                session.setAttribute("mensagem", "Email ");
                response.sendRedirect("Usuario?operacao=logar");
            } else {
                Usuario usuario = (daoUsuario.listByLogin(login)).get(0);
                if ((usuario != null) && (usuario.getSenha().equals(senha))) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("Paciente?operacao=listar");
                } else { //senha incorreta
                    response.sendRedirect("Usuario?operacao=logar");
                }
            }
        } else if (operacao.equalsIgnoreCase("recuperar")) {
            String email = request.getParameter("email");

            if (!(daoUsuario.listByEmail(email).isEmpty())) {
                Usuario usuario = daoUsuario.listByEmail(email).get(0);
                try {
                    //Opcao em html para enviar imagem
                    int sen = new Random().nextInt();
                    if (sen < 0) {
                        sen = sen * -1;
                    }
                    String senha = Util.Util.criptografar(sen + "");
                    usuario.setSenha(senha);

                    daoUsuario.update(usuario);
                    String caminho = "http://www.sbp.com.br/img/LogoABP1.JPG";
                    Email.sendEmail(email, "Recuperação de Login e Senha",
                            "<img src=\"" + caminho + "\" alt=\"Logo\" /> <br/>"
                            + "Olá " + usuario.getNome() + ", <br/><br/>"
                            + "Seu Login no sistema Antroped é: " + usuario.getLogin()
                            + " <br/>Sua senha é: " + sen + " <br/><br/>"
                            + "Atenciosamente,<br/>Antroped.");
                } catch (Exception ex) {
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }

                response.sendRedirect("Usuario?operacao=logar"); //email enviado com sucesso
            } else {
                response.sendRedirect("Usuario?operacao=recuperarSenha"); //email nao cadastrado
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
                    usuario.setSenha(Util.Util.criptografar(senhaNova));

                    daoUsuario.update(usuario);

                    session.removeAttribute("usuario");
                    session.setAttribute("usuario", usuario);

                    response.sendRedirect("Usuario?operacao=listar"); //sucesso na alteracao
                } else {
                    response.sendRedirect("Usuario?operacao=editar"); //senha invalida
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
