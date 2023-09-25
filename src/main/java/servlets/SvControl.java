/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mundo.Perro;

/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvControl", urlPatterns = {"/SvControl"})
public class SvControl extends HttpServlet {

    ArrayList<Perro> listarPerros = new ArrayList<>();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener la lista de perros del archivo
        FileInputStream archivo = new FileInputStream(getServletContext().getRealPath("perrosGuardados.txt"));
        ObjectInputStream cargado = new ObjectInputStream(archivo);
        List<Perro> listarPerros = null;
        try {
            listarPerros = (List<Perro>) cargado.readObject();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        cargado.close();
        archivo.close();

        // Establecer la lista de perros como atributo de la solicitud
        request.setAttribute("listarPerros", listarPerros);

        // Redirigir a la página index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Agregando todos los atributos de un perro, estos artibutos vienen del formulario en index
        String nombre=request.getParameter("nombre");
        String raza=request.getParameter("raza-selector");
        String fotos=request.getParameter("fotos");
        String puntos=request.getParameter("puntos");
        String edad=request.getParameter("edad");
        
        //creando objetos con los datos ingresados o tradios del formulario 
        Perro nuevoPerro=new Perro(nombre,raza,fotos,Integer.parseInt(puntos),Integer.parseInt(edad));
        listarPerros.add(nuevoPerro);
        
        //serealizando
        FileOutputStream archivo = new FileOutputStream(getServletContext().getRealPath("perrosGuardados.txt"),true);
        ObjectOutputStream cargado = new ObjectOutputStream(archivo);
        cargado.writeObject(listarPerros);
        
        cargado.close();
        archivo.close();
        
        
    
        
        // Redirigir a la página index.jsp
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    

}
