<%-- 
    Document   : usuarioRecuperarLoginSenha
    Created on : 20/02/2013, 23:44:53
    Author     : JoaoLuiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link type="text/css" rel="stylesheet" href="css/styles.css" />
        <link href='http://fonts.googleapis.com/css?family=Advent+Pro|Capriola' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <title>Antroped</title>
    </head>
    <body lang="pt-br">
        <div class="container">
            <!-- HEADER -->
            <header>
                <img src="img/logo.png" alt="[Logo]" />
            </header>
            <!-- MAIN -->
            <div class="main">
                <form name="form" action="ServletUsuario" method="POST" class="formulario formulariorecuperar">
                    <fieldset>
                        <legend>Recuperar Login e Senha:</legend>
                        <%
                            if (session.getAttribute("mensagem") != null) {
                                out.print("<p class=\"erro\">" + session.getAttribute("mensagem") + "</p>");
                                session.removeAttribute("mensagem");
                            }
                        %>
                        <label for="email">Email:</label><br/>
                        <input type="text" name="email" id="email"/><br/>                     
                        <input type="submit" id="recuperar" 
                               name="operacao"
                               value="Recuperar"
                               class="button" />
                    </fieldset>
                </form>
            </div>
            <!-- FOOTER -->
            <footer>
            </footer>
        </div>
    </body>
</html>

