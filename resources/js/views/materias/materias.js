import React, { Component } from "react";
import '../../css/materias.css'
import '../../fontawesome';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { Modal, Button } from 'react-bootstrap';




export default class Materias extends Component {
    constructor(props) {
        super(props);
        this.state = {
            materias: [],
            url: "http://127.0.0.1:8000",
            show: false,
            menciones: ['control', 'sistemas'],
            pensum: "", semestre: "", sigla: "", nombre: "", mencion: "", tipo: "", paralelo: "",
            control: false
        }
        this.handleChange = this.handleChange.bind(this);
        this.handleCheckChange = this.handleCheckChange.bind(this);
    }

    async componentDidMount() {
        this.fetchData();
    }
    async fetchData() {
        let url = this.state.url;
        var urlMaterias = url + "/api/materias/";
        const data = await fetch(urlMaterias).then(value => value.json());
        this.setState({ materias: data.materias })
    }
    async getData(id) {
        var urlData = this.state.url + "/api/materias?id=" + id;
        const data = await fetch(urlData).then(value => value.json());
        var materia = data.materias;
        let control = (materia.control == 'si');
        this.setState({
            id: materia.id, sigla: materia.sigla, tipo: materia.tipo,
            semestre: materia.semestre,
            control: control, telecomunicaciones: materia.telecomunicaciones,
            sistemas: materia.sistemas, paralelo: materia.paralelo,
            nombre: materia.nombre, pensum: materia.pensum
        })
        console.log(materia)
    }
    editar(e) {
        let event = this.getData(e);
        console.log(event)
        this.setState({ show: true, guardar: false, editar: true })
    }
    onHide = () => {
        this.setState({ show: false })
    }
    handleShow = () => {
        this.setState({ show: true })
    }

    eliminar(e) {
        // e.preventDefault();
        let id = e
        console.log(id)
        let urlPost = this.state.url + "/api/materias/eliminar/" + id

        fetch(urlPost, {
            method: 'post',
            mode: 'cors',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(id)
        })
            .then(res => res.json())
            .then(res => console.log(res))
        console.log("El evento " + id + " se Elimino exitosamente")
    }

    nuevo = () => {
        this.setState({ show: true, guardar: true, editar: false, id: "" })
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
    handleChange(event) {
        const target = event.target;
        const value = target.value
        const name = target.name;
        this.setState({ [name]: value });
        console.log(name);
        console.log(value);

    }
    handleCheckChange(event) {
        const target = event.target;
        const value = target.checked
        const name = target.name;
        this.setState({ [name]: value });
        console.log(name);
        console.log(value);

    }
    render() {
        return (
            <div>
                <h2>Materias</h2>
                <div>
                    <div className="table-responsive">
                        <div className="table-wrapper">
                            <div className="table-title">
                                <div className="row">
                                    <div className="col-sm-8"><h2>Lista de  <b>Materias</b></h2></div>
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

                                        <th>Sigla</th>
                                        <th>Nombre</th>
                                        <th>Semestre</th>
                                        <th className="src-only">Tipo</th>
                                        <th className="fit">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    {this.state.materias.map(item =>
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
                        <Modal.Header closeButton>
                            <Modal.Title id="contained-modal-title-vcenter">
                                Using Grid in Modal
                    </Modal.Title>
                        </Modal.Header>
                        <Modal.Body className="show-grid">
                            <div className="form-group">
                                <div className="form-row align-items-center">
                                    <div className="col-auto col-3">
                                        <label>Pensum</label>
                                        <select name="pensum" onChange={this.handleChange} required>
                                            <option value="" disabled={true}></option>
                                            <option value="2000">Pensum 2000</option>
                                            <option>...</option>
                                        </select>
                                    </div>
                                    <div className="col-auto col-3">
                                        <label htmlFor="semestre">Semestre</label>
                                        <select name="semestre" value={this.state.semestre} onChange={this.handleChange}>
                                            <option>1</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="form-group">
                                <div className="col-auto col-7">
                                    <label>Sigla</label>
                                    <input type="text" className="col-6" name="sigla"
                                        value={this.state.sigla} onChange={this.handleChange} />
                                </div>
                            </div>
                            <div className="form-group">
                                <div className="col-auto col-7">
                                    <label>Nombre</label>
                                    <input
                                        type="text"
                                        className="col-9"
                                        name="nombre"
                                        value={this.state.nombre}
                                        onChange={this.handleChange} />
                                </div>

                            </div>
                            <div className="form-group">
                                <div className="form-row align-items-center">
                                    <div className="col-auto">
                                        <label>Mencion</label>
                                    </div>
                                    {this.state.menciones.map(item => {
                                        const ho = "this.state." + item;
                                        const value =  toString(ho)

                                        console.log(value)
                                        return (
                                            <div className="col-auto" key={item} >
                                                <div className="control checkbox">
                                                    <input value={value} type="checkbox" name={item} onChange={this.handleCheckChange} />
                                                    <label className="checkbox">{item}</label>
                                                </div>
                                            </div>
                                        )

                                    }

                                    )}
                                </div>
                            </div>
                            <div className="form-group">
                                <div className="form-row align-items-center">
                                    <div className="col-auto">
                                        <label>Tipo</label>
                                        <select value={this.state.tipo}
                                            name="tipo" onChange={this.handleChange}>
                                            <option value="">...</option>
                                            <option value="laboratorio">Laboratorio</option>
                                            <option value="teoria">Teoría</option>
                                        </select>
                                    </div>
                                    <div className="col-auto">
                                        <label htmlFor="paralelo">Paralelo</label>
                                        <select
                                            name="paralelo" value={this.state.paralelo}
                                            onChange={this.handleChange}>
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                        </select>
                                    </div>
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
                            <Button onClick={this.onHide}>Close</Button>
                        </Modal.Footer>
                    </Modal >
                </div >

            </div >

        )
    }
}