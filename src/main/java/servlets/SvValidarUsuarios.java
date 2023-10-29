
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
import logica.Usuario;


@WebServlet(name = "SvValidarUsuarios", urlPatterns = {"/SvValidarUsuarios"})
public class SvValidarUsuarios extends HttpServlet {
    
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
        
        String nombreUsu = request.getParameter("user");
        String contrasenia = request.getParameter("pass");
        
        Usuario usu = control.validarUsuario(nombreUsu, contrasenia);
        
        if( usu != null ) {
            HttpSession misesion = request.getSession(true);
            misesion.setAttribute("nombreUsu", nombreUsu);
            
            String rol = usu.getRol();

            if( rol.equals("admin")) {
                response.sendRedirect("pantallaAdmin.jsp");
            }
            if( rol.equals("odonto")) {
                HttpSession misesion2 = request.getSession(true);
                misesion2.setAttribute("usuario", usu);
                response.sendRedirect("pantallaOdontologo.jsp");
            }
        }
        else {
            response.sendRedirect("loginError.jsp");
        }
 
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
