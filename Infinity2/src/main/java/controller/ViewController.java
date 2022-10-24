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
		BoardServiceImpl service= new BoardServiceImpl();
		BoardVO vo = service.read(bo_num);
		
		request.setAttribute("view", vo);//view에 값전달
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/view.jsp");
		dispatcher.forward(request, response);
		
		
	}


}
