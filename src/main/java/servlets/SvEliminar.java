/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.ExposicionPerros;
import mundo.Perro;

/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvEliminar", urlPatterns = {"/SvEliminar"})
public class SvEliminar extends HttpServlet {

   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext servletContext = getServletContext();
        
        String nombre = request.getParameter("nombre");
        
        ExposicionPerros.EliminarPerro(nombre,servletContext); // Implementa la lógica para buscar el perro en tu lista de perros
         
        // Agregar la lista de perros al objeto de solicitud
        request.setAttribute("misPerros", ExposicionPerros.listarPerros);
        
        // Redirigir a la página index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
                 
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
