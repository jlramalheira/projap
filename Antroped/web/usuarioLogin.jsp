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
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/styles.css" />
        <link href='http://fonts.googleapis.com/css?family=Advent+Pro|Capriola' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <title>Antroped</title>
    </head>
    <body lang="pt-br">
        <div class="container">
            <!-- HEADER -->
            <header>
                <h1>Antroped</h1>
            </header>
            <!-- MAIN -->
            <div class="main">
                <form name="form" action="ServletUsuario" method="POST" class="formulario formulariologin">
                    <fieldset>
                        <legend>Login:</legend>
                        <%
                            if (session.getAttribute("mensagem") != null) {
                                out.print("<p class=\"erro\">" + session.getAttribute("mensagem") + "</p>");
                                session.removeAttribute("mensagem");
                            }
                        %>
                        <label for="login">Login:</label><br/>
                        <input type="text" name="login" id="login"/><br/>
                        <label for="senha">Senha:</label><br/>
                        <input type="password" name="senha" id="senha"/><br/>                        
                        <input type="submit" id="login" 
                               name="operacao"
                               value="Login"
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
