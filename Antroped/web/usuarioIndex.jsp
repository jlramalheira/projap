<%--
    Document   : index
    Created on : 24/09/2012, 19:24:29
    Author     : JoaoLuiz
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
        List<Paciente> pacientes = new Dao<Paciente>(Paciente.class).listByUsuario(usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/styles.css" />
        <link href='http://fonts.googleapis.com/css?family=Advent+Pro|Capriola' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
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
        <title>Antropometria</title>
    </head>
    <body lang="pt-br">
        <div class="container">
            <!-- HEADER -->
            <header>
                <h1>Antropometria</h1>
                <p class="sair">
                    <a href="ServletUsuario?operacao=sair" title="Sair">Sair<img src="img/exitIco.png" /></a>
                </p>
            </header>
            <!-- MAIN -->
            <div class="main">
                <!-- Tabela de Pacientes -->
                <% if (!pacientes.isEmpty()) {%>
                <table class="tabela tabelapaciente" id="dataTable">
                    <thead>
                        <tr>
                            <th id="colunaNome">Nome</th>
                            <th id="colunaSexo">Sexo</th>
                            <th id="colunaOpções" colspan="2">Opções</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Paciente p : pacientes) {
                                out.print("<tr>");
                                out.print("<td>" + p.getNome() + "</td>");
                                out.print("<td>" + p.getSexo() + "</td>");
                                out.print("<td>");
                                out.print("<a href=\"ServletPaciente?id=" + p.getId() + "&operacao=mostrar\"> <img hint=\"Deletar\" src=img/lookIco.png /></a>");
                                out.print("</form></td>");
                                out.print("<td><a href=\"ServletPaciente?id=" + p.getId() + "&operacao=deletar\"> <img hint=\"Deletar\" src=img/deleteIco.png /> </a></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                </table>
                <%}%>
                
                <!-- Formulário para adicionar um paciente novo -->
                <form name="form" action="ServletPaciente" method="POST" class="formulario formularionovopaciente">
                    <fieldset>
                        <legend>Novo Paciente:</legend>
                        <label for="nome">Nome:</label><br/>
                        <input type="text" name="nome" id="nome" maxlength="40"
                               value="<%=(session.getAttribute("editando") == null)
                                       ? ""
                                       : ((Paciente) session.getAttribute("editando")).getNome()%>"/><br/>
                        
                        <label for="datanasc">Data de Nascimento:</label><br/>
                        <input type="text" name="dataNascimento" id="datanasc"
                               value="<%=(session.getAttribute("editando") == null)
                                       ? ""
                                       : Util.Util.dateToString(((Paciente) session.getAttribute("editando")).getDataNascimento())%>"/><br/>

                        <label>Sexo:</label><br/>
                        <input type="radio" name="sexo" value="Masculino" id="sexom" checked="checked"/>
                        <label for="sexom" class="radiolabel">Masculino</label>                        
                        <input type="radio" name="sexo" value="Feminino" id="sexof"
                               <%=(session.getAttribute("editando") != null)
                                       && (((Paciente) session.getAttribute("editando")).getSexo().equalsIgnoreCase("feminino"))
                                       ? "checked=\"checked\""
                                       : ""%>/>
                        <label for="sexof" class="radiolabel">Feminino</label><br/>

                        <label for="nomepai">Nome do Pai:</label><br/>
                        <input type="text" name="nomePai" id="nomepai"
                               value="<%=(session.getAttribute("editando") == null)
                                       ? ""
                                       : ((Paciente) session.getAttribute("editando")).getNomePai()%>"/><br/>

                        <label for="nomemae">Nome da Mãe:</label><br/>
                        <input type="text" name="nomeMae" id="nomemae"
                               value="<%=(session.getAttribute("editando") == null)
                                       ? ""
                                       : ((Paciente) session.getAttribute("editando")).getNomeMae()%>"/><br/>

                        <p class="estatura">
                            <label for="estaturapai">Estatura do Pai (cm):</label><br/>                        
                            <input type="text" name="estaturaPai" id="estaturapai"
                                   value="<%=(session.getAttribute("editando") == null)
                                           ? ""
                                           : ((Paciente) session.getAttribute("editando")).getEstaturaPai()%>"/>
                        </p>

                        <p class="estatura">
                            <label for="estaturamae">Estatura da Mãe (cm):</label><br/>
                            <input type="text" name="estaturaMae" id="estaturamae"
                                   value="<%=(session.getAttribute("editando") == null)
                                           ? ""
                                           : ((Paciente) session.getAttribute("editando")).getEstaturaMae()%>"/>
                        </p> 
                        
                        <input type="submit" value="Cancelar" name="operacao"
                               class="button cancelar" 
                               onclick=""/>                  
                        <input type="submit" value="Cadastrar" name="operacao"
                               class="button enviar"/>
                    </fieldset>
                </form>
            </div>
            <!-- FOOTER -->
            <footer>
            </footer>
        </div>
    </body>
    <%}%>
</html>
