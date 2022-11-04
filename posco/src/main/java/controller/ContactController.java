package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SendMail;
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
		String message = request.getParameter("message");//값 받아오기
		
		message += "<br>"+email;
		ContactVO contact = new ContactVO();
		contact.setCo_fname(fname);
		contact.setCo_email(email);
		contact.setCo_message(message);//출력할것들
		
		ContactServiceImpl service = new ContactServiceImpl();
		service.create(contact);//DB 저장
		
		new SendMail().send("tregon5@naver.com", "kgh58043252@gmail.com",fname + "님이 견적을 의뢰를 합니다.", message);
		response.sendRedirect("Contact?res=OK");
	}

}
