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

/* Métodos de validação */


/* VALIDAÇÃO DE FORMULARIOS */
/* var metrics = [
['[data-validation*="required"]', 'presence', 'Preencha esse campo'],
['[data-validation*="number"]', function(x) {
    var re = /\d/;
    return re.test(x);
}, 'Preencha com um número'],
['[data-validation*="date"]', function(x) {
    var check = false;
    var re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
    if( re.test(x)) {
        var adata = x.split('/');
        var gg = parseInt(adata[0],10);
        var mm = parseInt(adata[1],10);
        var aaaa = parseInt(adata[2],10);
        var xdata = new Date(aaaa,mm-1,gg);
        if ( ( xdata.getFullYear() === aaaa ) && ( xdata.getMonth() === mm - 1 ) && ( xdata.getDate() === gg ) ){
            check = true;
        } else {
            check = false;
        }
    } else {
        check = false;
    }
    return check;
}, 'Preencha uma data válida']
];

var options = {
    'helpSpanDisplay' : 'help-block'
};

$('[data-validation="on"]').nod(metrics,options); */