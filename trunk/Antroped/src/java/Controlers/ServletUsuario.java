/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.DaoUsuario;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        } else if (operacao.equalsIgnoreCase("login")) {
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
                    Email.sendEmail(email, "Recuperação de Login e Senha",
                            "Olá " + usuario.getNome() + ", \n\n"
                            + "Seu Login no sistema Antroped é: " + usuario.getLogin()
                            + " \nSua senha é: " + usuario.getSenha() + " \n\n"
                            + "Atenciosamente,\nAntroped.");
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
