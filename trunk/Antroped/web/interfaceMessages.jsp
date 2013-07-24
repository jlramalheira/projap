<%@page import="java.util.ArrayList"%>
<%@page import="Util.Message"%>
<%
    ArrayList<Message> messages = (ArrayList<Message>) session.getAttribute("messages");
    if(messages == null){
        messages = new ArrayList<Message>();
    }
    for(Message m : messages){
        out.print(m.printMessage());
    }
    session.removeAttribute("messages");
%>