<%--
    Document   : interfaceHeader
    Created on : 04/03/2013, 20:17:33
    Author     : Max
    Description: Esse documento JSP é utilizado para as configurações
                 default que são utilizadas em todos as páginas. Dentro das
                 delimitações do HEADER.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <a class="logo" href="#">
        <img src="img/logoAntroped.png" alt="Logo Antroped"/>
    </a>
    <section class="user">
        <div class="photo"></div>
        <p class="welcome">Olá,<br/>
            <span class="name"><%=usuario.getNome()%></span>
        </p>
        <p class="logout"><a href="ServletUsuario?operacao=sair" title="Sair">Sair</a></p>
    </section>
</header> 
