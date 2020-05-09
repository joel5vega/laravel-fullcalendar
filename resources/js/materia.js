$(document).ready(function() {
    function loadMateria() {
        console.log("cambio");
        
        var semestre_id = $('#semestre').val();
        if ($.trim(semestre_id) != '') {
            $.get('semestre', {
                semestre_id: semestre
            }, function(materias) {
                $('#materia').empty();
                $('#materia').append("<option value=''>Seleccione una materia</option>");
                $.each(materias, function(index, value) {
                    $('#materia').append("<option value='" + index + "'>" + value + "</option>");
                })

            });
        }
    }
    loadMateria();
    $('#semestre').on('change', loadMateria);

});