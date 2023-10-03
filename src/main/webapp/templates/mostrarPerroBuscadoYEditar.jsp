<%-- 
    Document   : mostrarPerroBuscadoYEliminar
    Created on : 2/10/2023, 3:28:42 p. m.
    Author     : jonathan
--%>

<%@page import="java.util.List"%>
<%@page import="mundo.Perro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>
            edicion
        </title>
        <style>
            
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
    <body class="container">
        <section>
            <header style="z-index: 1000;">
                <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp"><img src="./static/imagenes/headerImagen.jpg" alt="perros" width="300" height="50"> Inicio</a>

                </div>
                
            </nav>
            </header>
        </section>
        
        <section class="container mt-5 ">
            
            
                            <%
                                 boolean editar=(boolean) request.getAttribute("editar");
                                // Obtener los datos de la solicitud
                                
                                Perro perroEditar = (Perro) request.getAttribute("misPerros");
                                // Obtiene el valor del atributo `editar`
                                //System.out.println("desde mostrar y editar_ "+request.getAttribute("editar"));
                                
                                //System.out.println("./static/imagenes/"+perroEditar.getImagenes());
                               
                                
                                
                                if (perroEditar == null) {
                                    // Mostrar un mensaje de error al usuario
                                    request.setAttribute("error", "La lista de perros está vacía.");

                                }
                            %>
                    <% if (editar==false) {%>
                        <div class="d-flex justify-content-center align-items-center py-5">
                            <div class="card w-50 mb-3 ">
                                <img src="./static/imagenes/<%=perroEditar.getImagenes() %>" class="card-img-top" alt="img_perro_editar">
                                <div class="card-body">
                                    <h5 class="card-title">Nombre: <%=perroEditar.getNombre()  %></h5>
                                    <p class="card-text">Raza: <%=perroEditar.getRaza() %></p>
                                    <p class="card-text">Puntos: <%=perroEditar.getPuntos() %></p>
                                    <p class="card-text">Edad: <%=perroEditar.getEdad() %></p>
                                </div>
                            </div>
                        </div>


                    <%}%>      
                    
                    <% if (editar==true){%>
                      
                    <div class="row d-flex justify-content-center">
                        
                        <div class="col-md-5 mt-5 d-flex justify-content-center">
                            
                            <form action="SvEditar" method="POST" enctype="multipart/form-data" class="modern-form">
                                <div class="input-group mb-3" class="input-group-text">
                                    
                                    <input class="form-control form-title"  type="text" id="nombre" name="nombre" value="<%= perroEditar.getNombre() %>" readonly>
                                </div>

                                            <div class="input-group mb-3">
                                                <label for="raza-selector" class="input-group-text">Raza</label>
                                                <select class="form-select" id="raza-selector" name="raza-selector">
                                                    <option value="BASSET HOUND" <%= (perroEditar.getRaza().equals("BASSET HOUND")) ? "selected" : "" %>>BASSET HOUND</option>
                                                    <option value="BEAGLE" <%= (perroEditar.getRaza().equals("BEAGLE")) ? "selected" : "" %>>BEAGLE</option>
                                                    <option value="BERNES DE LA MONTAÑA" <%= (perroEditar.getRaza().equals("BERNES DE LA MONTAÑA")) ? "selected" : "" %>>BERNES DE LA MONTAÑA</option>
                                                    <option value="BORDER COLLIE" <%= (perroEditar.getRaza().equals("BORDER COLLIE")) ? "selected" : "" %>>BORDER COLLIE</option>
                                                    <option value="BOXER" <%= (perroEditar.getRaza().equals("BOXER")) ? "selected" : "" %>>BOXER</option>
                                                    <option value="BULLDOG" <%= (perroEditar.getRaza().equals("BULLDOG")) ? "selected" : "" %>>BULLDOG</option>
                                                    <option value="CANICHE" <%= (perroEditar.getRaza().equals("CANICHE")) ? "selected" : "" %>>CANICHE</option>
                                                    <option value="CHOW CHOW" <%= (perroEditar.getRaza().equals("CHOW CHOW")) ? "selected" : "" %>>CHOW CHOW</option>
                                                    <option value="COCKER" <%= (perroEditar.getRaza().equals("COCKER")) ? "selected" : "" %>>COCKER</option>
                                                    <option value="COLLIE" <%= (perroEditar.getRaza().equals("COLLIE")) ? "selected" : "" %>>COLLIE</option>
                                                    <option value="DALMATA" <%= (perroEditar.getRaza().equals("DALMATA")) ? "selected" : "" %>>DALMATA</option>
                                                    <option value="DOBERMAN" <%= (perroEditar.getRaza().equals("DOBERMAN")) ? "selected" : "" %>>DOBERMAN</option>
                                                    <option value="GOLDEN RETRIEVER" <%= (perroEditar.getRaza().equals("GOLDEN RETRIEVER")) ? "selected" : "" %>>GOLDEN RETRIEVER</option>
                                                    <option value="GRAN DANÉS" <%= (perroEditar.getRaza().equals("GRAN DANÉS")) ? "selected" : "" %>>GRAN DANÉS</option>
                                                    <option value="HUSKY" <%= (perroEditar.getRaza().equals("HUSKY")) ? "selected" : "" %>>HUSKY</option>
                                                    <option value="LABRADOR" <%= (perroEditar.getRaza().equals("LABRADOR")) ? "selected" : "" %>>LABRADOR</option>
                                                    <option value="PASTOR ALEMÁN" <%= (perroEditar.getRaza().equals("PASTOR ALEMÁN")) ? "selected" : "" %>>PASTOR ALEMÁN</option>
                                                    <option value="PERRO SALCHICHA" <%= (perroEditar.getRaza().equals("PERRO SALCHICHA")) ? "selected" : "" %>>PERRO SALCHICHA</option>
                                                    <option value="PITBULL" <%= (perroEditar.getRaza().equals("PITBULL")) ? "selected" : "" %>>PITBULL</option>
                                                    <option value="SAN BERNARDO" <%= (perroEditar.getRaza().equals("SAN BERNARDO")) ? "selected" : "" %>>SAN BERNARDO</option>
                                                </select>
                                            </div>


                                            <div class="input-group mb-3 row">
                                                
                                                <div class="input-group mb-3">
                                                        <label for="nuevaFoto" class="input-group-text">Nueva Foto</label>
                                                        <input class="form-control" type="file" id="nuevaFoto" name="nuevaFoto" required>
                                                </div>

                                            </div>
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="puntos">puntos</label>
                                                <select class="form-select" id="puntos" name="puntos" >
                                                  <option value="0" <% if (perroEditar.getPuntos() == 0) { %> selected <% } %>>0</option>
                                                  <option value="1" <% if (perroEditar.getPuntos() == 1) { %> selected <% } %>>1</option>
                                                  <option value="2" <% if (perroEditar.getPuntos() == 2) { %> selected <% } %>>2</option>
                                                  <option value="3" <% if (perroEditar.getPuntos() == 3) { %> selected <% } %>>3</option>
                                                  <option value="4" <% if (perroEditar.getPuntos() == 4) { %> selected <% } %>>4</option>
                                                  <option value="5" <% if (perroEditar.getPuntos() == 5) { %> selected <% } %>>5</option>
                                                  <option value="6" <% if (perroEditar.getPuntos() == 6) { %> selected <% } %>>6</option>
                                                  <option value="7" <% if (perroEditar.getPuntos() == 7) { %> selected <% } %>>7</option>
                                                  <option value="8" <% if (perroEditar.getPuntos() == 8) { %> selected <% } %>>8</option>
                                                  <option value="9" <% if (perroEditar.getPuntos() == 9) { %> selected <% } %>>9</option>
                                                  
                                                </select>
                                             </div>
                                            <div class="input-group mb-3">
                                              <label for="edad" class="input-group-text">Edad</label>
                                              <input class="form-control" type="text" id="edad" name="edad" value="<%= perroEditar.getEdad() %>" required>
                                            </div>
                                            
                                            <input class='btn btn-success' type="submit" value="Editar perro">
                                       
                            </form>
                        </div>
                        
                        <div class="col-md-7 mt-5 d-flex justify-content-center">
                            
                            <div class="card mb-3" style="width: 18rem;">
                                <img src="./static/imagenes/<%=perroEditar.getImagenes() %>" class="card-img-top" alt="img_perro_editar">
                                <div class="card-body">
                                  <h5 class="card-title" >Nombre : <%=perroEditar.getNombre()  %></h5>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                        
                        

                    <%}%>
        </section>
        
        
        <section>
                <%@include file="footer.jsp"%>
        </section>
    </body>
</html>
