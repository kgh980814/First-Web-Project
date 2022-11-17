package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import service.LoginServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
		dispatcher.forward(request, response);
		//request.getRequestDispatcher("views/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO vo = new MemberVO();
		vo.setMb_id(request.getParameter("mb_id"));
		vo.setMb_pw(request.getParameter("mb_pw"));
		
		LoginServiceImpl service = new LoginServiceImpl();
		MemberVO member = service.read(vo);
		
		if(member != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("sess_id", member.getMb_id());
			session.setAttribute("sess_name", member.getMb_name());
			response.sendRedirect("/Main");
		} else {
			response.sendRedirect("/Login");
		}
	}

}







