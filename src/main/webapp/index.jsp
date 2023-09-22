<%-- 
    Document   : index
    Created on : 22/09/2023, 9:03:06 a. m.
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Perros</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <section>
                <%@include file="templates/header.jsp"%>
         </section>
        <div class="container">
            
            
            <section class="mt-5 mb-5 " id="formulario">
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                              
                              <div class="col-md-12">
                                <div class="card-body">
                                  <h5 class="card-title">Insertar nuevo perro</h5>
                                  
                                  <div class="card-text">
                                      <div class="mb-3">
                                        <label for="formFile" class="form-label">Nombre</label>
                                        <input class="form-control" type="text" id="formFile">
                                      </div>
                                      <div class="mb-3">
                                          <label for="formFileMultiple" class="form-label">Raza</label> <br>
                                            <select name="raza-selector" id="image-selector" class="form-select-sm form-selec" >
                                                <option value="logo.svg" >selecciona una raza</option>
                                                <option value="meme_1.jpg" >raza 1</option>
                                                <option value="meme_2.jpg" >raza 2</option>
                                                <option value="meme3.jpg" >raza 3</option>
                                            </select>
                                      </div>
                                      <div class="mb-3">
                                        <label for="formFileDisabled" class="form-label">Foto</label>
                                        <input class="form-control" type="file" id="formFileDisabled" disabled>
                                      </div>
                                      <div class="mb-3">
                                        <label for="formFileSm" class="form-label">Puntos</label>
                                        <input class="form-control form-control-sm" id="formFileSm" type="text">
                                      </div>
                                      <div class="mb-3">
                                          <label for="formFileLg" class="form-label">Edad</label> <br>
                                        <select name="edad-selector" id="image-selector" class="form-select-sm form-selec" >
                                            <option value="logo.svg" >selecciona la edad</option>
                                            <option value="meme_1.jpg" >edad 1</option>
                                            <option value="meme_2.jpg" >edad 2</option>
                                            <option value="meme3.jpg" >edad 3</option>
                                        </select>
                                      </div>
                                      
                                  </div>
                                  
                                  
                                  
                                </div>
                              </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-8">

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
