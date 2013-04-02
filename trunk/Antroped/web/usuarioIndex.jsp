<%--
    Document   : index
    Created on : 24/09/2012, 19:24:29
    Author     : JoaoLuiz
--%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Paciente"%>
<%@page import="Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null)) {
        response.sendRedirect("usuarioLogin.jsp");
    } else {
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
                <%
                    //Mensagem de Alterado com sucesso
                    if (session.getAttribute("mensagem") != null) {
                        out.print("<p class=\"erro\">" + session.getAttribute("mensagem") + "</p>");
                        session.removeAttribute("mensagem");
                    }
                %>
                <a class="button buttonIcon fleft mright20px" href="pacienteCadastrar.jsp">Adicionar Novo</a>
                <a class="button buttonIcon" href="pacienteBuscar.jsp">Busca Avancada</a>
                <form action="ServletPaciente" method="GET"
                      name="formpesquisaPaciente" class="form search">
                    <input type="search" name="pesquisar" value=""
                           class="long"
                           placeholder="Digite o nome de um paciente" />
                    <input class="button mleft20px" type="submit" name="operacao" value="Pesquisar">
                </form>
            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
    <%}%>
</html>
