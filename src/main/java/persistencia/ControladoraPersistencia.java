
package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Turno;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    
    HorarioJpaController horaJpa = new HorarioJpaController();
    OdontologoJpaController odontoJpa = new OdontologoJpaController();
    PacienteJpaController pacienteJpa = new PacienteJpaController();
    PersonaJpaController personaJpa = new PersonaJpaController();
    ResponsableJpaController responJpa = new ResponsableJpaController();
    SecretarioJpaController secreJpa = new SecretarioJpaController();
    TurnoJpaController turnoJpa = new TurnoJpaController();
    UsuarioJpaController usuJpa = new UsuarioJpaController();

    public void crearUsuario(Usuario usu) {
        usuJpa.create(usu);
    }

    public void crearOdontologo(Odontologo odon) {
        odontoJpa.create(odon);
    }

    public void crearPaciente(Paciente p) {
        pacienteJpa.create(p);
    }

    public List<Usuario> traerUsuarios() {
        return usuJpa.findUsuarioEntities();
    }

    public List<Odontologo> traerOdontologos() {
        return odontoJpa.findOdontologoEntities();
    }

    public List<Paciente> traerPacientes() {
        return pacienteJpa.findPacienteEntities();
    }

    public void crearHorario(Horario h) {
        horaJpa.create(h);
    }

    public void crearTurno(Turno t) {
        
    }

    public void actualizarOdontologo(Odontologo o) {
        try {
            odontoJpa.edit(o);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> traerTurnos() {
        return turnoJpa.findTurnoEntities();
    }

    public void crearResponsable(Responsable r) {
        responJpa.create(r);
    }

    public Odontologo traerOdontologo(int parseInt) {
        return odontoJpa.findOdontologo(parseInt);
    }

    public void borrarUsuario(int id) {
        try {
            usuJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuario(int id) {
        return usuJpa.findUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuJpa.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarOdontologo(int id) {
        try {
            odontoJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarOdontologo(Odontologo odon) {
        try {
            odontoJpa.edit(odon);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarPaciente(int id) {
        try {
            pacienteJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Paciente traerPaciente(int id) {
        return pacienteJpa.findPaciente(id);
    }

    public void borrarHorario(int id_horario) {
        try {
            horaJpa.destroy(id_horario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarPaciente(Paciente pac) {
        try {
            pacienteJpa.edit(pac);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarTurno(int id_turno) {
        try {
            turnoJpa.destroy(id_turno);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarTurno(Turno turno) {
        try {
            turnoJpa.edit(turno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Turno traerTurno(int id) {
        return turnoJpa.findTurno(id);
    }

    public void borrarResponsable(int id) {
        try {
            responJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
