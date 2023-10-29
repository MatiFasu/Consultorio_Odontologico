

<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
    String s = (String) request.getSession().getAttribute("valP");
%>

<h1>Validar Paciente</h1>

<p style="color: red"><%= s %></p>

<form class="user" action="SvValidarPaciente" method="POST">
    <div class="form-group col">
        <div class="col-sm-6 mb-3 ">
            <input type="text" class="form-control form-control-user" id="dni" name="dni" "
                placeholder="Dni">
        </div>
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Validar Paciente
    </button>
    <hr>
    
</form>


<%@ include file="components/bodyfinal.jsp"%>
