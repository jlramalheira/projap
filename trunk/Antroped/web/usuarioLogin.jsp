<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario != null)) {
        response.sendRedirect("pacienteListar.jsp");
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
                <form action="Usuario" method="post"
                      class="form login">
                        <label for="login">Login</label>
                        <input type="text" name="login" value=""
                               id="login" class="input-xlarge"/>

                        <label for="senha">Senha</label>
                        <input type="password" name="senha" value=""
                               id="senha" class="input-xlarge"
                               />
                        <%
                            if (session.getAttribute("mensagem") != null) {
                                out.print("<p class=\"error\">" + session.getAttribute("mensagem") + "</p>");
                                session.removeAttribute("mensagem");
                            }
                        %>

                        <div class="form-actions">
                            <button type="submit" name="operacao" value="logar"
                                    id="loginButton" class="btn btn-large btn-icon login">
                                Entrar
                            </button>
                        </div>
                        <a class="minor" href="ServletUsuario?operacao=recuperarSenha">Esqueceu login/senha?</a>
                </form>
            </div>

            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>
