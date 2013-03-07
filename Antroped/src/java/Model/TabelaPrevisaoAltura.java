/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author JoaoLuiz
 */
@Entity
public class TabelaPrevisaoAltura implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String sexo;
    private int anos;
    private int meses;
    private double atrasado;
    private double compativel;
    private double adiantado;

    public TabelaPrevisaoAltura() {
    }

    public TabelaPrevisaoAltura(String sexo, int anos, int meses, double atrasado, double compativel, double adiantado) {
        this.sexo = sexo;
        this.anos = anos;
        this.meses = meses;
        this.atrasado = atrasado;
        this.compativel = compativel;
        this.adiantado = adiantado;
    }
    
    public void setAtrasadoCompativel(String sexo, int anos, int meses, double atrasado, double compativel){
        this.sexo = sexo;
        this.anos = anos;
        this.meses = meses;
        this.atrasado = atrasado;
        this.compativel = compativel;
    }
    
    public void setCompativelAdiantado(String sexo, int anos, int meses, double compativel, double adiantado){
        this.sexo = sexo;
        this.anos = anos;
        this.meses = meses;
        this.compativel = compativel;
        this.adiantado = adiantado;
    }
    
    public void setOnlyCompativel(String sexo, int anos, int meses, double compativel){
        this.sexo = sexo;
        this.anos = anos;
        this.meses = meses;
        this.compativel = compativel;
    }
    
    public void setOnlyAtrasado(String sexo, int anos, int meses, double atrasado){
        this.sexo = sexo;
        this.anos = anos;
        this.meses = meses;
        this.atrasado = atrasado;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getAnos() {
        return anos;
    }

    public void setAnos(int anos) {
        this.anos = anos;
    }

    public int getMeses() {
        return meses;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public double getAtrasado() {
        return atrasado;
    }

    public void setAtrasado(double atrasado) {
        this.atrasado = atrasado;
    }

    public double getCompativel() {
        return compativel;
    }

    public void setCompativel(double compativel) {
        this.compativel = compativel;
    }

    public double getAdiantado() {
        return adiantado;
    }

    public void setAdiantado(double adiantado) {
        this.adiantado = adiantado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TabelaPrevisaoAltura)) {
            return false;
        }
        TabelaPrevisaoAltura other = (TabelaPrevisaoAltura) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.TabelaPrevisaoAltura[ id=" + id + " ]";
    }
    
}
