/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mundo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletContext;

/**
 *
 * @author jonathan
 */

public class ExposicionPerros {
    
   // Creamos la lista darPerros y la definimos 
    // La definimos como "sttatic" para que este disponible en el todo el programa
    public static ArrayList<Perro> listarPerros = new ArrayList<>();
    public static ArrayList<Perro> listaOrdenada = new ArrayList<>();
    
// Método para guardar la lista de perros en un archivo perros.ser
    public static void guardarPerro(ArrayList<Perro> perros, ServletContext context) throws IOException {
        

        
        //Definimos una ruta para buscar nuestro archivo perro.ser
        String relativePath = "/data/datosPerro.txt";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
            // Crear un archivo para guardar la lista de perros serializada
            FileOutputStream cargar = new FileOutputStream(archivo);
            ObjectOutputStream caragado = new ObjectOutputStream(cargar);
            caragado.writeObject(perros);
            caragado.close();
            System.out.println("Datos de perros guardados exitosamente en: perros.ser"+ relativePath);
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }
        
        
    }

    // Método para cargar los perros desde el archivo deserializándolo
    public static ArrayList<Perro> cargarPerros(ServletContext context) throws IOException, ClassNotFoundException {
        
        //Reutilizamos la ruta previamente definida para perro.ser
        String ruta = "/data/datosPerro.txt";
        String rutraApstracta = context.getRealPath(ruta);
        
        File rutArchivo = new File(rutraApstracta);
        
        
        try {
            // Cargar la lista de perros desde el archivo
            FileInputStream archivo = new FileInputStream(rutArchivo);
            ObjectInputStream cargado = new ObjectInputStream(archivo);
            listarPerros = (ArrayList<Perro>) cargado.readObject();
            cargado.close();
            System.out.println("Datos de perros cargados exitosamente "+ cargado);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error al cargar los datos de perros: " + e.getMessage());
        }
        return listarPerros;
        
    }
    
     //Metodo para buscar un perro por nombre de lista
    public static Perro buscarPerroPorNombre(String nombre) {
        for (Perro perro : listarPerros) {
            if (perro.getNombre().equals(nombre)) {
                return perro; // Retorna  el perro si se encuentra
            }
        }
        return null; // Retorna null si no se encuentra el perro
    }
   
    public static void EliminarPerro(String nombre,ServletContext context) throws IOException  {
     
    

        // Buscamos el perro por su nombre
        Perro perro = buscarPerroPorNombre(nombre);
        //System.out.println("perro"+perro.getNombre());
        // Si el perro se encuentra, lo eliminamos de la lista
        if (!perro.getNombre().equals("null")) {
            listarPerros.remove(perro);
            System.out.println("perro: "+perro.getNombre()+listarPerros.size());
            eliminarContenidoArchivo(context);
            guardarPerro(listarPerros,context);

            
        }
        else{
            System.out.println("perro no se encuentra para eliminar ");
        }
    }

    public static void eliminarContenidoArchivo(ServletContext context) throws IOException {

        //Definimos una ruta para buscar nuestro archivo perro.ser
        String relativePath = "/data/datosPerro.txt";
        String absPath = context.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
            // Crear un archivo para guardar la lista de perros serializada
            FileOutputStream cargar = new FileOutputStream(archivo);
            ObjectOutputStream caragado = new ObjectOutputStream(cargar);
            caragado.writeObject("");
            caragado.close();
            
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }

    }
   
 
// Método para ordenar la lista de perros por edad, puntos y nombre
    public static void ordenarPerrosPor(String eleccion,ServletContext context) throws IOException {
       switch(eleccion){
            case "puntos":
               // Define un comparador para ordenar por puntos
                Comparator<Perro> comparador = Comparator.comparingInt(Perro::getPuntos);

                // Ordena la lista de perros usando el comparador
                Collections.sort(listarPerros, comparador);
                eliminarContenidoArchivo(context);
                guardarPerro(listarPerros, context);
                // Opcional: Puedes imprimir la lista ordenada si lo deseas
                for (Perro perro : listarPerros) {
                    System.out.println("Nombre: " + perro.getNombre() + ", Puntos: " + perro.getPuntos());
                }
            break;
            
            case "nombre":
                // Define un comparador para ordenar alfabéticamente por nombre
                Comparator<Perro> comparadorNombre = Comparator.comparing(Perro::getNombre);

                // Ordena la lista de perros usando el comparador
                Collections.sort(listarPerros, comparadorNombre);
                eliminarContenidoArchivo(context);
                guardarPerro(listarPerros, context);
                // Opcional: Puedes imprimir la lista ordenada si lo deseas
                for (Perro perro : listarPerros) {
                    System.out.println("Nombre: " + perro.getNombre());
                }
               
            break;
            
            case "raza":
                // Define un comparador para ordenar alfabéticamente por raza
                Comparator<Perro> comparadorraza = Comparator.comparing(Perro::getRaza);

                // Ordena la lista de perros usando el comparador
                Collections.sort(listarPerros, comparadorraza);
                eliminarContenidoArchivo(context);
                guardarPerro(listarPerros, context);
                
                // Opcional: Puedes imprimir la lista ordenada si lo deseas
                for (Perro perro : listarPerros) {
                    System.out.println("Raza: " + perro.getRaza());
                }
               
            break; 
            
            

                
                
       }
    }


    
}
