package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TabelaScoreZ implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String grafico;
    private String sexo;
    private int meses;
    private double primeiro;
    private double segundo;
    private double terceiro;
    private double quarto;
    private double quinto;
    private double sexto;
    private double setimo;

    public TabelaScoreZ() {
    }

    public TabelaScoreZ(String grafico, String sexo, int meses, double primeiro, double segundo, double terceiro, double quarto, double quinto, double sexto, double setimo) {
        this.grafico = grafico;
        this.sexo = sexo;
        this.meses = meses;
        this.primeiro = primeiro;
        this.segundo = segundo;
        this.terceiro = terceiro;
        this.quarto = quarto;
        this.quinto = quinto;
        this.sexto = sexto;
        this.setimo = setimo;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGrafico() {
        return grafico;
    }

    public void setGrafico(String grafico) {
        this.grafico = grafico;
    }

    public int getMeses() {
        return meses;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public double getPrimeiro() {
        return primeiro;
    }

    public void setPrimeiro(double primeiro) {
        this.primeiro = primeiro;
    }

    public double getQuarto() {
        return quarto;
    }

    public void setQuarto(double quarto) {
        this.quarto = quarto;
    }

    public double getQuinto() {
        return quinto;
    }

    public void setQuinto(double quinto) {
        this.quinto = quinto;
    }

    public double getSegundo() {
        return segundo;
    }

    public void setSegundo(double segundo) {
        this.segundo = segundo;
    }

    public double getSetimo() {
        return setimo;
    }

    public void setSetimo(double setimo) {
        this.setimo = setimo;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public double getSexto() {
        return sexto;
    }

    public void setSexto(double sexto) {
        this.sexto = sexto;
    }

    public double getTerceiro() {
        return terceiro;
    }

    public void setTerceiro(double terceiro) {
        this.terceiro = terceiro;
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
        if (!(object instanceof TabelaScoreZ)) {
            return false;
        }
        TabelaScoreZ other = (TabelaScoreZ) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Objeto.TabelaScoreZ[ id=" + id + " ]";
    }
    
}
