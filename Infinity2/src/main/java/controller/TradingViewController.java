package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TradingDetailVO;
import model.TradingVO;
import service.TradingDetailServiceImpl;
import service.TradingServiceImpl;

/**
 * Servlet implementation class TradingViewController
 */
@WebServlet("/TradingView")
public class TradingViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradingViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tra_num = Integer.parseInt(request.getParameter("tra_num"));
		
		TradingServiceImpl service =new TradingServiceImpl();
		TradingVO trading = service.read(tra_num);
		request.setAttribute("trading", trading);
		
		TradingDetailServiceImpl service2 = new TradingDetailServiceImpl();
		List<TradingDetailVO> list = service2.read(tra_num);
		request.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/tradingStatementView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int tra_num = Integer.parseInt(request.getParameter("tra_num"));
		
		TradingDetailServiceImpl service = new TradingDetailServiceImpl();
		service.modify(request);
		
		response.sendRedirect("TradingView?tra_num="+tra_num);
	}

}
