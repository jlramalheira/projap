<%--
    Document   : pacienteAcompanhar
    Created on : 21/02/2013, 10:55:23
    Author     : Max e Joao Luiz
    Description: Esse documento JSP é utilizado para mostrar as informações do
                 paciente e acompanhamento do médico.
--%>
<%@page import="Dao.DaoPaciente"%>
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
    Paciente paciente = (Paciente) request.getAttribute("paciente");
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if ((paciente == null) || (usuario == null) || (paciente.getUsuario().getId() != usuario.getId())) {
        response.sendError(404);
    } else {
        List<Medida> dados = new Dao<Medida>(Medida.class).listById(paciente.getId());
        List<Medida> paginados = new Dao<Medida>(Medida.class).listByIdPag(paciente.getId(), session.getAttribute("pag") != null ? (Integer) session.getAttribute("pag") : 1, Util.Util.ELEMENTOS_TABELA_GRAFICOS);
        if (session.getAttribute("pagina") == null) {
            session.setAttribute("pagina", 1);
        }
%>
<html>
    <head>
        <%@include file="interfaceHead.jsp" %>
        <script src="js/kinetic-v3.10.0.min.js" type="text/javascript"></script>
        <script src="js/graficos.js" type="text/javascript"></script>
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
                    $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825))
                            ? dados.get(0).getTextoAtual("peso05", paciente.getSexo())
                            : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                                    }else if(tab=='peso519'){
                                        $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() >= 1825) && (dados.get(0).getIdade() < 3650))
                                                ? dados.get(0).getTextoAtual("peso519", paciente.getSexo())
                                                : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                                                        }else if(tab=='estatura05'){
                                                            $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("estatura05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                                                        }else if(tab=='estatura519'){
                                                            $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() >= 1825) && (dados.get(0).getIdade() < 6935)) ? dados.get(0).getTextoAtual("estatura519", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                                                        }else if(tab=='imc05'){
                                                            $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("imc05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                                                        }else if(tab=='imc519'){
                                                            $('.report').html('<%=((dados.size() > 0) && (dados.get(0).getIdade() >= 1825) && (dados.get(0).getIdade() < 6935)) ? dados.get(0).getTextoAtual("imc519", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>');
                                                        }else if(tab=='pc05'){
                                                            $('.report').html('Não há nenhuma avaliação disponível para este tipo de gráfico.');
                                                        }
                                                    }
        </script>
    </head>

    <body>
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
                            Acompanhar Paciente
                        </li>
                    </ul>
                </nav>

                <%-- Paciente Data --%>
                <section class="row">
                    <div class="span9">
                        <h1><%=paciente.getNome()%></h1>
                        <div class="row">
                            <div class="span3">
                                <%=paciente.getSexo()%><br/>
                                nascido em <%=Util.Util.dateToString(paciente.getDataNascimento())%><br/>
                                <%=paciente.idadeToExtenso()%>
                                <br/><br/>
                                <span class="label">Estatura Alvo:</span><br/>
                                <%=paciente.CalculaEstaturaAlvo()%> cm <span class="minor">(+- 10 cm)</span>
                            </div>
                            <div class="span3">
                                <span class="label">Mãe:</span><br/>
                                <%=paciente.getNomeMae()%><br/>
                                <%=paciente.getEstaturaMae()%> cm
                            </div>
                            <div class="span3">
                                <span class="label">Pai:</span><br/>
                                <%=paciente.getNomePai()%><br/>
                                <%=paciente.getEstaturaPai()%> cm
                            </div>
                        </div>
                    </div>
                    <div class="span3">
                        <a href="Paciente?operacao=editar&idPaciente=<%=paciente.getId()%>" class="btn btn-large btn-block btn-icon edit margin-top">
                            Editar dados
                        </a>
                        <button class="btn btn-large btn-block btn-icon nova-medida margin-top"
                                onclick="showFormMedidaCreate()()"
                                id="medida-button">
                            Nova medida
                        </button>
                    </div>
                </section>

                <hr/>

                <section id="medida-view"
                         class="form margin-bottom">
                    <h3>Detalhes da medida de 88/88/2013</h3>
                    <div class="row">
                        <div class="span8">
                            <span class="label">Idade:</span> 69 anos e 62 meses
                            <div class="row">
                                <div class="span4">
                                    <span class="label">Peso:</span> 999<br/>
                                    <span class="label">IMC:</span> 88/88/2013<br/>
                                    <span class="label">Idade óssea:</span> 88/88/2013
                                </div>
                                <div class="span4">
                                    <span class="label">Estatura:</span> 982<br/>
                                    <span class="label">Perímetro Cefálico:</span> 88/88/2013<br/>
                                    <span class="label">Previsão de estatura:</span> 88/88/2013
                                </div>
                            </div>
                            <h3>Avaliação</h3>
                            <h4>Peso</h4>
                            <p></p>
                            <h4>Estatura</h4>
                            <p></p>
                            <h4>IMC</h4>
                            <p></p>
                        </div>
                        <div class="span3 pull-right">
                            <a href="Medidas?operacao=editar&idMedida="
                               class="btn btn-large btn-block btn-icon edit">
                                Editar medida
                            </a>
                            <a href="Medidas?operacao=editar&idMedida="
                               class="btn btn-large btn-block btn-icon cancel">
                                Excluir medida
                            </a>
                            <a href="Medidas?operacao=editar&idMedida="
                               class="btn btn-large btn-block btn-icon confirm">
                                Confirmar
                            </a>
                        </div>
                    </div>
                </section>

                <%-- Medidas table --%>
                <table id="medida-table"
                       class="table table-bordered table-striped table-hover"
                       data-provides="ajax">
                    <thead>
                        <tr>
                            <th>
                                Data
                            </th>
                            <th>
                                Idade
                            </th>
                            <th>
                                Peso<br/>
                                <span class="minor">(kg)</span>
                            </th>
                            <th>
                                Estatura<br/>
                                <span class="minor">(cm)</span>
                            </th>
                            <th>
                                IMC<br/><span class="minor">(kg/m²)</span>
                            </th>
                            <th>
                                Per. Cefálico<br/><span class="minor">(cm)</span>
                            </th>
                            <th>
                                Idade Óssea<br/><span class="minor"></span>
                            </th>
                            <th>
                                Prev. de Estatura<br/><span class="minor">(cm)</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Medida medida : paginados) {%>
                        <tr>
                            <td class="data">
                                <%=medida.getDataStr()%>
                            </td>
                            <td class="idade"><%=medida.idadeToExtenso()%></td>
                            <td class="peso"><%=medida.getPeso()%></td>
                            <td class="estatura"><%=medida.getAltura()%><span class="minor"> <%=medida.getPosicaoAbreviado()%></span></td>
                            <td class="imc"><%=medida.getIMC()%></td>
                            <td class="perimetroCefalico"><%=medida.getPerimetroCefalico()%></td>
                            <td class="idadeOssea"><%=medida.getIdadeOsseaExtenso()%></td>
                            <td class="previsaoEstatura"><%=medida.getPrevisaoEstatura(paciente.getSexo())%></td>
                            <%--<td class="opcoes">
                                <a href="#" title="Detalhes da medida">
                                    <img src="css/images/medidaDetails.svg" alt="Ícone Detalhes da medida" class="icon"/>
                                </a>

                            </td>--%>
                        </tr>
                        <%}%>
                    </tbody>
                </table>

                <div id="medida-pagination" class="pagination text-center">
                    <ul>
                        <li><a href="#">Medidas Anteriores</a></li>
                        <li><a href="#">Medidas Posteriores</a></li>
                    </ul>
                </div>

                <%-- Form Nova Medida --%>
                <form action="Medidas" method="POST"
                      class="form hide" id="medida-create"
                      data-validation="on">
                    <fieldset>
                        <legend>Nova Medida</legend>
                        <div class="row">
                            <div class="span4">
                                <div class="control-group">
                                    <input type="hidden" name="idPaciente" value="<%=paciente.getId()%>"/>
                                    <label class="control-label" for="medidaData">
                                        Data
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="data" value=""
                                               id="medidaData" class="input-large"
                                               placeholder="dd/mm/aaaa"
                                               data-validation="required date"
                                               />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="medidaPeso">
                                        Peso
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="peso" value=""
                                               id="medidaPeso" class="input-medium"
                                               placeholder="Em kilogramas"
                                               data-validation="required number positive"
                                               />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="medidaEstatura">
                                        Estatura
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="estatura" value=""
                                               id="medidaEstatura" class="input-medium"
                                               placeholder="Em centímetros"
                                               data-validation="required number positive"/>
                                    </div>
                                </div>




                            </div>

                            <div class="span3">
                                <div class="control-group">
                                    <label class="control-label">
                                        Idade Óssea atribuída
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="idadeOsseaAnos" value=""
                                               id="idadeOsseaAnos" class="input-small"
                                               placeholder="Anos"
                                               data-validation="required year"/>
                                    </div>
                                    <div class="controls">
                                        <input type="text" name="idadeOsseaMeses" value=""
                                               id="idadeOsseaMeses" class="input-small"
                                               placeholder="Meses"
                                               data-validation="required month"
                                               />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="medidaPerimetroCefalico">
                                        Perímetro Cefálico
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="perimetroCefalico" value=""
                                               id="medidaPerimetroCefalico"
                                               placeholder="Perímetro em centímetros"
                                               data-validation="required number positive"/>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">
                                        Posição
                                    </label>
                                    <div class="controls">
                                        <label class="radio inline">
                                            <input type="radio" name="posicao" value="decubito"
                                                   id="medidaPosicaoDecubito"
                                                   checked="checked"
                                                   />
                                            Decúbito
                                        </label>
                                        <label class="radio inline">
                                            <input type="radio" name="posicao" value="ortostatismo"
                                                   id="medidaPosicaoOrtosttismo"/>
                                            Ortostatismo
                                        </label>
                                    </div>
                                </div>

                            </div>

                            <div class="span3 pull-right">
                                <button type="submit" name="operacao" value="Cadastrar"
                                        class="btn btn-large btn-block btn-icon confirm ">
                                    Cadastrar
                                </button>
                                <button type="reset"
                                        class="btn btn-large btn-block btn-icon cancel margin-top"
                                        onclick="hideFormMedidaCreate()()">
                                    Cancelar
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </form>

                <hr/>

                <%-- Gráficos --%>
                <section class="graficos">

                    <ul class="nav nav-tabs no-margin-bottom" id="graficos-tabs">
                        <li class="active">
                            <a href="#grafico-peso" data-toggle="tab">Peso</a>
                        </li>
                        <li>
                            <a href="#grafico-estatura" data-toggle="tab">Estatura</a>
                        </li>
                        <li>
                            <a href="#grafico-imc" data-toggle="tab">
                                <abbr title="Índice de Massa Corporal">IMC</abbr>
                            </a>
                        </li>
                        <li id="tab-perimetro-cefalico">
                            <a href="#grafico-perimetro-cefalico" data-toggle="tab">Perímetro Cefálico</a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <h4 class="pull-left">Avaliação do Gráfico</h4>

                        <div class="span3 pull-right">
                            <div class="control">
                                <p>Mostrar gráfico de idade</p>
                                <button type="button" onclick="showGrafico05(this)"
                                        class="btn btn-block active toggle-grafico">
                                    Entre 0 e 5 anos
                                </button>
                                <button type="button" onclick="showGrafico519(this)"
                                        class="btn btn-block toggle-grafico">
                                    Maior que 5 anos
                                </button>

                            </div>
                        </div>

                        <div class="tab-pane active" id="grafico-peso">
                            <p class="avaliacao grafico-05">
                                <%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("peso05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>
                            </p>
                            <div id="graficoPeso05" class="grafico grafico-05"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/peso05masc.png');"
                                         : "background-image: url('img/peso05fem.png');")%>"></div>

                            <p class="avaliacao grafico-519 hide">
                                <%=((dados.size() > 0) && (dados.get(0).getIdade() >= 1825) && (dados.get(0).getIdade() < 3650)) ? dados.get(0).getTextoAtual("peso519", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>
                            </p>
                            <div id="graficoPeso519" class="grafico grafico-519 hide"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/peso519masc.png');"
                                         : "background-image: url('img/peso519fem.png');")%>"></div>
                        </div>

                        <div class="tab-pane" id="grafico-estatura">
                            <p class="avaliacao grafico-05">
                                <%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("estatura05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>

                            </p>
                            <div id="graficoEstatura05" class="grafico grafico-05"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/estatura05masc.png');"
                                         : "background-image: url('img/estatura05fem.png');")%>"></div>

                            <p class="avaliacao grafico-519 hide">
                                <%=((dados.size() > 0) && (dados.get(0).getIdade() >= 1825) && (dados.get(0).getIdade() < 6935)) ? dados.get(0).getTextoAtual("estatura519", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>
                            </p>
                            <div id="graficoEstatura519" class="grafico grafico-519 hide"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/estatura519masc.png');"
                                         : "background-image: url('img/estatura519fem.png');")%>"></div>
                        </div>

                        <div class="tab-pane" id="grafico-imc">
                            <p class="avaliacao grafico-05">
                                <%=((dados.size() > 0) && (dados.get(0).getIdade() < 1825)) ? dados.get(0).getTextoAtual("imc05", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>
                            </p>
                            <div id="graficoImc05" class="grafico grafico-05"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/imc05masc.png');"
                                         : "background-image: url('img/imc05fem.png');")%>"></div>

                            <p class="avaliacao grafico-519 hide">
                                <%=((dados.size() > 0) && (dados.get(0).getIdade() >= 1825) && (dados.get(0).getIdade() < 6935)) ? dados.get(0).getTextoAtual("imc519", paciente.getSexo()) : "Não há nenhuma avaliação disponível para este tipo de gráfico."%>
                            </p>
                            <div id="graficoImc519" class="grafico grafico-519 hide"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/imc519masc.png');"
                                         : "background-image: url('img/imc519fem.png');")%>"></div>
                        </div>

                        <div class="tab-pane" id="grafico-perimetro-cefalico">
                            <p class="avaliacao">
                                Não há nenhuma avaliação disponível para este tipo de gráfico.
                            </p>
                            <div id="graficoPc05" class="grafico grafico-05"
                                 style="<%=(paciente.getSexo().equals("Masculino")
                                         ? "background-image: url('img/pc05masc.png');"
                                         : "background-image: url('img/pc05fem.png');")%>" ></div>
                        </div>
                    </div>

                    <!--<ul class="tabs">
                        <li id="tabPeso" class="current" onclick="showGrafico(this)">Gráfico do Peso</li>
                        <li id="tabEstatura" onclick="showGrafico(this)">Gráfico da Estatura</li>
                        <li id="tabIMC" onclick="showGrafico(this)">Gráfico do IMC</li>
                        <li id="tabPerimetroCefalico" onclick="showGrafico(this)">Gráfico do Per. Cefálico</li>
                    </ul>
                    <hr class="bar" />
                    <div class="pane" id="pane">
                        <div id="graficoPeso05" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/peso05masc.png');"
                                     : "background-image: url('img/peso05fem.png');")%>"></div>

                        <div id="graficoPeso519" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/peso519masc.png');"
                                     : "background-image: url('img/peso519fem.png');")%>"></div>

                        <div id="graficoEstatura05" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/estatura05masc.png');"
                                     : "background-image: url('img/estatura05fem.png');")%>"></div>

                        <div id="graficoEstatura519" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/estatura519masc.png');"
                                     : "background-image: url('img/estatura519fem.png');")%>"></div>

                        <div id="graficoImc05" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/imc05masc.png');"
                                     : "background-image: url('img/imc05fem.png');")%>"></div>

                        <div id="graficoImc519" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/imc519masc.png');"
                                     : "background-image: url('img/imc519fem.png');")%>"></div>

                        <div id="graficoPc05" class="grafico"
                             style="<%=(paciente.getSexo().equals("Masculino")
                                     ? "background-image: url('img/pc05masc.png');"
                                     : "background-image: url('img/pc05fem.png');")%>" ></div>
                    </div> -->

                    <hr class="bar" />
                    <p class="minor">Fonte: OMS (2006)</p>
                </section>

            </div>
            <%-- FOOTER --%>
            <%@include file="interfaceFooter.jsp" %>
        </div>

        <script type="text/javascript">
            grafico();
        </script>
    </body>
</html>
<%}%>
