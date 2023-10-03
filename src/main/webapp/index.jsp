<%-- 
    Document   : index
    Created on : 22/09/2023, 9:03:06 a. m.
    Author     : jonathan
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="mundo.ExposicionPerros"%>
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
        <style>
            /* Estilo para la tabla */
            .table {
                width: 100%;
                background-color: #fff;
                border-collapse: collapse;
                border-spacing: 0;
            }

            .table thead th {
                background-color: #343a40; /* Color de fondo del encabezado */
                color: #fff; /* Color del texto del encabezado */
                font-weight: bold;
                padding: 12px;
                text-align: left;
            }

            .table tbody tr:nth-child(even) {
                background-color: #f2f2f2; /* Color de fondo de las filas pares */
            }

            .table tbody tr:hover {
                background-color: #e5e5e5; /* Color de fondo al pasar el cursor sobre las filas */
            }

            .table tbody td {
                padding: 12px;
            }

            /* Estilo para los botones de acciones */
            .table .btn {
                padding: 5px 10px;
                margin: 2px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-danger {
                background-color: #dc3545; /* Color de fondo del botón de eliminar */
                color: #fff; /* Color del texto del botón de eliminar */
            }

            .btn-danger:hover {
                background-color: #c82333; /* Color de fondo al pasar el cursor sobre el botón de eliminar */
            }

            .btn-warning {
                background-color: #ffc107; /* Color de fondo del botón de editar */
                color: #212529; /* Color del texto del botón de editar */
            }

            .btn-warning:hover {
                background-color: #e0a800; /* Color de fondo al pasar el cursor sobre el botón de editar */
            }

            .btn-primary {
                background-color: #007bff; /* Color de fondo del botón de ver */
                color: #fff; /* Color del texto del botón de ver */
            }

            .btn-primary:hover {
                background-color: #0056b3; /* Color de fondo al pasar el cursor sobre el botón de ver */
            }
            
            /* Estilo inicial del box-shadow */
            .table-hover tr:hover {
                transition: box-shadow 0.3s ease-in-out;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Efecto de sombra inicial */
            }

            /* Cambia el box-shadow cuando se pasa el mouse */
            .table-hover tr:hover {
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.4); /* Efecto de sombra al pasar el mouse */
            }
            
             /* Estilo para la tarjeta */
            .card {
                border: none;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                transition: 0.3s;
                background-color: #ffffff;
            }

            .card:hover {
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            }

            .card-title {
                font-size: 24px;
                font-weight: bold;
            }

            .card-text {
                font-size: 18px;
            }

            /* Estilo para la imagen dentro de la tarjeta */
            .card-img-top {
                max-width: 100%;
                height: auto;
            }

            /* Estilo para el contenedor principal */
            .container {
                padding: 20px;
            }
            
            .modern-form {
                background-color: #f7f7f7;
                padding: 20px;
                border: 1px solid #e1e1e1;
                border-radius: 5px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            .form-title {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px;
            }
        </style>
    </head>
    <body>
        <section>
                <%@include file="templates/header.jsp"%>
         </section>
        <div class="container py-5">
            
            
            <section class="mt-5 mb-5  py-5" id="formulario">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                              
                              <div class="col-md-12">
                                <div class="card-body">
                                  <h5 class="card-title">Insertar nuevo perro</h5>
                  
                                  
                                  <div class="card-text">
                                      <form action="SvControl" method="POST" enctype="multipart/form-data">
                                           <div class="input-group mb-3">
                                                <label for="nombre" class="input-group-text is-invalid">Nombre</label>
                                                <input class="form-control" type="text" id="nombre" name="nombre" required>
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
                                              <input class="form-control" type="file" id="fotos" name="fotos" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="puntos">puntos</label>
                                                <select class="form-select" id="puntos" name="puntos" >
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
                                             
                                              <input class="form-control" type="text" id="edad" name="edad" required>
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
                                String relativePath = getServletContext().getRealPath("/data");
                                String archivoA="datosPerro.txt";

                                File data= new File(relativePath);
                                File archivo=new File(data+"/"+archivoA);
                                data.mkdir();
                                archivo.createNewFile();
                                
                                
                                // Obtener array list de la solicitud utilizando el método cargarPerros
                                ServletContext context = request.getServletContext();
                                ArrayList<Perro> listarPerros = ExposicionPerros.cargarPerros(context);

                                if (listarPerros == null) {
                                    // Mostrar un mensaje de error al usuario
                                    request.setAttribute("error", "La lista de perros está vacía.");

                                }
                            %>
                        
                        <table class="table table-bordered table-striped table-hover thead-dark" >
                             <thead class="thead-dark">
                                <tr>
                                  <th scope="col">Nombre</th>
                                  <th scope="col">Raza</th>
                                  <th scope="col">Foto</th>
                                  <th scope="col">Puntos</th>
                                  <th scope="col">Edad</th>
                                  <th scope="col">Acciones</th>
                                </tr>
                              </thead>
                            
                            <tbody>
                                <% if (listarPerros!=null){ %>
                                    <% for (Perro perro : listarPerros) { %>

                                    <tr>
                                        <th scope="row"><%= perro.getNombre() %></th>
                                        <td><%= perro.getRaza() %></td>
                                        <td><%= perro.getImagenes() %></td>
                                        <td><%= perro.getPuntos() %></td>
                                        <td><%= perro.getEdad() %></td>
                                        <td>
                                       
                                            <a href="#" class="btn btn-danger eliminar" data-elimniar="<%= perro.getNombre()%>" >
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
                                                             <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
                                                        </svg> 
                                            </a>
                              
                                           
                                                 <a href="SvEliminar?nombreAEditar=<%= perro.getNombre() %>" class="btn btn-warning" data-editar="<%= perro.getNombre()%>" id="editar">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brush" viewBox="0 0 16 16">
                                                         <path d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.067 6.067 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.118 8.118 0 0 1-3.078.132 3.659 3.659 0 0 1-.562-.135 1.382 1.382 0 0 1-.466-.247.714.714 0 0 1-.204-.288.622.622 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896.126.007.243.025.348.048.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04zM4.705 11.912a1.23 1.23 0 0 0-.419-.1c-.246-.013-.573.05-.879.479-.197.275-.355.532-.5.777l-.105.177c-.106.181-.213.362-.32.528a3.39 3.39 0 0 1-.76.861c.69.112 1.736.111 2.657-.12.559-.139.843-.569.993-1.06a3.122 3.122 0 0 0 .126-.75l-.793-.792zm1.44.026c.12-.04.277-.1.458-.183a5.068 5.068 0 0 0 1.535-1.1c1.9-1.996 4.412-5.57 6.052-8.631-2.59 1.927-5.566 4.66-7.302 6.792-.442.543-.795 1.243-1.042 1.826-.121.288-.214.54-.275.72v.001l.575.575zm-4.973 3.04.007-.005a.031.031 0 0 1-.007.004zm3.582-3.043.002.001h-.002z"/>
                                                    </svg>
                                                </a>   

                                            
                                            
                                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= perro.getNombre()%>">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>

                                  <% } %>
                              <%}%>
                              
                            </tbody>
                        </table>

                    </div>

                </div>
                
            </section>
                              
            <!-- ventana Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Detalles del Perro</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div id="perro-details">
                                <!-- Aqui se mostraran los detalles del perro -->
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            
            
           
            <section>
                <%@include file="templates/footer.jsp"%>
            </section>
            
        </div>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="static/script/ver.js"></script>
        <script src="static/script/eliminar.js"> </script>
        <script src="static/script/editar.js"> </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>
