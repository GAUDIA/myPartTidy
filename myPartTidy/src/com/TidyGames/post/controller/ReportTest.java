package com.TidyGames.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReportTest
 */
@WebServlet("/report.po")
public class ReportTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reportReason = Integer.parseInt(request.getParameter("report"));
		int reportPno = Integer.parseInt(request.getParameter("reportPno"));
		int reportMem = Integer.parseInt(request.getParameter("reportMem"));
		
		System.out.println("신고사유 넘버  : " + reportReason);
		System.out.println("신고된 글넘버  : " + reportPno);
		System.out.println("신고된  회원넘버  : " + reportMem);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
