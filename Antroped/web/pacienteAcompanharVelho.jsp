<%--
    Document   : pacienteAcompanhar
    Created on : 24/09/2012, 19:24:29
    Author     : Joao Luiz e Max
    Description: Página que detalha os dados do paciente e acompanha suas medidas
--%>
<%@page import="Dao.DaoTabelaScoreZ"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.Paciente"%>
<%@page import="Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Medida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Paciente paciente = (Paciente) session.getAttribute("paciente");
    if ((paciente == null)) {
        response.sendRedirect("usuarioIndex.jsp");
    } else {
        List<Medida> dados = new Dao<Medida>(Medida.class).listById(paciente.getId());
        List<Medida> pag = new Dao<Medida>(Medida.class).listByIdPag(paciente.getId(), session.getAttribute("pag") != null ? (Integer) session.getAttribute("pag") : 1, Util.Util.ELEMENTOS_TABELA_GRAFICOS);
        if (session.getAttribute("pagina") == null) {
            session.setAttribute("pagina", 1);
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Antroped</title>

        <link type="text/css" rel="stylesheet" href="css/styles.css"/>
        <link href='http://fonts.googleapis.com/css?family=Advent+Pro|Capriola' rel='stylesheet' type='text/css'>
        <link type="text/css" rel="stylesheet" href="css/kinectcss.css"/>
        <link type="text/css" rel="stylesheet" href="css/jquery.tools.css"/>
        <link type="text/css" rel="stylesheet" href="css/jquery-ui-1.8.23.custom.css"/>

        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <script src="js/kinetic-v3.10.0.min.js" type="text/javascript"></script>
        <script src="js/scriptcanvas.js" type="text/javascript"></script>
        <script src="js/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
        <script src="js/jquery.tools.min.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
        <!-- Script das tabs -->
        <script type="text/javascript">
            // perform JavaScript after the document is scriptable.
            $(function() {
                $("ul.tabs").tabs("> .pane");
            });
        </script>
        <!-- Script que desenha os pontos e passa as linhas -->
        <script type="text/javascript">
            $(document).ready(function () {
                pontosPeso05 = [];
                pontosEstatura05 = [];
                pontosImc05 = [];
                pontosPc05 = [];
                pontosPeso519 = [];
                pontosEstatura519 = [];
                pontosImc519 = [];
                //nao consigo acessar o paciente dentro deste for, por isso fiz um hidden no formulario e pego o valor dele
            <% for (Medida d : dados) {
                    if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getPeso() >= 1 && d.getPeso() <= 25)) {%>
                            pontosPeso05.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPeso()%>, 3, '000', '000', 1,"<%=d.getHint()%>", stagePeso05, 'graficoPeso05', document.form.paciente.value));
            <% }%>
                    if (document.form.paciente.value == 'Masculino'){
            <%
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getAltura() >= 43 && d.getAltura() <= 122)) {%>
                            pontosEstatura05.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getAltura())%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageEstatura05, 'graficoEstatura05', document.form.paciente.value));
            <% }%>
                    } else {
            <%
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getAltura() >= 43 && d.getAltura() <= 122)) {%>
                            pontosEstatura05.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getAltura())%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageEstatura05, 'graficoEstatura05', document.form.paciente.value));
            <% }%>
                    }
            <%
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100))) >= 9.6 && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))) <= 21.2)) {%>
                        pontosImc05.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageImc05, 'graficoImc05', document.form.paciente.value));
            <% }%>
                    if (document.form.paciente.value == 'Masculino') {
            <%
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getPerimetroCefalico() >= 32 && d.getPerimetroCefalico() <= 54.5)) {%>
                            pontosPc05.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPerimetroCefalico()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePc05, 'graficoPc05', document.form.paciente.value));
            <% }%>
                    } else {
            <%
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getPerimetroCefalico() >= 31 && d.getPerimetroCefalico() <= 53.5)) {%>
                            pontosPc05.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPerimetroCefalico()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePc05, 'graficoPc05', document.form.paciente.value));
            <% }%>
                    }
                    if (document.form.paciente.value == 'Masculino'){
            <%
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getPeso() >= 13 && d.getPeso() <= 45)) {%>
                            pontosPeso519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPeso()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePeso519, 'graficoPeso519', document.form.paciente.value));
            <% }%>
                    } else {
            <%
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getPeso() >= 13 && d.getPeso() <= 47)) {%>
                            pontosPeso519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPeso()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePeso519, 'graficoPeso519', document.form.paciente.value));
            <% }%>
                    }
                    if (document.form.paciente.value == 'Masculino'){
            <%
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getAltura() >= 1 && d.getAltura() <= 195)) {%>
                            pontosEstatura519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getAltura()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageEstatura519, 'graficoEstatura519', document.form.paciente.value));
            <% }%>
                    } else {
            <%
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getAltura() >= 105 && d.getAltura() <= 180)) {%>
                            pontosEstatura519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getAltura()%>, 3, '000', '000', 1,"<%=d.getHint()%>", stageEstatura519, 'graficoEstatura519', document.form.paciente.value));
            <% }%>
                    }
                    if (document.form.paciente.value == 'Masculino'){
            <%
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100))) >= 12 && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))) <= 30)) {%>
                            pontosImc519.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageImc519, 'graficoImc519', document.form.paciente.value));
            <% }%>
                    } else {
            <%
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100))) >= 12 && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))) <= 29.5)) {%>
                            pontosImc519.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageImc519, 'graficoImc519', document.form.paciente.value));
            <% }%>
                    }
            <%
                }%>

                        drawLineTroughCircle(pontosPeso05, stagePeso05);
                        drawLineTroughCircle(pontosEstatura05, stageEstatura05);
                        drawLineTroughCircle(pontosImc05, stageImc05);
                        drawLineTroughCircle(pontosPc05, stagePc05);

                        drawLineTroughCircle(pontosPeso519, stagePeso519);
                        drawLineTroughCircle(pontosEstatura519, stageEstatura519);
                        drawLineTroughCircle(pontosImc519, stageImc519);
                    });
        </script>
    </head>
    <body>
        <div class="container">
            <!-- HEADER -->
            <header>
                <h1>Antroped</h1>
                <p class="sair">
                    <a href="ServletUsuario?operacao=sair" title="Sair">Sair<img src="img/exitIco.png" /></a>
                    <a href="usuarioIndex.jsp" title="Voltar">Voltar<img src="img/returnIco.png" /></a>
                </p>
            </header>
            <!-- MAIN -->
            <div class="main">
                <!-- FORMULARIO -->
                <form name="form" action="ServletMedidas" method="POST"
                      class="formulariodadospaciente formulario"
                      id="formularioNovaMedida" onsubmit="return cancelaCadastro();">
                    <fieldset>
                        <legend>Medidas</legend>
                        <input type="submit" value="Cadastrar" name="operacao"
                               class="button enviar" onclick="this.form.cancelar.value='Cancelar'"/>
                        <input type="submit" value="Cancelar" name="cancelar"
                               class="button cancelar"
                               onclick=" this.value = ' Cancelar '"/>
                        <input type="hidden" name="paciente" value="<%=paciente.getSexo()%>" />

                        <label for="datepicker">Data:</label><br/>
                        <input type="text" name="data" id="datepicker"
                               value="<%=(session.getAttribute("dado") == null)
                                       ? ""
                                       : Util.Util.dateToString(((Medida) session.getAttribute("dado")).getData())%>"/>
                        <br/>

                        <label for="peso">Peso (kg):</label><br/>
                        <input type="text" name="peso" id="peso"
                               value="<%=(session.getAttribute("dado") == null)
                                       ? ""
                                       : ((Medida) session.getAttribute("dado")).getPeso()%>"/>
                        <br/>

                        <label for="estatura">Estatura (cm):</label><br/>
                        <input type="text" name="altura" id="estatura"
                               value="<%=(session.getAttribute("dado") == null)
                                       ? ""
                                       : ((Medida) session.getAttribute("dado")).getAltura()%>"/>
                        <br/>

                        <label>Posição:</label><br/>
                        <input type="radio" name="posicao" id="posicaodecubito"
                               value="decubito" checked="checked"/>

                        <label for="posicaodecubito" class="radiolabel">Decúbito</label>
                        <input type="radio" name="posicao" id="posicaoortastatismo"
                               value="ortostatismo" <%=(session.getAttribute("dado") != null)
                                       && (((Medida) session.getAttribute("dado")).getPosicao().equals("ortostatismo"))
                                       ? "checked=\"checked\""
                                       : ""%>/>
                        <label for="posicaoortastatismo" class="radiolabel">Ortostatismo</label>
                        <br/>

                        <label for="perimetrocefalico">Perímetro Cefalico:</label><br/>
                        <input type="text" name="perimetroCefalico" id="perimetrocefalico"
                               value="<%=(session.getAttribute("dado") == null)
                                       ? ""
                                       : ((Medida) session.getAttribute("dado")).getPerimetroCefalico()%>"/>
                        <br/>
                        <label for="peso">Idade Óssea:</label><br/>
                        <input type="text" name="idadeOssea" id="idadeOssea"
                               value="<%=(session.getAttribute("dado") == null)
                                       ? ""
                                       : ((Medida) session.getAttribute("dado")).getIdadeOsseaExtenso()%>"/>
                        <br/>
                    </fieldset>
                </form>


                <!-- TABELA DOS DADOS DO PACIENTE -->
                <% if (!dados.isEmpty()) {%>
                <table class="tabela tabelamedidas" id="dataTable">
                    <thead>
                        <tr>
                            <th class="data">Data</th>
                            <th class="idade">Idade</th>
                            <th class="peso">Peso</th>
                            <th class="altura">Estatura</th>
                            <th class="imc">IMC</th>
                            <th class="perimetrocefalico">Perímetro<br/>
                                Cefalico</th>
                            <th class="idadeossea">Idade Óssea </th>
                            <th class="previsaoestatura">Previsão de Estatura (B-P)</th>
                            <th colspan="3">Opções</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Medida d : pag) {
                                out.print("<tr>");
                                out.print("<td>" + Util.Util.dateToString(d.getData()) + "</td>");
                                out.print("<td>");
                                out.print(d.idadeToExtenso());
                                out.print("</td>");
                                out.print("<td>" + d.getPeso() + " kg</td>");
                                out.print("<td>" + d.getAltura() + " cm</td>");
                                out.print("<td>" + d.getIMC() + " Kg/m²</td>");
                                out.print("<td>" + d.getPerimetroCefalico() + " cm</td>");
                                out.print("<td>" + d.getIdadeOsseaExtenso()+ "</td>");
                                out.print("<td> - </td>");
                                out.print("<td><a href=\"ServletMedidas?operacao=editar&id=" + d.getId() + "\"> <img hint=\"Editar\" src=img/editIcon.png /> </a></td>");
                                out.print("<td><a href=\"ServletMedidas?operacao=deletar&id=" + d.getId() + "\"> <img hint=\"Deletar\" src=img/deleteIco.png /> </a></td>");
                                out.print("<td><a href=\"#\" onclick=\"abrePopUp(" + d.getId() + ")\"> <img hint=\"Detalhes\" src=img/plusIco.png /> </a></td>");
                                out.print("</tr>");
                            }
                        %>
                    </tbody>
                    <tfoot>
                    <th colspan="9">
                        <% if (session.getAttribute("pagina") != null) {
                                if ((Integer) session.getAttribute("pagina") * Util.Util.ELEMENTOS_TABELA_GRAFICOS < dados.size()) {%>
                        <a href="ServletPagina?change=prox" class="button">Anterior</a>
                        <% }
                            if ((Integer) session.getAttribute("pagina") > 1) {
                        %>
                        <a href="ServletPagina?change=ant" class="button">Próximo</a>
                        <%}
                            }%>
                    </th>
                    </tfoot>
                </table>
                <% }%>
                <button type="button" id="novaMedida"
                        onclick="escondeTabela()"
                        class="botao">
                    Nova medida
                </button>


                <!-- DADOS DO PACIENTE -->
                <section class="dadospaciente">
                    <h2>Dados do paciente:</h2>
                    <ul>
                        <li>
                            <span>Nome:</span><br/>
                            <%=paciente.getNome()%>
                        </li>
                        <li>
                            <span>Sexo:</span><br/>
                            <%=paciente.getSexo()%>
                        </li>
                        <li>
                            <span>Idade (atual):</span><br/>
                            <%=paciente.idadeToExtenso() + " (" + Util.Util.dateToString(paciente.getDataNascimento()) + ")"%> </li>
                        <li>
                            <span>Nome pai:</span><br/>
                            <%=paciente.getNomePai()%>
                        </li>
                        <li>
                            <span>Nome mãe:</span><br/>
                            <%=paciente.getNomeMae()%>
                        </li>
                        <li>
                            <span>Estatura pai:</span><br/>
                            <%=paciente.getEstaturaPai()%> cm
                        </li>
                        <li>
                            <span>Estatura mãe:</span><br/>
                            <%=paciente.getEstaturaMae()%> cm
                        </li>
                        <li>
                            <span>Estatura alvo:</span><br/>
                            <%=paciente.CalculaEstaturaAlvo()%> cm +/- 10cm
                        </li>
                        <li>
                            <span><a href="ServletPaciente?id=<%=paciente.getId()%>&operacao=editar" class="linkeditar">Editar</a></span><br/>
                        </li>
                    </ul>
                </section>
                <!-- AVALIAÇÃO -->
                <section class="avaliacao">
                    <h1><strong>Avaliação do Gráfico</strong></h1>
                    <p class="relatorio"><script>mudaTexto('peso05')</script></p>
                </section>

                <!-- GRÁFICOS -->
                <section class="graficos">
                    <div class="wrap">
                        <!-- the tabs -->
                        <ul class="tabs">
                            <li><a href="#" onclick="mudaTexto('peso05')">Grafico Peso (< 5)</a></li>
                            <li><a href="#" onclick="mudaTexto('peso519')">Grafico Peso</a></li>
                            <li><a href="#" onclick="mudaTexto('estatura05')">Grafico Estatura (< 5)</a></li>
                            <li><a href="#" onclick="mudaTexto('estatura519')">Grafico Estatura</a></li>
                            <li><a href="#" onclick="mudaTexto('imc05')">Grafico Imc (< 5)</a></li>
                            <li><a href="#" onclick="mudaTexto('imc519')">Grafico Imc</a></li>
                            <li><a href="#" onclick="mudaTexto('pc05')">Grafico Perím. Cefalico</a></li>
                        </ul>

                        <!-- tab "panes" -->
                        <div class="pane">
                            <div id="graficoPeso05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/peso05masc.png');" : "background-image: url('img/peso05fem.png');")%>">
                                <div id="containerPeso05"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                        <div class="pane">
                            <div id="graficoPeso519" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/peso519masc.png');" : "background-image: url('img/peso519fem.png');")%>">
                                <div id="containerPeso519"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                        <div class="pane">
                            <div id="graficoEstatura05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/estatura05masc.png');" : "background-image: url('img/estatura05fem.png');")%>">
                                <div id="containerEstatura05"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                        <div class="pane">
                            <div id="graficoEstatura519" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/estatura519masc.png');" : "background-image: url('img/estatura519fem.png');")%>">
                                <div id="containerEstatura519"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                        <div class="pane">
                            <div id="graficoImc05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/imc05masc.png');" : "background-image: url('img/imc05fem.png');")%>">
                                <div id="containerImc05"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                        <div class="pane">
                            <div id="graficoImc519" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/imc519masc.png');" : "background-image: url('img/imc519fem.png');")%>">
                                <div id="containerImc519"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                        <div class="pane">
                            <div id="graficoPc05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/pc05masc.png');" : "background-image: url('img/pc05fem.png');")%>" >
                                <div id="containerPc05"></div>
                                <p>Fonte: OMS (2006)</p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- FOOTER -->
            <footer>
            </footer>
        </div>

    </body>
    <%}%>
</html>
