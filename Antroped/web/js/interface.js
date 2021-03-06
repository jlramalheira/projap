/*
 * Name: interface.js
 * Date: 23/02/2013
 * Author: Max e João Luiz
 * Description:
 *      Arquivo de javascript utilizado para a manipulação da interface
 *      do projeto Antroped.
 */

/* Geral */
function toggleMoreOptions(button){
    $(".more-options").toggle(300);
    $(button).toggleClass("active");
}

/*ACOMPANHAMENTO DE PACIENTE*/

/* Esconder na interface objetos que possam interferir
 * no cadastramento de uma nova medida*/
function showFormMedidaCreate(){
    $("#medida-table").hide(300);
    $("#medida-pagination").hide(300);
    $("#medida-create").show(300);
    $("#medida-view").hide(300);
    $("#medida-button").addClass("active");
}

/* Remostrar na interface objetos que possam interferir
 * no cadastramento de uma nova medida*/
function hideFormMedidaCreate(){
    $("#medida-table").show(300);
    $("#medida-pagination").show(300);
    $("#medida-view").hide(300);
    $("#medida-create").hide(300);
    $("#medida-button").removeClass("active");
}

/* Traz do servidor informações sobre a medida selecionada, preenche o formulário
 * e fornece o formulário de edição da medida.*/
function showFormMedidaUpdate(){
    //@TODO Trazer informações do servidor
    $("#medida-table").hide(300);
    $("#medida-pagination").hide(300);
    $("#medida-create").show(300);
    $("#medida-view").hide(300);
    $("#medida-button").addClass("active");
    
}

function showGrafico05(button){
    if(!$(button).hasClass("active")){
        $(".grafico-05").toggle(300);
        $(".grafico-519").toggle(300);
        $(".toggle-grafico").toggleClass("active");
        $("#tab-perimetro-cefalico").show(300);
    }
}

function showGrafico519(button){
    if(!$(button).hasClass("active")){
        $(".grafico-05").toggle(300);
        $(".grafico-519").toggle(300);
        $(".toggle-grafico").toggleClass("active");
        $("#tab-perimetro-cefalico").hide(300);
    }

}

/* Show Medida */
$('table[data-provides*="ajax"] tr').click(function(){
    medidaId = $(this).attr("data-id");

    $.ajax({
        url: 'Medidas',
        type: 'GET',
        data: 'operacao=ver&idMedida=' + medidaId,
        dataType: 'json',
        success: function(json){
            var html = "<h3>Detalhes da medida de "+json.data+"</h3>";
            html += "<div class=\"row\">";
            html += "<div class=\"span8\">";
            html += "<span class=\"label\">Idade:</span> "+json.idade;
            html += "<div class=\"row\">";
            html += "<div class=\"span4\">";
            html += "<span class=\"label\">Peso:</span> "+json.peso+"<br/>";
            html += "<span class=\"label\">IMC:</span> "+json.imc+"<br/>";
            html += "<span class=\"label\">Idade óssea:</span> "+json.idadeOssea;
            html += "</div>";
            html += "<div class=\"span4\">";
            html += "<span class=\"label\">Estatura:</span> "+json.estatura+"<br/>";
            html += "<span class=\"label\">Perímetro Cefálico:</span> "+json.pc+"<br/>";
            html += "<span class=\"label\">Previsão de estatura:</span> "+json.previsaoEstatura;
            html += "</div>";
            html += "</div>";
            html += "<h3>Avaliação</h3>";
            html += "<h4>Peso</h4>";
            html += "<p>"+json.textoPesoIdade+"</p>";
            html += "<h4>Estatura</h4>";
            html += "<p>"+json.textoEstaturaIdade+"</p>";
            html += "<h4>IMC</h4>";
            html += "<p>"+json.textoImc+"</p>";
            html += "</div>";
            html += "<div class=\"span3 pull-right\">";
            html += "<a href=\"Medidas?operacao=editar&idMedida="+json.idMedida+ "\"";
            html += "class=\"btn btn-large btn-block btn-icon edit\">";
            html += "Editar medida";
            html += "</a>";
            html += "<a href=\"Medidas?operacao=excluir&idMedida="+json.idMedida+ "\"";
            html += "class=\"btn btn-large btn-block btn-icon cancel\">";
            html += "Excluir medida";
            html += "<a onclick=\"closeMedidaView()\" ";
            html += "class=\"btn btn-large btn-block btn-icon confirm\">";
            html += "Confirmar";
            html += "</a>";
            html += "</div>";
            html += "</div>";

            $("#medida-view").html(html);
            $("#medida-table").hide(300);
            $("#medida-pagination").hide(300);
            $("#medida-view").show(300);
        }
    });
});

function closeMedidaView(){
    $("#medida-view").hide(300);
    $("#medida-table").show(300);
    $("#medida-pagination").show(300);
}