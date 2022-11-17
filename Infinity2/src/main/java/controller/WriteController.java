package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardVO;
import service.BoardServiceImpl;

/**
 * Servlet implementation class Write
 */
@WebServlet("/Write")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/write.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		BoardVO vo = new BoardVO();
		vo.setBo_category(request.getParameter("bo_category"));
		vo.setBo_title(request.getParameter("bo_title"));
		vo.setBo_content(request.getParameter("bo_content"));
		vo.setBo_mb_id((String) session.getAttribute("sess_id"));
		vo.setBo_mb_name((String) session.getAttribute("sess_name"));
		vo.setBo_ip(request.getRemoteAddr());
		System.out.println(vo);
		BoardServiceImpl service = new BoardServiceImpl();
		service.create(vo);
		
		response.sendRedirect("/List");
	}

}
