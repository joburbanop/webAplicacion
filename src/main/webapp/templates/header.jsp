<body>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="./static/css/stilo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        header {
            z-index: 100;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 80px;
            backdrop-filter: blur(0px);
            transition: backdrop-filter 0.3s;
          }
    </style>
    
        
    <header>
      
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="./static/imagenes/headerImagen.jpg" alt="perros" width="300" height="50"> </a>
              
              <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                  
                  
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
                      Ordenamientos
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" id="ordenamiento-nombre" data-value="nombre"   href="#">Por nombre</a></li>
                      <li><a class="dropdown-item" id="ordenamiento-puntos" data-value="puntos"  href="#">Por puntos</a></li>
                      <li><a class="dropdown-item" id="ordenamiento-raza" data-value="raza"  href="#">Por raza </a></li>
                      
                    </ul>
                  </li>
                </ul>
                <form class="d-flex" role="search">
                  <input class="form-control me-6" type="search" placeholder="Buscar por nombre" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Buscar</button>
                </form>
              </div>
            </div>
        </nav>

    </header>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        
        $('#ordenamiento-nombre').click(function() {
            var campo = $(this).data('value');
            console.log("holi, gracias por su seleccion: "+campo);
            $.ajax({
                url: 'SvOrdenar?value=' + campo,
                method: 'POST',
                success: function () {

                window.location.href = 'index.jsp';
                },
                error: function () {

                     }
                });
          });
         
        $('#ordenamiento-puntos').click(function() {
            var campo = $(this).data('value');
            console.log("holi, gracias por su seleccion: "+campo);
             $.ajax({
                url: 'SvOrdenar?value=' + campo,
                method: 'POST',
                success: function () {

                window.location.href = 'index.jsp';
                },
                error: function () {

                     }
                });
          });
          
        $('#ordenamiento-raza').click(function() {
            var campo = $(this).data('value');
            console.log("holi, gracias por su seleccion: "+campo);
             $.ajax({
                url: 'SvOrdenar?value=' + campo,
                method: 'POST',
                success: function () {

                window.location.href = 'index.jsp';
                },
                error: function () {

                     }
                });
          });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

