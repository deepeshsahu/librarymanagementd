package com.library;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/issue")
public class issuebook extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanagement", "root", "ford2023");
			PreparedStatement ps=con.prepareStatement("delete from userbooks where id=?");
			ps.setInt(1, Integer.parseInt(id));
			ps.executeUpdate();
			PrintWriter pw=resp.getWriter();
			pw.print("<h1>Book issued</h1>");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

