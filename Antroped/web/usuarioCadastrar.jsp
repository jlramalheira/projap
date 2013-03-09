<%-- 
    Document   : usuarioCadastrar
    Created on : 27/09/2012, 17:20:22
    Author     : João Luiz e Max
    Description: Pagina para cadastro de novos usuarios

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="interfaceHead.jsp" %>
    </head>
    
    <body lang="pt-br">
        <div class="container">
            <!-- HEADER -->
            <header>
                <a class="logo" href="#">
                    <img src="img/logoAntroped.png" alt="Logo Antroped"/>
                </a>
            </header>
            <!-- MAIN -->
            <div class="main">
                <form name="form" action="ServletUsuario" method="POST" class="formulario formulariocadastro">
                    <fieldset>
                        <legend>Cadastro:</legend>
                        <%
                            if (session.getAttribute("mensagem") != null) {
                                out.print("<p class=\"erro\">" + session.getAttribute("mensagem") + "</p>");
                                session.removeAttribute("mensagem");
                            }
                        %>
                        <label for="nome">Nome:</label><br/>
                        <input type="text" name="nome" id="nome"/><br/>
                        <label for="email">Email:</label><br/>
                        <input type="text" name="email" id="email"/><br/>
                        <label for="login">Login:</label><br/>
                        <input type="text" name="login" id="login"/><br/>
                        <label for="senha">Senha:</label><br/>
                        <input type="password" name="senha" id="senha"/><br/>                        
                        <input type="submit" id="login" name="operacao"
                               value="Cadastrar" class="button" />
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
