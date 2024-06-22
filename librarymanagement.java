package com.library;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/insretdata")
public class librarymanagement extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String id=req.getParameter("id");
		String subject=req.getParameter("subject");
		String author=req.getParameter("author");
		String gener=req.getParameter("gener");
	
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanagement","root","ford2023");
			PreparedStatement ps=con.prepareStatement("insert into books(id,subject,author,gener)value(?,?,?,?)");
			ps.setInt(1,Integer.parseInt(id));
			ps.setString(2, subject);
			ps.setString(3, author);
			ps.setString(4, gener);
				ps.executeUpdate();
				
				RequestDispatcher rd=req.getRequestDispatcher("alllibrarydata.jsp");
				rd.forward(req, resp);
				
		}catch(ClassNotFoundException cfe)
		{
			cfe.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
}
