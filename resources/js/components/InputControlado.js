import React, { Component } from "react";

export default class InputControlado extends Component {
  render() {
    const { label, valor, nombre, handleChange } = this.props;
    return (
      <div>
        <div className="form-group col-auto">
          <label className="col-6">{label}</label>
          <input
            type="text"
            className="col-auto"
            placeholder={label}
            name={nombre}
            value={valor}
            onChange={handleChange}
          />
        </div>
      </div>
    );
  }
}
