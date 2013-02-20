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
        <meta charset="UTF-8">
        <link type="text/css" rel="stylesheet" href="css/styles.css" />
        <link href='http://fonts.googleapis.com/css?family=Advent+Pro|Capriola' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <title>Antropometria</title>
    </head>
    <body lang="pt-br">
        <div class="container">
            <!-- HEADER -->
            <header>
                <h1>Antropometria</h1>
                <p class="sair">
                    <a href="ServletUsuario?operacao=sair" title="Sair">Sair<img src="img/exitIco.png" /></a>
                </p>
            </header>
            <!-- MAIN -->
            <div class="main">
                <form action="ServletPaciente" method="GET" name="formpesquisaPaciente">
                    <label for="pesquisar">Nome Paciente:</label>
                    <input type="search" name="pesquisar" id="pesquisar" value="" />
                    <label for="pesquisarNomeMae">Nome M
                        <input type="search" name="pesquisarNomeMae" id="pesquisarNomeMae" value="" />
                    <p><input type="search" name="pesquisarNomePai" id="pesquisarNomePai" value="" />
                    <p>Masculino<input type="radio" name="pesquisarSexo" value="Masculino" /></p>
                    <input type="submit" name="operacao" value="Pesquisar">
                </form>
                <a href="pacienteCadastrar.jsp">Adicionar Novo</a>
            </div>
            <!-- FOOTER -->
            <footer>
            </footer>
        </div>
    </body>
    <%}%>
</html>
