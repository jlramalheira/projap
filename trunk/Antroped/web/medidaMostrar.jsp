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
        Medida dado = new Dao<Medida>(Medida.class).get(idDado);
        %>      
        <p>Data: <%=dado.getDataStr()%></p>
        <p>Idade: <%=dado.idadeToExtenso() %></p>
        <p>Peso: <%=dado.getPeso() %> kg</p>
        <p>Altura: <%=dado.getEstaturaPosicao()%> cm</p>
        <p>Perímetro Cefalico: <%=dado.getPerimetroCefalico()%> cm</p>
        <p>IMC: <%=dado.getIMC()%></p>
        
        <h1>Avaliações:</h1>
        <h1>Peso/Idade: </h1>
        <p><%=dado.getTexto("peso05", dado.getPaciente().getSexo()) %></p><br/>
        <h1>Estatura/Idade: </h1>
        <p><%=(dado.getIdade() > 630) ? dado.getTexto("estatura05", dado.getPaciente().getSexo()) : "Não existe dado para ser avaliado"%></p><br/>
        <h1>IMC: </h1>
        <p><%=dado.getTexto("imc05", dado.getPaciente().getSexo()) %></p><br/>
    </body>
</html>
