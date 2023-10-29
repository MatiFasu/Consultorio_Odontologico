/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import logica.Horario;
import logica.Odontologo;


@WebServlet(name = "SvEditOdonto", urlPatterns = {"/SvEditOdonto"})
public class SvEditOdonto extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Odontologo odon = control.traerOdontologo(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("odonEditar", odon);
        
        response.sendRedirect("editarOdontologo.jsp");
        
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
        String horaInicio = request.getParameter("hor_ini");
        String horaFinal = request.getParameter("hor_final");
        
        Date date = convertirStringADate(fechaNac);
        
        Odontologo odon = (Odontologo) request.getSession().getAttribute("odonEditar");
        Horario h = odon.getUnHorario();
        h.setHorario_inicio(horaInicio);
        h.setHorario_final(horaFinal);
        
        odon.setDni(dni);
        odon.setNombre(nombre);
        odon.setApellido(apellido);
        odon.setTelefono(telefono);
        odon.setDireccion(direccion);
        odon.setFecha_nac(date);
        odon.setEspecialidad(especialidad);
        odon.setUnHorario(h);
        
        control.editarOdontologo(odon);
        
        response.sendRedirect("SvOdontologos");
        
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
        
        return date;
    }

}
