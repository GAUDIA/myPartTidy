package com.TidyGames.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TidyGames.common.model.vo.PageInfo;
import com.TidyGames.post.model.service.PostService;
import com.TidyGames.post.model.vo.Post;

/**
 * Servlet implementation class PostListController
 */
@WebServlet("/list.po")
public class PostListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = 0;		
		int currentPage = 0; 	
		int pageLimit = 10; 		
		int viewLimit = 15;	
		int maxPage;		
		int startPage;		
		int endPage;	
		
		String search = request.getParameter("search");
		String word = request.getParameter("word");
		// 그냥 페이지만 요청하면 null이다!
		
		System.out.println(search);
		System.out.println(word);
		
		// listCount 조건처리 (1)
		if(search == null) {
			listCount = new PostService().selectPostListCount();	
		} else {
			switch(search) {
			case "r" : 
			case "v" : 
			case "l" : listCount = 3; break;
			case "n" : listCount = new PostService().nicknamePostCount(word); break;
			}
		}
		
		
		
		
		
		System.out.println("listCount : " + listCount);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		System.out.println("currentPage : " + currentPage);
		maxPage = (int)Math.ceil((double)listCount / viewLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, viewLimit, maxPage, startPage, endPage);
		ArrayList<Post> list = new ArrayList<>();
		
		// listSelect 조건처리 (2)
		if(search ==null) {
			list = new PostService().selectPostList(pi);			
		} else {
			switch(search) {
			case "r" : 
			case "v" : 
			case "l" : listCount = 3; break;
			case "n" : list = new PostService().selectNicknamePost(pi, word);
					   break;
			}
		}
		
	
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/post/postListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
