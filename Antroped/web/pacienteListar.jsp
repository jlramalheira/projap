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
    if (usuario == null) {
        response.sendRedirect("Usuario?operacao=logar");
    }

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
                <%@include file="interfaceMessages.jsp" %>
                <h1>Pesquisar Pacientes</h1>

                <form action="Paciente" method="GET"
                      class="form">
                    <div class="row">
                        <div class="span8">
                            <label for="nome">Nome:</label>
                            <input type="text" name="pesquisar" value="<%=request.getAttribute("nomePaciente") == null ? "" : request.getAttribute("nomePaciente")%>"
                                   id="nome" class="input-xxlarge"
                                   placeholder="Nome completo do paciente"
                                   />

                            <div class="more-options">

                                <label>Sexo:</label>
                                <label for="sexom" class="radio inline">
                                    <input type="radio" name="sexo" value="Masculino"
                                           id="sexom" <%=request.getAttribute("sexo") == null ? "" : request.getAttribute("sexo").equals("Masculino") ? "checked=\"checked\"" : ""%>
                                           />
                                    Masculino
                                </label>
                                <label for="sexof" class="radio inline">
                                    <input type="radio" name="sexo" value="Feminino"
                                           id="sexof" <%=request.getAttribute("sexo") == null ? "" : request.getAttribute("sexo").equals("Feminino") ? "checked=\"checked\"" : ""%>
                                           />
                                    Feminino
                                </label><br/><br/>

                                <label for="nomepai">Nome do Pai:</label>
                                <input type="text" name="nomePai" value="<%=request.getAttribute("nomePai") == null ? "" : request.getAttribute("nomePai")%>"
                                       id="nomepai" class="input-xxlarge"
                                       placeholder="Nome completo do pai"/>

                                <label for="nomemae">Nome da Mãe:</label>
                                <input type="text" name="nomeMae" value="<%=request.getAttribute("nomeMae") == null ? "" : request.getAttribute("nomeMae")%>"
                                       id="nomemae" class="input-xxlarge"
                                       placeholder="Nome completo da mãe"/>
                            </div>

                            <div class="form-actions">


                            </div>



                        </div>
                        <div class="span3 pull-right">
                            <button type="submit" name="operacao" value="Pesquisar"
                                    class="btn btn-large btn-block btn-icon search">
                                Pesquisar
                            </button>
                            <button type="reset"
                                    class="btn btn-large btn-block btn-icon more"
                                    onclick="toggleMoreOptions(this)">
                                Busca Avançada
                            </button>
                        </div>
                    </div>
                </form>

                <% if (request.getAttribute("pacientes") != null) {
                        List<Paciente> pacientes = (List<Paciente>) request.getAttribute("pacientes");

                        if (!pacientes.isEmpty()) {%>
                <table class="table table-bordered table-striped"
                       id="dataTable"
                       data-provides="rowlink">
                    <caption class="lead text-left">
                        Resultados da pesquisa
                    </caption>
                    <thead>
                        <tr>
                            <th id="colunaNome">Nome</th>
                            <th id="colunaDataNascimento">Data Nascimento</th>
                            <th id="colunaNomeMae">Mãe</th>
                            <th id="colunaNomePai">Pai</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Paciente p : pacientes) {%>
                        <tr>
                            <td>
                                <a href="Paciente?idPaciente=<%=p.getId()%>&operacao=acompanhar"><%=p.getNome()%></a>
                            </td>
                            <td>
                                <%=Util.Util.dateToString(p.getDataNascimento())%>
                            </td>
                            <td>
                                <%=p.getPrimeiroNomeMae()%>
                            </td>
                            <td>
                                <%=p.getPrimeiroNomePai()%>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

                <%} else {//caso nao encontra nenhum usuario com os parametros fornecidos%>
                <h1>Nenhum resultado foi encontrado</h1>
                <% }
                    }
                %>
            </div>
            <!-- FOOTER -->
            <footer>
                <%@include file="interfaceFooter.jsp" %>
            </footer>
        </div>
    </body>
</html>
