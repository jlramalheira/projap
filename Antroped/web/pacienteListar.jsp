<%-- 
    Document   : pacienteListar
    Created on : 20/02/2013, 17:04:09
    Author     : JoaoLuiz
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Paciente"%>
<%@page import="Dao.Dao"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null) || session.getAttribute("pacientesPesquisa") == null) {
        response.sendRedirect("usuarioLogin.jsp");
    } else {
        List<Paciente> pacientes = (List<Paciente>) session.getAttribute("pacientesPesquisa");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
    </head>
    <body lang="pt-br">
        <div class="container">
            <%-- HEADER --%>
            <%@include file="interfaceHeader.jsp" %>
            <%-- MAIN --%>
            <div class="main">
                <% if (!pacientes.isEmpty()) {%>
                <table class="tabela tabelapaciente" id="dataTable">
                    <thead>
                        <tr>
                            <th id="colunaNome">Nome</th>
                            <th id="colunaDataNascimento">Data Nascimento</th>
                            <th id="colunaSexo">Sexo</th>
                            <th id="colunaNomeMae">Mãe</th>
                            <th id="colunaNomePai">Pai</th>
                            <th id="colunaOpções" colspan="2">Opções</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Paciente p : pacientes) {%>
                        <tr>
                            <td><%=p.getNome()%></td>
                            <td><%=Util.Util.dateToString(p.getDataNascimento())%></td>
                            <td><%=p.getSexo()%></td>
                            <td><%=p.getPrimeiroNomeMae()%></td>
                            <td><%=p.getPrimeiroNomePai()%></td>
                            <td><a href="ServletPaciente?id=<%=p.getId()%>&operacao=mostrar"> <img hint="Deletar" src=img/lookIco.png /></a></td>
                            <td><a href="ServletPaciente?id=<%=p.getId()%>&operacao=deletar"> <img hint="Deletar" src=img/deleteIco.png /> </a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

                <%} else {//caso nao encontra nenhum usuario com os parametros fornecidos%>
                <h1>Não existe nenhum paciente com esses dados</h1>
                <% }%>
                <a href="pacienteCadastrar.jsp">Adicionar Novo</a>
                <%
                    session.removeAttribute("pacientesPesquisa");
                %>
            </div>
            <!-- FOOTER -->
            <footer>
                <%@include file="interfaceFooter.jsp" %>
            </footer>
        </div>
    </body>
    <%}%>
</html>
