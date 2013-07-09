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

                <h1>Pacientes</h1>

                <form action="ServletPaciente" method="GET"
                      class="form">
                    <div class="row">
                        <div class="span8">
                            <label for="nome">Nome:</label>
                            <input type="text" name="pesquisar" value=""
                                   id="nome" class="input-xxlarge"
                                   placeholder="Nome completo do paciente"
                                   required/>

                            <div class="more-options">
                                <label for="datanasc">Data de Nascimento:</label>
                                <input type="text" name="dataNascimento" value=""
                                       id="datanasc" class="date"
                                       title="Data de nascimento"
                                       pattern="([0-2][0-9]|3(0|1))/(0[0-9]|1[0-2])/([0-9]+)"
                                       placeholder="dd/mm/aaaa"
                                       required/>

                                <label>Sexo:</label>
                                <label for="sexom" class="radio inline">
                                    <input type="radio" name="sexo" value="Masculino"
                                           id="sexom"
                                           required/>
                                    Masculino
                                </label>
                                <label for="sexof" class="radio inline">
                                    <input type="radio" name="sexo" value="Feminino"
                                           id="sexof"
                                           required=""/>
                                    Feminino
                                </label><br/><br/>

                                <label for="nomepai">Nome do Pai:</label>
                                <input type="text" name="nomePai" value=""
                                       id="nomepai" class="input-xxlarge"
                                       placeholder="Nome completo do pai"/>

                                <label for="nomemae">Nome da Mãe:</label>
                                <input type="text" name="nomeMae" value=""
                                       id="nomemae" class="input-xxlarge"
                                       placeholder="Nome completo da mãe"/>
                            </div>

                            <button type="submit" name="operacao" value="Pesquisar"
                                    class="btn btn-large btn-icon search">
                                Pesquisar
                            </button>
                            <button type="button"
                                    class="btn btn-large btn-icon more"
                                    onclick="toggleMoreOptions(this)">
                                Mais Opções
                            </button>
                            <a href="pacienteCadastrar.jsp"
                               class="btn btn-large btn-icon new-user">
                                Adicionar Novo
                            </a>
                        </div>
                        <div class="span3 pull-right">

                        </div>
                    </div>



                </form>

                <% if (!pacientes.isEmpty()) {%>
                <table class="table table-bordered table-striped" id="dataTable">
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
