package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardVO;
import model.CommentVO;
import model.ViewInfoVO;
import service.BoardServiceImpl;
import service.CommentServiceImpl;

/**
 * Servlet implementation class ViewController
 */
@WebServlet("/View")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		
		
		//BoardServiceImpl service = new BoardServiceImpl();
		//BoardVO vo = service.read(bo_num);
		BoardServiceImpl service = new BoardServiceImpl();
		ViewInfoVO info = service.view(bo_num);
		request.setAttribute("view", info.getBoard());//view에 값전달
		
		//CommentServiceImpl service2 = new CommentServiceImpl();
		//List<CommentVO> list = service2.read(bo_num);
		
		request.setAttribute("list", info.getList());//view에 값전달
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/view.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String com_refnum = request.getParameter("com_refnum");
		
		HttpSession session = request.getSession();
		
		CommentVO vo = new CommentVO();
		vo.setCom_refnum(Integer.parseInt(com_refnum));
		vo.setCom_content(request.getParameter("com_content"));

		vo.setCom_mb_id((String) session.getAttribute("sess_id"));
		vo.setCom_mb_name((String) session.getAttribute("sess_name"));

		CommentServiceImpl service = new CommentServiceImpl();
		service.create(vo);
		
		response.sendRedirect("?bo_num="+com_refnum);
	}


}
