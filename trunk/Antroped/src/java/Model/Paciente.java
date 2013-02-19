/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;

/**
 *
 * @author Guilherme
 */
@Entity
public class Paciente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nome;
    private String nomePai;
    private String nomeMae;
    private int estaturaPai;
    private int estaturaMae;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataNascimento;
    private String sexo;
    private Usuario usuario;

    public Paciente() {
    }

    public Paciente(String nome, String sexo) {
        this.nome = nome;
        this.sexo = sexo;
    }

    public Paciente(String nome, String nomePai, String nomeMae, int estaturaPai, int estaturaMae, Date dataNascimento, String sexo, Usuario usuario) {
        this.nome = nome;
        this.nomePai = nomePai;
        this.nomeMae = nomeMae;
        this.estaturaPai = estaturaPai;
        this.estaturaMae = estaturaMae;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.usuario = usuario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public int getEstaturaMae() {
        return estaturaMae;
    }

    public void setEstaturaMae(int estaturaMae) {
        this.estaturaMae = estaturaMae;
    }

    public int getEstaturaPai() {
        return estaturaPai;
    }

    public void setEstaturaPai(int estaturaPai) {
        this.estaturaPai = estaturaPai;
    }
    
    public String getNomeMae() {
        return nomeMae;
    }

    public void setNomeMae(String nomeMae) {
        this.nomeMae = nomeMae;
    }

    public String getNomePai() {
        return nomePai;
    }

    public void setNomePai(String nomePai) {
        this.nomePai = nomePai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
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
        if (!(object instanceof Paciente)) {
            return false;
        }
        Paciente other = (Paciente) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Controle.Paciente[ id=" + id + " ]";
    }
    
    public double CalculaEstaturaAlvo(){
        double estaturaAlvo = 0;
        if (this.getSexo().equals("Masculino")){
            estaturaAlvo = (this.getEstaturaPai()+this.getEstaturaMae()+13)/2;
        } else {
            estaturaAlvo = (this.getEstaturaPai()+this.getEstaturaMae()-13)/2;
        }
        return estaturaAlvo;
    }
    
    public String idadeToExtenso() {
        String data = "";
        int idade = Util.Util.getDiferencaDatas(this.getDataNascimento(), Calendar.getInstance().getTime());
        int anos = (int)(idade/365);
        int meses = (int) ((idade%365)/30);
        int dias = (int) ((idade%365)%30)-(meses/2+1);
        if (anos > 0) {
            data += anos;
            if (anos == 1) {
                data += " ano";
            } else {
                data += (" anos");
            }
            if (meses > 0 || dias > 0) {
                if (meses > 0 && dias > 0) {
                    data += (", ");
                } else {
                    data += (" e ");
                }
            }
        }
        if (meses > 0) {
            data += (meses);
            if (meses == 1) {
                data += (" mês");
            } else {
                data += (" meses");
            }
            if (dias > 0) {
                data += (" e ");
            }
        }
        if (dias > 0) {
            data += (dias);
            if (dias == 1) {
                data += (" dia");
            } else {
                data += (" dias");
            }
        }
        return data;
    }    
    
}
