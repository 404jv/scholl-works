<%-- 
    Document   : devolverLivros
    Created on : 14 de mai de 2022, 09:21:42
    Author     : jvolima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JRJ | Devolver livros</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Itim&family=Lexend&family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./styles/global.css">
        <link rel="stylesheet" href="./styles/devolver.css">
        <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href=".favicon-16x16.png">
        <link rel="manifest" href="site.webmanifest">
    </head>
    <body>
        <header>
            <a href="ListBooksController" id="back"><img src="./images/arrowLeft.svg" alt="Seta apontando para a esquerda"/></a>
            <div id="fake-button"><span>Devolver Livros</span></div>
        </header>
        
        <div id="containerForm">
            <form method="post" action="GiveBackBookController">
                <div id="containerElipse">
                    <div></div>
                    <div id="elipse">
                        <img src="./images/alugarLivro.svg" alt="Icone de adicionar livro"/>
                    </div>
                </div>
                <section>
                    <div class="containerSelect">
                        <img src="./images/bookAluguel.svg" alt="Icone de livro"/>
                        <select name="bookIndex" id="selectBooks">
                            <option class="options" value="" disabled selected>Selecione um Livro</option>
                            <c:forEach var="book" varStatus="status" items="${books}">
                                <c:if test="${book.isBorrowed == true}">
                                    <option class="options" value="${status.index}">${book.title}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </section>
                
                <button type="submit" id="botaoDevolver">Devolver</button>
            </form>
        </div>
    </body>
</html>
