<%-- 
    Document   : index
    Created on : 22/09/2023, 9:03:06 a. m.
    Author     : jonathan
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mundo.Perro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Perros</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="static/css/stilo.css">
    </head>
    <body>
        <section>
                <%@include file="templates/header.jsp"%>
         </section>
        <div class="container">
            <a href="SvControl" class="btn btn-success">Ver lista perros </a>
            
            <section class="mt-5 mb-5 " id="formulario">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                              
                              <div class="col-md-12">
                                <div class="card-body">
                                  <h5 class="card-title">Insertar nuevo perro</h5>
                  
                                  
                                  <div class="card-text">
                                      <form action="SvControl" method="POST">
                                           <div class="input-group mb-3">
                                                <label for="nombre" class="input-group-text">Nombre</label>
                                                <input class="form-control" type="text" id="nombre" name="nombre">
                                            </div>
                                            <div class="input-group mb-3">
                                                <label for="raza-selector" class="input-group-text" >Raza</label><br>
                                                <select class="form-select" type="text" name="raza-selector">
                                                    <option value="BASSET HOUND">BASSET HOUND</option>
                                                    <option value="BEAGLE">BEAGLE</option>
                                                    <option value="BERNES DE LA MONTAÑA">BERNES DE LA MONTAÑA</option>
                                                    <option value="BORDER COLLIE">BORDER COLLIE</option>
                                                    <option value="BOXER">BOXER</option>
                                                    <option value="BULLDOG">BULLDOG</option>
                                                    <option value="CANICHE">CANICHE</option>
                                                    <option value="CANICHE">CHOW CHOW</option>
                                                    <option value="COCKER">COCKER</option>
                                                    <option value="COLLIE">COLLIE</option>
                                                    <option value="DALMATA">DALMATA</option>
                                                    <option value="DOBERMAN">DOBERMAN</option>
                                                    <option value="GOLDEN RETRIEVER">GOLDEN RETRIEVER</option>
                                                    <option value="GRAN DANÉS">GRAN DANÉS</option>
                                                    <option value="HUSKY">HUSKY</option>
                                                    <option value="LABRADOR">LABRADOR</option>
                                                    <option value="PASTOR ALEMÁN">PASTOR ALEMÁN</option>
                                                    <option value="PERRO SALCHICHA">PERRO SALCHICHA</option>
                                                    <option value="PITBULL">PITBULL</option>
                                                    <option value="SAN BERNARDO">SAN BERNARDO</option>
                                                </select> 
                                            </div>
                                            <div class="input-group mb-3">
                                              <label for="fotos" class="input-group-text">Foto</label>
                                              <input class="form-control" type="text" id="fotos" name="fotos">
                                            </div>
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="puntos">puntos</label>
                                                <select class="form-select" id="puntos" name="puntos">
                                                  <option selected>0</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                </select>
                                             </div>
                                            <div class="input-group mb-3">
                                              <label for="edad" class="input-group-text">Edad</label>
                                              <input class="form-control" type="text" id="edad" name="edad">
                                            </div>
                                            
                                            <input class='btn btn-success' type="submit" value="Insertar Perro">
                                        </form>
                                  </div>
                                  
                                  
                                  
                                </div>
                              </div>
                            </div>
                        </div>

                    </div>
                    

                    <div class="col-md-8">
                            <%
                                // Obtener los datos de la solicitud
                                List<Perro> listarPerros = (List<Perro>) request.getAttribute("listarPerros");

                                if (listarPerros == null) {
                                    // Mostrar un mensaje de error al usuario
                                    request.setAttribute("error", "La lista de perros está vacía.");

                                }
                            %>
                        
                        <table class="table table-dark" >
                             <thead>
                                <tr>
                                  <th scope="col">Nombre</th>
                                  <th scope="col">Raza</th>
                                  <th scope="col">Foto</th>
                                  <th scope="col">Puntos</th>
                                  <th scope="col">Edad</th>
                                  <th scope="col">Acciones</th>
                                </tr>
                              </thead>
                            </thead>
                            <tbody>
                              <% for (Perro perro : listarPerros) { %>
                                
                                <tr>
                                    <th scope="row"><%= perro.getNombre() %></th>
                                    <td><%= perro.getRaza() %></td>
                                    <td><%= perro.getImagenes() %></td>
                                    <td><%= perro.getPuntos() %></td>
                                    <td><%= perro.getEdad() %></td>
                                    <td>accion</td>
                                </tr>
                               
                              <% } %>
                            </tbody>
                        </table>

                    </div>

                </div>
                
            </section>

            <section>
                <%@include file="templates/footer.jsp"%>
            </section>
            
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>
