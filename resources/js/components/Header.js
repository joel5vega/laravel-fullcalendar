import React from "react";
import { Link, NavLink } from "react-router-dom";
import mainlogo from "../images/logo-UMSA.png";
const navStyles = {
    display: "flex",
    justifyContent: "space-around",
    border: "2px",
    margin: "5px",
    color: "green"
};
const NavActive = {
    color: "red"
};
const Header = () => (
    <nav className="navbar navbar-expand-md navbar-black navbar-laravel">
        <div className="container">
            <NavLink className="navbar-brand" style={navStyles} exact to="/">
                <img
                    src={mainlogo}
                    id="logo_header"
                    height="50px"
                    alt="logo-UMSA"
                />
            </NavLink>
            <NavLink
                className="navbar-brand"
                style={navStyles}
                activeStyle={NavActive}
                exact
                to="/"
            >
                Sistema de Horarios
            </NavLink>
            <NavLink
                exact
                to="/clase/"
                style={navStyles}
                activeStyle={NavActive}
            >
                Clase
            </NavLink>
            <NavLink
                exact
                to="/ambiente/"
                style={navStyles}
                activeStyle={NavActive}
            >
                Ambiente
            </NavLink>
            <NavLink
                exact
                to="/responsable/"
                style={navStyles}
                activeStyle={NavActive}
            >
                Responsable
            </NavLink>
            <NavLink
                exact
                to="/materia/"
                style={navStyles}
                activeStyle={NavActive}
            >
                Materia
            </NavLink>
            <NavLink
                exact
                to="/admin/"
                style={navStyles}
                activeStyle={NavActive}
            >
                Administración
            </NavLink>
            <NavLink
                exact
                to="/login/"
                style={navStyles}
                activeStyle={NavActive}
            >
                Login
            </NavLink>
        </div>
    </nav>
);

export default Header;
