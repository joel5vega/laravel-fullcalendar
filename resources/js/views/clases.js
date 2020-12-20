import React, { Component } from "react";
import html2canvas from "html2canvas";
import jsPdf from "jspdf";
import "../fontawesome";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Calendario from "../components/Calendario";
import { Link } from "react-router-dom";
import WindowConsumer from "../containers/WindowProvider";
export default class clases extends Component {
  constructor(props) {
    super(props);
    this.state = {
      url: "http://127.0.0.1:8000",
      fuente: "http://127.0.0.1:8000/index?periodo=1",
      width: window.innerWidth,
      view: "timeGridWeek",
      loading: true,
      titulo: "",
      eventos: [],
      ambientes: [],
      materias: [],
      responsables: [],
      periodos: [],
      semestres: [],
      menciones: [],

      selectedBuscar: "",
      selectedPeriodo: "",
      selectedSemestre: "",
      selectedTipo: "",
      selectedMencion: "",
      selectedAmbiente: "",
    };
  }
  async componentDidMount() {
    this.fetchData();
    let periodo = this.props.periodo;
    window.addEventListener("resize", this.handleResize);
    this.setState({ periodo: periodo });
  }

  /////////////////////////////////////////////
  //Tamaño

  componentWillUnmount() {
    window.removeEventListener("resize", this.handleResize);
  }

  handleResize = () => {
    this.setState({ width: window.innerWidth });
    this.setView();
    console.log(this.state.width);
  };
  setView = () => {
    if (this.state.width < 500) {
      this.setState({ view: "timeGrid" });
    } else this.setState({ view: "timeGridWeek" });
    console.log(this.state.view);
    this.render();
  };
  ///////////////////////////////////////////////

  //descargaremos el periodo y los semestres
  async fetchData() {
    let url = this.state.url;
    var urlPeriodos = url + "/index?index=periodos";
    var urlAmbientes = url + "/index?index=ambientes";
    // var urlAmbientes = url + "/index/ambientes?tipo=aula";
    var urlSemestres = url + "/index?index=semestres";
    var urlMenciones = url + "/index?index=menciones";
    var urlResponsables = url + "/index?index=responsables";
    Promise.all([
      fetch(urlAmbientes).then((value) => value.json()),
      fetch(urlResponsables).then((value) => value.json()),
      fetch(urlPeriodos).then((value) => value.json()),
      fetch(urlSemestres).then((value) => value.json()),
    ])
      .then((allResponses) => {
        //const materias = allResponses[4];
        const ambientes = allResponses[0];
        const responsables = allResponses[1];
        const periodos = allResponses[2];
        const semestres = allResponses[3];
        this.setState({
          periodos: periodos.periodos,
          ambientes: ambientes.ambientes,
          responsables: responsables.responsables,
          semestres: semestres.semestres,
          menciones: semestres.menciones,
          loading: false,
        });
      })
      .catch((err) => {
        console.log(err);
      });
  }
  //Exportar PDF
  printPDF = () => {
    const domElement = document.getElementById("root");
    html2canvas(domElement, {
      onclone: (document) => {
        document.getElementById("print").style.visibility = "hidden";
      },
    }).then((canvas) => {
      const imgData = canvas.toDataURL("image/png");
      const pdf = new jsPdf({
        orientation: "landscape",
      });
      // 180,160
      pdf.addImage(imgData, "JPEG", 5, 5, 265, 200);
      pdf.save(`${new Date().toISOString()} Horario.pdf`);
    });
    alert("Se empezo la descarga de su documento PDF");
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
    // console.log(nuevo)
    var evento = [
      { title: "evento", daysOfWeek: day, startTime: startTime, endTime: fin },
    ];
    console.log(evento);
  };

  ///Handler
  handleBuscarChange = (event) => {
    var buscar = event.target.value;
    this.setState({
      selectedBuscar: buscar,
      selectedAmbiente: "",
      selectedSemestre: "",
    });
  };

  handlePeriodoChange = (event) => {
    var periodo = event.target.value;
    var nombre = this.filtro(this.state.periodos, periodo);
    // console.log(nombre.nombre);
    const fuentePeriodo = this.state.url + "/index?periodo=" + periodo;

    this.setState({
      periodo: nombre.nombre,
      selectedPeriodo: periodo,
      fuente: fuentePeriodo,
      selectedSemestre: "",
      selectedAmbiente: "",
      choqueAmbientes: "",
      choqueSemestre: "",
      eventos: this.state.evento,
    });
  };
  handleSemestreChange = (event) => {
    var semestre = event.target.value;
    let title = "Semestre:  " + semestre;
    var nuevaFuente =
      this.state.url +
      "/semestres/" +
      semestre +
      "?periodo=" +
      this.state.selectedPeriodo;
    this.setState({ fuente: nuevaFuente });
    this.setState({
      selectedSemestre: event.target.value,
      selectedMencion: "",
      selectedAmbiente: "",
      titulo: title,
    });
  };
  handleMencionChange = (event) => {
    var mencion = event.target.value;
    var semestre = this.state.selectedSemestre;
    let title = "Semestre:  " + semestre + " - " + mencion;
    var fuenteDatos =
      this.state.url +
      "/semestres/" +
      semestre +
      "?periodo=" +
      this.state.selectedPeriodo +
      "&mencion=" +
      mencion;
    this.setState({
      selectedMencion: mencion,
      fuente: fuenteDatos,
      titulo: title,
    });
    // this.fetchMaterias(semestre, mencion)
    // this.fetchChoqueSemestre(semestre, mencion)
  };
  handleAmbienteChange = (event) => {
    console.log(event.target.value);
    var ambiente = event.target.value;
    var ambientes = this.state.ambientes;
    var nuevaFuente =
      this.state.url +
      "/ambientes/" +
      ambiente +
      "?periodo=" +
      this.state.selectedPeriodo;
    // var nombre = ambientes.filter(item => item.id === ambiente)
    var nombre = this.filtro(ambientes, ambiente);
    let title = "Ambiente: " + nombre.nombre;
    this.setState({
      selectedAmbiente: ambiente,
      selectedSemestre: "",
      titulo: title,
      fuente: nuevaFuente,
    });
    console.log(nombre.nombre);
  };
  filtro = (array, id) => {
    let filtrar = array;
    var nombre = filtrar.filter((item) => {
      if (item.id == id) {
        return item.nombre;
      }
    });
    return nombre[0];
  };
  crearClase = () => {
    alert("crear clase?");
  };

  render() {
    return (
      <div>
        <div className="container" id="print">
          <div className="row align-items-center">
            {this.state.loading == false && (
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
            )}

            {this.state.selectedPeriodo && (
              <div className="col-auto">
                <label className="src-only" htmlFor="tipo">
                  Tipo{" "}
                </label>
                <select
                  type="text"
                  className="form-control"
                  id="tipo"
                  value={this.state.selectedBuscar}
                  onChange={this.handleBuscarChange}
                  required
                >
                  <option value="" disabled={true}>
                    Seleccione
                  </option>
                  <option value="semestre">Semestre</option>
                  <option value="ambiente">Ambiente</option>
                </select>
              </div>
            )}
            {this.state.selectedBuscar == "semestre" && (
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
                    <option key={item.semestre} value={item.semestre}>
                      {item.semestre}
                    </option>
                  ))}
                </select>
              </div>
            )}

            {this.state.selectedSemestre > 6 && (
              <div className="col-auto">
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
                    Mencion
                  </option>
                  {this.state.menciones.map((item) => (
                    <option key={item.mencion} value={item.mencion}>
                      {item.mencion}
                    </option>
                  ))}
                </select>
              </div>
            )}
            {this.state.selectedBuscar == "ambiente" && (
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
          <div className="row align-items-center">
            <div className="col-auto">
              <div>
                <small>Exportar a PDF</small>
              </div>
              <button onClick={this.printPDF}>
                <FontAwesomeIcon icon={"file-pdf"} size="1x" />
              </button>
            </div>
            <div className="col-auto">
              <div>
                <small>Crear Nuevo</small>
              </div>
              <Link to={"/crear/clase"}>
                <FontAwesomeIcon icon={"plus"} size="2x" />
              </Link>
            </div>
          </div>
        </div>

        <div className="row align-items-center">
          <div className="col-auto col-md-offset-5">
            <div id="periodo">
              <h3>{this.state.periodo}</h3>
            </div>
          </div>
          <div className="col-auto center-block">
            <div id="title">
              <h2>{this.state.titulo}</h2>
            </div>
          </div>
        </div>

        <div id="calendario">
          {this.state.view == "timeGrid" && (
            <Calendario
              fuente={this.state.fuente}
              getDateClick={this.getDateClick}
              view="timeGrid"
            />
          )}
          {this.state.view == "timeGridWeek" && (
            <Calendario
              fuente={this.state.fuente}
              getDateClick={this.getDateClick}
              view="timeGridWeek"
            />
          )}
        </div>
      </div>
    );
  }
}
