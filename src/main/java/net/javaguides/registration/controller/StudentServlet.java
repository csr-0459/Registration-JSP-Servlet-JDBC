package net.javaguides.registration.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.javaguides.registration.Dao.StudentDao;
import net.javaguides.registration.model.Student;

import java.io.IOException;

/**
 * Servlet implementation class StudentServlet
 */
//@WebServlet("/register")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private StudentDao st = new StudentDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		request.getRequestDispatcher("/WEB-INF/views/StudentRegistration.jsp")
        .forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int rollNo = Integer.parseInt(request.getParameter("rollNo"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		Long  contact = Long.parseLong(request.getParameter("contact"));
		
		Student stu = new Student();
		stu.setRollNo(rollNo);
		stu.setFirstName(firstName);
		stu.setLastName(lastName);
		stu.setUserName(userName);
		stu.setPassword(password);
		stu.setAddress(address);
		stu.setContact(contact);
		
		try {
			st.registrationStudent(stu);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/StudentDetailsSuccessful.jsp");
		dispatcher.forward(request, response);
	}

}
