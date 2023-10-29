
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

/**
 *
 * @author matia
 */
@WebServlet(name = "SvEditPaciente", urlPatterns = {"/SvEditPaciente"})
public class SvEditPaciente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Paciente pac = control.traerPaciente(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("pacEditar", pac);
        
        response.sendRedirect("editarPaciente.jsp");
        
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
        String tipoSangre = request.getParameter("tipoSangre");
        String obraSocial = request.getParameter("obraSocial");
        
        boolean os = (obraSocial.equals("true"))? true: false;
        
        Date date = convertirStringADate(fechaNac);
        
        Paciente pac = (Paciente) request.getSession().getAttribute("pacEditar");
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        pac.setFecha_nac(date);
        pac.setTipoSangre(tipoSangre);
        pac.setTiene_OS(os);
        
        control.editarPaciente(pac);
        
        response.sendRedirect("SvPacientes");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Date convertirStringADate(String fechaNac) {
        Date date = null;
        String pattern = "yyyy-MM-dd"; 
        
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            date = dateFormat.parse(fechaNac);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        return date;    }

}
