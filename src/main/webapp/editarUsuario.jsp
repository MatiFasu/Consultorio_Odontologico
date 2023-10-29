
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Usuarios</h1>

 <% Usuario u = (Usuario) request.getSession().getAttribute("usuEditar"); %>

<form class="user" action="SvEditUsuarios" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                placeholder="Nombre Usuario" value="<%= u.getUsuario() %>">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                placeholder="Contraseña" value="<%= u.getContrasenia() %>">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="rol" name="rol"
                placeholder="Rol" value="<%= u.getRol() %>">
        </div>
        
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Editar Usuario
    </button>
    <hr>
    
</form>

<%@ include file="components/bodyfinal.jsp"%>
