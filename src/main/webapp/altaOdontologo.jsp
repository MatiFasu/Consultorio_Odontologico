
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Odontólogos</h1>
<form class="user" action="SvOdontologos" method="POST">
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
                placeholder="yyyy-mm-dd">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="especialidad" name="especialidad"
                placeholder="Especialidad">
        </div>
        
        <!--<!-- Aca va a ir todo lo que respecta a horarios y usuarios -->
        <hr>
        <h1>Alta Usuario</h1>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="nombreUsu" name="user"
                placeholder="Nombre Usuario">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="password" class="form-control form-control-user" id="password" name="pass"
                placeholder="Password">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="rol" name="rol"
                placeholder="Rol">
        </div>
        
        <hr>
        <h1>Alta Horario</h1>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hor_ini" name="hor_ini"
                placeholder="Horario Inicio">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="time" class="form-control form-control-user" id="hor_final" name="hor_final"
                placeholder="Horario final">
        </div>
        
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Crear Odontólogo
    </button>>
    <hr>
    
</form>

<%@ include file="components/bodyfinal.jsp"%>