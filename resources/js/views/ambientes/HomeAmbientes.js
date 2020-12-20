import React, { Component } from "react";
import Lista from "../../components/Lista";
import TarjetaAmbiente from "../../components/TarjetaAmbiente";
export default class HomeAmbientes extends Component {
  constructor(args) {
    super(args);
    this.state = {
      loading: true,
      libres: [],
      ocupados: [],
    };
  }
  componentDidMount() {
    this.fetchData();
  }
  async fetchData() {
    const url = "http://127.0.0.1:8000";
    var ocupado = url + "/now?ambientes=ocupado";
    var libre = url + "/now?ambientes=libre";
    Promise.all([
      fetch(ocupado).then((value) => value.json()),
      fetch(libre).then((value) => value.json()),
    ])
      .then((allResponses) => {
        const ocupados = allResponses[0];
        const libres = allResponses[1];
        this.setState({
          ocupados: ocupados.ambientes,
          libres: libres.ambientes,
          loading: false,
        });
      })
      .catch((err) => {
        console.log(err);
      });
  }
  render() {
    var { datos } = this.props;
    var libres = this.state.libres;
    var ocupados = this.state.ocupados;
    return (
      <div>
        <h3>Ocupados</h3>
        {this.state.ocupados.length > 0 && (
          <div className="d-flex flex-wrap">
            {ocupados.map((item) => {
              return (
                <div key={item.id} className="p-2">
                  <TarjetaAmbiente
                    nombre={item.nombre}
                    tipo={item.tipo}
                    capacidad={item.capacidad}
                    lugar={item.edificio}
                  />
                </div>
              );
            })}
          </div>
        )}
        <h3>Disponibles</h3>
        <div className="d-flex flex-wrap">
          {libres.map((item) => {
            return (
              <div key={item.id} className="p-2">
                <TarjetaAmbiente
                  nombre={item.nombre}
                  tipo={item.tipo}
                  capacidad={item.capacidad}
                  lugar={item.edificio}
                />
              </div>
            );
          })}
        </div>
      </div>
    );
  }
}
