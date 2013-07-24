<%--
    Document   : error404
    Created on : 23/07/2013, 22:28:41
    Author     : Max
    Description:
        Esse documento JSP é utilizado para página de erro.
--%>
<%@page import="Model.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null)) {
        response.sendRedirect("Usuario?operacao=logar");
    }
%>
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
                <h1>Alterar senha</h1>
                <%@include file="interfaceMessages.jsp" %>

                <form action="Usuario" method="post"
                      class="form">

                    <label for="senhaAtual">Senha Atual:</label>
                    <input type="password" name="senhaAtual"
                           id="senhaAtual" class="input-xlarge"
                           placeholder="Digite sua senha atual"/>

                    <label for="senhaNova">Nova Senha:</label>
                    <input type="password" name="senhaNova"
                           id="senhaNova" class="input-xlarge"
                           placeholder="Digite sua nova senha"/>
                    <br/>
                    <input type="password" name="senhaNova2"
                           id="senhaNova2" class="input-xlarge"
                           placeholder="Digite sua nova senha novamente"/>

                    <div>
                        <button type="submit" name="operacao" value="EditarSenha"
                                class="btn btn-large btn-icon edit">
                            Editar
                        </button>
                    </div>
                </form>

            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>