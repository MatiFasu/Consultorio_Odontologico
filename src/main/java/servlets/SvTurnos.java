
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
import logica.Turno;

@WebServlet(name = "SvTurnos", urlPatterns = {"/SvTurnos"})
public class SvTurnos extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Turno> turnos = new ArrayList<>();
        turnos = control.traerTurnos();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("turnos", turnos);

        response.sendRedirect("verTurnos.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_pac = Integer.parseInt(request.getParameter("idPac"));
        int id_odon = Integer.parseInt(request.getParameter("idOdon"));
        String fechaTurno = request.getParameter("fechaTurno");
        String horaTurno = request.getParameter("horaTurno");
        String afeccion = request.getParameter("afeccion");

        if( control.validarTurno(fechaTurno, horaTurno, id_odon) ) {
            control.crearTurno(id_pac, id_odon, fechaTurno, horaTurno, afeccion);
            response.sendRedirect("pantallaAdmin.jsp");
        } else {
            String turnoDisponible = "El odontologo tiene ocupado ese horario";
            HttpSession misesion = request.getSession();
            misesion.setAttribute("turnoD", turnoDisponible);
            response.sendRedirect("altaTurnos.jsp");
        }
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
