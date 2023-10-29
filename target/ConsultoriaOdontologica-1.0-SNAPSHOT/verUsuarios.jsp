
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Usuarios</h1>
                    <p class="mb-4">Tabla para visualizar a los usuarios</p>

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
                                            <th>Nombre de Usuario</th>
                                            <th>Rol</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre de Usuario</th>
                                            <th>Rol</th>
                                            <th style="width: 210px">Accion</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%                                  
                                            List<Usuario> usuarios = (List) request.getSession().getAttribute("usuarios");
                                            for(Usuario u: usuarios) { %>
                                        <tr>
                                            <td><%= u.getId_usuario() %></td>
                                            <td><%= u.getUsuario()%></td>
                                            <td><%= u.getRol() %></td>
                                            
                                            <td style="display: flex; width: 230px">
                                                <form name="eliminar" action="SvElimUsuarios" method="POST">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: red; margin-right: 5px ">
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= u.getId_usuario() %>">
                                                </form>
                                                <form name="editar" action="SvEditUsuarios" method="GET">
                                                    <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px ">
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%= u.getId_usuario() %>">
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