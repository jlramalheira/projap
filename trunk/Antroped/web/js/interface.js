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
/*Script de pontos do grafico */
var hintCount = 0;
var stagePeso05;
var stageEstatura05;
var stageImc05;
var stagePc05;
var stagePeso519;
var stageEstatura519;
var stageImc519;

$(document).ready(function () {
    stagePeso05 = new Kinetic.Stage({
        container: "grafico",
        width: 960,
        height: 640
    });
    stageEstatura05 = new Kinetic.Stage({
        container: "grafico",
        width: 960,
        height: 640
    });
    stageImc05 = new Kinetic.Stage({
        container: "grafico",
        width: 960,
        height: 640
    });
    stagePc05 = new Kinetic.Stage({
        container: "grafico",
        width: 960,
        height: 640
    });
    stagePeso519 = new Kinetic.Stage({
        container: "containerPeso519",
        width: 960,
        height: 640
    });
    stageEstatura519 = new Kinetic.Stage({
        container: "containerEstatura519",
        width: 960,
        height: 640
    });
    stageImc519 = new Kinetic.Stage({
        container: "containerImc519",
        width: 960,
        height: 640
    });    
});

function drawCircle (kx, ky, kradius, kfill, kstroke, kstrokeWidth, khint, stage, grafico, sexo) {
    shape = new Kinetic.Layer();
    if (sexo == 'Masculino'){        
        circle = new Kinetic.Circle({
            x: convertDadoMascPixelsX(kx, grafico),
            y: convertDadoMascPixelsY(ky, grafico),
            radius: kradius,
            fill: kfill,
            stroke: kstroke,
            strokeWidth: kstrokeWidth,
            hint: 'hint-'+hintCount
        });
    } else {        
        circle = new Kinetic.Circle({
            x: convertDadoFemPixelsX(kx, grafico),
            y: convertDadoFemPixelsY(ky, grafico),
            radius: kradius,
            fill: kfill,
            stroke: kstroke,
            strokeWidth: kstrokeWidth,
            hint: 'hint-'+hintCount
        });
        alert(stage);
        alert(grafico);
        alert(sexo);
        alert(kx);
        alert(ky);
        alert(khint);
    }
    
    html = '<div id="hint-'+hintCount+'" class="hint">'+khint+'</div>';
    $('#grafico').append(html);
    
    /*$('#hint-'+hintCount).mouseleave(function () {
        $(this).fadeOut(100);
    });*/
    
    circle.on("mouseover", function() {
        hint = $('.hint#'+this.attrs['hint']);
        x = this.attrs['x']+(this.attrs['radius']*2);
        y = this.attrs['y']+(this.attrs['radius']*2);
        hint.css('left', x+'px');
        hint.css('top', y+'px');
        hint.fadeIn(100);
    });
    
    circle.on("mouseout", function() {
        hint = $('.hint#'+this.attrs['hint']);
        hint.fadeOut(100);
    });        
    
    shape.add(circle);
    stage.add(shape);
    
    hintCount ++;
    return circle;
}

function drawLineTroughCircle (pontos, stage) {
    points = [];
    notVetorNull = true;
    if (pontos[0]==null){
        notVetorNull = false;
    }
    if (notVetorNull==true){
        for (var i in pontos) {
            ponto = pontos[i];
            points.push(ponto.getX());
            points.push(ponto.getY());
        }
    
    
        shape = new Kinetic.Layer();    
    
        var line = new Kinetic.Line({
            points: points,
            stroke: "green",
            strokeWidth: 2
        });
        line.move(0, 0);

        shape.add(line);
        stage.add(shape);
    }
}

function convertDadoMascPixelsX(kx, grafico){
    if (grafico == 'graficoPeso05'){
        return (72+(797/1825)*kx);
    }
    if (grafico == 'graficoEstatura05'){
        return (72+(797/1825)*(kx));
    } 
    if (grafico == 'graficoImc05'){
        return (72+(797/1825)*(kx));
    } 
    if (grafico == 'graficoPc05'){        
        return (80+(777/1825)*(kx));
    } 
    if (grafico == 'graficoPeso519'){        
        return (80+(776/1825)*(kx-1825));
    }
    if (grafico == 'graficoEstatura519'){
        return (80+(776/5110)*(kx-1825));
    }
    if (grafico == 'graficoImc519'){
        return (80+(776/5110)*(kx-1825));
    }
    return (0);
}

function convertDadoMascPixelsY(ky, grafico){    
    if (grafico == 'graficoPeso05'){
        return (27+555-(555/24)*(ky-1));
    }
    if (grafico == 'graficoEstatura05'){
        return (27+555-(555/79)*(ky-43));
    } 
    if (grafico == 'graficoImc05'){
        return (27+555-(555/(11.8))*(ky-9.6));
    } 
    if (grafico == 'graficoPc05'){        
        return (27+551-(551/(22.5))*(ky-32));        
    } 
    if (grafico == 'graficoPeso519'){                
        return (27+551-(551/32.07)*(ky-12.93));
    }
    if (grafico == 'graficoEstatura519'){
        return (27+551-(551/95)*(ky-100));
    }
    if (grafico == 'graficoImc519'){
        return (27+551-(551/18)*(ky-12));
    }
    return (0);
}

function convertDadoFemPixelsX(kx, grafico){
    if (grafico == 'graficoPeso05'){
        return (72+(800/1835)*kx);
    }
    if (grafico == 'graficoEstatura05'){
        return (72+(800/1835)*kx);
    } 
    if (grafico == 'graficoImc05'){
        return (72+(800/1835)*kx);
    } 
    if (grafico == 'graficoPc05'){
        return (80+(777/1825)*kx);
    } 
    if (grafico == 'graficoPeso519'){        
        return (80+(776/1825)*(kx-1825));
    }
    if (grafico == 'graficoEstatura519'){
        return (80+(776/5110)*(kx-1825));
    }
    if (grafico == 'graficoImc519'){
        return (80+(776/5110)*(kx-1825));
    }
    return (0);
}

function convertDadoFemPixelsY(ky, grafico){
    if (grafico == 'graficoPeso05'){
        return (27+555-(555/24)*(ky-1));
    }
    if (grafico == 'graficoEstatura05'){
        return (27+555-(555/79)*(ky-43));
    } 
    if (grafico == 'graficoImc05'){
        return (27+555-(555/(11.8))*(ky-9.6));
    } 
    if (grafico == 'graficoPc05'){
        return (27+551-(551/(22.5))*(ky-31));
    } 
    if (grafico == 'graficoPeso519'){                
        return (27+551-(551/34)*(ky-13));
    }
    if (grafico == 'graficoEstatura519'){
        return (27+551-(551/85)*(ky-95));
    }
    if (grafico == 'graficoImc519'){
        return (27+551-(551/18)*(ky-12));
    }
    return (0);
}

function cancelaCadastro(){
    form = $("#formularioNovaMedida");
    cancelar = form.find("input[name=cancelar]").val();     
    if (cancelar==" Cancelar "){               
        $.ajax({
            type: "POST",
            url: "Armazenamento",
            data: "cancelar="+cancelar,
            success: function (result){      
               mostraTabela();             
            }
        });
        return false;
    }else{        
        return true;
    }
}