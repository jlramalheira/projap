<%--
    Document   : error404
    Created on : 23/07/2013, 22:28:41
    Author     : Max
    Description:
        Esse documento JSP é utilizado para página de erro.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
    </head>
    <body>
        <div class="container">
            <%-- HEADER --%>
            <header>
                <a class="logo">
                    <img src="img/logoAntroped.png" alt="Logo Antroped"/>
                </a>
            </header>
            <%-- MAIN --%>
            <div class="main">
                <h1>Erro! Página não encontrada</h1>
                <p>
                    A página requisitada não foi encontrada. Por favor, verifique seus parâmetros.
                </p>

            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>
