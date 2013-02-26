<%-- 
    Document   : detalhesPaciente
    Created on : 14/02/2013, 12:06:58
    Author     : JoaoLuiz
--%>

<%@page import="Dao.Dao"%>
<%@page import="Model.Medida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalhes da medida</title>
        <link type="text/css" rel="stylesheet" href="CSS/styles.css"/>
    </head>
    <body>
        <%int idDado = Integer.parseInt(request.getParameter("id"));
        Medida medida = new Dao<Medida>(Medida.class).get(idDado);
        %>      
        <p>Data: <%=medida.getDataStr()%></p>
        <p>Idade: <%=medida.idadeToExtenso() %></p>
        <p>Peso: <%=medida.getPeso() %> kg</p>
        <p>Altura: <%=medida.getAltura()%><span class="minor"> <%=medida.getPosicaoAbreviado()%></span> cm</p>
        <p>Perímetro Cefalico: <%=medida.getPerimetroCefalico()%> cm</p>
        <p>IMC: <%=medida.getIMC()%></p>
        
        <h1>Avaliações:</h1>
        <h1>Peso/Idade: </h1>
        <p><%=medida.getTextoEspecifico("peso05", medida.getPaciente().getSexo()) %></p><br/>
        <h1>Estatura/Idade: </h1>
        <p><%=medida.getTextoEspecifico("estatura05", medida.getPaciente().getSexo())%></p><br/>
        <h1>IMC: </h1>
        <p><%=medida.getTextoEspecifico("imc05", medida.getPaciente().getSexo()) %></p><br/>
    </body>
</html>
