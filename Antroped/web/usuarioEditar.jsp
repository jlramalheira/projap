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
                <form name="form" action="ServletUsuario" method="POST" class="formulario formulariocadastro">
                    <fieldset>
                        <legend>Editar:</legend>
                        <%
                            if (session.getAttribute("mensagem") != null) {
                                out.print("<p class=\"erro\">" + session.getAttribute("mensagem") + "</p>");
                                session.removeAttribute("mensagem");
                            }
                        %>
                        <label for="nome">Nome:</label><br/>
                        <input type="text" name="nome" id="nome" value="<%=usuario.getNome()%>"/><br/>
                        <label for="email">Email:</label><br/>
                        <input type="text" name="email" id="email" value="<%=usuario.getEmail()%>"/><br/>
                        <%--@TODO aparecer clicando em algo do tipo "alterar senha?"--%>
                        <div>
                            <label for="senhaAtual">Senha Atual:</label><br/>
                            <input type="password" name="senhaAtual" id="senhaAtual"/><br/>
                            <label for="senhaNova">Nova Senha:</label><br/>
                            <input type="password" name="senhaNova" id="senhaNova"/><br/> 
                        </div>
                        <input type="submit" id="login" name="operacao"
                               value="Editar" class="button" />
                    </fieldset>
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