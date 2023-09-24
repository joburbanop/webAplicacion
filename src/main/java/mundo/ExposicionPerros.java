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

    public static List<Perro> getPerros() {
        return perros;
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
    
    
}
