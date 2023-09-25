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
        
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    
        ArrayList<Perro> listaPerros = (ArrayList<Perro>) getServletContext().getAttribute("listaPerros");
        if (listaPerros == null) {
            listaPerros = new ArrayList<>();
            getServletContext().setAttribute("listaPerros", listaPerros);
        }
        
        String nombre=request.getParameter("nombre");
        String raza=request.getParameter("raza-selector");
        String fotos=request.getParameter("fotos");
        String puntos=request.getParameter("puntos");
        String edad=request.getParameter("edad");
       
        
        //ingresar datos del objeto
        
        Perro miPerro = new Perro(Integer.parseInt(nombre), raza, fotos, puntos,edad);
       
       FileOutputStream datosPerro = new FileOutputStream(getServletContext().getRealPath("listaPerros.data"), true);
        ObjectOutputStream escribir = new ObjectOutputStream (datosPerro);
        escribir.writeObject(miPerro);
        datosPerro.close();
        escribir.close();
        //Deserializar 
        FileInputStream leer = new FileInputStream(getServletContext().getRealPath("listaPerro.data"));
        //leer
        ObjectInputStream cargado = new ObjectInputStream(leer);
        
        try{
           datosPerro miPerro = (perro) cargado.readObject();
            miPerro.add(miPerro);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        cargado.close();
         request.setAttribute("miPerro",miPerro);
        
        
        // Redirigir a la página index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private static class Perro {

        public Perro(int parseInt, String raza, String fotos, String puntos, String edad) {
        }

        private void add(Perro miPerro) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }

}
