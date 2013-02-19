package Dao;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import Model.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author JoaoLuiz
 */
public class Dao<T> {
    protected EntityManager em =
            Persistence.createEntityManagerFactory("UP").createEntityManager();
    private Class classe;

    public Dao(Class classe) {
        this.classe = classe;
    }

    public void insert(T entidade) {
        em.getTransaction().begin();
        em.persist(entidade);
        em.getTransaction().commit();
    }

    public void update(T entidade) {
        em.getTransaction().begin();
        em.merge(entidade);
        em.getTransaction().commit();
    }

    public void remove(int id) {
        T entidade = get(id);
        if (entidade == null) {
            return;
        }
        em.getTransaction().begin();
        em.remove(entidade);
        em.getTransaction().commit();
    }

    public T get(int id) {
        return (T)em.find(classe, id);
    }

    public List<T> list() {
        return em.createQuery("SELECT e FROM "+classe.getSimpleName()+" e ").getResultList();
    }

    // pesquisas especificas
    public List<T> listByNome(String nome) {
        return em.createQuery("SELECT e FROM "+classe.getSimpleName()+" e WHERE e.nome LIKE '%"+nome+"%'").getResultList();
    }
    
    public List<T> listByUsuario(Usuario usuario) {
        System.out.print("SELECT e FROM "+classe.getSimpleName()+" e WHERE e.usuario.id ="+usuario.getId());
        return em.createQuery("SELECT e FROM "+classe.getSimpleName()+" e WHERE e.usuario.id ="+usuario.getId()).getResultList();
    }
    
    public List<T> listById(int id) {
        return em.createQuery("SELECT e FROM "+classe.getSimpleName()+" e where e.paciente.id="+id+" order by e.idade desc").getResultList();
    }
    public List<T> listByIdade() {
        return em.createQuery("SELECT e FROM "+classe.getSimpleName()+" e order by e.idade").getResultList();
    }    
    public List<T> listByIdPag(int id, int pag, int elementos){
        List<T> pagina = em.createQuery("SELECT e FROM "+classe.getSimpleName()+" e where e.paciente.id="+id+" order by e.idade desc").getResultList();
        List<T> paginado = new ArrayList<T>();
        for (int i = elementos*(pag-1); i<=pag*elementos-1; i++){
            if (pagina.size()>i){
                paginado.add(pagina.get(i));
            }
        }
        return paginado;
    }
}
