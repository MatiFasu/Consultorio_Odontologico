
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;


@WebServlet(name = "SvOdontologos", urlPatterns = {"/SvOdontologos"})
public class SvOdontologos extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Odontologo> odontologos = new ArrayList<>();
        odontologos = control.traerOdontologos();
          
        HttpSession misesion = request.getSession();
        misesion.setAttribute("odontologos", odontologos);
        
        response.sendRedirect("verOdontologos.jsp");
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNac = request.getParameter("fechaNac");
        String especialidad = request.getParameter("especialidad");
        
        String nombreUsu = request.getParameter("user");
        String contrasenia = request.getParameter("pass");
        String rol = request.getParameter("rol");
        
        String hor_ini = request.getParameter("hor_ini");
        String hor_final = request.getParameter("hor_final");
        
        control.crearOdontologo(dni, nombre, apellido, telefono, direccion, fechaNac, 
                especialidad, nombreUsu, contrasenia, rol, hor_ini, hor_final);
        
        response.sendRedirect("pantallaAdmin.jsp");
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
