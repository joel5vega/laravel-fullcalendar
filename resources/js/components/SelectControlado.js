import React, { Component } from "react";

export default class SelectControlado extends Component {
  render() {
    const { label, valor, name, datos, handleChange } = this.props;
    return (
      <div>
        <div className="form-group col-auto">
          <label className="col-4">{label}</label>
          <select
            value={valor}
            className="col-auto"
            name={name}
            onChange={handleChange}
            defaultValue="default"
          >
            <option value="default" disabled={true}>
              Seleccione {label}
            </option>
            {datos.map((item) => {
              return (
                <option key={item.valor} value={item.valor}>
                  {item.label}
                </option>
              );
            })}
          </select>
        </div>
      </div>
    );
  }
}
