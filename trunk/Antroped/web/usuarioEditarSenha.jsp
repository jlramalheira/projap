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
            <%@include file="interfaceHeader.jsp" %>
            <%-- MAIN --%>
            <div class="main">
                <h1>Hello World!</h1>
                <%@include file="interfaceMessages.jsp" %>

                <form action="Usuario" method="post"
                      class="form">
                    
                        <label for="senhaAtual">Senha Atual:</label>
                        <input type="password" name="senhaAtual" id="senhaAtual"/>

                        <label for="senhaNova">Nova Senha:</label>
                        <input type="password" name="senhaNova" id="senhaNova"/>

                        <label for="senhaNova2">Nova Senha:</label>
                        <input type="password" name="senhaNova2"
                               id="senhaNova2"/>
                </form>

            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>
