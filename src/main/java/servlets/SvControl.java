/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mundo.ExposicionPerros;
import mundo.Perro;

/**
 *
 * @author jonathan
 */
@WebServlet(name = "SvControl", urlPatterns = {"/SvControl"})
@MultipartConfig
public class SvControl extends HttpServlet {

    ArrayList<Perro> listarPerros = new ArrayList<>();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    
@Override
public void init() throws ServletException {
   
}

    


  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    

        String nombre = request.getParameter("nombre");
        Perro perro =ExposicionPerros.buscarPerroPorNombre(nombre); // Implementa la lógica para buscar el perro en tu lista de perros
        if (perro != null) {
            // Genera la respuesta HTML con los detalles del perro
            String perroHtml = "<h2>Nombre: " + perro.getNombre() + "</h2>"
                    + "<p>Raza: " + perro.getRaza() + "</p>"
                    + "<p>Puntos: " + perro.getPuntos() + "</p>"
                    + "<p>Edad (meses): " + perro.getEdad() + "</p>"
                    + "<img src='static/imagenes/" + perro.getImagenes() + "' alt='" + perro.getNombre() + "' width='100%'/>";
            response.setContentType("text/html");
            response.getWriter().write(perroHtml);
        } else {
            // Maneja el caso en el que no se encuentra el perro
            response.setContentType("text/plain");
            response.getWriter().write("Perro no encontrado");
        }
 
}



    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /*--------------------------------------------------------------------
        *Serializacion
       *----------------------------------------------------------------------- */
        
        // Crear una carpeta
        // Crear una carpeta
            
        
        
        Part imagenPart = request.getPart("fotos");
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

        
        
        // Verifica si algún campo está vacío
        if (nombre.isEmpty() || raza.isEmpty() || fileName.isEmpty() || puntos.isEmpty() || edad.isEmpty()) {
            // Genera una respuesta que muestra una alerta en el navegador del usuario
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Error</title></head><body>");
            out.println("<script>alert('Por favor, complete todos los campos.'); history.back();</script>");
            out.println("</body></html>");
        } else {
             try {
                 // Creando objeto con los datos ingresados o traídos del formulario
                 Perro nuevoPerro = new Perro(nombre, raza, fotos, Integer.parseInt(puntos), Integer.parseInt(edad));
                 
                 
                 
                 // Obtener la lista actual de perros
                 ServletContext servletContext = getServletContext();
                 listarPerros = ExposicionPerros.cargarPerros(servletContext);
                 
                 // Agregar el nuevo perro a la lista
                 listarPerros.add(nuevoPerro);
                 
                 // Guardar la lista actualizada de perros en el archivo.ser
                 ExposicionPerros.guardarPerro(listarPerros, servletContext);
                 
                 // Agregar la lista de perros al objeto de solicitud
                 request.setAttribute("misPerros", listarPerros);
                 
                 
                 
             } catch (ClassNotFoundException ex) {
                 Logger.getLogger(SvControl.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
        
       // Redirigir a la página index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    

}


