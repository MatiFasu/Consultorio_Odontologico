
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Pacientes</h1>

 <% Paciente p = (Paciente) request.getSession().getAttribute("pacEditar"); 
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    String fechaNac = sdf.format(p.getFecha_nac());
    String obraSocial = p.isTiene_OS()==true?"true":"false";
 %>

<form class="user" action="SvEditPaciente" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="dni"
                   placeholder="Dni" value="<%= p.getDni() %>">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                placeholder="Nombre" value="<%= p.getNombre()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                placeholder="Apellido" value="<%= p.getApellido()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                placeholder="Teléfono" value="<%= p.getTelefono()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                placeholder="Dirección" value="<%= p.getDireccion()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="fechaNac" name="fechaNac" 
                placeholder="Fecha Nac" value="<%= fechaNac %>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="tipoSangre" name="tipoSangre"
                placeholder="Tipo de sangre" value="<%= p.getTipoSangre()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="obraSocial" name="obraSocial"
                placeholder="obraSocial" value="<%= obraSocial %>">
        </div>              

    <button class="btn btn-primary btn-user btn-block" type="submit">
        Editar Paciente
    </button>
    <hr>
    
</form>

<%@ include file="components/bodyfinal.jsp"%>