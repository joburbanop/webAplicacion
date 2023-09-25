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
    FileInputStream cargar = new FileInputStream(getServletContext().getRealPath("perrosGuardados.txt"));
    ObjectInputStream caragado = new ObjectInputStream(cargar);
    try {
        ArrayList<Perro> listaPerros = (ArrayList<Perro>) caragado.readObject();
        System.out.println("Tamaño de la lista de perros cargada desde el archivo: " + listaPerros.size());
        listarPerros.clear(); // Limpia la lista actual
        listarPerros.addAll(listaPerros); // Agrega los elementos cargados a la lista actual
        caragado.close();
    } catch (IOException | ClassNotFoundException ex) {
        Logger.getLogger(SvControl.class.getName()).log(Level.SEVERE, null, ex);
    }
    request.setAttribute("listarPerros", listarPerros);
    request.getRequestDispatcher("index.jsp").forward(request, response);
}



    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Agregando todos los atributos de un perro, estos atributos vienen del formulario en index
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza-selector");
        String fotos = request.getParameter("fotos");
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");

        // Creando objeto con los datos ingresados o traídos del formulario
        Perro nuevoPerro = new Perro(nombre, raza, fotos, Integer.parseInt(puntos), Integer.parseInt(edad));

        // Agregar el nuevo perro a la lista
        listarPerros.add(nuevoPerro);

        // Serializar la lista completa y escribirla en el archivo
        FileOutputStream archivo = new FileOutputStream(getServletContext().getRealPath("perrosGuardados.txt"));
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
