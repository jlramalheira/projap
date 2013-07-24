/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.DaoUsuario;
import Model.Usuario;
import Util.Message;
import java.io.IOException;
import java.util.ArrayList;
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
        } else if (operacao.equalsIgnoreCase("editarSenha")) {
            rd = request.getRequestDispatcher("usuarioEditarSenha.jsp");
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
        ArrayList<Message> messages = new ArrayList<Message>();
        String operacao = request.getParameter("operacao");

        if (operacao.equalsIgnoreCase("cadastrar")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String sen = request.getParameter("senha");
            String senha = Util.Util.criptografar(sen);

            List<Usuario> usuarios = (daoUsuario.listByEmail(email));


            if (!usuarios.isEmpty()) {
                Message message = new Message("Email já cadastrado!", Message.TYPE_ERROR);
                messages.add(message);

                session.setAttribute("messages", messages);
                response.sendRedirect("Usuario?operacao=cadastrar");
            } else {

                usuarios = daoUsuario.listByLogin(login);
                if (!usuarios.isEmpty()) {
                    Message message = new Message("Login já cadastrado!", Message.TYPE_ERROR);
                    messages.add(message);

                    session.setAttribute("messages", messages);
                    response.sendRedirect("Usuario?operacao=cadastrar");
                } else {
                    Usuario usuario = new Usuario(login, senha, nome, email);
                    daoUsuario.insert(usuario);

                    Message message = new Message("Usuário cadastrado com sucesso!", Message.TYPE_SUCCESS);
                    messages.add(message);

                    session.setAttribute("messages", messages);
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

            if ((daoUsuario.listByLogin(login)).isEmpty()) { //login incorreto
                Message message = new Message("Login incorreto!", Message.TYPE_ERROR);
                messages.add(message);

                session.setAttribute("messages", messages);
                response.sendRedirect("Usuario?operacao=logar");
            } else {
                Usuario usuario = (daoUsuario.listByLogin(login)).get(0);
                if ((usuario != null) && (usuario.getSenha().equals(senha))) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("Paciente?operacao=listar");
                } else {
                    Message message = new Message("Sennha incorreta!", Message.TYPE_ERROR);
                    messages.add(message);

                    session.setAttribute("messages", messages);
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
                Message message = new Message("Email enviado com sucesso!", Message.TYPE_SUCCESS);
                messages.add(message);

                session.setAttribute("messages", messages);
                response.sendRedirect("Usuario?operacao=logar");
            } else {
                Message message = new Message("Email não cadastrado!", Message.TYPE_ERROR);
                messages.add(message);

                session.setAttribute("messages", messages);
                response.sendRedirect("Usuario?operacao=recuperarSenha");
            }
        } else if (operacao.equalsIgnoreCase("editar")) {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            Usuario usuario = (Usuario) session.getAttribute("usuario");

            if (!usuario.getEmail().equalsIgnoreCase(email)) {
                List<Usuario> usuarios = daoUsuario.listByEmail(email);
                if (!usuarios.isEmpty()) {
                    Message message = new Message("Email já cadastrado!", Message.TYPE_ERROR);
                    messages.add(message);

                    session.setAttribute("messages", messages);
                    response.sendRedirect("Usuario?operacao=editar");
                }
            } else {
                if (usuario.getSenha().equals(senha)) {
                    usuario.setEmail(email);
                    usuario.setNome(nome);

                    daoUsuario.update(usuario);

                    session.removeAttribute("usuario");
                    session.setAttribute("usuario", usuario);

                    Message message = new Message("Usuário alterado com sucesso!", Message.TYPE_SUCCESS);
                    messages.add(message);

                    session.setAttribute("messages", messages);
                    response.sendRedirect("Usuario?operacao=listar");
                } else {
                    Message message = new Message("Senha invalida!", Message.TYPE_ERROR);
                    messages.add(message);

                    session.setAttribute("messages", messages);
                    response.sendRedirect("Usuario?operacao=editar");
                }
            }
        } else if (operacao.equalsIgnoreCase("editarSenha")) {
            String senhaAtual = request.getParameter("senhaAtual");
            String senhaNova = request.getParameter("senhaNova");
            String senhaNova2 = request.getParameter("senhaNova2");

            Usuario usuario = (Usuario) session.getAttribute("usuario");

            if (usuario.getSenha().equals(senhaAtual)) {
                if (senhaNova.equals(senhaNova2)) {
                    usuario.setSenha(Util.Util.criptografar(senhaNova));

                    daoUsuario.update(usuario);

                    session.removeAttribute("usuario");
                    session.setAttribute("usuario", usuario);

                    Message message = new Message("Usuário alterado com sucesso!", Message.TYPE_SUCCESS);
                    messages.add(message);

                    session.setAttribute("messages", messages);
                    response.sendRedirect("Usuario?operacao=listar");
                } else {
                    Message message = new Message("As senhas não conferem!", Message.TYPE_SUCCESS);
                    messages.add(message);

                    session.setAttribute("messages", messages);
                    response.sendRedirect("Usuario?operacao=editarSenha");
                }
            } else {
                Message message = new Message("Senha invalida!", Message.TYPE_ERROR);
                messages.add(message);

                session.setAttribute("messages", messages);
                response.sendRedirect("Usuario?operacao=editar");
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
