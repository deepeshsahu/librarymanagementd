<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book Information</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
     body 
     {
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
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Update Book Information</h3>
                    </div>
                    <div class="card-body">
                        <%
                            String id = request.getParameter("id");
                            if (id != null) {
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanagement", "root", "ford2023");
                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE id = ?");
                                    ps.setInt(1, Integer.parseInt(id));
                                    ResultSet rs = ps.executeQuery();

                                    if (rs.next()) {
                        %>
                        <form action="updatedata1" method="get">
                            <div class="form-group row">
                                <label for="id" class="col-sm-3 col-form-label">Enter ID:</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="id" name="id" value="<%= rs.getInt(1) %>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="bookName" class="col-sm-3 col-form-label">Enter Book Name:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="bookName" name="bookName" value="<%= rs.getString(2) %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="author" class="col-sm-3 col-form-label">Enter Author:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="author" name="author" value="<%= rs.getString(3) %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="genre" class="col-sm-3 col-form-label">Enter Genre:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="genre" name="genre" value="<%= rs.getString(4) %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-9 offset-sm-3">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </form>
                        <%
                                    } else {
                                        out.println("<p>No book found with the given ID.</p>");
                                    }
                                    rs.close();
                                    ps.close();
                                    con.close();
                                } catch (Exception e) {
                                    out.println("<p>Error: " + e.getMessage() + "</p>");
                                }
                            } else {
                                out.println("<p>Book ID is required.</p>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
