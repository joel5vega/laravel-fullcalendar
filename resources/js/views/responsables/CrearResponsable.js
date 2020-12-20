import React, { Component } from "react";
import InputControlado from "../../components/InputControlado";
import SelectControlado from "../../components/SelectControlado";

export default class CrearResponsable extends Component {
  constructor(props) {
    super(props);
    this.state = {
      // selected: this.props,
    };
  }
  handleChange = (evento) => {
    const target = evento.target;
    const value = target.value;
    const name = target.name;
    this.setState({ selected: { ...this.state.selected, [name]: value } });
    // Propagar datos al padre
    this.props.onChange(evento);
  };
  render() {
    // var {
    const puestos = [
      { valor: "auxiliar", label: "Auxiliar" },
      { valor: "docente", label: "Docente" },
    ];
    const titulos = [
      { valor: "univ", label: "Univ." },
      { valor: "ing", label: "Ing" },
    ];
    const estados = [
      { valor: "interino", label: "Interino" },
      { valor: "titular", label: "titular" },
      { valor: "emerito", label: "emerito" },
    ];
    console.log(puestos);
    // } = this.state.selected;
    var { nombre, ap_paterno, ap_materno, puesto, titulo, estado } = this.props;
    return (
      <div className="container">
        <InputControlado
          label="Nombre"
          nombre="nombre"
          valor={nombre}
          handleChange={this.handleChange}
        />
        <InputControlado
          label="Apellido Paterno"
          nombre="ap_paterno"
          valor={ap_paterno}
          handleChange={this.handleChange}
        />
        <InputControlado
          label="Apellido Materno"
          nombre="ap_materno"
          valor={ap_materno}
          handleChange={this.handleChange}
        />
        <SelectControlado
          label="Puesto"
          value={puesto}
          name="puesto"
          handleChange={this.handleChange}
          datos={puestos}
        />
        <SelectControlado
          label="Titulo"
          value={titulo}
          name="titulo"
          handleChange={this.handleChange}
          datos={titulos}
        />
        <SelectControlado
          label="Estado"
          value={estado}
          name="estado"
          handleChange={this.handleChange}
          datos={estados}
        />
        
      </div>
    );
  }
}
