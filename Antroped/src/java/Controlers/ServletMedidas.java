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
            Medida medida = new Dao<Medida>(Medida.class).get(id);
            session.setAttribute("medida", medida);
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
        double idadeOsseaAnos = 0;
        double idadeOsseaMeses = 0;
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
        if (!request.getParameter("idadeOsseaAnos").isEmpty()) {
            idadeOsseaAnos = Double.parseDouble(request.getParameter("idadeOsseaAnos"));
        }
        if (!request.getParameter("idadeOsseaMeses").isEmpty()) {
            idadeOsseaMeses = Double.parseDouble(request.getParameter("idadeOsseaMeses"));
        }
        int total = Util.Util.getDiferencaDatas(paciente.getDataNascimento(), data);
        if (operacao.equalsIgnoreCase("cadastrar")) {

            System.out.println("aqui");
            new Dao<Medida>(Medida.class).insert(new Medida(posicao, data, paciente, total, peso, perimetroCefalico, estatura, idadeOsseaAnos, idadeOsseaMeses));
            System.out.println("aqui");

        } else if (operacao.equalsIgnoreCase("editar")) {
            Medida medida = (Medida) session.getAttribute("medida");
            medida.setPeso(peso);
            medida.setPerimetroCefalico(perimetroCefalico);
            medida.setAltura(estatura);
            medida.setPosicao(posicao);
            medida.setData(data);
            medida.setIdade(total);
            medida.setIdadeOsseaAnos(idadeOsseaAnos);
            medida.setIdadeOsseaMeses(idadeOsseaMeses);

            new Dao<Medida>(Medida.class).update(medida);
            session.removeAttribute("medida");
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
