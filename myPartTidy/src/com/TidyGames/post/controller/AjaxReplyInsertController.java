package com.TidyGames.post.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TidyGames.member.model.vo.Member;
import com.TidyGames.post.model.service.PostService;
import com.TidyGames.post.model.vo.Reply;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.po")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("rcontent");
		int postNo = Integer.parseInt(request.getParameter("pno"));
		
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		/*
		 * !!!! 다시 복습 !!!!
		 * 이 요청을 보냈다는 것 == 현재 로그인한 회원이라는 것 == 세션 영역에 멤버 객체가 담겨있다!
		 * request.getSession().getAttribute("loginUser")
		 * - 서블릿 단에서 세션 객체에 접근 (request.getSession())
		 * - 이 세션에 loginUser키값으로 Member객체가 담겨있음
		 * - 세션으로부터 뭔가롤 뽑고자 할 때 getAttribute("키값") 이때 반환값은 Object이므로 Member로 강제형변환 후
		 * - 멤버 넘버는 그 후에 뽑는다!
		 */
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setRefPostNo(postNo);
		r.setReplyWriter(String.valueOf(memNo));
		
		int result = new PostService().insertReply(r);
		
		// ajax 요청
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
