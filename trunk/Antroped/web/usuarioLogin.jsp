<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario != null)) {
        response.sendRedirect("usuarioIndex.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
    </head>
    <body lang="pt-br">
        <div class="container">
            <%-- HEADER --%>
            <header>
                <a class="logo" href="#">
                    <img src="img/logoAntroped.png" alt="Logo Antroped"/>
                </a>
            </header>
            <%-- MAIN --%>
            <div class="main">
                <form class="form login" action="ServletUsuario" method="post" name="form" >
                        <label for="login">Login:</label><br/>
                        <input type="text" name="login" id="login" class="medium"/><br/>
                        <label for="senha">Senha:</label><br/>
                        <input type="password" name="senha" id="senha" class="small"/><br/>
                        <%
                            if (session.getAttribute("mensagem") != null) {
                                out.print("<p class=\"error\">" + session.getAttribute("mensagem") + "</p>");
                                session.removeAttribute("mensagem");
                            }
                        %>
                        <div class="buttons">
                            <input type="submit" id="loginButton"
                                   name="operacao"
                                   value="Entrar"
                                   class="button buttonIcon login" />
                        </div>
                        <a class="minor" href="ServletUsuario?operacao=esqueceuSenha">Esqueceu login/senha?</a>
                </form>
            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>
