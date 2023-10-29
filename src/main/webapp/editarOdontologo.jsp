
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Editar Odontólogos</h1>

 <% Odontologo o = (Odontologo) request.getSession().getAttribute("odonEditar"); %>

<form class="user" action="SvEditOdonto" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="dni"
                   placeholder="Dni" value="<%= o.getDni() %>">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                placeholder="Nombre"value="<%= o.getNombre()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                placeholder="Apellido" value="<%= o.getApellido()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                placeholder="Teléfono" value="<%= o.getTelefono()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                placeholder="Dirección" value="<%= o.getDireccion()%>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                placeholder="yyyy-mm-dd" value="<%= o.getFecha_nac() %>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="especialidad" name="especialidad"
                placeholder="Especialidad" value="<%= o.getEspecialidad()%>">
        </div>

        <hr>
        <h1>Editar Horario</h1>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hor_ini" name="hor_ini"
                placeholder="Horario Inicio" value="<%= o.getUnHorario().getHorario_inicio() %>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hor_final" name="hor_final"
                placeholder="Horario final" value="<%= o.getUnHorario().getHorario_final() %>"> 
        </div>
        
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Editar Odontólogo
    </button>>
    <hr>
    
</form>

<%@ include file="components/bodyfinal.jsp"%>