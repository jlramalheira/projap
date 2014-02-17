/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Dao.DaoTabelaPrevisaoAltura;
import Dao.DaoTabelaScoreZ;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Guilherme
 */
@Entity
public class Medida implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    private Paciente paciente;
    private int idade;
    private double peso;
    private double altura;
    private double perimetroCefalico;
    private String posicao;
    private double idadeOsseaAnos;
    private double idadeOsseaMeses;
    private double previsaoEstatura;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date data;

    public Medida() {
    }

    public Medida(String posicao, Date data, Paciente paciente, int idade, double peso, double perimetroEncefalico, double altura, double idadeOsseaAnos, double idadeOsseaMeses) {
        this.paciente = paciente;
        this.peso = peso;
        this.idade = idade;
        this.perimetroCefalico = perimetroEncefalico;
        this.altura = altura;
        this.data = data;
        this.posicao = posicao;
        this.idadeOsseaAnos = idadeOsseaAnos;
        this.idadeOsseaMeses = idadeOsseaMeses;
    }

    public double getScoreZ(String grafico, String sexo) {
        double imc = this.getPeso() / ((this.getAltura() / 100) * (this.getAltura() / 100));
        int meses = (int) (this.getIdade() / 30);
        TabelaScoreZ valorPadrao = new DaoTabelaScoreZ().GetByGraficoSexoMes(grafico, this.getPaciente().getSexo(), meses);
        if (grafico.equalsIgnoreCase("imc05")) {
            return (imc - valorPadrao.getQuarto()) / valorPadrao.getDesvioPadrao();
        } else if (grafico.equalsIgnoreCase("peso05")) {
            return (this.peso - valorPadrao.getQuarto()) / valorPadrao.getDesvioPadrao();
        } else if (grafico.equalsIgnoreCase("estatura05")) {
            return (this.altura - valorPadrao.getQuarto()) / valorPadrao.getDesvioPadrao();
        } else if (grafico.equalsIgnoreCase("imc519")) {
            return (imc - valorPadrao.getQuarto()) / valorPadrao.getDesvioPadrao();
        } else if (grafico.equalsIgnoreCase("peso519")) {
            return (this.peso - valorPadrao.getQuarto()) / valorPadrao.getDesvioPadrao();
        } else if (grafico.equalsIgnoreCase("estatura519")) {
            return (this.altura - valorPadrao.getQuarto()) / valorPadrao.getDesvioPadrao();
        } else {
            return 0;
        }
    }

    public String getTextoAtual(String grafico, String sexo) {
        String texto = "";
        if (grafico.equals("imc05")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_IMC05_MAGREZAACENTUADA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_IMC05_MAGREZA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 1) {
                texto = Util.Util.TEXTO_IMC05_EUTROFIA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 1 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_IMC05_RISCOSOBREPESO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 2 && this.getScoreZ(grafico, sexo) <= 3) {
                texto = Util.Util.TEXTO_IMC05_SOBREPESO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 3) {
                texto = Util.Util.TEXTO_IMC05_OBESIDADE_ATUAL;
            }
        } else if (grafico.equals("peso05")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_PESO05_MUITOBAIXO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_PESO05_BAIXO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_PESO05_ADEQUADO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 2) {
                texto = Util.Util.TEXTO_PESO05_ELEVADO_ATUAL;
            }
        } else if (grafico.equals("estatura05")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_ESTATURA05_MUITOBAIXA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_ESTATURA05_BAIXA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -2) {
                texto = Util.Util.TEXTO_ESTATURA05_ADEQUADA_ATUAL;
            }
        } else if (grafico.equals("peso519")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_PESO519_MUITOBAIXO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_PESO519_BAIXO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_PESO519_ADEQUADO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 2) {
                texto = Util.Util.TEXTO_PESO519_ELEVADO_ATUAL;
            }
        } else if (grafico.equals("estatura519")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_ESTATURA519_MUITOBAIXA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_ESTATURA519_BAIXA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -2) {
                texto = Util.Util.TEXTO_ESTATURA519_ADEQUADA_ATUAL;
            }
        } else if (grafico.equals("imc519")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_IMC519_MAGREZAACENTUADA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_IMC519_MAGREZA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 1) {
                texto = Util.Util.TEXTO_IMC519_EUTROFIA_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 1 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_IMC519_SOBREPESO_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 2 && this.getScoreZ(grafico, sexo) <= 3) {
                texto = Util.Util.TEXTO_IMC519_OBESIDADE_ATUAL;
            } else if (this.getScoreZ(grafico, sexo) > 3) {
                texto = Util.Util.TEXTO_IMC519_OBESIDADEGRAVE_ATUAL;
            }
        }
        return texto;
    }

    public String getTextoEspecifico(String grafico, String sexo) {
        String texto = "";
        if (grafico.equals("imc05")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_IMC05_MAGREZAACENTUADA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_IMC05_MAGREZA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 1) {
                texto = Util.Util.TEXTO_IMC05_EUTROFIA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 1 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_IMC05_RISCOSOBREPESO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 2 && this.getScoreZ(grafico, sexo) <= 3) {
                texto = Util.Util.TEXTO_IMC05_SOBREPESO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 3) {
                texto = Util.Util.TEXTO_IMC05_OBESIDADE_ESPECIFICA;
            }
        } else if (grafico.equals("peso05")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_PESO05_MUITOBAIXO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_PESO05_BAIXO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_PESO05_ADEQUADO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 2) {
                texto = Util.Util.TEXTO_PESO05_ELEVADO_ESPECIFICA;
            }
        } else if (grafico.equals("estatura05")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_ESTATURA05_MUITOBAIXA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_ESTATURA05_BAIXA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -2) {
                texto = Util.Util.TEXTO_ESTATURA05_ADEQUADA_ESPECIFICA;
            }
        } else if (grafico.equals("peso519")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_PESO519_MUITOBAIXO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_PESO519_BAIXO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_PESO519_ADEQUADO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 2) {
                texto = Util.Util.TEXTO_PESO519_ELEVADO_ESPECIFICA;
            }
        } else if (grafico.equals("estatura519")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_ESTATURA519_MUITOBAIXA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_ESTATURA519_BAIXA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -2) {
                texto = Util.Util.TEXTO_ESTATURA519_ADEQUADA_ESPECIFICA;
            }
        } else if (grafico.equals("imc519")) {
            if (this.getScoreZ(grafico, sexo) < -3) {
                texto = Util.Util.TEXTO_IMC519_MAGREZAACENTUADA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -3 && this.getScoreZ(grafico, sexo) < -2) {
                texto = Util.Util.TEXTO_IMC519_MAGREZA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) >= -2 && this.getScoreZ(grafico, sexo) <= 1) {
                texto = Util.Util.TEXTO_IMC519_EUTROFIA_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 1 && this.getScoreZ(grafico, sexo) <= 2) {
                texto = Util.Util.TEXTO_IMC519_SOBREPESO_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 2 && this.getScoreZ(grafico, sexo) <= 3) {
                texto = Util.Util.TEXTO_IMC519_OBESIDADE_ESPECIFICA;
            } else if (this.getScoreZ(grafico, sexo) > 3) {
                texto = Util.Util.TEXTO_IMC519_OBESIDADEGRAVE_ESPECIFICA;
            }
        }
        return texto;
    }

    public String getPrevisaoEstatura(String sexo) {
        String texto = "-";
        if (this.getIdadeOsseaAnos() > 5) {
            int idadeDias = this.getIdade();
            int idadeOsseaDias = (int) (this.getIdadeOsseaAnos() * 365);
            idadeOsseaDias += (int) (this.getIdadeOsseaMeses() * 30);
            int mesesIdadeOssea = (int) (this.getIdadeOsseaMeses());
            int anosIdadeOssea = (int) (this.getIdadeOsseaAnos());

            if ((idadeDias - 365 < idadeOsseaDias) && (idadeDias + 365 > idadeOsseaDias)) {
                switch (mesesIdadeOssea) {
                    case 0: //valores mais proximos do mes 0, consulta tabela mes 0
                    case 1: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 0, anosIdadeOssea);
                        double fracao = previsaoAltura.getCompativel();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 2:
                    case 3:   //valores mais proximos do mes 3, consulta tabela mes 3
                    case 4: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 3, anosIdadeOssea);
                        double fracao = previsaoAltura.getCompativel();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 5:
                    case 6: //valores mais proximos do mes 6, consulta tabela mes 6
                    case 7: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 6, anosIdadeOssea);
                        double fracao = previsaoAltura.getCompativel();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 8: //valores mais proximos do mes 9, consulta tabela mes 9
                    case 9: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 9, anosIdadeOssea);
                        double fracao = previsaoAltura.getCompativel();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                }
            } else if (idadeDias - 365 > idadeOsseaDias) {
                switch (mesesIdadeOssea) {
                    case 0: //valores mais proximos do mes 0, consulta tabela mes 0
                    case 1: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 0, anosIdadeOssea);
                        double fracao = previsaoAltura.getAtrasado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 2:
                    case 3:   //valores mais proximos do mes 3, consulta tabela mes 3
                    case 4: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 3, anosIdadeOssea);
                        double fracao = previsaoAltura.getAtrasado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 5:
                    case 6: //valores mais proximos do mes 6, consulta tabela mes 6
                    case 7: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 6, anosIdadeOssea);
                        double fracao = previsaoAltura.getAtrasado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 8: //valores mais proximos do mes 9, consulta tabela mes 9
                    case 9: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 9, anosIdadeOssea);
                        double fracao = previsaoAltura.getAtrasado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                }
            } else {
                switch (mesesIdadeOssea) {
                    case 0: //valores mais proximos do mes 0, consulta tabela mes 0
                    case 1: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 0, anosIdadeOssea);
                        double fracao = previsaoAltura.getAdiantado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 2:
                    case 3:   //valores mais proximos do mes 3, consulta tabela mes 3
                    case 4: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 3, anosIdadeOssea);
                        double fracao = previsaoAltura.getAdiantado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 5:
                    case 6: //valores mais proximos do mes 6, consulta tabela mes 6
                    case 7: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 6, anosIdadeOssea);
                        double fracao = previsaoAltura.getAdiantado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                    case 8: //valores mais proximos do mes 9, consulta tabela mes 9
                    case 9: {
                        TabelaPrevisaoAltura previsaoAltura = new DaoTabelaPrevisaoAltura().GetByGraficoSexoMes(sexo, 9, anosIdadeOssea);
                        double fracao = previsaoAltura.getAdiantado();
                        if (fracao > 0) {
                            texto = Math.round(this.getAltura() / fracao) + "";
                            break;
                        }
                    }
                }
            }
        }
        return texto;
    }

    public String getIdadeOsseaExtenso() {
        String idadeOssea = "-";
        if (this.getIdadeOsseaAnos() > 0) {
            idadeOssea = ((int) this.getIdadeOsseaAnos()) + " ano";
            if (this.getIdadeOsseaAnos() > 1) {
                idadeOssea += "s";
            }
            if (this.getIdadeOsseaMeses() > 0) {
                idadeOssea += " " + ((int) this.getIdadeOsseaMeses());
                if (this.getIdadeOsseaMeses() > 1) {
                    idadeOssea += " meses";
                } else {
                    idadeOssea += " mês";
                }
            }
        }
        return idadeOssea;
    }

    public String getIMC() {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format((this.getPeso() / ((this.getAltura() / 100) * this.getAltura() / 100)));

    }

    public double getPerimetroCefalico() {
        return perimetroCefalico;
    }

    public void setPerimetroCefalico(double perimetroCefalico) {
        this.perimetroCefalico = perimetroCefalico;
    }

    public double getIdadeOsseaAnos() {
        return idadeOsseaAnos;
    }

    public void setIdadeOsseaAnos(double idadeOsseaAnos) {
        this.idadeOsseaAnos = idadeOsseaAnos;
    }

    public double getIdadeOsseaMeses() {
        return idadeOsseaMeses;
    }

    public void setIdadeOsseaMeses(double idadeOsseaMeses) {
        this.idadeOsseaMeses = idadeOsseaMeses;
    }

    public double getPrevisaoEstatura() {
        return previsaoEstatura;
    }

    public void setPrevisaoEstatura(double previsaoEstatura) {
        this.previsaoEstatura = previsaoEstatura;
    }

    public String getPosicao() {
        return posicao;
    }

    public void setPosicao(String posicao) {
        this.posicao = posicao;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public String getDataStr() {
        return Util.Util.dateToString(data);
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getIdade() {
        return Util.Util.getDiferencaDatas(this.paciente.getDataNascimento(), this.data);
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
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
        if (!(object instanceof Medida)) {
            return false;
        }
        Medida other = (Medida) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Objeto.Dados[ id=" + id + " ]";
    }

    public String getHint() {
        String hint = "Data: " + Util.Util.dateToString(this.getData()) + "<br/>"
                + "Idade: " + this.idadeToExtenso() + "<br/>"
                + "Peso: " + this.getPeso() + " kg<br/>"
                + "Altura: " + this.getAltura() + " " + this.getPosicaoAbreviado() + " cm<br/>"
                + "IMC: " + this.getIMC();
        return hint;
    }

    public String getPosicaoAbreviado() {
        String estaturaposicao = "";
        if (this.getPosicao().equalsIgnoreCase("decubito")) {
            estaturaposicao += "(D)";
        } else {
            estaturaposicao += "(O)";
        }
        return estaturaposicao;
    }

    public String idadeToExtenso() {
        String data = "";
        int anos = (int) (this.getIdade() / 365);
        int meses = (int) ((this.getIdade() % 365) / 30);
        int dias = (int) ((this.getIdade() % 365) % 30) - (meses / 2 + 2);
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