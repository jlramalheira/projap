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
                <a class="button buttonIcon fleft mright20px" href="pacienteCadastrar.jsp">Adicionar Novo</a>
                <a class="button buttonIcon" href="pacienteBuscar.jsp">Busca Avancada</a>
                <form action="ServletPaciente" method="GET"
                      name="formpesquisaPaciente" class="form search">
                    <input type="search" name="pesquisar" value=""
                           class="long"
                           placeholder="Digite o nome de um paciente" />
                    <input class="button mleft20px" type="submit" name="operacao" value="Pesquisar">
                </form>
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
                            <td><a href="ServletPaciente?pacienteId=<%=p.getId()%>&operacao=mostrar"> <img hint="Deletar" src=img/lookIco.png /></a></td>
                            <td><a href="ServletPaciente?pacienteId=<%=p.getId()%>&operacao=deletar"> <img hint="Deletar" src=img/deleteIco.png /> </a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

                <%} else {//caso nao encontra nenhum usuario com os parametros fornecidos%>
                <h1>Nenhum resultado foi encontrado</h1>
                <% }%>
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
