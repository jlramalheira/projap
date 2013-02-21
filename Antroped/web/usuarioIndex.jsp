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
                <div class="usuario">
                    <p>Olá,</p>
                    <p><%=usuario.getNome()%> </p>
                    <p><a href="ServletUsuario?operacao=sair" title="Sair">Sair</a></p>
                </div>

            </header>
            <!-- MAIN -->
            <div class="main">
                <form action="ServletPaciente" method="GET" name="formpesquisaPaciente">
                    <input type="search" name="pesquisar" id="pesquisar" value=""
                           placeholder="Digite o nome de um paciente" />
                    <input type="submit" name="operacao" value="Pesquisar">
                </form>
                <a href="pacienteCadastrar.jsp">Adicionar Novo</a>
                <a href="pacienteBuscar.jsp">Busca Avancada</a>
            </div>
            <!-- FOOTER -->
            <footer>
            </footer>
        </div>
    </body>
    <%}%>
</html>
