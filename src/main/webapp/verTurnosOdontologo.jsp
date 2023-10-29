

<%@page import="java.util.List"%>
<%@page import="logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">        
    
<%@ include file="components/header.jsp"%>

<%@ include file="components/bodyPantallaOdontologo.jsp"%>

<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Nombre Paciente</th>
                                            <th>Dni Paciente</th>
                                            <th>Fecha Turno</th>
                                            <th>Hora Turno</th>
                                            <th>Afeccion</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Nombre Paciente</th>
                                            <th>Dni Paciente</th>
                                            <th>Fecha Turno</th>
                                            <th>Hora Turno</th>
                                            <th>Afeccion</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                          Odontologo od = (Odontologo) request.getSession().getAttribute("odontologo");
                                          List<Turno> turnos = control.traerTurnos();
                                          for(Turno t: turnos) {
                                            if( t.getOdonto().getId()==od.getId()) {
                                            SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
                                            String fechaTurno = sdf2.format(t.getFecha_turno());
                                        %>
                                        <tr>
                                            <td><%= t.getPacien().getNombre() %></td>
                                            <td><%= t.getPacien().getDni() %></td>
                                            <td><%=  fechaTurno %></td>
                                            <td><%= t.getHora_turno() %></td>
                                            <td><%= t.getAfeccion() %></td>
                                        </tr>
                                        <% } %>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->



<%@ include file="components/bodyfinal.jsp"%>








