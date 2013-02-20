/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.Dao;
import Dao.DaoPaciente;
import Model.Medida;
import Model.Paciente;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "ServletPaciente", urlPatterns = {"/ServletPaciente"})
public class ServletPaciente extends HttpServlet {

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
            out.println("<title>Servlet ServletPaciente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPaciente at " + request.getContextPath() + "</h1>");
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
        
        int id = 0;
        if (request.getParameter("id")!=null){
            id = Integer.parseInt(request.getParameter("id"));
        }
        Usuario usuario = (Usuario)session.getAttribute("usuario");
        String operacao = request.getParameter("operacao");

        if (operacao.equalsIgnoreCase("deletar")) {
            List<Medida> dados = new Dao<Medida>(Medida.class).listById(id);
            for (Medida d : dados) {
                new Dao<Medida>(Medida.class).remove(d.getId());
            }
            new Dao<Paciente>(Paciente.class).remove(id);

            response.sendRedirect("usuarioIndex.jsp");
        } else if (operacao.equalsIgnoreCase("mostrar")) {
            Paciente paciente = new Dao<Paciente>(Paciente.class).get(id);

            session.setAttribute("paciente", paciente);
            response.sendRedirect("pacienteAcompanhar.jsp");
        } else if (operacao.equalsIgnoreCase("editar")) {
            Paciente paciente = new Dao<Paciente>(Paciente.class).get(id);

            session.setAttribute("pacienteEditando", paciente);
            response.sendRedirect("usuarioIndex.jsp");
        } else if (operacao.equalsIgnoreCase("pesquisar")){
            String nome = request.getParameter("pesquisar");
            
            List<Paciente> pacientesPesquisa = new DaoPaciente().listByNomeUsuario(nome,usuario);
            
            session.setAttribute("pacientesPesquisa", pacientesPesquisa);
            RequestDispatcher rd = request.getRequestDispatcher("pacienteListar.jsp");
            
            rd.forward(request, response);            
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

        String operacao = request.getParameter("operacao");
        String nome = "";
        String sexo = "";
        String nomePai = "";
        String nomeMae = "";
        int estaturaPai = 0;
        int estaturaMae = 0;
        Date dataNascimento = new Date();

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if ((usuario == null)) {
            response.sendRedirect("usuarioLogin.jsp");
        }

        if (!request.getParameter("nome").isEmpty()) {
            nome = request.getParameter("nome");
        }
        if (!request.getParameter("sexo").isEmpty()) {
            sexo = request.getParameter("sexo");
        }
        if (!request.getParameter("nomePai").isEmpty()) {
            nomePai = request.getParameter("nomePai");
        }
        if (!request.getParameter("nomeMae").isEmpty()) {
            nomeMae = request.getParameter("nomeMae");
        }
        if (!request.getParameter("estaturaPai").isEmpty()) {
            estaturaPai = Integer.parseInt(request.getParameter("estaturaPai"));
        }
        if (!request.getParameter("estaturaMae").isEmpty()) {
            estaturaMae = Integer.parseInt(request.getParameter("estaturaMae"));
        }
        if (!request.getParameter("dataNascimento").isEmpty()) {
            dataNascimento = Util.Util.stringToDate(request.getParameter("dataNascimento"));
        }

        //@TO-DO Implementar o cancelar do editar
        if (operacao.equalsIgnoreCase("cadastrar")) {
            Paciente paciente = new Paciente(nome, nomePai, nomeMae, estaturaPai, estaturaMae, dataNascimento, sexo, usuario);
            new Dao<Paciente>(Paciente.class).insert(paciente);
            session.setAttribute("paciente", paciente);
            response.sendRedirect("pacienteAcompanhar.jsp");

        } else if (operacao.equalsIgnoreCase("editar")) {
            Paciente paciente = (Paciente) session.getAttribute("editando");
            paciente.setNome(nome);
            paciente.setSexo(sexo);
            paciente.setNomePai(nomePai);
            paciente.setNomeMae(nomeMae);
            paciente.setEstaturaPai(estaturaPai);
            paciente.setEstaturaMae(estaturaMae);
            paciente.setDataNascimento(dataNascimento);

            new Dao<Paciente>(Paciente.class).update(paciente);

            session.removeAttribute("pacienteEditando");
            session.setAttribute("paciente", paciente);
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
