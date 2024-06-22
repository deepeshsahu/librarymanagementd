<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Books</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('https://wallpapers.com/images/hd/novel-in-library-m9ck0jamer9i33i1.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 800px;
        margin: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Library Books</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Book Name</th>
                <th>Author</th>
                <th>Genre</th>
            </tr>
        </thead>
        <tbody>
            <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanagement", "root", "ford2023");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM books");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getString("gener") %></td>
                <td><a href="updatelibrary.jsp?id=<%= rs.getInt(1) %>">update</a></td>
                <td><a href="delete.jsp?id=<%= rs.getInt(1) %>">delete</a></td>
            </tr>
            <% 
                }
                rs.close();
                st.close();
                con.close();
            } 
            catch(ClassNotFoundException cfe)
            {
            	 cfe.printStackTrace();
            }
            
            catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
