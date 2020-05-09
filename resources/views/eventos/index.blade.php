@extends('layouts.app')

@section('scripts')
<!-- Para Calendario -->
<link href="{{ asset('fullcalendar/core/main.css') }}" rel='stylesheet' />
<link href="{{ asset('fullcalendar/daygrid/main.css') }}" rel='stylesheet' />
<!-- estilos de vistas -->
<link href="{{ asset('fullcalendar/timegrid/main.css') }}" rel='stylesheet' />
<link href="{{ asset('fullcalendar/list/main.css') }}" rel='stylesheet' />

<!-- scripts -->
<!-- js de fullcalendar -->
<script src="{{ asset('fullcalendar/core/main.js') }}" defer></script>
<script src="{{ asset('fullcalendar/daygrid/main.js') }}" defer></script>
<script src="{{ asset('fullcalendar/interaction/main.js') }}" defer></script>

<!-- Plugins funcionalidades adicionales -->
<script src="{{ asset('fullcalendar/list/main.js') }}" defer></script>
<script src="{{ asset('fullcalendar/timegrid/main.js') }}" defer></script>
<script>
    let objCalendar;
    let eventos;
    let datos;
    let url_show = 'clases';
    let ambiente_id;
    function select($id) {
            // event.preventDefault();
            ambientes = $id;
            /*
            var data = $(this).serializeArray();
            data.push({
                name: 'ambiente',
                value: $id
            });
            data.push({
                name: 'tag',
                value: 'login'
            });
            */
            // url_show = 'ambientes' + ambiente;
            // url_show = 'clases';
            console.log(url_show);
            console.log("ambientes: "+ambientes);
            //objCalendar.destroy();
            objCalendar.render();
            objCalendar.refetchEvents();
            /*
                    httpGet('clases/show', function(request) {
                        eventos = JSON.parse(request.responseText);
                    });
            */
        }
</script>
<!-- anadiendo al script especifico -->
<script>
    
    

    function httpGet(url, callback) {
        const request = new XMLHttpRequest();
        request.open('get', url, true);
        request.onload = function() {
            callback(request);
        };
        request.send();
    }
    var url_ = "{{url('/eventos')}}"
</script>
<script src="{{ asset('js/main.js') }}" defer></script>



@endsection
@section('content')
<div class="row">
    <div class="col">
        <div>
            <!-- <button id="btnVista" class="btn btn-success">Vista</button> -->

        </div>
        <div class="col-10">
            <div id="calendar"></div>
        </div>
    </div>




    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Datos del evento</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="d-none">
                        ID:
                        <input type="text" name="txtID" id="txtID">
                        <br />
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-8">
                            <label>Titulo</label>
                            <input type="text" class="form-control" name="txtTitle" id="txtTitle">
                        </div>
                        <div class="form-group col-md-8">
                            <label>Dia</label>
                            <input type="text" class="form-control" name="txtDay" id="txtDay">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Inicio</label>
                            <input type="text" class="form-control" name="txtStart" id="txtStart">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Fin</label>
                            <input type="time" min="7:00" max="19:00" step=" " class="form-control" name="txtEnd" id="txtEnd">
                        </div>
                        <div class="form-group col-md-12">
                            <label>Descripcion</label>
                            <textarea name="txtDescripcion" class="form-control" id="txtDescripcion" cols="30" rows="3"></textarea>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button id="btnAgregar" class="btn btn-success">Agregar</button>
                    <button id="btnModificar" class="btn btn-warning">Modificar</button>
                    <button id="btnBorrar" class="btn btn-danger">Borrar</button>
                    <button id="btnCancelar" data-dismiss="modal" class="btn btn-default">Cancelar</button>
                </div>
            </div>
        </div>
    </div>


    @endsection