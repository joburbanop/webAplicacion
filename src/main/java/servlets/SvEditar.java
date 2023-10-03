/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mundo.ExposicionPerros;
import static mundo.ExposicionPerros.listarPerros;
import mundo.Perro;

/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
@MultipartConfig
public class SvEditar extends HttpServlet {
     
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
        
        /*--------------------------------------------------------------------
        *Serializacion
       *----------------------------------------------------------------------- */
        
        // Crear una carpeta
        // Crear una carpeta
            
        ServletContext servletContext = getServletContext();
        
        Part imagenPart = request.getPart("nuevaFoto");
        System.out.println("imagenPart" + imagenPart);

        // Nombre original del archivo
        String fileName = imagenPart.getSubmittedFileName();
        System.out.println("fileName: " + fileName);

        // Directorio donde se almacenara el archivo
        String uploadDirectory = getServletContext().getRealPath("static/imagenes");
        System.out.println("uploadDirectory: " + uploadDirectory);

        //Ruta completa del archivo
        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("filePath: " + filePath);

        //Guardar el archivo en el sistemaa de archivos
        try (InputStream input = imagenPart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        }
        
        // Agregando todos los atributos de un perro, estos atributos vienen del formulario en index
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza-selector");
        String fotos = fileName;
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");
        
        System.out.println("edad nueva: "+edad);
        
       // Busca el perro por su nombre
        Perro perro = ExposicionPerros.buscarPerroPorNombre(nombre);
        
        if (perro != null) {
            // Actualiza los datos del perro con los nuevos valores
            ExposicionPerros.EliminarPerro(nombre, servletContext);
            // Creando objeto con los datos ingresados o traídos del formulario
            Perro nuevoPerro = new Perro(nombre, raza, fotos, Integer.parseInt(puntos), Integer.parseInt(edad));
            listarPerros=ExposicionPerros.listarPerros;
            listarPerros.add(nuevoPerro);
            ExposicionPerros.guardarPerro(listarPerros, servletContext);
        }
        
       // Redirigir a la página index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
