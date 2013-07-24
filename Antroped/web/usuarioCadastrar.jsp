<%--
    Document   : usuarioCadastrar
    Created on : 27/09/2012, 17:20:22
    Author     : João Luiz e Max
    Description: Pagina para cadastro de novos usuarios

--%>
<%@page import="Model.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null)) {
        response.sendRedirect("Usuario?operacao=logar");
    } else if (!usuario.isAdministrador()) { //Caso o usuario não seja o Administrador, não permite cadastrar novo usuario
        response.sendRedirect("Paciente?operacao=listar");
    } 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
    </head>

    <body lang="pt-br">
        <div class="container">
            <%@include file="interfaceHeader.jsp" %>
            <!-- MAIN -->
            <div class="main">
                <%@include file="interfaceMessages.jsp" %>
                <h1>Cadastrar novo usuário</h1>
                <form action="Usuario" method="POST"
                      class="form">
                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" value=""
                           id="nome" class="input-xxlarge"
                           placeholder="Nome completo do usuário"/>

                    <label for="email">Email:</label>
                    <input type="text" name="email"
                           id="email" class="input-xlarge"
                           placeholder="Utilize um e-mail válido"/>

                    <label for="login">Login:</label>
                    <input type="text" name="login"
                           id="login"
                           placeholder="Nome de usuário"/>

                    <label for="senha">Senha:</label>
                    <input type="password" name="senha"
                           id="senha"
                           placeholder="Senha de usuário"/>
                    <br/>
                    <input type="password" name="senha-2"
                           id="senha-2"
                           placeholder="Repita sua senha"/>

                    <div class="form-actions">
                        <input type="submit" id="login" name="operacao"
                               value="Cadastrar" class="btn btn-large" />
                    </div>
                </form>
            </div>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>