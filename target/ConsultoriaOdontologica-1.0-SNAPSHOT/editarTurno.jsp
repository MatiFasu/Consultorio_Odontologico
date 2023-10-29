<%@page import="logica.Turno"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyPantallaOdontologo.jsp"%>
    
<% 
    Turno turno = (Turno) request.getSession().getAttribute("turno"); 
    SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
    String fechaTurno = sdf3.format(o.getFecha_nac());
%>

<h1 style="margin-left: 50px">Editar Turno</h1>

<br>
<form class="user" action="SvEditTurno" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="hidden" class="form-control form-control-user" id="idPac" name="idPac" value="<%= turno.getPacien().getId() %>"
                placeholder="Id Paciente">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="hidden" class="form-control form-control-user" id="idOdon" name="idOdon" value="<%= turno.getOdonto().getId() %>"
                placeholder="Id Odontologo">
        </div>            
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="fechaTurno" name="fechaTurno" value="<%= fechaTurno %>"
                placeholder="Fecha Turno">
        </div>
        <div class="col-sm-6 mb-3 ">
            <input type="time" class="form-control form-control-user" id="horaTurno" name="horaTurno" value="<%= turno.getHora_turno() %>"
                placeholder="Hora Turno">
        </div>
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="afeccion" name="afeccion" value="<%= turno.getAfeccion() %>"
                placeholder="Afeccion">
        </div>        
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Editar Turno
    </button>
    <hr>
    
</form>



<%@ include file="components/bodyfinal.jsp"%>