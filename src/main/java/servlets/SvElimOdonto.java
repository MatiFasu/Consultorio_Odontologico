
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Odontologo;


@WebServlet(name = "SvElimOdonto", urlPatterns = {"/SvElimOdonto"})
public class SvElimOdonto extends HttpServlet {

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
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        control.eliminarOdontologo(id);
        
        Odontologo o = control.traerOdontologo(id);

        control.borrarUsuario(o.getUnUsuario().getId_usuario());
        
        control.borrarHorario(o.getUnHorario().getId_horario());
        
        control.borrarTurnos(o.getTurnos());
        
        response.sendRedirect("SvOdontologos");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
