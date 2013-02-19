
package Dao;

import Model.Usuario;
import java.util.List;


public class DaoUsuario extends Dao<Usuario>{

    public DaoUsuario() {
        super(Usuario.class);
    }        
    
    public Usuario autenticaLogin(String senha, String login){        
        return (Usuario) em.createQuery("select e from Usuario e where e.login = '"+login+"' and e.senha = '"+senha+"'").getSingleResult();
    }

    public Usuario repete(String login){
        return (Usuario) em.createQuery("select e from Usuario e where e.login = '"+login+"'").getSingleResult();
    }
    
    public List<Usuario> listByLogin(String login) {
        return em.createQuery("SELECT e FROM Usuario e WHERE e.login LIKE '"+login+"'").getResultList();
    }
    
}
