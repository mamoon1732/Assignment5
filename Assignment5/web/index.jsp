<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    //use try/catch to catch database exceptions
    try {
        //create connection to database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/classicmodels", "root", "admin");
        
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT MIN(orderNumber) FROM orderdetails;");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Lookup</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1><strong class="bi bi-search">Order Lookup</strong></h1>
        <form action="order.jsp">
            <%
            
            out.println("Enter an Order Number between: ");
            
            while (rs.next()){
                out.print(rs.getInt(1));
            }
            
            out.print(" - ");
            
            rs = stmt.executeQuery("SELECT MAX(orderNumber) FROM orderdetails");
            while (rs.next()){
                out.print(rs.getInt(1));
            }
            %>
            
                            
                                
            <%
            //close connection
            con.close();

            }catch (Exception e){
                out.println(e);
            }//end catch
            %>
            <br>
            <input type="text" name="orderNumber" id="textbox">
            <input type="submit" value="Submit" name="submit">
        </form>
          
        <img src="ship.jpg" alt="picture of ship" id="shipPic">
        
                               
    </body>
</html>
