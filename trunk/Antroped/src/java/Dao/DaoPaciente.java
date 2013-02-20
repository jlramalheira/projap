/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Paciente;
import Model.Usuario;
import java.util.List;

/**
 *
 * @author JoaoLuiz
 */
public class DaoPaciente extends Dao<Paciente> {

    public DaoPaciente() {
        super(Paciente.class);
    }
    
    public List<Paciente> listByNomeUsuario(String nome, Usuario usuario) {
        return em.createQuery("SELECT e FROM Paciente e WHERE e.nome LIKE '%"+nome+"' and e.usuario.id ="+usuario.getId()).getResultList();
    }
}
