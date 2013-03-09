<%--
    Document   : pacienteBuscar
    Created on : 20/02/2013, 17:34:15
    Author     : Joao Luiz e Max
    Description: Pagina que contem opcoes para uma busca avancada dos pacientes
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
            <!-- HEADER -->
            <%@include file="interfaceHeader.jsp" %>
            <!-- MAIN -->
            <div class="main">
                <form action="ServletPaciente" method="GET" name="formpesquisaPaciente">
                    <label for="pesquisar">Nome Paciente:</label>
                    <input type="search" name="pesquisar" id="pesquisar" value="" /><br/>
                    <label for="pesquisarNomeMae">Nome Mãe: </label>
                    <input type="search" name="pesquisarNomeMae" id="pesquisarNomeMae" value="" /><br/>
                    <label for="pesquisarNomePai">Nome Pai:</label>
                    <input type="search" name="pesquisarNomePai" id="pesquisarNomePai" value="" /><br/>
                    <label>Sexo:</label><br/>
                    <input type="radio" name="pesquisarSexo" value="Masculino" id="sexom" checked="checked"/>
                    <label for="sexom" class="radiolabel">Masculino</label>                        
                    <input type="radio" name="pesquisarSexo" value="Feminino" id="sexof" />
                    <label for="sexof" class="radiolabel">Feminino</label><br/>
                    <input type="submit" name="operacao" value="Pesquisar">
                </form>
                <a href="pacienteCadastrar.jsp">Adicionar Novo</a>
            </div>
            <!-- FOOTER -->
            <footer>
                <%@include file="interfaceFooter.jsp" %>
            </footer>
        </div>
    </body>
    <%}%>
</html>
