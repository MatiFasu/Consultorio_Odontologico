

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>
 
<h1>Ver Turnos</h1>

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
                                            <th>Id Odontologo</th>
                                            <th>Nombre Odontologo</th>
                                            <th>Dni</th>
                                            <th>Nombre Paciente</th>
                                            <th>Fecha Turno</th>
                                            <th>Hora Turno</th>
                                            <th>Afeccion</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id Odontologo</th>
                                            <th>Nombre Odontologo</th>
                                            <th>Dni</th>
                                            <th>Nombre Paciente</th>
                                            <th>Fecha Turno</th>
                                            <th>Hora Turno</th>
                                            <th>Afeccion</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                          List<Turno> turnos = (List) request.getSession().getAttribute("turnos");
                                          for(Turno t: turnos) {
                                          SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                          String fechaNac = sdf.format(t.getFecha_turno());
                                        %>
                                        <tr>
                                            <td><%= t.getOdonto().getId() %></td>
                                            <td><%= t.getOdonto().getNombre() %></td>
                                            <td><%= t.getPacien().getDni() %></td>
                                            <td><%= t.getPacien().getNombre() %></td>
                                            <td><%= fechaNac %></td>
                                            <td><%= t.getHora_turno() %></td>
                                            <td><%= t.getAfeccion() %></td>
                                            
                                            <td style="display: flex; width: 230px">
                                                <form name="eliminar" action="SvElimTurno" method="POST">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px ">
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= t.getId_turno() %>">
                                                </form>
                                                <form name="editar" action="SvEditTurno" method="GET">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px ">
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= t.getId_turno() %>">
                                                </form>
                                            </td>
                                            
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->



<%@ include file="components/bodyfinal.jsp"%>