/*
 * Name: interface.js
 * Date: 23/02/2013
 * Author: Max e João Luiz
 * Description: Arquivo de javascript utilizado para a manipulação da interface
 *              do projeto Antroped.
 */
/* MEDIDAS
 * ===========================================================================*/
/* Esconder na interface objetos que possam interferir
 * no cadastramento de uma nova medida*/
function medidaNewShow(){
    $(".tableControl button").hide(300);
    $("#medidaNewButton").hide(300);
    $("table.medidas").fadeOut(300, function(){
        $("#medidaNewForm").fadeIn(300);
    });
}
/* Remostrar na interface objetos que possam interferir
 * no cadastramento de uma nova medida*/
function medidaNewCancel(){
    $(".tableControl button").show(300);
    $("#medidaNewButton").show(300);
    $("#medidaNewForm").fadeOut(300, function(){
        $("table.medidas").fadeIn(300);
    });
}
/* GRÁFICOS
 * ===========================================================================*/
/* Tornar a aba como a atualmente selecionada */
function turnCurrent(tab){
    $(".graficos .tabs .current").removeClass("current");
    $(tab).addClass("current");
}
/* Seleciona e exibe o gráfico */
function selectGrafico(tab){
    id = $(tab).attr("id");
    idade = $(".graphControl input[name='idade']:checked").attr("id");
    sexo = $("#pacienteSexo").text();
    grafico = $("#grafico");
    image = "";
    if(sexo.toUpperCase() == ("masculino").toUpperCase()){
        //Caso Masculino
        if(idade == "maior"){
            //Caso maior que 5
            switch (id){
                case "tabPeso" :
                    image = "peso519masc.png"
                    mudaTexto('peso519');
                    break;
                case "tabEstatura" :
                    image = "estatura519masc.png";
                    mudaTexto('estatura519');
                    break;
                case "tabIMC" :
                    image = "imc519masc.png";
                    mudaTexto('imc519');
                    break;
                case "tabPerimetroCefalico" :
                    hideGraficoPerimetroCefalico(id);
                    break;
                default:
                    image = "";
            }
        } else {
            //Caso menor que 5
            switch (id){
                case "tabPeso" :
                    image = "peso05masc.png"
                    mudaTexto('peso05');
                    break;
                case "tabEstatura" :
                    image = "estatura05masc.png";
                    mudaTexto('estatura05');
                    break;
                case "tabIMC" :
                    image = "imc05masc.png";
                    mudaTexto('imc05');
                    break;
                case "tabPerimetroCefalico" :
                    image = "pc05masc.png";
                    mudaTexto('pc05');
                    break;
                default:
                    image = "";
            }
        }
    }else{
        //Caso Feminino
        if(idade == "maior"){
            //Caso maior que 19
            switch (id){
                case "tabPeso" :
                    image = "peso519fem.png"
                    break;
                case "tabEstatura" :
                    image = "estatura519fem.png";
                    break;
                case "tabIMC" :
                    image = "imc519fem.png";
                    break;
                case "tabPerimetroCefalico" :
                    hideGraficoPerimetroCefalico(id);
                    break;
                default:
                    image = "";
            }
        } else {
            //Caso menor que 5
            switch (id){
                case "tabPeso" :
                    image = "peso05fem.png"
                    break;
                case "tabEstatura" :
                    image = "estatura05fem.png";
                    break;
                case "tabIMC" :
                    image = "imc05fem.png";
                    break;
                case "tabPerimetroCefalico" :
                    image = "pc05fem.png";
                    break;
                default:
                    image = "";
            }
        }
    }
    grafico.css({
        "background-image":"url('img/"+image+"')"
    });
}
/* Apaga a guia de perímetro cefálico para gráficos de idade maior que 5 */
function hideGraficoPerimetroCefalico(id){
    if(id.toUpperCase() == ("tabPerimetroCefalico").toUpperCase()){
        $("#tabPerimetroCefalico").hide(300);
        $("#tabPeso").click();
    }
}
/* Função geral para as duas acimas */
function showGrafico(tab){
    turnCurrent(tab);
    selectGrafico(tab);
}
/* Troca o gráfico quando trocar a idade no painel de controle */
function toggleGrafico(){
    tab = $(".graficos .tabs .current").first();
    idade = $(".graphControl input[name='idade']:checked").attr("id");
    if (idade.toUpperCase() == ("maior").toUpperCase()) {
        hideGraficoPerimetroCefalico("tabPerimetroCefalico");
    } else {
        $("#tabPerimetroCefalico").show(300);
    }
    selectGrafico(tab);
}






