/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.Dao;
import Model.Medida;
import Model.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "ServletMedidas", urlPatterns = {"/ServletMedidas"})
public class ServletMedidas extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletMedidas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletMedidas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

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

        if (operacao.equalsIgnoreCase("deletar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            new Dao<Medida>(Medida.class).remove(id);

        } else if (operacao.equalsIgnoreCase("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Medida dado = new Dao<Medida>(Medida.class).get(id);
            session.setAttribute("dado", dado);
        }
        response.sendRedirect("pacienteAcompanhar.jsp");
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
        Paciente paciente = (Paciente) session.getAttribute("paciente");
        if ((paciente == null)) {
            response.sendRedirect("index.jsp");
        }
        String operacao = request.getParameter("operacao");
        double peso = 0;
        double perimetroCefalico = 0;
        double estatura = 0;
        double idadeOssea = 0;
        String posicao = "";
        Date data = new Date();

        if (!request.getParameter("peso").isEmpty()) {
            peso = Double.parseDouble(request.getParameter("peso"));
        }
        if (!request.getParameter("perimetroCefalico").isEmpty()) {
            perimetroCefalico = Double.parseDouble(request.getParameter("perimetroCefalico"));
        }
        if (!request.getParameter("estatura").isEmpty()) {
            estatura = Double.parseDouble(request.getParameter("estatura"));
        }
        if (!request.getParameter("posicao").isEmpty()) {
            posicao = request.getParameter("posicao");
        }
        if (!request.getParameter("data").isEmpty()) {
            data = Util.Util.stringToDate(request.getParameter("data"));
        }
        if (!request.getParameter("idadeOssea").isEmpty()) {
            idadeOssea = Double.parseDouble(request.getParameter("idadeOssea"));
        }
        int total = Util.Util.getDiferencaDatas(paciente.getDataNascimento(), data);
        System.out.println("************************");
        System.out.println("aqui");
        if (operacao.equalsIgnoreCase("cadastrar")) {

            System.out.println("aqui");
            new Dao<Medida>(Medida.class).insert(new Medida(posicao, data, paciente, total, peso, perimetroCefalico, estatura, idadeOssea));
            System.out.println("aqui");

        } else if (operacao.equalsIgnoreCase("editar")) {
            Medida dado = (Medida) session.getAttribute("dado");
            dado.setPeso(peso);
            dado.setPerimetroCefalico(perimetroCefalico);
            dado.setAltura(estatura);
            dado.setPosicao(posicao);
            dado.setData(data);
            dado.setIdade(total);

            new Dao<Medida>(Medida.class).update(dado);
            session.removeAttribute("dado");
        }
        response.sendRedirect("pacienteAcompanhar.jsp");
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
