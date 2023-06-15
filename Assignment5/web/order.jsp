<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    //use try/catch to catch database exceptions
    try {
        //create connection to database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/classicmodels", "root", "admin");
        
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT O.orderDate, O.shippedDate, OD.productCode, OD.quantityOrdered, OD.priceEach, P.productName FROM orders O INNER JOIN orderdetails OD ON O.orderNumber = OD.orderNumber INNER JOIN products P ON P.productCode = OD.productCode WHERE O.orderNumber = " + request.getParameter("orderNumber")+";");
        
        //use while loop
        while (rs.next()){
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Results</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <p class="myOwn">Product Name: <strong><%=rs.getString("productName")%></strong></p>
            <p>Order Date: <strong><%=rs.getString("orderDate")%></strong></p>
            <p>Shipped Date: <%=rs.getString("shippedDate")%></p>
            <p>Product Code: <%=rs.getString("productCode")%></p>
            <p>Quantity Order: <%=rs.getInt("quantityOrdered")%></p>
            <p>Price: $<%=rs.getDouble("priceEach")%></p>
        </div>
        <%
            }//end while loop

            //close connection
            con.close();

            }catch (Exception e){
                out.println(e);
            }//end catch
        %>
        
        <div class="containerTwo">
            <a href="index.jsp" id="link">Return to Home</a>
        </div>
        
    </body>
</html>
