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
                <%@include file="interfaceFooter.jsp" %>
            </footer>
        </div>
    </body>
    <%}%>
</html>
