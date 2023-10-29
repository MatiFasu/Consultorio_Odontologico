
package logica;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Responsable extends Persona {
    
    
    private String tipoResponsabilidad;

    public Responsable() {
    }

    public Responsable(String tipoResponsabilidad, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.tipoResponsabilidad = tipoResponsabilidad;
    }

    public String getTipoResponsabilidad() {
        return tipoResponsabilidad;
    }

    public void setTipoResponsabilidad(String tipoResponsabilidad) {
        this.tipoResponsabilidad = tipoResponsabilidad;
    }
    
    
    
}
