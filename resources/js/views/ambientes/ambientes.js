import React, { Component } from "react";
import { Modal, Button } from "react-bootstrap";
import '../../fontawesome';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

export default class Ambientes extends Component {
    constructor(props) {
        super(props);
        this.state = {
            ambientes: [],
            url: "http://127.0.0.1:8000",
            data: [],
            show: false, guardar: false, editar: false,
            nombre: "", tipo: "", capacidad: "", edificio: "", piso: "", id: ""
        }

        this.handleChange = this.handleChange.bind(this);
    }

    async componentDidMount() {
        this.fetchData();
    }
    async fetchData() {
        let urlAmbientes = "http://127.0.0.1:8000/index/ambientes"
        const data = await fetch(urlAmbientes).then(value => value.json());
        this.setState({ data: data, ambientes: data.ambientes })

    }
    //editar
    editar(e) {
        this.getData(e);
        this.setState({ show: true, id: e, editar: true, guardar: false });
        console.log("editar: " + e)
    }
    //requerir los datos dado un id
    getData(id) {
        this.setState({ nombre: "aula-222", tipo: "aula", capacidad: 13, edificio: "obelisco", piso: "4" });
    }
    eliminar(e) {
        console.log("eliminar: " + e)
    }
    guardar = (e) => {
        e.preventDefault()
        if (this.state.id) {
            var evento = {
                nombre: this.state.nombre, tipo: this.state.tipo, capacidad: this.state.capacidad,
                edificio: this.state.edificio, piso: this.state.piso, id: this.state.id
            };
        }
        else {
            var evento = {
                nombre: this.state.nombre, tipo: this.state.tipo, capacidad: this.state.capacidad,
                edificio: this.state.edificio, piso: this.state.piso
            };
        }
        console.log("guardar: ")
        console.log(evento)
    }
    onHide = () => {
        this.setState({ show: false })
    }
    nuevo = () => {
        this.setState({ show: true, guardar: true, id: "", editar: false, })
    }
    ///manejador de cambios
    handleChange(event) {
        const target = event.target;
        const value = target.value

        //=== 'nombre' ? target.value:target.value;
        const name = target.name;
        this.setState({ [name]: value });
        console.log(name);
        console.log(value);

    }

    render() {
        return (
            <div>
                Ambientes
                <div>
                    <div className="table-responsive">
                        <div className="table-wrapper">
                            <div className="table-title">
                                <div className="row">
                                    <div className="col-sm-8"><h2>Lista de  <b>Ambientes</b></h2></div>
                                    <div className="col-sm-4">
                                        <button onClick={this.nuevo} type="button" className="btn btn-info add-new">
                                            <FontAwesomeIcon icon={'plus'} size="1x" /> <small>Nuevo</small>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <table className="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Tipo</th>
                                        <th className="src-only">Capacidad</th>
                                        <th className="fit">Edificio</th>
                                        <th className="fit">Piso</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    {/* <tr>
                                        <td>
                                            <a type="button" href="#"
                                                className='btn ml-4'
                                                onClick={() => this.editar(1)}
                                            >
                                                <FontAwesomeIcon icon={'edit'} />
                                            </a>
                                            <a type="button" href="#"
                                                className='btn ml-4'
                                                onClick={() => this.eliminar(1)}
                                            >
                                                <FontAwesomeIcon icon={'trash'} />
                                            </a>
                                        </td>
                                    </tr>
                                     */}
                                    {this.state.ambientes.map(item =>
                                        <tr key={item.id}>
                                            <td>{item.sigla}</td>
                                            <td>{item.nombre}</td>
                                            <td>{item.semestre}</td>
                                            <td>{item.tipo}</td>
                                            <td>
                                                <a type="button" href="#"
                                                    className='btn ml-4'
                                                    onClick={() => this.editar(item.id)}
                                                >
                                                    <FontAwesomeIcon icon={'edit'} />
                                                </a>
                                                <a type="button" href="#"
                                                    className='btn ml-4'
                                                    onClick={() => this.eliminar(item.id)}
                                                >
                                                    <FontAwesomeIcon icon={'trash'} />
                                                </a>
                                            </td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div>
                    <Modal
                        show={this.state.show}
                        onHide={this.onHide}
                        aria-labelledby="contained-modal-title-vcenter">
                        <form onSubmit={this.guardar}>
                            <Modal.Header closeButton>
                                <Modal.Title id="contained-modal-title-vcenter">
                                    Ambiente
                                </Modal.Title>
                            </Modal.Header>

                            <Modal.Body className="show-grid">
                                <div className="form-group">
                                    <div className="col-auto">
                                        <label>Nombre</label>
                                        <input
                                            type="text"
                                            value={this.state.nombre}
                                            name="nombre"
                                            className="col-6"
                                            onChange={this.handleChange}
                                            required />
                                    </div>

                                </div>
                                <div className="form-group">
                                    <div className="col-auto" >
                                        <label>Tipo</label>
                                        <select name="tipo"
                                            value={this.state.tipo}
                                            onChange={this.handleChange}
                                            required>
                                            <option disabled={true} value="">...</option>
                                            <option value="aula">Aula</option>
                                            <option value="laboratorio">Laboratorio</option>
                                        </select>
                                    </div>
                                </div>
                                <div className="form-group">
                                    <div className="col-auto">
                                        <label>Capacidad</label>
                                        <input name="capacidad"
                                            type="number"
                                            value={this.state.capacidad}
                                            onChange={this.handleChange}
                                            className="col-3"
                                            required />
                                    </div>

                                </div>
                                <div className="form-group">

                                    <div className="col-auto">
                                        <label>Edificio</label>
                                        <input name="edificio"
                                            type="text"
                                            value={this.state.edificio}
                                            onChange={this.handleChange}
                                            className="col-4"
                                            required />
                                    </div>
                                </div>
                                <div className="form-group">
                                    <div className="col-auto">
                                        <label>Piso</label>
                                        <input name="piso" type="text" value={this.state.piso} onChange={this.handleChange} className="col-3" />
                                    </div>
                                </div>
                            </Modal.Body>



                            <Modal.Footer>
                                {this.state.guardar &&
                                    <Button type="submit" onClick={this.guardar}>Guardar</Button>
                                }
                                {this.state.editar &&
                                    <Button type="submit" onClick={this.guardar}>Actualizar</Button>
                                }

                                <Button onClick={this.onHide}>Cancelar</Button>
                            </Modal.Footer>
                        </form>
                    </Modal >
                </div >

            </div>
        )
    }
}