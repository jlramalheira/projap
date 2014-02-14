/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JoaoLuiz
 */
public class Util {

    private static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    public static int ELEMENTOS_TABELA_GRAFICOS = 7;
    //public static double DESVIO_PADRAO_MASC_IMC05 = 0.9902626022190686;
    //public static double DESVIO_PADRAO_FEM_IMC05 = 0.9902626022190686;
    public static double DESVIO_PADRAO_MASC_IMC05 = 0.990262;
    public static double DESVIO_PADRAO_FEM_IMC05 = 0.828723;
    
    public static double DESVIO_PADRAO_MASC_PESO05 = 0.979605;
    public static double DESVIO_PADRAO_FEM_PESO05 = 0.730985;
    
    public static double DESVIO_PADRAO_MASC_ESTATURA05 = 0.978690;
    public static double DESVIO_PADRAO_FEM_ESTATURA05 = 1.424478;
    
    public static double DESVIO_PADRAO_MASC_PC05 = 0.925044;
    public static double DESVIO_PADRAO_FEM_PC05 = 0.934567;
    
    public static double DESVIO_PADRAO_MASC_IMC519 = 0.73089;
    public static double DESVIO_PADRAO_FEM_IMC519 = 0.73309;
    
    public static double DESVIO_PADRAO_MASC_PESO519 = 2.098701;
    public static double DESVIO_PADRAO_FEM_PESO519 = 1.788095;
    
    public static double DESVIO_PADRAO_MASC_ESTATURA519 = 2.641411;
    public static double DESVIO_PADRAO_FEM_ESTATURA519 = 2.638188;
    
    public static String TEXTO_IMC05_MAGREZAACENTUADA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Magreza Acentuada. Obs: Este até pode ser um biotipo familiar, no entanto, há um maior de risco de estar relacionado a alguma doença.";
    public static String TEXTO_IMC05_MAGREZA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Magreza, que pode ser um biotipo familiar ou indicar uma doença. É importante o acompanhamento médico.";
    public static String TEXTO_IMC05_EUTROFIA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Eutrofia, que significa criança saudável.";
    public static String TEXTO_IMC05_RISCOSOBREPESO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Risco de Sobrepeso. É importante os pais estarem alertas com a alimentação e atividade física para que o quadro não avance para sobrepeso ou obesidade.";
    public static String TEXTO_IMC05_SOBREPESO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Sobrepreso. É importante os pais procurarem um profissional da saúde afim de que não evolua para obesidade.";
    public static String TEXTO_IMC05_OBESIDADE_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Obesidade, essa é uma situação que requer assistência médica.";
    
    public static String TEXTO_IMC519_MAGREZAACENTUADA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Magreza Acentuada. Obs: Este até pode ser um biotipo familiar, no entanto, há um maior de risco de estar relacionado a alguma doença.";
    public static String TEXTO_IMC519_MAGREZA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Magreza, que pode ser um biotipo familiar ou indicar uma doença. É importante o acompanhamento médico.";
    public static String TEXTO_IMC519_EUTROFIA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Eutrofia, que significa criança saudável.";
    public static String TEXTO_IMC519_SOBREPESO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Sobrepreso. É importante os pais procurarem um profissional da saúde afim de que não evolua para obesidade.";
    public static String TEXTO_IMC519_OBESIDADE_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se em Obesidade, essa é uma situação que requer assistência médica.";
    public static String TEXTO_IMC519_OBESIDADEGRAVE_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se Obesidade Grave, essa é uma situação que requer urgentemente assistência médica .";
    
    public static String TEXTO_PESO05_MUITOBAIXO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso muito baixo para a idade.";
    public static String TEXTO_PESO05_BAIXO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso baixo para a idade.";
    public static String TEXTO_PESO05_ADEQUADO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso adequado para a idade.";
    public static String TEXTO_PESO05_ELEVADO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso elevado para a idade.";
    
    public static String TEXTO_PESO519_MUITOBAIXO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso muito baixo para a idade.";
    public static String TEXTO_PESO519_BAIXO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso baixo para a idade.";
    public static String TEXTO_PESO519_ADEQUADO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso adequado para a idade.";
    public static String TEXTO_PESO519_ELEVADO_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com o peso elevado para a idade.";
    
    public static String TEXTO_ESTATURA05_MUITOBAIXA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com a estatura muito baixa para a idade.";
    public static String TEXTO_ESTATURA05_BAIXA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com a estatura baixa para a idade.";
    public static String TEXTO_ESTATURA05_ADEQUADA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com a estatura adequada para a idade.";
    
    public static String TEXTO_ESTATURA519_MUITOBAIXA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com a estatura muito baixa para a idade.";
    public static String TEXTO_ESTATURA519_BAIXA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com a estatura baixa para a idade.";
    public static String TEXTO_ESTATURA519_ADEQUADA_ATUAL = "De acordo com a Organização Mundial de Saúde (OMS) e conforme a última medida antropométrica, a criança encontra-se com a estatura adequada para a idade.";
    
    public static String TEXTO_IMC05_MAGREZAACENTUADA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Magreza Acentuada. Obs: Este até pode ser um biotipo familiar, no entanto, há um maior de risco de estar relacionado a alguma doença.";
    public static String TEXTO_IMC05_MAGREZA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Magreza, que pode ser um biotipo familiar ou indicar uma doença. É importante o acompanhamento médico.";
    public static String TEXTO_IMC05_EUTROFIA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Eutrofia, que significa criança saudável.";
    public static String TEXTO_IMC05_RISCOSOBREPESO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Risco de Sobrepeso. É importante os pais estarem alertas com a alimentação e atividade física para que o quadro não avance para sobrepeso ou obesidade.";
    public static String TEXTO_IMC05_SOBREPESO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Sobrepreso. É importante os pais procurarem um profissional da saúde afim de que não evolua para obesidade.";
    public static String TEXTO_IMC05_OBESIDADE_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Obesidade, essa é uma situação que requer assistência médica.";
    
    public static String TEXTO_PESO05_MUITOBAIXO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso muito baixo para a idade.";
    public static String TEXTO_PESO05_BAIXO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso baixo para a idade.";
    public static String TEXTO_PESO05_ADEQUADO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso adequado para a idade.";
    public static String TEXTO_PESO05_ELEVADO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso elevado para a idade.";
    
    public static String TEXTO_ESTATURA05_MUITOBAIXA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com a estatura muito baixa para a idade.";
    public static String TEXTO_ESTATURA05_BAIXA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com a estatura baixa para a idade.";
    public static String TEXTO_ESTATURA05_ADEQUADA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com a estatura adequada para a idade.";

    public static String TEXTO_IMC519_MAGREZAACENTUADA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Magreza Acentuada. Obs: Este até pode ser um biotipo familiar, no entanto, há um maior de risco de estar relacionado a alguma doença.";
    public static String TEXTO_IMC519_MAGREZA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Magreza, que pode ser um biotipo familiar ou indicar uma doença. É importante o acompanhamento médico.";
    public static String TEXTO_IMC519_EUTROFIA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Eutrofia, que significa criança saudável.";
    public static String TEXTO_IMC519_SOBREPESO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Sobrepreso. É importante os pais procurarem um profissional da saúde afim de que não evolua para obesidade.";
    public static String TEXTO_IMC519_OBESIDADE_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se em Obesidade, essa é uma situação que requer assistência médica.";
    public static String TEXTO_IMC519_OBESIDADEGRAVE_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se Obesidade Grave, essa é uma situação que requer urgentemente assistência médica .";
    
    public static String TEXTO_ESTATURA519_MUITOBAIXA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com a estatura muito baixa para a idade.";
    public static String TEXTO_ESTATURA519_BAIXA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com a estatura baixa para a idade.";
    public static String TEXTO_ESTATURA519_ADEQUADA_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com a estatura adequada para a idade.";
    
    public static String TEXTO_PESO519_MUITOBAIXO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso muito baixo para a idade.";
    public static String TEXTO_PESO519_BAIXO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso baixo para a idade.";
    public static String TEXTO_PESO519_ADEQUADO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso adequado para a idade.";
    public static String TEXTO_PESO519_ELEVADO_ESPECIFICA = "De acordo com a Organização Mundial de Saúde (OMS) e conforme esta medida antropométrica, a criança encontra-se com o peso elevado para a idade.";
   
    
    public static String dateToString(Date data) {
        return dateFormat.format(data);
    }

    public static Date stringToDate(String data) {
        try {
            return dateFormat.parse(data);
        } catch (ParseException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static int getDiferencaDatas(Date dInicio, Date dFim) {
        long dataFim = dFim.getTime();
        long dataInicio = dInicio.getTime();
        long diferenca = dataFim - dataInicio;

        return (int) (diferenca / (1000 * 24 * 60 * 60));
    }
    
    public static String criptografar(String senha) {
        String sen = "";
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
        sen = hash.toString(16);
        return sen;
    }
}
