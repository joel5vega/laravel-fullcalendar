
    document.addEventListener('DOMContentLoaded', function() {

        var calendarEl = document.getElementById('calendar');
        
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
            //Los eventos
            
            // events: url_show,evetnos
            events: {
                url: url_show,
                // url: 'clases',
                method: 'GET',
                
                extraParams: {
                  ambiente: ambiente_id,
                  semestre: '3',
                  mencion: 'Sistemas'
                },
                success: function(msg) {
                    //si existe un cambio hara que se actualize
                    
                    // calendar.refetchEvents();
                    console.log("eventos recargados con exito");
                    
                },
                failure: function() {
                  console.log('there was an error while fetching events!');
                  console.log(ambientes);
                },
                color: 'yellow',   // a non-ajax option
                textColor: 'black' // a non-ajax option
              },
          
            

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
                left: 'prev,next, today, Miboton',
                // center:'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            //botton personalizado
            customButtons: {
                Miboton: {
                    text: ".",
                    click: function() {
                        
                        
                        
                        Actualizar();
                        
                        calendar.destroy();
                        
                        calendar.refetchEvents();
                        calendar.render()
                        
                        

                    }
                }
            },
            //Para capturar la fecha
            dateClick: function(info) {
                //limpiar el formulario
                limpiarFormulario();

                //recoppilar datos
                $('#txtDay').val(info.date.getDay());
                horaIni = (info.date.toLocaleTimeString());
                // horaFin=;
                $('#txtStart').val(horaIni);
                //$('#txtEnd').val(horaFin);

                //Deshabilitar un boton
                $("#btnAgregar").prop("disabled", false);
                $("#btnBorrar").prop("disabled", true);
                $("#btnModificar").prop("disabled", true);
                //llamamos al modal
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
                console.log(horaIni);
                startTime = Date.parse(horaIni);
                console.log(startTime);
                $('#txtDay').val(dia);
                $('#txtStart').val(horaIni),
                    $('#txtEnd').val(horaFin)
                //endTime: $('#txtEnd').val(),

                //Deshabilitar un boton
                $("#btnAgregar").prop("disabled", true);
                $("#btnBorrar").prop("disabled", false);
                $("#btnModificar").prop("disabled", false);
                //llamar al modal
                $('#exampleModal').modal();

            },






        });
        //En espanol
        calendar.setOption('locale', 'Es');

        //prueba para elegir el calendario
        //objeto para la manipulacion

        objCalendar=calendar;
        calendar.render();
        calendar.refetchEvents();


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
                url: url_ + accion,
                data: objEvento,
                success: function(msg) {
                    //si existe un cambio hara que se actualize
                    $('#exampleModal').modal('toggle');
                    calendar.refetchEvents();
                
                },
                error: function() {
                    alert("Existe un error");
                }

            })
        }
        function Actualizar(url){
            $.ajax({
                type: "GET",
                url: url,
                
                success: function(msg) {
                    //si existe un cambio hara que se actualize
                    // $('#exampleModal').modal('toggle');
                    calendar.refetchEvents();
                },
                error: function() {
                    alert("Existe un error");
                }

            })
        }

        function limpiarFormulario() {
            $('#txtID').val("");
            $('#txtTitle').val("");
            $('#txtDescripcion').val("");
            $('#txtDay').val("");
            $('#txtStart').val("");
            $('#txtEnd').val("");

        }
    });
