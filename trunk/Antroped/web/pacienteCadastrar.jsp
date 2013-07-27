<%--
    Document   : pacienteCadastrar
    Created on : 24/09/2012, 19:24:29
    Author     : Joao Luiz e Max
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
    if ((usuario == null)) {
        response.sendRedirect("Usuario?operacao=logar");
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
            <%@include file="interfaceHeader.jsp" %>
            <%-- MAIN --%>
            <div class="main">
                <%@include file="interfaceMessages.jsp" %>
                <%-- Navigation --%>
                <nav>
                    <ul class="breadcrumb">
                        <li>
                            <a href="Paciente?operacao=listar">Pacientes</a>
                            <span class="divider">/</span>
                        </li>
                        <li class="active">
                            Cadastrar
                        </li>
                    </ul>
                </nav>

                <h1>Cadastrar paciente</h1>
                <form action="" method="POST"
                      class="form form-validate"
                      data-validation="on">
                    <fieldset>
                        <div class="control-group">
                            <label for="nome" class="control-label">
                                Nome
                            </label>
                            <div class="controls">
                                <input type="text" name="nome" value=""
                                       id="nome" class="input-xxlarge"
                                       placeholder="Nome completo do paciente"
                                       data-validation="required"
                                       />
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="datanasc" class="control-label">
                                Data de Nascimento
                            </label>
                            <div class="controls">
                                <input type="text" name="dataNascimento" value=""
                                       id="datanasc"
                                       placeholder="dd/mm/aaaa"
                                       data-validation="required date"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">
                                Sexo
                            </label>
                            <div class="controls">
                                <label for="sexom" class="radio inline">
                                    <input type="radio" name="sexo" value="Masculino"
                                           checked="checked"
                                           id="sexom"/>
                                    Masculino
                                </label>
                                <label for="sexof" class="radio inline">
                                    <input type="radio" name="sexo" value="Feminino"
                                           id="sexof"/>
                                    Feminino
                                </label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="nomemae" class="control-label">
                                Mãe
                            </label>
                            <div class="controls">
                                <input type="text" name="nomeMae" value=""
                                       id="nomemae" class="input-xxlarge"
                                       placeholder="Nome completo da mãe"/>
                                <br/>
                                <input type="text" name="estaturaMae"
                                       id="estaturamae" class="input-xlarge"
                                       placeholder="Estatura da mãe em centímetros"
                                       data-validation="required number positive"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="nomepai" class="control-label">
                                Pai
                            </label>
                            <div class="controls">
                                <input type="text" name="nomePai" value=""
                                       id="nomepai" class="input-xxlarge"
                                       placeholder="Nome completo do pai"/>
                                <br/>
                                <input type="text" name="estaturaPai" value=""
                                       id="estaturapai" class="input-xlarge"
                                       placeholder="Estatura do pai em centímetros"
                                       data-validation="required number positive"/>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="submit" value="" name=""
                                    class="btn btn-large btn-icon new-user">
                                Cadastrar
                            </button>
                        </div>
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
