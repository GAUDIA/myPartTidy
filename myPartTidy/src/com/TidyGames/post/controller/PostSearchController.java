package com.TidyGames.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TidyGames.post.model.vo.Post;
import com.TidyGames.common.model.vo.PageInfo;
import com.TidyGames.post.model.service.PostService;



/**
 * Servlet implementation class PostSearchController
 */
@WebServlet("/search.po")
public class PostSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String search = request.getParameter("search");
		String word = request.getParameter("word");
		
		int listCount;
		
		switch(search) {
		case "r" : listCount = new PostService().select(search, word);
		}
		
		System.out.println(listCount);
		int currentPage; 	
		int pageLimit = 5; 		
		int viewLimit = 10;	
		int maxPage = (int)Math.ceil((double)listCount / viewLimit);		
		int startPage;		
		int endPage;	
		
		/*
		String companyName = request.getParameter("companyName");
		ArrayList<Post> list = new PostService().searchPost(companyName);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/post/postListView.jsp").forward(request, response);
		
		
		int listCount;		
		int currentPage; 	
		int pageLimit; 		
		int viewLimit;	
		int maxPage;		
		int startPage;		
		int endPage;	
		
		listCount = new PostService().selectPostListCount();	
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		viewLimit = 15;
		maxPage = (int)Math.ceil((double)listCount / viewLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, viewLimit, maxPage, startPage, endPage);
		
		
		String search = request.getParameter("search");
		String word = request.getParameter("word");
		
		// ArrayList<Post> list = new PostService().searchPost(search, word, pi);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
