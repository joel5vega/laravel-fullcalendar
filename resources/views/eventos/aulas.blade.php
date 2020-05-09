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

<!-- anadiendo al script especifico -->
<script>
    document.addEventListener('DOMContentLoaded', function() {

        var calendarEl = document.getElementById('calendar');

        var eventSources = [
            // your event source
            {
                id: 'all',
                url: '/eventos/show',
                method: 'GET',
                extraParams: {
                    custom_param1: 'something',
                    custom_param2: 'somethingelse'
                },
                success: function() {
                    alert("todo correcto");

                },
                failure: function() {
                    alert('there was an error while fetching events!');
                },
                color: 'yellow', // a non-ajax option
                textColor: 'black' // a non-ajax option
            },

            // any other sources...
            {
                id: 'semestres',
                url: '/semestres',
                method: 'GET',
                // startParam:false,
                /*
                extraParams: {
                    semestre: 1
                    
                },
                */
                failure: function() {
                    alert('there was an error while fetching events!');
                },
                color: 'green', // a non-ajax option
                textColor: 'black' // a non-ajax option
            }

        ];
        //definiremos las fuentes
        var allEventos = "{{url('eventos/show')}}";
        var semestres = "{{url('semestres')}}";

        function getCalendarEvents($view) {
            switch ($view) {
                case 'semestres':
                    events = semestres;
                    break;
                default:
                    events = allEventos;
            }
            return events;
        }
        var vista='semestres';
        
        console.log(vista);
        var eventos = getCalendarEvents(vista);
        // console.log(eventos);
        /**boton */
        //referencia al boton
        $('#btnVista').click(function() {
            eventos=getCalendarEvents('semestres');
            console.log(eventos);

            calendar.destroy();
            calendar.refetchEvents();
            calendar.render();

        });
        var calendar = new FullCalendar.Calendar(calendarEl,{
            //Los eventos


            events:eventos,
            // events: getCalendarEvents(vista),
            

            // events: "{{ url('/eventos/show') }}",
            //PARA PROBAR LAS FUENTES

            //events: getCalendarEvents(vista),
            //eventSources: eventSources,
            //ev//ts: calendar.getEventSourceById('all'),
            //fecha por defecto
            defaultDate: new Date(2019, 8, 1),
            plugins: ['timeGrid', 'dayGrid', 'interaction', 'list'],
            defaultView: 'timeGridWeek',


            //eliminar allday
            hiddenDays: "0",
            allDaySlot: false,
            minTime: '7:00',
            maxTime: '23:00',
            slotDuration: '00:45:00',
            height: 'auto',
            // width:'parent',
            // allDay:false,
            //cabecera
            header: {
                left: 'prev,next',
                // center:'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            //botton personalizado
            customButtons: {
                Miboton: {
                    text: "Semestre",
                    click: function() {
                        console.log(vista);
                        vista = 'semestres';
                        // eventos= "{{url('semestres')}}";
                        // $('#vista').val('semestres');

                        events = getCalendarEvents('semestres');
                        // ('addEventSource', "{{url('/semestre')}}");
                        calendar.destroy();
                        console.log(vista);
                        calendar.refetchEvents();
                        console.log(events);
                        calendar.render()
                        console.log(events);

                    }
                }
            },
            //Para capturar la fecha
            dateClick: function(info) {
                //recoppilar datos
                $('#txtDay').val(info.date.getDay());
                horaIni = (info.date.toLocaleTimeString());
                // horaFin=;
                $('#txtStart').val(horaIni);
                //$('#txtEnd').val(horaFin);
                $('#exampleModal').modal();
                console.log(info);
                /*
                //crear un evento donde se haga click
                calendar.addEvent({
                    title: "Evento x",
                    date: info.dateStr
                });
                */
            },
            //para mostrar los eventos
            eventClick: function(info) {
                console.log(info);
                console.log(info.event.title);
                console.log(info.event.end);
                //para un dato custom
                console.log(info.event.extendedProps.descripcion);
                $('#txtID').val(info.event.id);
                $('#txtTitle').val(info.event.title);
                $('#txtDescripcion').val(info.event.extendedProps.descripcion);

                //para extraer el dia y la hora

                dia = (info.event.start.getDay());
                horaIni = (info.event.start.toLocaleTimeString());
                horaFin = (info.event.end.toLocaleTimeString());
                $('#txtDay').val(dia);
                $('#txtStart').val(horaIni),
                    $('#txtEnd').val(horaFin)
                //endTime: $('#txtEnd').val(),

                $('#exampleModal').modal();

            },






        });
        //En espanol
        calendar.setOption('locale', 'Es');

        //prueba para elegir el calendario

        calendar.render();



        /**boton */
        //referencia al boton
        $('#btnAgregar').click(function() {
            ObjEvento = recolectarDatosGui("POST");
            EnviarInformacion('', ObjEvento);
        });

        //boton eliminar
        $('#btnBorrar').click(function() {
            ObjEvento = recolectarDatosGui("DELETE");
            //concatenamos para enviar informacion del id
            EnviarInformacion('/' + $('#txtID').val(), ObjEvento);
        });
        //boton modificar
        $('#btnModificar').click(function() {
            ObjEvento = recolectarDatosGui("PATCH");
            //concatenamos para enviar informacion del id
            EnviarInformacion('/' + $('#txtID').val(), ObjEvento);
        });






        //recolectar datos de la GUI
        function recolectarDatosGui(method) {
            nuevoEvento = {
                id: $('#txtID').val(),
                groupId: $('#txtID').val(),
                title: $('#txtTitle').val(),
                descripcion: $('#txtDescripcion').val(),
                daysOfWeek: $('#txtDay').val(),
                startTime: $('#txtStart').val(),
                endTime: $('#txtEnd').val(),
                //token de laravel para saber que esta viniendo de una interfaz
                //           <!-- CSRF Token -->
                // meta name="csrf-token" content="kHHeNkYJEJLItrdmUgxDG8Fnd9xKIA1cjuQzmHL1">
                '_token': $("meta[name='csrf-token']").attr("content"),
                '_method': method

            }
            return (nuevoEvento);
        }

        function EnviarInformacion(accion, objEvento) {
            $.ajax({
                type: "POST",
                url: "{{url('/eventos')}}" + accion,
                data: objEvento,
                success: function(msg) {
                    console.log(msg);
                    //si existe un cambio hara que se actualize
                    $('#exampleModal').modal('toggle');
                    calendar.refetchEvents();
                },
                error: function() {
                    alert("Existe un error");
                }

            })
        }


    });
</script>


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

                    ID:
                    <input type="text" name="txtID" id="txtID">
                    <br />
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
                            <input type="text" class="form-control" name="txtEnd" id="txtEnd">
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
                    <button id="btnCancelar" class="btn btn-default">Cancelar</button>
                </div>
            </div>
        </div>
    </div>


    @endsection