package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ContactVO;
import service.ContactServiceImpl;

/**
 * Servlet implementation class ContactController
 */
@WebServlet("/Contact")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("contact.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String fname = request.getParameter("fname");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		ContactVO contact = new ContactVO();
		contact.setCo_fname(fname);
		contact.setCo_email(email);
		contact.setCo_message(message);
		
		ContactServiceImpl service = new ContactServiceImpl();
		service.create(contact);
		
		response.sendRedirect("Contact?res=OK");
	}

}
