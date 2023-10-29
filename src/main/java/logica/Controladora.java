
package logica;

import static java.lang.String.format;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;


public class Controladora {
    
    ControladoraPersistencia controlPersis;

    public Controladora() {
        controlPersis = new ControladoraPersistencia();
    }
    
    public void crearUsuario(String nombreUsuario, String contrasenia, String rol) {
        Usuario usu = new Usuario();
        usu.setUsuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        controlPersis.crearUsuario(usu);
    }

    public void crearOdontologo(String dni, String nombre, String apellido, String telefono, 
            String direccion, String fechaNac, String especialidad, String nombreUsu, String pass, String rol,
            String hor_ini, String hor_final) {
        
        Date date = convertirStringADate(fechaNac);
        
        Usuario u = new Usuario();
        u.setUsuario(nombreUsu);
        u.setContrasenia(pass);
        u.setRol(rol);
        controlPersis.crearUsuario(u);
        
        Horario h = new Horario();
        h.setHorario_inicio(hor_ini);
        h.setHorario_final(hor_final);
        controlPersis.crearHorario(h);
        
        Odontologo odon = new Odontologo();
        odon.setDni(dni);
        odon.setNombre(nombre);
        odon.setApellido(apellido);
        odon.setDireccion(direccion);
        odon.setTelefono(telefono);
        odon.setFecha_nac(date);
        odon.setEspecialidad(especialidad);
        odon.setTurnos(null);
        odon.setUnHorario(h);
        odon.setUnUsuario(u);
        controlPersis.crearOdontologo(odon);     
    }
    
    public void crearPaciente(String dni, String nombre, String apellido, String telefono, String direccion, 
            String fechaNac, String obraSocial, String tipoSangre) {
        
        Date date = convertirStringADate(fechaNac);

        boolean tieneOS; 
        
        if(obraSocial.equals("true")) {
            tieneOS = true;
        } else {
            tieneOS = false;
        }
        
        Paciente p = new Paciente();
        p.setDni(dni);
        p.setNombre(nombre);
        p.setApellido(apellido);
        p.setDireccion(direccion);
        p.setTelefono(telefono);
        p.setFecha_nac(date);
        p.setTiene_OS(tieneOS);
        p.setTipoSangre(tipoSangre);
        p.setTurnos(null);
        p.setUnResponsable(null);
        controlPersis.crearPaciente(p);
    }

    public List<Usuario> traerUsuarios() {
        return controlPersis.traerUsuarios();
    }

    public List<Odontologo> traerOdontologos() {
        return controlPersis.traerOdontologos();
    }

    public List<Paciente> traerPacientes() {
        return controlPersis.traerPacientes();
    }

    public Usuario validarUsuario(String nombreUsu, String contrasenia) {
        Usuario usu = null;
        
        List<Usuario> usuarios = controlPersis.traerUsuarios();
        for(Usuario u: usuarios) {
            if( u.getUsuario().equals(nombreUsu)) {
                if( u.getContrasenia().equals(contrasenia)) {
                    usu = u;
                    return usu;
                } else {
                    usu = null;
                    return usu;
                }
            } else {
                usu = null;
            }
        }

        return usu;
    }

    public Odontologo traerOdontologo(String nombreUsu) {
        
        Odontologo odon = null;
        
        List<Odontologo> odontologos = controlPersis.traerOdontologos();
        for(Odontologo o : odontologos) {
            if( o.getUnUsuario().getUsuario().equals(nombreUsu) ) {
                odon = o;
            }
        }
        
        return odon;
    }

    public void crearTurno(int idPac, int idOdon, String fechaTurno, String horaTurno, String afeccion) {
        
        Date fecTurno = convertirStringADate(fechaTurno);
        
        Paciente p = controlPersis.traerPaciente(idPac);
        
        Odontologo o = controlPersis.traerOdontologo(idOdon);
        
        Turno turno = new Turno();
        turno.setFecha_turno(fecTurno);
        turno.setHora_turno(horaTurno);
        turno.setAfeccion(afeccion);
        turno.setOdonto(o);
        turno.setPacien(p);
        
        List<Turno> turnosP = p.getTurnos();
        turnosP.add(turno);
        
        p.setTurnos(turnosP);
        o.setTurnos(turnosP);
        
        controlPersis.editarOdontologo(o);
        
        controlPersis.crearTurno(turno);
    }

    public List<Turno> traerTurnos() {
        return controlPersis.traerTurnos();
    }

    public void crearPacienteConResponsable(String dni, String nombre, String apellido, String telefono, String direccion, 
            String fechaNac, String obraSocial, String tipoSangre, String dniResp, String nombreResp, 
            String apellidoResp, String telefonoResp, String direccionResp, String fechaNacResp) {
        
        Date fechaNacPaciente = convertirStringADate(fechaNac); 
        Date fechaNacR = convertirStringADate(fechaNacResp); 
        
        boolean tieneOS; 
        
        if(obraSocial.equals("true")) {
            tieneOS = true;
        } else {
            tieneOS = false;
        }
        
        Responsable r = new Responsable();
        r.setDni(dniResp);
        r.setNombre(nombreResp);
        r.setApellido(apellidoResp);
        r.setTelefono(telefonoResp);
        r.setDireccion(direccionResp);
        r.setFecha_nac(fechaNacR);
        controlPersis.crearResponsable(r);

        Paciente p = new Paciente();
        p.setDni(dni);
        p.setNombre(nombre);
        p.setApellido(apellido);
        p.setDireccion(direccion);
        p.setTelefono(telefono);
        p.setFecha_nac(fechaNacPaciente);
        p.setTiene_OS(tieneOS);
        p.setTipoSangre(tipoSangre);
        p.setTurnos(null);
        p.setUnResponsable(r);
        controlPersis.crearPaciente(p);
        
        
    }

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

    public Paciente traerPacienteDni(String dni) {
        Paciente pac = null;
        
        List<Paciente> pacientes = controlPersis.traerPacientes();
        for(Paciente p: pacientes) {
            if( p.getDni().equals(dni)) {
                pac = p;
            }
        }
        
        return pac;
    }

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public void eliminarOdontologo(int id) {
        controlPersis.borrarOdontologo(id);
    }

    public Odontologo traerOdontologo(int id) {
        return controlPersis.traerOdontologo(id);
    }

    public void editarOdontologo(Odontologo odon) {
        controlPersis.editarOdontologo(odon);
    }

    public void eliminarPaciente(int id) {
        controlPersis.eliminarPaciente(id);
    }

    public Paciente traerPaciente(int id) {
        return controlPersis.traerPaciente(id);
    }

    public void borrarHorario(int id_horario) {
        controlPersis.borrarHorario(id_horario);
    }

    public void editarPaciente(Paciente pac) {
        controlPersis.editarPaciente(pac);
    }

    public void borrarTurnos(List<Turno> turnos) {
        for(Turno t: turnos) {
            controlPersis.borrarTurno(t.getId_turno());
        }
    }
    
    public Odontologo traerOdontologo(Usuario usu) {
        Odontologo odon = null;
        List<Odontologo> odontologos = controlPersis.traerOdontologos();
        for(Odontologo o: odontologos) {
            if( o.getUnUsuario().getId_usuario()==usu.getId_usuario()) {
                odon = o;
            }
        }
        
        return odon;
    }

    public void borrarTurno(int idTurno) {
        controlPersis.borrarTurno(idTurno);
    }

    public Turno traerTurno(int id) {
        return controlPersis.traerTurno(id);
    }

    public void editarTurno(Turno turno) {
        controlPersis.editarTurno(turno);
    }

    public void borrarResponsable(int id) {
        controlPersis.borrarResponsable(id);
    }

    public boolean validarTurno(String fechaTurno, String horaTurno, int id_odon) {
        
        boolean validarTurno = true;
        
        Date fechaTur = convertirStringADate(fechaTurno);
        
        Odontologo o = controlPersis.traerOdontologo(id_odon);
        
        for(Turno t: o.getTurnos()) {
            if( t.getFecha_turno().equals(fechaTur) && t.getHora_turno().equals(horaTurno)) {
                return false;
            }
        }
        
        return validarTurno;
    }
    
}
