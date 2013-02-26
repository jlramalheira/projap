<%--
    Document   : pacienteAcompanhar2
    Created on : 21/02/2013, 10:55:23
    Author     : Max
    Description: Esse documento JSP é utilizado para mostrar as informações do
                 paciente e acompanhamento do médico.
--%>
<%@page import="Model.Usuario"%>
<%@page import="Dao.DaoTabelaScoreZ"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.Paciente"%>
<%@page import="Dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Medida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    
    Paciente paciente = (Paciente) session.getAttribute("paciente");
    if ((paciente == null)) {
        response.sendRedirect("usuarioIndex.jsp");
    } else {
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        List<Medida> dados = new Dao<Medida>(Medida.class).listById(paciente.getId());
        List<Medida> paginados = new Dao<Medida>(Medida.class).listByIdPag(paciente.getId(), session.getAttribute("pag") != null ? (Integer) session.getAttribute("pag") : 1, Util.Util.ELEMENTOS_TABELA_GRAFICOS);
        if (session.getAttribute("pagina") == null) {
            session.setAttribute("pagina", 1);
        }
        boolean corEscuraTabela = true;
%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Acompanhamento do Paciente</title>
        <link href="css/styles2.css" type="text/css" rel="stylesheet"/>

        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <script src="js/kinetic-v3.10.0.min.js" type="text/javascript"></script>
        <script src="js/interface.js" type="text/javascript"></script>
        <script type="text/javascript">
            function grafico(){
                init();
                pontosPeso05 = [];
                pontosEstatura05 = [];
                pontosImc05 = [];
                pontosPc05 = [];
                pontosPeso519 = [];
                pontosEstatura519 = [];
                pontosImc519 = [];
            <% for (Medida d : dados) {
                    if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getPeso() >= 1 && d.getPeso() <= 25)) {%>
                            pontosPeso05.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPeso()%>, 3, '000', '000', 1,"<%=d.getHint()%>", stagePeso05, 'graficoPeso05', 'Masculino'));
            <% }%>
                    if ($("#pacienteSexo").text() == 'Masculino'){
            <%                
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getAltura() >= 43 && d.getAltura() <= 122)) {%>
                            pontosEstatura05.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getAltura())%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageEstatura05, 'graficoEstatura05', 'Masculino'));
            <% }%>
                    } else {
            <%                
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getAltura() >= 43 && d.getAltura() <= 122)) {%>
                            pontosEstatura05.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getAltura())%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageEstatura05, 'graficoEstatura05', 'Feminino'));
            <% }%>
                    }
            <%                
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100))) >= 9.6 && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))) <= 21.2)) {%>
                        pontosImc05.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageImc05, 'graficoImc05', 'Masculino'));
            <% }%>
                    if ($("#pacienteSexo").text() == 'Masculino') {
            <%                
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getPerimetroCefalico() >= 32 && d.getPerimetroCefalico() <= 54.5)) {%>
                            pontosPc05.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPerimetroCefalico()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePc05, 'graficoPc05', 'Masculino'));
            <% }%>
                    } else {
            <%                
                if ((d.getIdade() >= 0 && d.getIdade() < 1826) && (d.getPerimetroCefalico() >= 31 && d.getPerimetroCefalico() <= 53.5)) {%>
                            pontosPc05.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPerimetroCefalico()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePc05, 'graficoPc05', 'Feminino'));
            <% }%>
                    }
                    if ($("#pacienteSexo").text() == 'Masculino'){
            <%                
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getPeso() >= 13 && d.getPeso() <= 45)) {%>
                            pontosPeso519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPeso()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePeso519, 'graficoPeso519', 'Masculino'));
            <% }%>
                    } else {
            <%                
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getPeso() >= 13 && d.getPeso() <= 47)) {%>
                            pontosPeso519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getPeso()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stagePeso519, 'graficoPeso519', 'Feminino'));
            <% }%>
                    }
                    if ($("#pacienteSexo").text() == 'Masculino'){
            <%                
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getAltura() >= 1 && d.getAltura() <= 195)) {%>
                            pontosEstatura519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getAltura()%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageEstatura519, 'graficoEstatura519', 'Masculino'));
            <% }%>
                    } else {
            <%                
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && (d.getAltura() >= 105 && d.getAltura() <= 180)) {%>
                            pontosEstatura519.push(drawCircle(<%=(d.getIdade())%>, <%=d.getAltura()%>, 3, '000', '000', 1,"<%=d.getHint()%>", stageEstatura519, 'graficoEstatura519', 'Feminino'));
            <% }%>
                    }
                    if ($("#pacienteSexo").text() == 'Masculino'){
            <%                
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100))) >= 12 && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))) <= 30)) {%>
                            pontosImc519.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageImc519, 'graficoImc519', 'Masculino'));
            <% }%>
                    } else {
            <%                
                if ((d.getIdade() >= 1825 && d.getIdade() < 6936) && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100))) >= 12 && ((d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))) <= 29.5)) {%>
                            pontosImc519.push(drawCircle(<%=(d.getIdade())%>, <%=(d.getPeso() / ((d.getAltura() / 100) * (d.getAltura() / 100)))%>, 3, '000', '000', 1, "<%=d.getHint()%>", stageImc519, 'graficoImc519', 'Feminino'));
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

                    }
        </script>
        <script type="text/javascript">
            function mudaTexto(tab){
                if (tab=='peso05'){
                    $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("peso05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                }else if(tab=='peso519'){
                    $('.report').html('Não há nenhuma avaliação disponível para este tipo de gráfico.');
                }else if(tab=='estatura05'){
                    $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("estatura05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                }else if(tab=='estatura519'){
                    $('.report').html('Não há nenhuma avaliação disponível para este tipo de gráfico.');
                }else if(tab=='imc05'){
                    $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("imc05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                }else if(tab=='imc519'){
                    $('.report').html('Não há nenhuma avaliação disponível para este tipo de gráfico.');
                }else if(tab=='pc05'){
                    $('.report').html('Não há nenhuma avaliação disponível para este tipo de gráfico.');
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <%-- HEADER --%>
            <header>
                <a class="logo" href="#">
                    <img src="img/logoAntroped.png" alt="Logo Antroped"/>
                </a>
                <section class="user">
                    <div class="photo"></div>
                    <p class="welcome">Olá,<br/>
                        <span class="name"><%=usuario.getNome()%></span>
                    </p>
                    <p class="logout"><a href="ServletUsuario?operacao=sair" title="Sair">Sair</a></p>
                </section>
            </header>
            <%-- MAIN --%>
            <div class="main">
                <%-- Navigation --%>
                <nav>
                    <a href="#">Pacientes</a> » <span class="current">Acompanhar Paciente</span>
                </nav>
                <%-- Paciente Data --%>
                <section class="paciente">
                    <%-- Paciente Controller --%>
                    <section class="control">
                        <button class="edit" id="edit">Editar dados</button>
                        <button class="newMedida" onclick="medidaNewShow()" id="medidaNewButton">Nova medida</button>
                    </section>
                    <h1 class="name"><%=paciente.getNome()%></h1>
                    <section class="data">
                        <span id="pacienteSexo"><%=paciente.getSexo()%></span><br/>
                        nascido em <%=Util.Util.dateToString(paciente.getDataNascimento())%><br/>
                        <%=paciente.idadeToExtenso()%>
                        <div class="margin"><span class="label">Estatura Alvo:</span><br/>
                            <%=paciente.CalculaEstaturaAlvo()%> cm <span class="minor">(+- 10 cm)</span></div>
                    </section>
                    <section class="mother">
                        <span class="label">Mãe:</span><br/>
                        <%=paciente.getNomeMae()%><br/>
                        <%=paciente.getEstaturaMae()%> cm
                    </section>
                    <section class="father">
                        <span class="label margin">Pai:</span><br/>
                        <%=paciente.getNomePai()%><br/>
                        <%=paciente.getEstaturaPai()%> cm
                    </section>
                </section>
                <%-- Medidas table --%>
                <table class="medidas">
                    <thead>
                        <tr>
                            <th>Data</th>
                            <th>Idade</th>
                            <th>Peso<br/><span class="minor">(kg)</span></th>
                            <th>Estatura<br/><span class="minor">(cm)</span></th>
                            <th>IMC<br/><span class="minor">(kg/m²)</span></th>
                            <th>Per. Cefálico<br/><span class="minor">(cm)</span></th>
                            <th>Idade Óssea<br/><span class="minor"></span></th>
                            <th>Prev. de Estatura<br/><span class="minor">(cm)</span></th>
                            <th>Opções</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Medida medida : paginados) {%>
                        <tr class="<%
                            //verifica a cor da linha e define o id dela
                            if (corEscuraTabela) {
                                out.print("even");
                                corEscuraTabela = false;
                            } else {
                                out.print("odd");
                                corEscuraTabela = true;
                            }
                            %>">
                            <td class="data"><%=medida.getDataStr()%></td>
                            <td class="idade"><%=medida.idadeToExtenso()%></td>
                            <td class="peso"><%=medida.getPeso()%></td>
                            <td class="estatura"><%=medida.getAltura()%><span class="minor"> <%=medida.getPosicaoAbreviado()%></span></td>
                            <td class="imc"><%=medida.getIMC()%></td>
                            <td class="perimetroCefalico"><%=medida.getPerimetroCefalico()%></td>
                            <td class="idadeOssea"><%=medida.getIdadeOssea()%></td>
                            <td class="previsaoEstatura">-</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <%-- Form Nova Medida --%>
                <form class="form" id="medidaNewForm" action="ServletMedidas" method="POST">
                    <fieldset>
                        <legend>Nova Medida</legend>
                        <div class="col">
                            <label for="medidaData">Data:</label><br/>
                            <input type="text" name="data" value="" id="medidaData"
                                   placeholder="Data que foi realizada a medida"/><br/>

                            <label for="medidaPeso">Peso (kg):</label><br/>
                            <input type="text" name="peso" value="" id="medidaPeso"
                                   placeholder="O peso que foi medido"/><br/>

                            <label for="medidaEstatura">Estatura (cm):</label><br/>
                            <input type="text" name="estatura" value="" id="medidaEstatura"
                                   placeholder="A estatura que foi medida"/><br/>
                        </div>
                        <div class="col">
                            <label for="medidaIdadeOssea">Idade Óssea:</label><br/>
                            <input type="text" name="idadeOssea" value="" id="medidaIdadeOssea"
                                   placeholder="A idade óssea atribuída" /><br/>

                            <label for="medidaEstatura">Perímetro Cefálico (cm):</label><br/>
                            <input type="text" name="perimetroCefalico" value="" id="medidaPerimetroCefalico"
                                   placeholder="O perímetro cefálico que foi medido"/><br/>
                            <label>Posição:</label><br/>
                            <input type="radio" name="posicao" value="decubito" id="medidaPosicaoDecubito" checked="checked"/>
                            <label for="medidaPosicaoDecubito">Decúbito</label>
                            <input type="radio" name="posicao" value="ortostatismo" id="medidaPosicaoOrtosttismo" />
                            <label for="medidaPosicaoOrtosttismo">Ortostatismo</label><br/>
                        </div>
                        <div class="buttons">
                            <input type="submit" name="operacao" value="Cadastrar" class="confirm"/><br/>
                            <button type="reset" class="cancel"  onclick="medidaNewCancel()">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
                <%-- Table and Graph Controller --%>
                <section class="control tableControl">
                    <div>
                        <button class="antigas">&lt; Antigas</button>
                        <button class="recentes">Recentes ></button>
                    </div>
                    <form class="graphControl">
                        <fieldset>
                            <legend>Mostrar gráfico de idade</legend>
                            <input type="radio" name="idade" value="menor"
                                   id="menor" checked="checked"
                                   onchange="toggleGrafico()"/>
                            <label for="menor"> Menor que 5 anos</label><br/>
                            <input type="radio" name="idade" value="maior"
                                   id="maior" onclick="toggleGrafico()"/>
                            <label for="maior"> Maior que 5 anos</label>
                        </fieldset>
                    </form>
                </section>
                <%-- Avaliação do Gráfico --%>
                <section class="avaliacao">
                    <h1>Avaliação do Gráfico</h1>
                    <p class="report">
                    </p>
                </section>
                <%-- Gráficos --%>
                <section class="graficos">
                    <ul class="tabs">
                        <li id="tabPeso" class="current" onclick="showGrafico(this)">Gráfico do Peso</li>
                        <li id="tabEstatura" onclick="showGrafico(this)">Gráfico da Estatura</li>
                        <li id="tabIMC" onclick="showGrafico(this)">Gráfico do IMC</li>
                        <li id="tabPerimetroCefalico" onclick="showGrafico(this)">Gráfico do Per. Cefálico</li>
                    </ul>
                    <hr class="bar" />
                    <div class="pane" id="pane">
                        <div id="graficoPeso05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/peso05masc.png');" : "background-image: url('img/peso05fem.png');")%>">

                        </div>

                        <div id="graficoPeso519" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/peso519masc.png');" : "background-image: url('img/peso519fem.png');")%>">

                        </div>
                        <div id="graficoEstatura05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/estatura05masc.png');" : "background-image: url('img/estatura05fem.png');")%>">

                        </div>
                        <div id="graficoEstatura519" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/estatura519masc.png');" : "background-image: url('img/estatura519fem.png');")%>">

                        </div>
                        <div id="graficoImc05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/imc05masc.png');" : "background-image: url('img/imc05fem.png');")%>">

                        </div>
                        <div id="graficoImc519" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/imc519masc.png');" : "background-image: url('img/imc519fem.png');")%>">

                        </div>
                        <div id="graficoPc05" class="grafico" style="<%=(paciente.getSexo().equals("Masculino") ? "background-image: url('img/pc05masc.png');" : "background-image: url('img/pc05fem.png');")%>" >
                        </div>
                    </div>

                    <hr class="bar" />
                    <p class="minor">Fonte: OMS (2006)</p>
                </section>

            </div>
            <footer>

            </footer>
        </div>
        <script type="text/javascript" >
            grafico()
        </script>
    </body>
</html>
<%}%>
