/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.TabelaScoreZ;
import java.util.List;

/**
 *
 * @author Guilherme
 */
public class DaoTabelaScoreZ extends Dao<TabelaScoreZ> {
    public DaoTabelaScoreZ() {
        super(TabelaScoreZ.class);
    }
    
    public TabelaScoreZ GetByGraficoSexoMes(String grafico,String sexo, int mes) {
        return (TabelaScoreZ) em.createQuery("SELECT e FROM TabelaScoreZ e where e.meses="+mes+" AND e.sexo like '%"+sexo+"%' AND e.grafico like '%"+grafico+"%'").getSingleResult();
    }
    
    public double desvioPadraoByGrafico(String grafico){     
        int count = em.createQuery("select e.primeiro from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getResultList().size();
        double primeiro = ((Double)em.createNativeQuery("select sum(e.primeiro) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        double segundo = ((Double)em.createNativeQuery("select sum(e.segundo) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        double terceiro = ((Double)em.createNativeQuery("select sum(e.terceiro) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        double quarto = ((Double)em.createNativeQuery("select sum(e.quarto) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        double quinto = ((Double)em.createNativeQuery("select sum(e.quinto) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        double sexto = ((Double)em.createNativeQuery("select sum(e.sexto) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        double setimo = ((Double)em.createNativeQuery("select sum(e.setimo) from TabelaScoreZ e where e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getSingleResult())/count;
        
        double soma = 0;
        List<TabelaScoreZ> primeiros = em.createQuery("select e from TabelaScoreZ e where  e.sexo='masculino' AND e.grafico like '%"+grafico+"%'").getResultList();
        for (TabelaScoreZ p : primeiros){
            soma += (p.getPrimeiro()-primeiro)*(p.getPrimeiro()-primeiro);
            soma += (p.getSegundo()-segundo)*(p.getSegundo()-segundo);
            soma += (p.getTerceiro()-terceiro)*(p.getTerceiro()-terceiro);
            soma += (p.getQuarto()-quarto)*(p.getQuarto()-quarto);
            soma += (p.getQuinto()-quinto)*(p.getQuinto()-quinto);
            soma += (p.getSexto()-sexto)*(p.getSexto()-sexto);
            soma += (p.getSetimo()-setimo)*(p.getSetimo()-setimo);
        }
        soma = 1/((double)count)*soma;
        return soma/7;
    }
    
}
