/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Dao.Dao;
import Dao.DaoPaciente;
import Model.Medida;
import Model.Paciente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "Medidas", urlPatterns = {"/Medidas"})
public class ServletMedidas extends HttpServlet {

    Dao<Medida> daoMedida = new Dao<Medida>(Medida.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        String operacao = request.getParameter("operacao");
        RequestDispatcher rd;

        if (operacao.equalsIgnoreCase("excluir")) {
            int idMedida = Integer.parseInt(request.getParameter("idMedida"));

            Medida medida = daoMedida.get(idMedida);
            int idPaciete = medida.getPaciente().getId();
            Paciente paciente = new DaoPaciente().get(idPaciete);

            daoMedida.remove(idMedida);

            request.setAttribute("paciente", paciente);

            rd = request.getRequestDispatcher("pacienteAcompanhar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("editar")) {
            //toDo
        } else if (operacao.equalsIgnoreCase("ver")) {
            int idMedida = Integer.parseInt(request.getParameter("idMedida"));
            Medida medida = daoMedida.get(idMedida);

            String json = "{";
            json += "\"idMedida\" : \"" + medida.getId() + "\" , ";
            json += "\"data\" : \"" + Util.Util.dateToString(medida.getData()) + "\" , ";
            json += "\"idade\" : \"" + medida.idadeToExtenso() + "\" , ";
            json += "\"peso\" : \"" + medida.getPeso() + "\" , ";
            json += "\"estatura\" : \"" + medida.getAltura() +" "+ medida.getPosicaoAbreviado() + "\" , ";
            json += "\"pc\" : \"" + medida.getPerimetroCefalico() + "\" , ";
            json += "\"imc\" : \"" + medida.getIMC() + "\" , ";
            json += "\"idadeOssea\" : \"" + medida.getIdadeOsseaExtenso() + "\" , ";
            json += "\"previsaoEstatura\" : \"" + medida.getPrevisaoEstatura(medida.getPaciente().getSexo()) + "\" , ";
            if (medida.getIdade() > 0 && medida.getIdade() < 1825) {
                json += "\"textoPesoIdade\" : \"" + medida.getTextoEspecifico("peso05", medida.getPaciente().getSexo()) + "\" , ";
                json += "\"textoEstaturaIdade\" : \"" + medida.getTextoEspecifico("estatura05", medida.getPaciente().getSexo()) + "\" , ";
                json += "\"textoImc\" : \"" + medida.getTextoEspecifico("imc05", medida.getPaciente().getSexo()) + "\" ";
            } else if (medida.getIdade() >= 1825 && medida.getIdade() < 6935){
                if (medida.getIdade() < 3650){
                    json += "\"textoPesoIdade\" : \"" + medida.getTextoEspecifico("peso519", medida.getPaciente().getSexo()) + "\" , ";
                } else {
                    json += "\"textoPesoIdade\" : \"Não há nenhuma avaliação disponível para este tipo de gráfico.\" , ";
                }
                json += "\"textoEstaturaIdade\" : \"" + medida.getTextoEspecifico("estatura519", medida.getPaciente().getSexo()) + "\" , ";
                json += "\"textoImc\" : \"" + medida.getTextoEspecifico("imc519", medida.getPaciente().getSexo()) + "\" ";
            } else {
                json += "\"textoPesoIdade\" : \"Não há nenhuma avaliação disponível para este tipo de gráfico.\" , ";
                json += "\"textoEstaturaIdade\" : \"Não há nenhuma avaliação disponível para este tipo de gráfico.\" , ";
                json += "\"textoImc\" : \"Não há nenhuma avaliação disponível para este tipo de gráfico.\" ";
            }

            json += "}";

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
        Paciente paciente = new DaoPaciente().get(idPaciente);

        if (paciente == null) { //caso seja alterado hidden id
            response.sendError(404);
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

            daoMedida.insert(new Medida(posicao, data, paciente, total, peso, perimetroCefalico, estatura, idadeOsseaAnos, idadeOsseaMeses));
            response.sendRedirect("Paciente?operacao=acompanhar&idPaciente=" + idPaciente);

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

            daoMedida.update(medida);
            session.removeAttribute("medida");
            response.sendRedirect("Paciente?operacao=acompanhar&idPaciente=" + idPaciente);
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
