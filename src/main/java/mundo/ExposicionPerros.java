/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mundo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jonathan
 */

public class ExposicionPerros {
    
    private Perro perroNuevo;
    private static List<Perro> perros=new ArrayList<>();
    
    
    public ExposicionPerros() {
    }

    public static List<Perro> darPerros() {
        return perros;
    }
    
        
    public void ordenarPorRaza(){
            
    }
    
    public  void ordenaaPorNombre(){
    }
    
    public void ordenarPorPuntos(){
    }
       
    public void ordenarPorEdad(){
    }
    
    public int buscarPerro(String nombre){
        
        return 1;
    }
    
    public int buscarBinarioPorNombre(String nombre){
        
        return 1;
    }
    
    
        public boolean agregarPerros(String nombre, String raza, String imagenes, int puntos, int edad ){
        
        if (nombre!=null){
            
            perroNuevo=new Perro(nombre,raza,imagenes,puntos,edad);
            perros.add(perroNuevo);
            return true;
      
        }
        else{
            return false;
        }
    }
    
    
    public void verificarInvariante(){
    }
    
    public boolean buscarPerrosConNombresRepetidos(){
        
        return true;
    }
    
    public int buscarPerroMayorPuntaje(){
        return 1;
    }
    
    public int buscarPerroMenorPuntaje(){
        return 1;
    }
        
    public int buscarPerroMayorEdado(){
        
        return 1;
        
    }
  
}
