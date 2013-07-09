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
        response.sendRedirect("usuarioLogin.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
        <script src="js/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function(){
                $('#datanasc').mask("99/99/9999");

                $("#estaturapai").keyup(function() {
                    var valor = $("#estaturapai").val().replace(/[^0-9.]+/g,'');
                    $("#estaturapai").val(valor);
                });

                $("#estaturamae").keyup(function() {
                    var valor = $("#estaturamae").val().replace(/[^0-9.]+/g,'');
                    $("#estaturamae").val(valor);
                });
            });
        </script>
    </head>
    <body lang="pt-br">
        <div class="container">
            <%-- HEADER --%>
            <%@include file="interfaceHeader.jsp" %>
            <%-- MAIN --%>
            <div class="main">

                <%-- Navigation --%>
                <nav>
                    <ul class="breadcrumb">
                        <li>
                            <a href="pacienteListar.jsp">Pacientes</a>
                            <span class="divider">/</span>
                        </li>
                        <li class="active">
                            Cadastrar
                        </li>
                    </ul>
                </nav>

                <h1>Cadastrar paciente</h1>
                <form action="ServletPaciente" method="POST"
                      class="form">
                    <fieldset>
                        <label for="nome">Nome:</label>
                        <input type="text" name="nome" value=""
                               id="nome" class="input-xxlarge"
                               placeholder="Nome completo do paciente"
                               required/>

                        <label for="datanasc">Data de Nascimento:</label>
                        <input type="text" name="dataNascimento" value=""
                               id="datanasc" class="date"
                               title="Data de nascimento"
                               pattern="([0-2][0-9]|3(0|1))/(0[0-9]|1[0-2])/([0-9]+)"
                               placeholder="dd/mm/aaaa"
                               required/>

                        <label>Sexo:</label>
                        <label for="sexom" class="radio inline">
                            <input type="radio" name="sexo" value="Masculino"
                                   id="sexom"
                                   required/>
                            Masculino
                        </label>
                        <label for="sexof" class="radio inline">
                            <input type="radio" name="sexo" value="Feminino"
                                   id="sexof"
                                   required=""/>
                            Feminino
                        </label><br/><br/>

                        <label for="nomepai">Nome do Pai:</label>
                        <input type="text" name="nomePai" value=""
                               id="nomepai" class="input-xxlarge"
                               placeholder="Nome completo do pai"/>

                        <label for="nomemae">Nome da Mãe:</label>
                        <input type="text" name="nomeMae" value=""
                               id="nomemae" class="input-xxlarge"
                               placeholder="Nome completo da mãe"/>


                        <label for="estaturapai">Estatura do Pai:</label>
                        <input type="text" name="estaturaPai" value=""
                               id="estaturapai" class="input-xlarge"
                               placeholder="Estatura do pai em centímetros"/>

                        <label for="estaturamae">Estatura da Mãe:</label>
                        <input type="text" name="estaturaMae"
                               id="estaturamae" class="input-xlarge"
                               placeholder="Estatura da mãe em centímetros"/>

                        <div class="form-actions">
                            <button type="submit" value="Cadastrar" name="operacao"
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
    <%}%>
</html>
