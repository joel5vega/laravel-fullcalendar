document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    locale: 'nl',
    weekNumbers: true,
    defaultDate: standaarddatum,
    nowIndicator: true,
    businessHours: true,
    editable: true,
    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listYear'
    },
    allDaySlot: true,
    events: {
      url: 'load_select.php',
      method: 'POST',
      extraParams: {
        cursus_id: cursus_id,
        evenement_id: evenement_id,
        locatie_id: locatie_id,
        trainer_id: trainer_id
      },
      failure: function() {
        alert('there was an error while fetching events!');
      },

    },
    eventClick: function(info) {
      var event = info.event;
      $.ajax({
        url: "select.php",
        type: "POST",
        data: {
          id: event.id
        },
        success: function(data) {
          console.log(data);
          $("#exampleModal1").modal();
          document.getElementById("title1").value = (data['title']);
          document.getElementById("trainer1").value = (data['trainer']);
        }
      })
      $('#deleteButton').on('click', function() {
        $.ajax({
          url: "delete.php",
          type: "POST",
          data: {
            id: event.id
          },
          success: function() {
            $('#exampleModal1').modal('hide');
            calendar.refetchEvents()
          }
        })
      })
    },
    dateClick: function(info) {
      $("#exampleModal").modal();
      var start = info.dateStr;
      var start1 = start.replace("T", " ");
      var start2 = start1.split('+');
      var start3 = start2[0];
      var start4 = start3.split(' ');
      var start5 = start4[0];
      var start6 = start5.split('-').reverse().join('-');
      var start7 = start4[1].slice(0, 5)
      var start8 = start6 + " " + start7;
      var end1 = start3.split(' ');
      var end2 = end1[1];
      var end3 = end2.slice(0, 2);
      var end4 = parseInt(end3) + 1;
      var end5 = end2.slice(2, 8);
      var end6 = end4.toString();
      var end7 = end6 + end5;
      var end8 = end1[0];
      var end9 = end8 + " " + end7;
      var end10 = end7.slice(0, 5)
      var end11 = start6 + " " + end10;
      document.getElementById("datetimepicker3").value = (start8);
      document.getElementById("datetimepicker4").value = (end11);
      localStorage.setItem("standaarddatum", end8);
      $('#submitButton').on('click', function() {
        var cursus_id = localStorage.getItem("cursus_id");
        var evenement_id = localStorage.getItem("evenement_id");
        var locatie_id = localStorage.getItem("locatie_id");
        var trainer_id = localStorage.getItem("trainer_id");
        var title = $('#title').val();
        var start10 = $('#datetimepicker3').val();
        var start11 = start10.split(' ');
        var start12 = start11[0].split('-').reverse().join('-');
        var startdef = start12 + " " + start11[1];
        var end12 = $('#datetimepicker4').val();
        var end13 = end12.split(' ');
        var end14 = end13[0].split('-').reverse().join('-');
        var enddef = end14 + " " + end13[1];
        if (start != "") {
          $.ajax({
            url: "insert.php",
            type: "POST",
            data: {
              title: title,
              start: startdef,
              end: enddef,
              cursus_id: cursus_id,
              evenement_id: evenement_id,
              locatie_id: locatie_id,
              trainer_id: trainer_id
            },
            success: function() {
              $('#exampleModal').modal('hide');
              calendar.refetchEvents()
              $('#title').val("");
              $('#trainer').val("");
              title = "";
              start = "";
              end9 = "";
            }
          })
        }
      })
    },
    eventResize: function(info) {
      var event = info.event;
      var id = event.id;
      var starte = event.start;
      var ende = event.end;
      var start = calendar.formatIso(starte);
      var start1 = start.replace("T", " ");
      var start2 = start1.split('+');
      var start3 = start2[0];
      var end = calendar.formatIso(ende);
      var end1 = end.replace("T", " ");
      var end2 = end1.split('+');
      var end3 = end2[0];
      $.ajax({
        url: "update.php",
        type: "POST",
        data: {
          start: start3,
          end: end3,
          id: id
        },
        success: function() {
          calendar.refetchEvents()
        }

      })
    },
    eventDrop: function(info) {
      var event = info.event;
      var id = event.id;
      var starte = event.start;
      var ende = event.end;
      var start = calendar.formatIso(starte);
      var start1 = start.replace("T", " ");
      var start2 = start1.split('+');
      var start3 = start2[0];
      var end = calendar.formatIso(ende);
      var end1 = end.replace("T", " ");
      var end2 = end1.split('+');
      var end3 = end2[0];
      $.ajax({
        url: "update.php",
        type: "POST",
        data: {
          start: start3,
          end: end3,
          id: id
        },
        success: function() {
          calendar.refetchEvents()
        }
      })
    },

  });
  calendar.render();
  $('#cursus tbody').on('click', 'tr', function() {
    var row = this.closest('tr');
    var table = $('#cursus').DataTable()
    var cursus_id = table.row(row).data()[1]
    alert(cursus_id);
    calendar.refetchEvents()
  });
});
