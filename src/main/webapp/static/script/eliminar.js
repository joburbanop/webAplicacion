$('#eliminar').click(function() {
  swal({
    title: "¿Estás seguro?",
    text: "Una vez eliminado, no podrás recuperar a: "+     $(this).data('elimniar'),
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
      $.ajax({
        url: 'SvEliminar?nombre=' + $(this).data('elimniar'),
        method: 'POST',
        success: function () {
                                                    
        window.location.href = 'index.jsp';
        },
        error: function () {
            
             }
        });
      swal("Perro ha sido eliminado!", {
        icon: "success",
      });
    } else {
      swal("¡Tu perro está a salvo!");
    }
  });
});
