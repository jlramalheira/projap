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
        container: "containerPeso05",
        width: 960,
        height: 640
    });
    stageEstatura05 = new Kinetic.Stage({
        container: "containerEstatura05",
        width: 960,
        height: 640
    });
    stageImc05 = new Kinetic.Stage({
        container: "containerImc05",
        width: 960,
        height: 640
    });
    stagePc05 = new Kinetic.Stage({
        container: "containerPc05",
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
    }
    
    html = '<div id="hint-'+hintCount+'" class="hint">'+khint+'</div>';
    $('#'+grafico).append(html);
    
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