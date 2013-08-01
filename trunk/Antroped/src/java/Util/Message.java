/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

/**
 *
 * @author Max
 */
public class Message {

    public static final String TYPE_ALERT = "alert";
    public static final String TYPE_ERROR = "error";
    public static final String TYPE_SUCCESS = "success";
    public static final String TYPE_INFO = "info";
    private String text;
    private String type;

    public Message() {
    }

    public Message(String text, String type) {
        this.text = text;
        this.type = type;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getType() {
        return type;
    }

    public void setTypeAlert() {
        this.type = Message.TYPE_ALERT;
    }

    public void setTypeError() {
        this.type = Message.TYPE_ERROR;
    }

    public void setTypeSuccess() {
        this.type = Message.TYPE_SUCCESS;
    }

    public void setTypeInfo() {
        this.type = Message.TYPE_INFO;
    }

    public String printMessage() {
        String titulo;
        switch (this.type) {
            case Message.TYPE_ALERT:
                titulo = "Atenção!";
                break;
            case Message.TYPE_ERROR:
                titulo = "Erro!";
                break;
            case Message.TYPE_INFO:
                titulo = "Informação:";
                break;
            case Message.TYPE_SUCCESS:
                titulo = "Confirmado!";
                break;
            default:
                titulo = "Mensagem";
                break;
        }
        return "<div class=\"alert alert-block alert-" + this.type + "\">\n"
                + "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"
                + "<h4>" + titulo + "</h4>\n"
                + "<p>" + this.text + "</p>\n"
                + " </div>";
    }
}
