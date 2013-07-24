<%--
    Document   : usuarioEditar
    Created on : 09/03/2013, 11:38:31
    Author     : Joao Luiz e Max
    Description: Pagina para o usuario alterar sua senha
--%>
<%@page import="Model.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null)) {
        response.sendRedirect("usuarioLogin.jsp");
    } else {

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1>Editar dados cadastrais</h1>

                <p>
                    <a href="Usuario?operacao=editarSenha" title="Alterar sua senha"
                       class="btn btn-large">
                        Alterar senha
                    </a>
                </p>

                <form action="Usuario" method="POST"
                      class="form">
                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" value="<%=usuario.getNome()%>"
                           id="nome" class="input-xxlarge"/>

                    <label for="email">Email:</label>
                    <input type="text" name="email" value="<%=usuario.getEmail()%>"
                           id="email" class="input-xlarge"/>

                    <label for="senha">Senha:</label>
                    <input type="password" name="senha"
                           id="senha"/>

                    <div class="form-actions">
                        <input type="submit" name="operacao" value="Editar"
                               id="login" class="btn btn-large btn-icon edit" />
                    </div>
                </form>
            </div>
            <!-- FOOTER -->
            <footer>
                <%@include file="interfaceFooter.jsp" %>
            </footer>
        </div>
    </body>
</html>
<%}%>