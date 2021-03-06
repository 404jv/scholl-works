/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.edu.ifpr.jrjlibrary.MVC.controllers;

import br.edu.ifpr.jrjlibrary.MVC.entities.Book;
import br.edu.ifpr.jrjlibrary.MVC.models.BookModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author jvolima
 */
@WebServlet(name = "EditBookController", urlPatterns = {"/EditBookController"})
public class EditBookController extends HttpServlet {
    int index;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int getIndex = Integer.parseInt(request.getParameter("index"));
        
        BookModel model = new BookModel();
        Book book = model.findByIndex(getIndex);
        
        this.index = getIndex;
        
        request.setAttribute("book", book);
        request.getRequestDispatcher("editarLivro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String newTitle = request.getParameter("title");
        String newAuthor = request.getParameter("author");
        String newGenre = request.getParameter("genre");
        String newPublishingCompany = request.getParameter("publishing_company");
        int newPages = Integer.parseInt(request.getParameter("pages"));
        int newYear = Integer.parseInt(request.getParameter("year"));
        boolean isBorrowed = Boolean.parseBoolean(request.getParameter("isBorrowed"));
        
        Book bookEdited = new Book(newTitle, newAuthor, newPublishingCompany, newGenre, newYear, newPages, isBorrowed);
        
        BookModel model = new BookModel();
        
        model.edit(index, bookEdited);
        response.sendRedirect("ListBooksController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
