
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Odontologos</h1>
                    <p class="mb-4">Tabla para visualizar a los odontologos</p>

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
                                            <th>Id</th>
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Telefono</th>
                                            <th>Direccion</th>
                                            <th>Fecha Nac</th>
                                            <th>Especialidad</th>
                                            <th>Usuario</th>
                                            <th>Hora Inicial</th>
                                            <th>Hora Final</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Dni</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Telefono</th>
                                            <th>Direccion</th>
                                            <th>Fecha Nac</th>
                                            <th>Especialidad</th>
                                            <th>Usuario</th>
                                            <th>Hora Inicial</th>
                                            <th>Hora Final</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%                                  
                                            List<Odontologo> odontologos = (List) request.getSession().getAttribute("odontologos");
                                            for(Odontologo o: odontologos) {
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                            String fechaNac = sdf.format(o.getFecha_nac());
                                        %>
                                        <tr>
                                            <td><%= o.getId() %></td>
                                            <td><%= o.getDni() %></td>
                                            <td><%= o.getNombre() %></td>
                                            <td><%= o.getApellido() %></td>
                                            <td><%= o.getTelefono() %></td>
                                            <td><%= o.getDireccion() %></td>
                                            <td><%= fechaNac %></td>
                                            <td><%= o.getEspecialidad() %></td>
                                            <td><%= o.getUnUsuario().getUsuario()%></td>
                                            <td><%= o.getUnHorario().getHorario_inicio() %></td>
                                            <td><%= o.getUnHorario().getHorario_final()%></td>
                                            
                                            <td style="display: flex; width: 230px">
                                                <form name="eliminar" action="SvElimOdonto" method="POST">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px ">
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= o.getId() %>">
                                                </form>
                                                <form name="editar" action="SvEditOdonto" method="GET">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px ">
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= o.getId() %>">
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

