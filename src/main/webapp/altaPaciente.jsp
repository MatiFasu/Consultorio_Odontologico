
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Pacientes</h1>


<form class="user" action="SvPacientes" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="dni"
                placeholder="Dni">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                placeholder="Nombre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac" 
                placeholder="Fecha Nac">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="tipoSangre" name="tipoSangre"
                placeholder="Tipo de sangre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="radio" class="form-check form-check-inline" value="true" name="obraSocial" checked=""> Tiene Obra Social<br>
            <input type="radio" class="form-check form-check-inline" value="false" name="obraSocial"> No Tiene Obra Social<br>
        </div>    
        
        <hr>
        <h2>Responsable</h2>
        <p class="" style="color: red;"> Si el paciente es menor de edad, debe ingresar un responsable </p>
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="dniResp"
                placeholder="Dni">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="nombre" name="nombreResp"
                placeholder="Nombre">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido" name="apellidoResp"
                placeholder="Apellido">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono" name="telefonoResp"
                placeholder="Teléfono">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion" name="direccionResp"
                placeholder="Dirección">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNacResp"
                placeholder="Fecha Nac">
        </div>
        
    </div>
    
    <button href="#" class="btn btn-primary btn-user btn-block" type="submit">
        Crear Paciente
    </button>
    <hr>
    
</form>

<%@ include file="components/bodyfinal.jsp"%>