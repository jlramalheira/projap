<%--
    Document   : error404
    Created on : 23/07/2013, 22:28:41
    Author     : Max
    Description:
        Esse documento JSP é utilizado para página de erro.
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null) || (!usuario.isAdministrador())) {
        usuario = new Usuario();
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
                <h1>Listar usuários</h1>
                <%@include file="interfaceMessages.jsp" %>
                <form action="Usuario" method="GET"
                      class="form">
                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" value=""
                           id="nome" class="input-xxlarge"
                           placeholder="Nome completo do usuario"
                           />

                    <div class="more-options">
                        <label for="email">Email:</label>
                        <input type="text" name="email"
                               id="email" class="input-xlarge"
                               placeholder="E-mail usuario"/>

                        <label for="login">Login:</label>
                        <input type="text" name="login"
                               id="login"
                               placeholder="login do usuário"/>
                    </div>

                    <div class="form-actions">
                        <button type="submit" name="operacao" value="Pesquisar"
                                class="btn btn-large btn-icon search">
                            Pesquisar
                        </button>
                        <button type="button"
                                class="btn btn-large btn-icon more"
                                onclick="toggleMoreOptions(this)">
                            Mais Opções
                        </button>
                        <a href="Usuario?operacao=cadastrar"
                           class="btn btn-large btn-icon new-user">
                            Adicionar Novo
                        </a>
                    </div>
                </form>
                <% if (request.getAttribute("usuarios") != null) {
                        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                        if (!usuarios.isEmpty()) {%>


                <table class="table table-bordered table-striped" id="dataTable">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Login</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Usuario user : usuarios){ %>
                        <tr>
                            <td><%=user.getNome()%></td>
                            <td><%=user.getLogin()%></td>
                            <td><%=user.getEmail()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <%    } else {%>
                <h1>Nenhum resultado foi encontrado</h1>
                <%}
                    }%>
            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>
    </body>
</html>
