<%-- 
    Document   : sum
    Created on : 29 de set. de 2024, 19:31:00
    Author     : Jorginho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    String errorMessage = null;
    double taxaJuros=0;
    double meses=0;
    double capital = 0;
    double jurosSimples = 0;
    double total = 0;
try{

    if(request.getParameter("calcular")!= null){
     taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"))/100;
     meses = Double.parseDouble(request.getParameter("meses"));
     capital = Double.parseDouble(request.getParameter("capital"));
     
     jurosSimples = capital*taxaJuros*meses;
     total = jurosSimples + capital;
     
    }
    
    } catch (Exception ex){
    errorMessage = ex.getMessage();
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include file="../WEB-INF/jspf/menu.jspf" %>
        
        <h1>Juros Simples</h1>
       
        <form action="juros-simples.jsp"> 
                    <h4>Valor do capital</h4>
               <input type="number" name="capital" value="<%=capital%>"/>
                       <h4>taxa de juros em %</h4>
               <input type="number" name="taxaJuros" value="<%=taxaJuros%>"/>
                       <h4>Tempo em meses</h4>
               <input type="number" name="meses" value="<%=meses%>"/>
              <input type="submit" name="calcular" value="Generate"/>
    </form>
       
        <% if (capital > 0 && taxaJuros > 0 && meses > 0) {%>
        <h2><%="Juros simples: " + jurosSimples %></h2> 
        <h2><%="Valor total: " + total %></h2> 
        <%}%>
    </body>
</html>
