/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@WebServlet(name = "SvOrdenar", urlPatterns = {"/SvOrdenar"})
@MultipartConfig
public class SvOrdenar extends HttpServlet {
    
    private ArrayList<Perro> listarPerrosEcontrados = new ArrayList<>();
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean  editar=false;
        ServletContext servletContext = getServletContext();
        
        String nombre = request.getParameter("buscar");
        System.out.print("nombre a buscar: "+ nombre);
        Perro perro =ExposicionPerros.buscarPerroPorNombre(nombre); // Implementa la lógica para buscar el perro en tu lista de perros
        //System.out.print("perro encontrado: "+ perro.getNombre());
        if(perro!=null){
            // Redirigir a la página index.jsp
            
            // Agregar la lista de perros al objeto de solicitud
            request.setAttribute("editar", editar);
            request.setAttribute("misPerros", perro);
                 
            request.getRequestDispatcher("templates/mostrarPerroBuscadoYEditar.jsp").forward(request, response);
        }else{
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Error</title></head><body>");
            out.println("<script>alert('Perro no existe.'); history.back();</script>");
            out.println("</body></html>");



        }
        
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext servletContext = getServletContext();
        
        String nombre = request.getParameter("value");
        
        ExposicionPerros.ordenarPerrosPor(nombre, servletContext);// Implementa la lógica para buscar el perro en tu lista de perros
         
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
