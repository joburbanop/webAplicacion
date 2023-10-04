// Obtener el elemento header
  var header = document.querySelector('header');

  // Agregar un controlador de eventos al scroll
  window.addEventListener('scroll', function() {
    // Obtener la distancia vertical que se ha desplazado el documento
    var scrollY = window.scrollY;

    // Establecer el valor del filtro de desenfoque según la posición del scroll
    if (scrollY > 0) {
      // Si el scroll es mayor que cero, aplicar un efecto de desenfoque de 5px
      header.style.backdropFilter = 'blur(5px)';
    } else {
      // Si el scroll es cero, quitar el efecto de desenfoque
      header.style.backdropFilter = 'blur(0px)';
    }
  });