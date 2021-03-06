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
    <a class="logo" href="Paciente?operacao=listar">
        <img src="img/logoAntroped.png" alt="Logo Antroped"/>
    </a>
    <section class="user">
        <div class="photo"></div>
        <p class="welcome">Olá,<br/>
            <span class="name"><%=usuario.getNome()%></span>
        </p>
        <p class="logout">
            <a href="Usuario?operacao=editar&idUsuario=<%=usuario.getId()%>" title="Editar">Editar</a>
            -
            <a href="Usuario?operacao=sair" title="Sair">Sair</a>

        </p>
    </section>
</header>
<nav class="navbar">
    <div class="navbar-inner">
        <ul class="nav">
            <li>
                <a href="Paciente?operacao=pesquisar">Pesquisar paciente</a>
            </li>
            <li>
                <a href="Paciente?operacao=cadastrar">Cadastrar paciente</a>
            </li>
        </ul>
    </div>
</nav>
