package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardVO;
import service.BoardServiceImpl;

/**
 * Servlet implementation class ModifyController
 */
@WebServlet("/Modify")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		BoardServiceImpl service= new BoardServiceImpl();
		BoardVO vo = service.read(bo_num);
		
		request.setAttribute("view", vo);//view에 값전달

		RequestDispatcher dispatcher = request.getRequestDispatcher("views/modify.jsp");
		dispatcher.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BoardVO vo = new BoardVO();
		vo.setBo_category(request.getParameter("bo_category"));
		vo.setBo_title(request.getParameter("bo_title"));
		vo.setBo_content(request.getParameter("bo_content"));
		vo.setBo_num(Integer.parseInt(request.getParameter("bo_num")));
		
		BoardServiceImpl service = new BoardServiceImpl();
		service.update(vo);
		
		response.sendRedirect("List");
	}

}
