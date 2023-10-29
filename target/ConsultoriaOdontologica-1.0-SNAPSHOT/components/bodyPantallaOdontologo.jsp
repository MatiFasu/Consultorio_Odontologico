

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!<!-- Validacion Sesion -->
    <%  
        HttpSession misession = request.getSession();
        String nombreUsu = (String) request.getSession().getAttribute("nombreUsu");
        if(nombreUsu==null) {
            response.sendRedirect("sinLogin.jsp");
        } 
    %>

<body id="page-top">
    
    <%
        Usuario usu = (Usuario) request.getSession().getAttribute("usuario");
        Controladora control = new Controladora();
        Odontologo o = control.traerOdontologo(usu);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaNac2 = sdf.format(o.getFecha_nac());
    %>
    
    
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="pantallaOdontologo.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-regular fa-tooth"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Consultorio Odontológico</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="pantallaOdontologo.jsp">
                    <i class="fas fa-solid fa-bars"></i>
                    <span>Menú</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Gestión
            </div>

            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTurnos"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-list"></i>
                    <span>Turnos</span>
                </a>
                <div id="collapseTurnos" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <form action="SvTurnosOdontologo" method="GET">
                            <button class="btn collapse-item" type="submit"> Ver Turnos</button>
                            <input type="hidden" name="id" value="<%= o.getId() %>">
                        </form>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDatos"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-hospital-user"></i>
                    <span>Mis Datos</span>
                </a>
                <div id="collapseDatos" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <form action="SvDatosOdontologo" method="GET">
                            <button class="btn collapse-item" type="submit"> Mis Datos</button>
                            <input type="hidden" name="id" value="<%= o.getId() %>">
                        </form>
                    </div>
                </div>
            </li>

            
            <!-- Divider -->
            <hr class="sidebar-divider">
  
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">    

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= o.getNombre() %></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-table align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Clínica Odontológica</h1>
                        
                        
                        </div>
                    </div>
