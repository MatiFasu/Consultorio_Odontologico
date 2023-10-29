
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Pacientes</h1>
                    <p class="mb-4">Tabla para visualizar a los pacientes</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tabla</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Telefono</th>
                                            <th>Direccion</th>
                                            <th>Fecha Nac</th>
                                            <th>Obra Social</th>
                                            <th>Tipo de Sangre</th>
                                            <th>Turno</th>
                                            <th>Un Responsable</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Telefono</th>
                                            <th>Direccion</th>
                                            <th>Fecha Nac</th>
                                            <th>Obra Social</th>
                                            <th>Tipo de Sangre</th>
                                            <th>Turno</th>
                                            <th>Un Responsable</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                          List<Paciente> pacientes = (List) request.getSession().getAttribute("pacientes");
                                          for(Paciente p: pacientes) {
                                          String obraSocial = (p.isTiene_OS()==true)? "Si": "No";
                                          SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                          String fechaNac = sdf.format(p.getFecha_nac());
                                        %>
                                        <tr>
                                            <td><%= p.getDni() %></td>
                                            <td><%= p.getNombre() %></td>
                                            <td><%= p.getApellido() %></td>
                                            <td><%= p.getTelefono() %></td>
                                            <td><%= p.getDireccion() %></td>
                                            <td><%= fechaNac%></td>
                                            <td><%= obraSocial%></td>
                                            <td><%= p.getTipoSangre() %></td>
                                            <td> <a href="verTurnos.jsp"> Turnos </a> </td>
                                            <td><%= (p.getUnResponsable()==null)?"Sin Responsable":p.getUnResponsable()%></td>
                                            
                                            <td style="display: flex; width: 230px">
                                                <form name="eliminar" action="SvElimPaciente" method="POST">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px ">
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= p.getId() %>">
                                                </form>
                                                <form name="editar" action="SvEditPaciente" method="GET">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px ">
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= p.getId() %>">
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

            </div>
            <!-- End of Main Content -->


<%@ include file="components/bodyfinal.jsp"%>

