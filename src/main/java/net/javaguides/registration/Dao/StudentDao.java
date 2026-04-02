package net.javaguides.registration.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import net.javaguides.registration.model.Student;

public class StudentDao {
	
	
	public int registrationStudent(Student stu) throws ClassNotFoundException
	{
		String connection = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/students";
		String userName = "root";
		String password = "asdf";
		int result =0;
		String insretQuery = "insert into student values(?,?,?,?,?,?,?)";
		try
		{
			Class.forName(connection);
			Connection con = DriverManager.getConnection(url,userName,password);
			PreparedStatement ps = con.prepareStatement(insretQuery);
			ps.setInt(1, stu.getRollNo());
			ps.setString(2, stu.getFirstName());
			ps.setString(3, stu.getLastName());
			ps.setString(4, stu.getUserName());
			ps.setString(5, stu.getPassword());
			ps.setString(6, stu.getAddress());
			ps.setLong(7, stu.getContact());
			result = ps.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
		
	}

}
