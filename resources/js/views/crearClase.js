import React, { Component } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import { Dropdown, NavDropdown, DropdownButton } from "react-bootstrap";
import FetchDatos from "../containers/FetchDatos";
import Calendario from "../components/Calendario";
import { asRoughMinutes } from "@fullcalendar/core";
import "../css/crear.css";
import { Redirect } from "react-router-dom";

export default class CrearClase extends Component {
  constructor(args) {
    super(args);
    this.state = {
      url: "http://127.0.0.1:8000",
      ambientes: [],
      materias: [],
      responsables: [],
      periodos: [],
      loading: true,
      choqueSemestre: [],
      choqueAmbiente: [],
      eventos: [],
      evento: [],
      view: "timeGridWeek",
      valido: false,
      selectedPeriodo: "",
      selectedMateria: "",
      selectedAmbiente: "",
      day: "",
      startTime: "",
      endTime: "",

      selectedSemestre: "",
      selectedMencion: "",

      selectedNivel: "",
      selectedTipo: "",

      selectedResponsable: "",
      isSubmitting: false,
      semestres: [
        { id: 1, nombre: "Primer Semestre", value: 1 },
        { id: 2, nombre: "Segundo Semestre", value: 2 },
        { id: 3, nombre: "Tercer Semestre", value: 3 },
        { id: 4, nombre: "Cuarto Semestre", value: 4 },
        { id: 5, nombre: "Quinto Semestre", value: 5 },
        { id: 6, nombre: "Sexto Semestre", value: 6 },
        { id: 7, nombre: "Septimo Semestre", value: 7 },
        { id: 8, nombre: "Octavo Semestre", value: 8 },
        { id: 9, nombre: "Noveno Semestre", value: 9 },
        { id: 10, nombre: "Decimo Semestre", value: 10 },
      ],
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }
  //fetch materias
  async fetchMaterias(semestre, mencion) {
    const url = "http://127.0.0.1:8000";
    try {
      this.setState({ loading: true });
      if (mencion !== "") {
        var urlMaterias =
          url + "/index/materias/" + semestre + "?mencion=" + mencion;
      } else {
        var urlMaterias = url + "/index/materias/" + semestre;
      }
      //  console.log(urlMaterias)
      const data = await fetch(urlMaterias).then((value) => value.json());
      //asignamos las materias del semestre correspondiente
      this.setState({ materias: data.materias });
      // console.log(data.materias)
    } catch (e) {
      console.log(e);
      this.setState({ ...this.state, loading: false });
    }
  }
  //fetch Ambientes
  async fetchAmbientes(tipo) {
    const url = "http://127.0.0.1:8000";
    try {
      this.setState({ loading: true });
      var urlAmbientes = url + "/index/ambientes?tipo=" + tipo;
      const data = await fetch(urlAmbientes).then((value) => value.json());
      //asignamos las aulas del tipo  correspondiente
      this.setState({ ambientes: data.ambientes });
      // console.log(data)
    } catch (e) {
      console.log(e);
      this.setState({ ...this.state, loading: false });
    }
  }
  //fetch responsables
  async fetchResponsables(nivel) {
    const url = "http://127.0.0.1:8000";
    try {
      this.setState({ loading: true });
      const urlResponsables = url + "/index/responsables?nivel=" + nivel;
      // console.log(urlResponsables)
      const data = await fetch(urlResponsables).then((value) => value.json());
      //asignamos las materias del semestre correspondiente
      this.setState({ responsables: data.responsables });
      // console.log(data.responsable)
    } catch (e) {
      console.log(e);
      this.setState({ ...this.state, loading: false });
    }
  }

  async fetchChoqueSemestre(semestre, mencion) {
    const url = "http://127.0.0.1:8000";
    try {
      this.setState({ loading: true });
      if (mencion !== "") {
        var urlSemestre =
          url +
          "/semestres/" +
          semestre +
          "?mencion=" +
          mencion +
          "&periodo=" +
          this.state.selectedPeriodo;
      } else {
        var urlSemestre =
          url +
          "/semestres/" +
          semestre +
          "?periodo=" +
          this.state.selectedPeriodo;
      }
      // console.log(urlSemestre)
      const data = await fetch(urlSemestre).then((value) => value.json());
      //asignamos las materias del semestre correspondiente
      let anterior = this.state.evento.concat(this.state.choqueAmbiente);
      this.setState({ choqueSemestre: data, eventos: anterior });

      //anadimos al array de eventos
      /*
            data.map(item => {
                console.log(item)
                this.setState({ eventos: [...this.state.eventos, item] });
            })
            */
      this.pushArray(data);
    } catch (e) {
      console.log(e);
      this.setState({ ...this.state, loading: false });
      //adicionamos a eventos
    }
  }
  pushArray(data) {
    data.map((item) => {
      if (item.title !== "evento") {
        // if (!(this.state.eventos.filter(e => e.ambiente_id === item.ambiente_id).length > 0)) {
        if (
          !(
            this.state.eventos.filter((e) => e.groupId === item.groupId)
              .length > 0
          )
        ) {
          this.setState({ eventos: [...this.state.eventos, item] });
        }
      } else {
        if (item.title == "evento") {
          // console.log("evento crado")
          let anterior = this.state.choqueAmbiente.concat(
            this.state.choqueSemestre
          );
          // console.log(anterior)
          // this.setState({eventos:anterior});
          this.setState({ eventos: [...anterior, item] });

          // console.log("funciono")
          // console.log(this.state.eventos)
          // this.setState({eventos:this.state.choqueAmbiente})
        }
      }
    });
  }
  async fetchChoqueAmbiente(ambiente) {
    const url = "http://127.0.0.1:8000";
    try {
      this.setState({ loading: true });
      const urlChoque =
        url +
        "/ambientes/" +
        ambiente +
        "?periodo=" +
        this.state.selectedPeriodo;
      // console.log(urlChoque)
      const data = await fetch(urlChoque).then((value) => value.json());
      //asignamos las materias del semestre correspondiente
      let anterior = this.state.evento.concat(this.state.choqueSemestre);
      this.setState({ choqueAmbiente: data, eventos: anterior });
      this.pushArray(data);
      //console.log(data)
    } catch (e) {
      console.log(e);
      this.setState({ ...this.state, loading: false });
    }
  }

  async fetchData() {
    const url = "http://127.0.0.1:8000";
    //const urlMaterias = url + "/index/materias/" + this.state.selectedSemestre;
    if (this.state.selectedAmbiente == "undefined") {
      var urlAmbientes = url + "/index/ambientes";
      // var urlAmbientes = url + "/index?index=ambientes";
    } else
      urlAmbientes =
        url + "/index/ambientes?tipo=" + this.state.selectedAmbiente;
    const urlResponsables = url + "/index/responsables";
    const urlPeriodos = url + "/index?index=periodos";
    Promise.all([
      //fetch(urlMaterias).then(value => value.json()),
      fetch(urlAmbientes).then((value) => value.json()),
      fetch(urlResponsables).then((value) => value.json()),
      fetch(urlPeriodos).then((value) => value.json()),
    ])
      .then((allResponses) => {
        //const materias = allResponses[4];
        const ambientes = allResponses[0];
        const responsables = allResponses[1];
        const periodos = allResponses[2];
        this.setState({
          periodos: periodos.periodos,
          ambientes: ambientes.ambientes,
          responsables: responsables.responsables,
          loading: false,
        });
      })
      .catch((err) => {
        console.log(err);
      });
  }

  //fetch data
  async componentDidMount() {
    this.fetchData();
  }
  handlePeriodoChange = (event) => {
    var periodo = event.target.value;
    // console.log(periodo)
    this.setState({
      selectedPeriodo: periodo,
      selectedSemestre: "",
      selectedAmbiente: "",
      choqueAmbientes: "",
      choqueSemestre: "",
      eventos: this.state.evento,
    });
  };
  handleSemestreChange = (event) => {
    var semestre = event.target.value;
    var mencion = "";
    // console.log(semestre)
    this.setState({
      selectedSemestre: event.target.value,
      selectedMencion: "",
    });
    this.fetchMaterias(semestre, mencion);
    this.fetchChoqueSemestre(semestre, mencion);
  };
  handleMencionChange = (event) => {
    var mencion = event.target.value;
    var semestre = this.state.selectedSemestre;
    // console.log(mencion)
    this.setState({ selectedMencion: mencion });
    this.fetchMaterias(semestre, mencion);
    this.fetchChoqueSemestre(semestre, mencion);
  };
  handleMateriaChange = (event) => {
    var materia = event.target.value;
    this.setState({ selectedMateria: materia });
  };
  handleAmbienteChange = (event) => {
    var ambiente = event.target.value;
    this.setState({ selectedAmbiente: ambiente });
    console.log(ambiente);
    this.fetchChoqueAmbiente(ambiente);
  };
  handleNivelChange = (event) => {
    var nivel = event.target.value;
    this.setState({ selectedNivel: nivel });
    this.fetchResponsables(nivel);
    // console.log(ambiente)
  };
  handleTipoChange = (event) => {
    var tipo = event.target.value;
    this.setState({ selectedTipo: tipo });
    this.fetchAmbientes(tipo);
  };

  handleResponsableChange = (event) => {
    var responsable = event.target.value;
    this.setState({ selectedResponsable: responsable });
    // this.fetchResponsables(responsable);
    // console.log(ambiente)
  };
  handleDayChange = (event) => {
    var dia = event.target.value;
    var evento = [
      {
        title: "evento",
        daysOfWeek: dia,
        startTime: this.state.startTime,
        endTime: this.state.endTime,
      },
    ];
    this.setState({ day: dia, evento: evento, view: "dayGrid" });
    this.pushArray(evento);
    // console.log(evento)
  };
  handleStartChange = (event) => {
    var start = event.target.value;

    let nuevo = this.addTime(start, 90);

    var evento = [
      {
        title: "evento",
        daysOfWeek: this.state.day,
        startTime: start,
        endTime: nuevo,
      },
    ];
    this.setState({ startTime: start, endTime: nuevo, evento: evento });
    this.pushArray(evento);
  };
  handleEndChange = (event) => {
    var fin = event.target.value;
    var evento = [
      {
        title: "evento",
        daysOfWeek: this.state.day,
        startTime: this.state.startTime,
        endTime: fin,
      },
    ];
    this.setState({ endTime: fin, evento: evento });
    this.pushArray(evento);
  };
  getDateClick = (event) => {
    let startTime = event.startTime;
    let day = event.day.toString();
    let date = event.date;
    let minutes = 90;
    let fin = new Date(date.getTime() + minutes * 60000).toLocaleTimeString(
      [],
      { hour: "2-digit", minute: "2-digit" }
    );
    var evento = [
      { title: "evento", daysOfWeek: day, startTime: startTime, endTime: fin },
    ];
    // console.log(evento)
    this.setState({ startTime: startTime, day: day, endTime: fin });
    this.pushArray(evento);
  };
  addTime(time, minutes) {
    let now = new Date("January 25, 1994 " + time);
    let nuevo = new Date(now.getTime() + minutes * 60000).toLocaleTimeString(
      [],
      { hour: "2-digit", minute: "2-digit" }
    );
    return nuevo;
  }
  handleSubmit(event) {
    event.preventDefault();
    var evento = {
      materia: this.state.selectedMateria,
      responsable: this.state.selectedResponsable,
      ambiente: this.state.selectedAmbiente,
      periodo: this.state.selectedPeriodo,
      tipo: this.state.selectedTipo,
      nivel: this.state.selectedNivel,
      day: this.state.day,
      startTime: this.state.startTime,
      endTime: this.state.endTime,
    };
    // var myRequest = new Request('flowers.jpg', myInit);
    let urlPost = this.state.url + "/api/crear";
    fetch(urlPost, {
      method: "post",
      mode: "cors",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify(evento),
    })
      .then((res) => res.json())
      .then((res) => console.log(res))
      .then(this.limpiarForm()).then(this.props.history.push('/clases'));

    alert("El evento se creo exitosamente");

    // console.log(evento)
  }

  limpiarForm() {
    this.setState({
      selectedPeriodo: "",
      selectedAmbiente: "",
      selectedMateria: "",
      selectedMencion: "",
      selectedNivel: "",
      selectedResponsable: "",
      selectedSemestre: 0,
      selectedTipo: "",
    });
  }
  onSubmit(event) {
    alert("se cambio");
    /*
        (values, { setSubmitting, resetForm }) => {
            setSubmitting(true);
            setTimeout(() => {
                alert(JSON.stringify(values, null, 2));
            }, 500)
            resetForm();
            setSubmitting(false);
     
        }*/
  }
  view = (event) => {
    let view = this.state.view;
    return view;
  };

  render() {
    var message = "you selected" + this.state.selectedSemestre;
    return (
      <div className="container">
        <div className="container">
          <form onSubmit={this.handleSubmit}>
            <div className="form-group">
              {/* <h2 >Materia</h2> */}
              <div className="form-row align-items-center">
                <div className="col-auto">
                  <label className="src-only" htmlFor="periodo">
                    Periodo{" "}
                  </label>
                  <select
                    type="text"
                    className="form-control"
                    name="periodo"
                    id="periodo"
                    value={this.state.selectedPeriodo}
                    onChange={this.handlePeriodoChange}
                    required
                  >
                    <option disabled={true} value="">
                      Periodo
                    </option>
                    {this.state.periodos.map((item) => (
                      <option key={item.id} value={item.id}>
                        {item.nombre}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="col-auto">
                  <label className="src-only" htmlFor="semestre">
                    Semestre{" "}
                  </label>
                  <select
                    type="text"
                    className="form-control"
                    name="semestre"
                    id="semestre"
                    placeholder="semestre"
                    value={this.state.selectedSemestre}
                    onChange={this.handleSemestreChange}
                    required
                  >
                    <option disabled={true} value="">
                      Semestre
                    </option>
                    {this.state.semestres.map((item) => (
                      <option
                        className="align-items-center"
                        key={item.id}
                        value={item.value}
                        data-mencion={item.mencion}
                      >
                        {item.value}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="col-auto">
                  {this.state.selectedSemestre > 6 && (
                    <div>
                      <label htmlFor="mencion">Mencion </label>
                      <select
                        type="text"
                        name="mencion"
                        id="mencion"
                        className="form-control"
                        placeholder="mencion"
                        value={this.state.selectedMencion}
                        onChange={this.handleMencionChange}
                      >
                        <option disabled={true} value="">
                          Seleccione Mencion
                        </option>
                        <option value="control">Control</option>
                        <option value="sistemas">Sistemas</option>
                        <option value="telecomunicaciones">
                          Telecomunicaciones
                        </option>
                      </select>
                    </div>
                  )}
                </div>

                <div className="col-auto">
                  {this.state.selectedSemestre != "" && (
                    <div className="input-row">
                      <label htmlFor="materia">Materia:</label>
                      <select
                        type="text"
                        name="materia"
                        id="materia"
                        className="form-control"
                        placeholder="materia"
                        value={this.state.selectedMateria}
                        onChange={this.handleMateriaChange}
                        required
                      >
                        <option value="" disabled={true}>
                          Materia
                        </option>
                        {this.state.materias.map((item) => (
                          <option key={item.id} value={item.id}>
                            {item.sigla}
                          </option>
                        ))}
                      </select>
                    </div>
                  )}
                </div>
              </div>
            </div>
            {/* <label >Ambientes</label> */}
            <div className="form-group">
              <div className="form-row align-items-center">
                <div className="col-auto">
                  <label htmlFor="nivel">Nivel de docencia</label>
                  <select
                    type="text"
                    name="nivel"
                    id="nivel"
                    className="form-control"
                    placeholder="Docencia/Auxiliatura"
                    value={this.state.selectedNivel}
                    onChange={this.handleNivelChange}
                    required
                  >
                    <option value="" disabled={true}>
                      Docente/Auxiliar
                    </option>
                    <option value="docente">Docencia</option>
                    <option value="auxiliar">Auxiliatura</option>
                  </select>
                </div>

                <div className="col-auto">
                  {this.state.selectedNivel != "" && (
                    <div>
                      <label htmlFor="responsable">Responsable:</label>
                      <select
                        type="text"
                        name="responsable"
                        id="responsable"
                        className="form-control"
                        placeholder="responsable"
                        value={this.state.selectedResponsable}
                        onChange={this.handleResponsableChange}
                        required
                      >
                        <option value="" disabled={true}>
                          Responsable
                        </option>
                        {this.state.responsables.map((item) => (
                          <option key={item.id} value={item.id}>
                            {item.titulo} {item.ap_paterno} {item.nombre}
                          </option>
                        ))}
                      </select>
                    </div>
                  )}
                </div>
              </div>
            </div>

            <div className="form-group">
              <div className="form-row align-items-center">
                <div className="col-auto">
                  <label htmlFor="tipo">Tipo de ambiente</label>
                  <select
                    type="text"
                    name="tipo"
                    id="tipo"
                    className="form-control"
                    placeholder="teoria/laboratorio"
                    value={this.state.selectedTipo}
                    onChange={this.handleTipoChange}
                    required
                  >
                    <option value="" disabled={true}>
                      Teoria/Laboratorio
                    </option>
                    <option value="aula">Teoria</option>
                    <option value="laboratorio">Laboratorio</option>
                  </select>
                </div>

                {this.state.selectedTipo != "" && (
                  <div className="col-auto">
                    <label htmlFor="ambiente">Ambiente:</label>
                    <select
                      type="text"
                      name="ambiente"
                      id="ambiente"
                      className="form-control"
                      placeholder="ambiente"
                      value={this.state.selectedAmbiente}
                      onChange={this.handleAmbienteChange}
                      required
                    >
                      <option value="" disabled={true}>
                        ambiente
                      </option>
                      {this.state.ambientes.map((item) => (
                        <option key={item.id} value={item.id}>
                          {item.nombre}
                        </option>
                      ))}
                    </select>
                  </div>
                )}
              </div>
            </div>
            <div className="form-group">
              <div className="form-row align-items-center">
                <div className="col-auto">
                  <div>
                    <label htmlFor="day">Dia:</label>
                    <select
                      type="number"
                      name="day"
                      id="day"
                      className="form-control"
                      placeholder={this.state.day}
                      value={this.state.day}
                      onChange={this.handleDayChange}
                      required
                    >
                      <option value="" disabled={true}>
                        dia
                      </option>
                      <option value="1">Lunes</option>
                      <option value="2">Martes</option>
                      <option value="3">Miercoles</option>
                      <option value="4">Jueves</option>
                      <option value="5">Viernes</option>
                      <option value="6">Sabado</option>
                    </select>
                  </div>
                </div>

                {this.state.day > 0 && (
                  <div className="col-auto">
                    <label htmlFor="startTime">Hora de inicio:</label>
                    <input
                      type="time"
                      name="startTime"
                      id="startTime"
                      className="form-control"
                      placeholder={this.state.startTime}
                      value={this.state.startTime}
                      onChange={this.handleStartChange}
                      required
                    ></input>
                  </div>
                )}
                {this.state.startTime != "" && (
                  <div className="col-auto">
                    <label htmlFor="endTime">Hora de fin:</label>
                    <input
                      type="time"
                      name="endTime"
                      id="endTime"
                      disabled={true}
                      className="form-control"
                      placeholder={this.state.endTime}
                      value={this.state.endTime}
                      onChange={this.handleEndChange}
                    ></input>
                  </div>
                )}
              </div>
            </div>

            <div className="form-row align-items-center">
              {!this.state.valido && (
                <button
                  className="btn btn-primary mb-2"
                  type="submit"
                  disabled={this.state.isSubmitting}
                >
                  Crear
                </button>
              )}
            </div>
          </form>
        </div>

        {this.state.selectedSemestre != "" && (
          <div className="container">
            <Calendario
              fuente={this.state.eventos}
              getDateClick={this.getDateClick}
              size="small"
            />
          </div>
        )}
      </div>
    );
  }
}
