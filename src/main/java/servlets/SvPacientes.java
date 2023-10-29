
package servlets;

import static java.awt.SystemColor.control;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

@WebServlet(name = "SvPacientes", urlPatterns = {"/SvPacientes"})
public class SvPacientes extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Paciente> pacientes = new ArrayList<>();
        pacientes = control.traerPacientes();
          
        HttpSession misesion = request.getSession();
        misesion.setAttribute("pacientes", pacientes);
        
        response.sendRedirect("verPacientes.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fechaNac = request.getParameter("fechaNac");
        
        String mayor = esMayor(fechaNac);
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String obraSocial = request.getParameter("obraSocial");
        String tipoSangre = request.getParameter("tipoSangre");
        
        if( mayor.equals("true") ) {
            control.crearPaciente(dni, nombre, apellido, telefono, direccion, fechaNac, obraSocial, tipoSangre);
            Paciente p = control.traerPacienteDni(dni);
       
            HttpSession misesion = request.getSession();
            misesion.setAttribute("paciente", p);
            
            response.sendRedirect("altaTurnos.jsp");
        }
        
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String esMayor(String fechaNac) {
        
        if( fechaNac.equals("") ) {
            return "false";
        }
        
        int anio = Integer.parseInt(fechaNac.substring(0, 4));
        int mes = Integer.parseInt(fechaNac.substring(5, 7));
        int dia = Integer.parseInt(fechaNac.substring(8, 10));

        // Fecha de nacimiento (ejemplo: 1990-06-15)
        LocalDate fechaNacimiento = LocalDate.of(anio,mes,dia);

        // Obtener la fecha actual
        LocalDate fechaActual = LocalDate.now();

        // Calcular la diferencia entre la fecha actual y la fecha de nacimiento
        Period periodo = Period.between(fechaNacimiento, fechaActual);

        // Verificar si la persona es mayor de edad (18 años o más)
        boolean esMayorDeEdad = periodo.getYears() >= 18;

        // Mostrar el resultado
        if (esMayorDeEdad) {
            return "true";
        } else {
            return "false";
        }
        
    }
    
    
}
