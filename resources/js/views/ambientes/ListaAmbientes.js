import React, { Component } from "react";
import Lista from "../../components/Lista";

export default class ListaAmbientes extends Component {
  constructor(props) {
    super(props);
    this.state ={
      datos:this.props
    }
  }
  render() {
    var { datos } = this.props;
    return (
      <div>
        <h1>Lista</h1>
        <Lista datos={datos} titulo="Ambientes" tipo="ambiente" />
      </div>
    );
  }
}
