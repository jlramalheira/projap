<%--
    Document   : usuarioRecuperarLoginSenha
    Created on : 20/02/2013, 23:44:53
    Author     : JoaoLuiz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
    </head>
    <body lang="pt-br">
        <div class="container">
            <header>
                <a class="logo" href="#">
                    <img src="img/logoAntroped.png" alt="Logo Antroped"/>
                </a>
            </header>
            <!-- MAIN -->
            <div class="main">
                <%@include file="interfaceMessages.jsp" %>
                <h1>Recuperar Login e Senha</h1>
                <p>
                    Insira seu e-mail cadastrado, você irá receber um email em breve com informações para recuperar senha.
                </p>
                <form action="ServletUsuario" method="POST"
                      class="form login">
                    <label for="email">Email:</label>
                    <input type="text" name="email"
                           id="email" class="input-xlarge"/>

                    <div class="form-actions">
                        <input type="submit" name="operacao" value="Recuperar"
                               id="recuperar" class="btn btn-large" />
                    </div>
                </form>
            </div>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>

