$('.eliminar').click(function() {
    var nombre=$(this).data('elimniar');
    console.log(nombre);
  swal({
    title: "¿Estás seguro?",
    text: "Una vez eliminado, no podrás recuperar a: "+ nombre,
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
      $.ajax({
        url: 'SvEliminar?nombre=' + nombre,
        method: 'POST',
        success: function () {
                                                    
        window.location.href = 'index.jsp';
        },
        error: function () {
            
             }
        });
      swal("Perro ha sido eliminado!", {
        icon: "éxito",
      });
    } else {
      swal("¡Tu perro está a salvo!");
    }
  });
});
