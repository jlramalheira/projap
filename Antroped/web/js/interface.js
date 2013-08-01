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
    $("#medida-table").toggle(300);
    $("#medida-pagination").toggle(300);
    $("#medida-create").toggle(300);
    $("#medida-button").toggleClass("active");
}

/* Remostrar na interface objetos que possam interferir
 * no cadastramento de uma nova medida*/
function hideFormMedidaCreate(){
    $("#medida-table").toggle(300);
    $("#medida-pagination").toggle(300);
    $("#medida-create").toggle(300);
    $("#medida-button").toggleClass("active");
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
        sucess: function(json){
            html = "";
        }
    });
});
