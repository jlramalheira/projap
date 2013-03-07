/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.TabelaPrevisaoAltura;

/**
 *
 * @author JoaoLuiz
 */
public class DaoTabelaPrevisaoAltura extends Dao<TabelaPrevisaoAltura> {

    public DaoTabelaPrevisaoAltura() {
        super(TabelaPrevisaoAltura.class);
    }

    public TabelaPrevisaoAltura GetByGraficoSexoMes(String sexo, int mes, int anos) {
        return (TabelaPrevisaoAltura) em.createQuery("SELECT e FROM TabelaPrevisaoAltura e where e.meses=" + mes + " AND e.anos=" + anos + " AND e.sexo like '%" + sexo + "%'").getSingleResult();
    }
}
