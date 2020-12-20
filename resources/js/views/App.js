import React, { Component } from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Header from "../components/Header";
import Home from "./Home";
import HomeResponsables from "./responsables/HomeResponsable";
import HomeAmbientes from "./ambientes/HomeAmbiente";
import HomeMaterias from "./materias/HomeMateria";

class App extends Component {
    componentDidMount() {
        axios.get("/api/index").then(response => {
            this.setState({
                materias: response.data.materias,
                ambientes: response.data.ambientes,
                menciones: response.data.menciones,
                periodos: response.data.periodos,
                periodoActual: response.data.periodoActual,
                responsables: response.data.responsables,
                clases: response.data.clases
            });
        });
    }
    render() {
        return (
            <BrowserRouter>
                <div>
                    <Header />
                    <Switch>
                        <Route exact path="/" component={Home} />
                        <Route
                            exact
                            path="/responsable"
                            render={props => (
                                <HomeResponsables
                                    {...props}
                                    datos={this.state.responsables}
                                />
                            )}
                        />

                        <Route
                            exact
                            path="/ambiente"
                            render={props => (
                                <HomeAmbientes
                                    {...props}
                                    datos={this.state.ambientes}
                                />
                            )}
                        />
                        <Route
                            exact
                            path="/materia"
                            render={props => (
                                <HomeMaterias
                                    {...props}
                                    datos={this.state.materias}
                                />
                            )}
                        />
                    </Switch>
                </div>
            </BrowserRouter>
        );
    }
}

ReactDOM.render(<App />, document.getElementById("app"));
