/*
 * Métodos de validação padrões
 */

var validator = $('form[data-validation*="on"]').validate({
    errorClass: 'help-block',
    highlight: function(element) {
        $(element).parents('.control-group').addClass('error');
    },
    unhighlight: function(element) {
        $(element).parents('.control-group').removeClass('error');
    }
});

$('button[type="reset"]').click(function(){
    validator.resetForm();
});

$('[data-validation*="required"]').each(function(){
    $(this).rules( "add", {
        required: true
    });
});

$('[data-validation*="date"]').each(function(){
    $(this).datepicker({
        format: "dd/mm/yyyy",
        language: "pt-BR",
        todayHighlight: true
    });
    $(this).rules( "add", {
        dateITA: true
    });
});

$('[data-validation*="number"]').each(function(){
    $(this).rules( "add", {
        number: true
    });
});

$('[data-validation*="integer"]').each(function(){
    $(this).rules( "add", {
        integer : true
    });
});

$('[data-validation*="positive"]').each(function(){
    $(this).rules( "add", {
        min : 0
    });
});

$('[data-validation*="year"]').each(function(){
    $(this).rules( "add", {
        number : true,
        integer : true,
        min : 0
    });
});

$('[data-validation*="month"]').each(function(){
    $(this).rules( "add", {
        number : true,
        integer : true,
        min : 0,
        max : 12
    });
});