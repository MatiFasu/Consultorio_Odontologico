
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
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;

@WebServlet(name = "SvEditTurno", urlPatterns = {"/SvEditTurno"})
public class SvEditTurno extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idTurno"));
        
        Turno turno = control.traerTurno(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("turno", turno);
        
        response.sendRedirect("editarTurno.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_pac = Integer.parseInt(request.getParameter("idPac"));
        int id_odon = Integer.parseInt(request.getParameter("idOdon"));
        String fechaTurno = request.getParameter("fechaTurno");
        String horaTurno = request.getParameter("horaTurno");
        String afeccion = request.getParameter("afeccion");
        
        Odontologo o = control.traerOdontologo(id_odon);
        Paciente p = control.traerPaciente(id_pac);
        
        Date fecTurno = convertirStringADate(fechaTurno);
        
        Turno turno = (Turno) request.getSession().getAttribute("turno");
        turno.setFecha_turno(fecTurno);
        turno.setHora_turno(horaTurno);
        turno.setAfeccion(afeccion);
        turno.setOdonto(o);
        turno.setPacien(p);
        
        control.editarTurno(turno);
        
        response.sendRedirect("SvTurnos");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Date convertirStringADate(String fechaTurno) {
        Date date = null;
        String pattern = "yyyy-MM-dd"; 
        
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            date = dateFormat.parse(fechaTurno);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        return date;
    }

}
