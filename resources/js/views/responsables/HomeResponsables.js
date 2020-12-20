import React, { Component, Contetxt } from "react";
import Tarjeta from "../../components/Tarjeta";
export default class HomeResponsables extends Component {
    componentDidMount() {}
    render() {
        // let data = this.context;
        let { datos } = this.props;

        console.log("----componente home responsables---");
        // console.log(data);
        console.log(datos);
        const styles = {
            container: {
                flex: 1,
                flexItems: 3,
                backgroundColor: "blue",
                alignItems: "center",
                backgroundColor: "orange",
                position: "relative",
                margin: 10
            }
        };
        return (
          <div>Home Responsables</div>
/*
            <div>
                <h3>Docentes</h3>
                <div className="d-flex flex-wrap">
                    {datos.map(item => {
                        return (
                            <div key={item.id} className="p-2">
                                {item.puesto === "docente" && (
                                    <Tarjeta
                                        titulo={item.titulo}
                                        apellido={item.ap_paterno}
                                        puesto={item.puesto}
                                        estado={item.estado}
                                    />
                                )}
                            </div>
                        );
                    })}
                </div>
                <h3>Auxiliares</h3>
                <div className="d-flex flex-sm-wrap">
                    {datos.map(item => {
                        return (
                            <div key={item.id} className="p-2">
                                {item.puesto === "auxiliar" && (
                                    <Tarjeta
                                        titulo={item.titulo}
                                        apellido={item.ap_paterno}
                                        puesto={item.puesto}
                                        estado={item.estado}
                                    />
                                )}
                            </div>
                        );
                    })}
                </div>
            </div>
     */   
        );
    }
}
