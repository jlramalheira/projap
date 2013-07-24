<%--
    Document   : pacienteEditar
    Created on : 23/03/2013, 01:14:29
    Author     : JoaoLuiz e Max
--%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Paciente"%>
<%@page import="Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((usuario == null) || ((Paciente) request.getAttribute("paciente") == null)) {
        response.sendRedirect("Usuario?operacao=logar");
    } 
        Paciente paciente = (Paciente) request.getAttribute("paciente");
%>
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
                <h1>Editar dados do paciente</h1>
                <%@include file="interfaceMessages.jsp" %>
                <!-- Formulário para adicionar um paciente novo -->
                <form action="Paciente" method="POST"
                      class="form">
                    <input type="hidden" name="idPaciente" value="<%=(paciente).getId()%>" />

                    <label for="nome">Nome:</label>
                    <input type="text" name="nome" value="<%=paciente.getNome()%>"
                           id="nome" class="input-xxlarge"/>

                    <label for="datanasc">Data de Nascimento:</label>
                    <input type="text" name="dataNascimento" value="<%=Util.Util.dateToString(paciente.getDataNascimento())%>"
                           id="datanasc"/>

                    <label>Sexo:</label>
                    <label for="sexo-masculino" class="radio inline">
                        <input type="radio" name="sexo" value="Masculino"
                               id="sexo-masculino"
                               checked="checked"/>
                        Masculino
                    </label>
                    <label for="sexo-feminino" class="radio inline">
                        <input type="radio" name="sexo" value="Feminino"
                               id="sexo-feminino"
                               <%=(paciente).getSexo().equalsIgnoreCase("feminino") ? "checked=\"checked\"" : ""%>
                               />
                        Feminino
                    </label>
                    <br/><br/>

                    <label for="nomepai">Nome do Pai:</label>
                    <input type="text" name="nomePai" value="<%=paciente.getNomePai()%>"
                           id="nomepai" class="input-xxlarge"/>

                    <label for="nomemae">Nome da Mãe:</label>
                    <input type="text" name="nomeMae" value="<%=paciente.getNomeMae()%>"
                           id="nomemae" class="input-xxlarge"/>

                    <label for="estaturapai">Estatura do Pai:</label>
                    <input type="text" name="estaturaPai" value="<%=paciente.getEstaturaPai()%>"
                           id="estaturapai"/>

                    <label for="estaturamae">Estatura da Mãe:</label>
                    <input type="text" name="estaturaMae" value="<%=paciente.getEstaturaMae()%>"
                           id="estaturamae"/>

                    <div class="form-actions">
                        <input type="submit" value="Editar" name="operacao"
                               class="btn btn-large btn-icon edit"/>
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