
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

@WebServlet(name = "SvValidarPaciente", urlPatterns = {"/SvValidarPaciente"})
public class SvValidarPaciente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        
        Paciente p = control.traerPacienteDni(dni);
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("paciente", p);
        
        if( p!=null ) {
            response.sendRedirect("altaTurnosPacExistentes.jsp");
        } else {
            String valP = "El paciente no existe";
            misesion.setAttribute("valP", valP);
            response.sendRedirect("validarPaciente.jsp");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
