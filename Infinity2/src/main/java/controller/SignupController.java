package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/signup.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//회원가입후 로그인페이지로 이동.
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String mb_name = request.getParameter("mb_name");
		String mb_email = request.getParameter("mb_email");
		String mb_zipcode = request.getParameter("mb_zipcode");
		String mb_addr = request.getParameter("mb_addr");
		String mb_detailAddr = request.getParameter("mb_detailAddr");
		String mb_phone = request.getParameter("mb_phone");
		String mb_birth = request.getParameter("mb_birth");
		String mb_gender = request.getParameter("mb_gender");
		
		MemberVO vo = new MemberVO();
		vo.setMb_id(mb_id);
		vo.setMb_pw(mb_pw);
		vo.setMb_name(mb_name);
		vo.setMb_email(mb_email);
		vo.setMb_zipcode(mb_zipcode);
		vo.setMb_addr(mb_addr);
		vo.setMb_detailAddr(mb_detailAddr);
		vo.setMb_phone(mb_phone);
		vo.setMb_birth(mb_birth);
		vo.setMb_gender(mb_gender);
		
		
		MemberServiceImpl service = new MemberServiceImpl();
		service.create(vo);
		//페이지 이동
		response.sendRedirect("/Login");
	}

}
