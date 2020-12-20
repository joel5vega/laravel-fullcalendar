import React, { Component } from "react";
import Lista from "../../components/Lista";

export default class ListaResponsables extends Component {
  render() {
    var { datos } = this.props;
    console.log("----componente lista---");
    console.log(datos);

    return (
      <div>
        <h1>Lista</h1>
        <Lista datos={datos} tipo="responsable" />
      </div>
    );
  }
}
