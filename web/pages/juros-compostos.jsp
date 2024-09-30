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
    boolean mostrarTabela = false;
try{

    if(request.getParameter("calcular")!= null){
     taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"))/100;
     meses = Double.parseDouble(request.getParameter("meses"));
     capital = Double.parseDouble(request.getParameter("capital"));
     
     jurosSimples = capital*taxaJuros*meses;
     total = jurosSimples + capital;
     
     mostrarTabela = true;
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
       
        <h1>Juros compostos</h1>
        
        <form action="juros-compostos.jsp"> 
                    <h4>Valor do capital</h4>
               <input type="number" name="capital" value="<%=capital%>"/>
                       <h4>taxa de juros em %</h4>
               <input type="number" name="taxaJuros" value="<%=taxaJuros%>"/>
                       <h4>Tempo em meses</h4>
               <input type="number" name="meses" value="<%=meses%>"/>
              <input type="submit" name="calcular" value="Generate"/>
    </form>
        <% if (mostrarTabela && capital > 0 && taxaJuros > 0 && meses > 0) { %>
       <table border='1'>
            <tr>
                <th>Mes</th>
                <th>Valor acumulado</th>
                
            </tr>
            
            <%for(int i=1; i<=meses; i++) {%>
             <% double valorAcumulado = capital*Math.pow((1+taxaJuros), i); %>
            <tr> 
            <td><%=i%></td>
            <td><%= String.format("%.2f", valorAcumulado) %> </td>
            </tr>
            <%}%>  
        </table>
       <%}%>
    </body>
</html>
