

<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
    Paciente p = (Paciente) request.getSession().getAttribute("paciente");
    Controladora control = new Controladora();
    List<Odontologo> odontologos = control.traerOdontologos();
%>

<h1>Alta Turno</h1>

<p>Elegir Odontologo</p>
<select>
   <% for(Odontologo o: odontologos) { %>
  <option><%= o.getId() + " " + o.getNombre() %></option>
   <% } %>
</select>

<br><br>
<form class="user" action="SvTurnos" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="idPac" value="<%= p.getId() %>"
                placeholder="id Paciente">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="idOdon" name="idOdon" 
                placeholder="Id Odontologo">
        </div>            
        <div class="col-sm-6 mb-3 ">
            <input type="date" class="form-control form-control-user" id="fechaTurno" name="fechaTurno"
                placeholder="Fecha Turno">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="time" class="form-control form-control-user" id="horaTurno" name="horaTurno"
                placeholder="Hora Turno">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="afeccion" name="afeccion"
                placeholder="Afeccion">
        </div>        
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Crear Turno
    </button>
    <hr>
    
</form>


<%@ include file="components/bodyfinal.jsp"%>
