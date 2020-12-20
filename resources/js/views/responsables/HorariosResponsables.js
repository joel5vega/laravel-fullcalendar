import React, { Component } from "react";
import html2canvas from "html2canvas";
import jsPdf from "jspdf";
import "../../fontawesome";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Calendario from "../../components/Calendario";
import { Link } from "react-router-dom";
import WindowConsumer from "../../containers/WindowProvider";
export default class HorariosResponsables extends Component {
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
  handleResponsableChange = (event) => {
    var responsable = event.target.value;
    const responsables = this.state.responsables;
    var resp = this.filtro(responsables, responsable);
    console.log(resp);

    // var title = resp.titulo + " " + resp.nombre + " " + resp.ap_paterno;
    var title = "Horarios del docente";
    console.log(title);

    var nuevaFuente =
      this.state.url +
      "/responsables/" +
      responsable +
      "?periodo=" +
      this.state.selectedPeriodo;
    this.setState({ fuente: nuevaFuente });
    this.setState({
      selectedResponsable: event.target.value,
      selectedMencion: "",
      selectedAmbiente: "",
      titulo: title,
    });
  };

  filtro = (array, id) => {
    let filtrar = array;
    var nombre = filtrar.filter((item) => {
      if (item.id == id) {
        return item.nombre;
      }
    });

    
    return nombre[0];
    // }
  };

  crearClase = () => {
    alert("crear clase?");
  };

  render() {
    // let { responsables } = this.props;
    const auxiliares = this.state.responsables.filter(
      (resp) => resp.puesto == "auxiliar"
    );
    const docentes = this.state.responsables.filter(
      (resp) => resp.puesto == "docente"
    );
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
                  value={this.selectedBuscar}
                  onChange={this.handleBuscarChange}
                  required
                >
                  <option value="" disabled={true}>
                    Seleccione
                  </option>
                  <option value="auxiliar">Auxiliar</option>
                  <option value="docente">Docente</option>
                </select>
              </div>
            )}
            {this.state.selectedBuscar == "auxiliar" && (
              <div className="col-auto">
                <label className="src-only" htmlFor="auxiliar">
                  Auxiliar
                </label>
                <select
                  type="text"
                  className="form-control"
                  name="auxiliar"
                  id="auxiliar"
                  placeholder="auxiliar"
                  value={this.selectedResponsable}
                  onChange={this.handleResponsableChange}
                  required
                >
                  <option disabled={true} value="">
                    Auxiliar
                  </option>
                  {auxiliares.map((item) => (
                    <option key={item.id} value={item.id}>
                      {item.titulo} {item.ap_paterno}
                    </option>
                  ))}
                </select>
              </div>
            )}

            {this.state.selectedBuscar == "docente" && (
              <div className="col-auto">
                <label htmlFor="docente">Docente:</label>
                <select
                  type="text"
                  name="docente"
                  id="docente"
                  className="form-control"
                  placeholder="docente"
                  value={this.selectedResponsable}
                  onChange={this.handleResponsableChange}
                  required
                >
                  <option value="" disabled={true}>
                    Docente
                  </option>
                  {docentes.map((item) => (
                    <option key={item.id} value={item.id}>
                      {item.titulo} {item.ap_paterno}
                    </option>
                  ))}
                </select>
              </div>
            )}
          </div>
          {this.state.selectedBuscar !== "" && (
            <div className="container">
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
          )}
        </div>
      </div>
    );
  }
}
