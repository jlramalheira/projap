<%--
    Document   : pacienteAcompanhar2
    Created on : 21/02/2013, 10:55:23
    Author     : Max
    Description: Esse documento JSP é utilizado para mostrar as informações do
                 paciente e acompanhamento do médico.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="css/styles2.css" type="text/css" rel="stylesheet"/>
        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <script src="js/interface.js" type="text/javascript"></script>
        <title>Acompanhamento do Paciente</title>
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
                        <span class="name">Adenozina Trifosfata de Alquila Maria Esperança Joaquina</span>
                    </p>
                    <p class="logout"><a href="#">Sair</a></p>
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
                    <h1 class="name">Pedremildo Escavadeira Trunk</h1>
                    <section class="data">
                        <span id="pacienteSexo">Masculino</span><br/>
                        nascido em 16/02/2009<br/>
                        3 anos, 5 meses e 1 dia
                        <div class="margin"><span class="label">Estatura Alvo:</span><br/>
                            174 cm <span class="minor">(+- 10 cm)</span></div>
                    </section>
                    <section class="mother">
                        <span class="label">Mãe:</span><br/>
                        Geoduda Escavadeira Trunk<br/>
                        160 cm
                    </section>
                    <section class="father">
                        <span class="label margin">Pai:</span><br/>
                        Pedro Onix Trunk<br/>
                        175 cm
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
                        <tr class="even">
                            <td class="data">19/05/2010</td>
                            <td class="idade">10 anos 10 meses e 27 dias</td>
                            <td class="peso">45</td>
                            <td class="estatura">100</td>
                            <td class="imc">21</td>
                            <td class="perimetroCefalico">50</td>
                            <td class="idadeOssea">41</td>
                            <td class="previsaoEstatura">60</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="data">19/05/2010</td>
                            <td class="idade">10 anos 10 meses e 27 dias</td>
                            <td class="peso">45</td>
                            <td class="estatura">100</td>
                            <td class="imc">21</td>
                            <td class="perimetroCefalico">50</td>
                            <td class="idadeOssea">41</td>
                            <td class="previsaoEstatura">60</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="data">19/05/2010</td>
                            <td class="idade">10 anos 10 meses e 27 dias</td>
                            <td class="peso">45</td>
                            <td class="estatura">100</td>
                            <td class="imc">21</td>
                            <td class="perimetroCefalico">50</td>
                            <td class="idadeOssea">41</td>
                            <td class="previsaoEstatura">60</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="data">19/05/2010</td>
                            <td class="idade">10 anos 10 meses e 27 dias</td>
                            <td class="peso">45</td>
                            <td class="estatura">100</td>
                            <td class="imc">21</td>
                            <td class="perimetroCefalico">50</td>
                            <td class="idadeOssea">41</td>
                            <td class="previsaoEstatura">60</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="data">19/05/2010</td>
                            <td class="idade">10 anos 10 meses e 27 dias</td>
                            <td class="peso">45</td>
                            <td class="estatura">100</td>
                            <td class="imc">21</td>
                            <td class="perimetroCefalico">50</td>
                            <td class="idadeOssea">41</td>
                            <td class="previsaoEstatura">60</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="data">19/05/2010</td>
                            <td class="idade">10 anos 10 meses e 27 dias</td>
                            <td class="peso">45</td>
                            <td class="estatura">100</td>
                            <td class="imc">21</td>
                            <td class="perimetroCefalico">50</td>
                            <td class="idadeOssea">41</td>
                            <td class="previsaoEstatura">60</td>
                            <td class="opcoes">
                                <a href="#" title="Detalhes da medida"><img src="css/images/medidaDetails.svg" alt="Detalhes da medida icon"/></a>
                                <a href="#" title="Editar medida"><img src="css/images/medidaEdit.svg" alt="Editar medida icon"/></a>
                                <a href="#" title="Excluir medida"><img src="css/images/medidaDelete.svg" alt="Deletar medida icon"/></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%-- Form Nova Medida --%>
                <form class="form" id="medidaNewForm" action="" method="get">
                    <fieldset>
                        <legend>Nova Medida</legend>
                        <div class="col">
                            <label for="medidaData">Data:</label><br/>
                            <input type="text" name="data" value="" id="medidaData"
                                   placeholder="Data que foi realizada a medida"/><br/>

                            <label for="medidaPeso">Peso (kg):</label><br/>
                            <input type="text" name="peso" value="" id="medidaPeso"
                                   placeholder="O peso que foi medido"/><br/>

                            <label for="medidaEstatura">Perímetro Cefálico (cm):</label><br/>
                            <input type="text" name="perimetroCefalico" value="" id="medidaPerimetroCefalico"
                                   placeholder="O perímetro cefálico que foi medido"/><br/>
                        </div>
                        <div class="col">
                            <label for="medidaIdadeOssea">Idade Óssea:</label><br/>
                            <input type="text" name="idadeOssea" value="" id="medidaIdadeOssea"
                                   placeholder="A idade óssea atribuída" /><br/>

                            <label for="medidaEstatura">Estatura (cm):</label><br/>
                            <input type="text" name="estatura" value="" id="medidaEstatura"
                                   placeholder="A estatura que foi medida"/><br/>

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
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec justo enim, cursus at faucibus nec, condimentum feugiat felis. Pellentesque mi mi, vehicula a imperdiet id, varius rutrum justo. Quisque leo nunc, euismod fringilla imperdiet et, sagittis et nibh.
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
                    <div class="grafico" id="grafico">

                    </div>
                    <hr class="bar" />
                    <p class="minor">Fonte: OMS (2006)</p>
                </section>

            </div>
            <footer>

            </footer>
        </div>
    </body>
</html>
