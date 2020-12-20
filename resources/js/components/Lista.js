import React, { Component } from "react";
import "../css/Lista.css";
import "../fontawesome";
import { Modal, Button } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
//Plantillas para crear
import CrearResponsable from "../views/responsables/CrearResponsable";
import CrearAmbiente from "../views/ambientes/crearAmbiente";
import CrearMateria from "../containers/crearMateria";
import CrearClase from "../containers/crearClase";

export default class Lista extends Component {
  constructor(props) {
    super(props);
    this.state = {
      id: "",
      dato: {},
      tipo: "",
      show: false,
      guardar: false,
      editar: false,
      selected: {},
    };
  }

  modal = () => {
    var tipo = this.props.tipo;
    this.setState({
      show: true,
      guardar: true,
      id: "",
      editar: false,
      tipo: tipo,
      selected: {},
    });
    console.log("modal");
  };
  onHide = () => {
    this.setState({ show: false });
  };

  onChange = (evento) => {
    const target = evento.target;
    const value = target.value;
    const name = target.name;
    this.setState({ selected: { ...this.state.selected, [name]: value } });
    // console.log(name + " es: " + value);
  };

  editar(e) {
    this.setState({
      show: true,
      dato: e,
      editar: true,
      guardar: false,
      selected: e,
    });
    console.log("editar en lista");
    console.log(e);
  }

  // Crud
  guardar = (e) => {
    console.log("guardar");
    console.log(this.state.selected);
  };
  eliminar(e) {
    console.log("eliminar: " + e);
    fetch()
  }
  //end of CRUD
  selectCrear(e) {
    console.log("tipo: " + e);
    const { selected } = this.state.selected;
    const { handleChange } = this.handleChange;
    switch (e) {
      case "ambiente":
        return <CrearAmbiente {...this.state.selected} />;
        break;
      case "responsable":
        return (
          <CrearResponsable {...this.state.selected} onChange={this.onChange} />
        );
        break;
      case "materia":
        return <CrearMateria />;
        break;
      case "clase":
        return <CrearClase />;
      default:
        return <p>Envie el modo</p>;
        break;
    }
  }
  ///manejador de cambios
  handleChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;
    this.setState({ [name]: value });
    console.log(name);
    console.log(value);
  }

  render() {
    const { datos, tipo, titulo } = this.props;
    // console.log(datos)
    const keys = Object.keys(datos[0]);
    // console.log(keys);
    return (
      <div>
        <div className="container-lg">
          <div className="table-wrapper">
            <div className="table-title">
              <h1 className="col-auto">{titulo}</h1>
              <button
                type="button"
                className="btn btn-info add-new col-auto"
                onClick={this.modal}
              >
                <FontAwesomeIcon icon={"plus"} size="1x" />{" "}
                <small>Crear Nuevo</small>
              </button>
            </div>
            <table className="table">
              <thead>
                <tr>
                  {keys.map((key) => {
                    if (key === "id") {
                    } else {
                      return <th key={key}>{key}</th>;
                    }
                  })}
                </tr>
              </thead>
              <tbody>
                {this.props.datos.map((item) => (
                  <tr key={item.id}>
                    {keys.map((campo) => {
                      if (campo === "id") {
                      } else {
                        return <td key={item.id + campo}>{item[campo]}</td>;
                      }
                    })}
                    <td>
                      <div
                        type="button"
                        href="#"
                        className="col-auto"
                        onClick={() => this.editar(item)}
                      >
                        <FontAwesomeIcon icon={"edit"} />
                      </div>
                      <span
                        type="button"
                        href="#"
                        className="col-auto"
                        onClick={() => this.eliminar(item.id)}
                      >
                        <FontAwesomeIcon icon={"trash"} />
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div>
          <Modal
            show={this.state.show}
            onHide={this.onHide}
            aria-labelledby="contained-modal-title-vcenter"
          >
            <form onSubmit={this.guardar}>
              <Modal.Header closeButton>
                <Modal.Title id="contained-modal-title-vcenter">
                  {this.props.titulo}
                </Modal.Title>
              </Modal.Header>
              <Modal.Body >
              {/* <Modal.Body className="show-grid"> */}
                {this.selectCrear(this.props.tipo)}
              </Modal.Body>
              <Modal.Footer>
                {this.state.guardar && (
                  <Button onClick={this.guardar}>Guardar</Button>
                )}
                {this.state.editar && (
                  <Button
                    // type="submit"
                    onClick={this.guardar}
                  >
                    Actualizar
                  </Button>
                )}
                <Button onClick={this.onHide}>Cancelar</Button>
              </Modal.Footer>
            </form>
          </Modal>
        </div>
      </div>
    );
  }
}
