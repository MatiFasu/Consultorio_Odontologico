<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>
    
<% 
    Paciente pac = (Paciente) request.getSession().getAttribute("paciente"); 
    Controladora control = new Controladora();
    List<Odontologo> odontologos = control.traerOdontologos();
    String turnoD =  (String) request.getSession().getAttribute("turnoD"); 
%>

<h1>Alta Turnos</h1>
<p><%= turnoD %></p>

<select>
   <% for(Odontologo o: odontologos) { %>
  <option><%= o.getId() + " " + o.getNombre() %></option>
   <% } %>
</select>

<br><br>
<form class="user" action="SvTurnos" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="idPac" value="<%= pac.getId() %>"
                placeholder="Id Paciente">
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