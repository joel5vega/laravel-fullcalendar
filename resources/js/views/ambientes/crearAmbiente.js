import React, { Component } from "react";
import InputControlado from "../../components/InputControlado";
export default class CrearAmbiente extends Component {
  constructor(props) {
    super(props);
    this.state = {
      ambientes: [],
      // show: false, guardar: false, editar: false,
      // nombre: "", tipo: "", capacidad: "", edificio: "", piso: "", id: ""
    };

    this.handleChange = this.handleChange.bind(this);
  }
  handleChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;
    this.setState({ [name]: value });
    console.log(name);
    console.log(value);
  }
  render() {
    var { nombre, tipo, capacidad, edificio, piso } = this.props;
    return (
      <div>
        <InputControlado
          nombre="nombre"
          valor={this.props.nombre}
          handleChange={this.handleChange}
        />
        <div className="form-group">
          <div className="col-auto">
            <label className="col-4">M</label>
            <input
              type="text"
              value={nombre}
              name="nombre"
              className="col-6"
              onChange={this.handleChange}
              required
            />
          </div>
        </div>
        <div className="form-group">
          <div className="col-auto">
            <label className="col-4">Tipo</label>
            <select
              name="tipo"
              value={tipo}
              onChange={this.handleChange}
              required
            >
              <option disabled={true} value="">
                ...
              </option>
              <option value="aula">Aula</option>
              <option value="laboratorio">Laboratorio</option>
            </select>
          </div>
        </div>
        <div className="form-group">
          <div className="col-auto">
            <label className="col-4">Capacidad</label>
            <input
              name="capacidad"
              type="number"
              value={capacidad}
              onChange={this.handleChange}
              className="col-3"
              required
            />
          </div>
        </div>
        <div className="form-group">
          <div className="col-auto">
            <label className="col-4">Edificio</label>
            <input
              name="edificio"
              type="text"
              value={edificio}
              onChange={this.handleChange}
              className="col-4"
              required
            />
          </div>
        </div>
        <div className="form-group">
          <div className="col-auto">
            <label className="col-4">Piso</label>
            <input
              name="piso"
              type="text"
              value={piso}
              onChange={this.handleChange}
              className="col-3"
            />
          </div>
        </div>
      </div>
    );
  }
}
