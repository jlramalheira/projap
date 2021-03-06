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
import Util.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Paciente", urlPatterns = {"/Paciente"})
public class ServletPaciente extends HttpServlet {

    DaoPaciente daoPaciente = new DaoPaciente();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        RequestDispatcher rd;

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String operacao = request.getParameter("operacao");
        if (operacao.equalsIgnoreCase("cadastrar")) {
            rd = request.getRequestDispatcher("pacienteCadastrar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("deletar")) {
            int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));

            List<Medida> dados = new Dao<Medida>(Medida.class).listById(idPaciente);
            for (Medida d : dados) {
                new Dao<Medida>(Medida.class).remove(d.getId());
            }
            daoPaciente.remove(idPaciente);

            rd = request.getRequestDispatcher("pacienteListar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("acompanhar")) {
            int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
            Paciente paciente = daoPaciente.get(idPaciente);

            request.setAttribute("paciente", paciente);
            rd = request.getRequestDispatcher("pacienteAcompanhar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("listar")) {
            rd = request.getRequestDispatcher("pacienteListar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("editar")) {
            int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));

            Paciente paciente = daoPaciente.get(idPaciente);

            request.setAttribute("paciente", paciente);

            rd = request.getRequestDispatcher("pacienteEditar.jsp");
            rd.forward(request, response);
        } else if (operacao.equalsIgnoreCase("pesquisar")) {
            String nomePaciente = "";
            String nomePai = "";
            String nomeMae = "";
            String sexo = "";

            if (request.getParameter("pesquisar") != null) {
                nomePaciente = request.getParameter("pesquisar");
            }
            if (request.getParameter("pesquisarNomeMae") != null) {
                nomeMae = request.getParameter("pesquisarNomeMae");
            }
            if (request.getParameter("pesquisarNomePai") != null) {
                nomePai = request.getParameter("pesquisarNomePai");
            }
            if (request.getParameter("sexo") != null) {
                sexo = request.getParameter("sexo");
            }

            List<Paciente> pacientes = daoPaciente.listByAll(nomePaciente, nomePai, nomeMae, sexo, usuario);

            request.setAttribute("nomePaciente", nomePaciente);
            request.setAttribute("nomePai", nomePai);
            request.setAttribute("nomeMae", nomeMae);
            request.setAttribute("sexo", sexo);
            request.setAttribute("pacientes", pacientes);
            rd = request.getRequestDispatcher("pacienteListar.jsp");

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
        String nome = "";
        String sexo = "";
        String nomePai = "";
        String nomeMae = "";
        int estaturaPai = 0;
        int estaturaMae = 0;
        Date dataNascimento = new Date();

        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if ((usuario == null)) {
            response.sendRedirect("Usuario?operacao=logar");
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
            daoPaciente.insert(paciente);
            
            Message message = new Message("Paciente cadastrado com sucesso!", Message.TYPE_SUCCESS);
            messages.add(message);
            
            session.setAttribute("messages", messages);
            response.sendRedirect("Paciente?operacao=acompanhar&idPaciente="+paciente.getId());

        } else if (operacao.equalsIgnoreCase("editar")) {
            int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
            Paciente paciente = daoPaciente.get(idPaciente);
            paciente.setNome(nome);
            paciente.setSexo(sexo);
            paciente.setNomePai(nomePai);
            paciente.setNomeMae(nomeMae);
            paciente.setEstaturaPai(estaturaPai);
            paciente.setEstaturaMae(estaturaMae);
            paciente.setDataNascimento(dataNascimento);

            daoPaciente.update(paciente);
            
            Message message = new Message("Paciente editado com sucesso!", Message.TYPE_SUCCESS);
            messages.add(message);
            
            session.setAttribute("messages", messages);
            response.sendRedirect("Paciente?operacao=acompanhar&idPaciente="+paciente.getId());
        } else if (operacao.equalsIgnoreCase("cancelar")) {
            int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
            
            response.sendRedirect("Paciente?operacao=acompanhar&idPaciente="+idPaciente);
        }
    }
}
