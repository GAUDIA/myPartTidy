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
 * Servlet implementation class MyPostViewController
 */
@WebServlet("/mypost.po")
public class MyPostViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memNo = Integer.parseInt(request.getParameter("mynum"));		
		int listCount = new PostService().selectMyPostCount(memNo);		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 10; 		
		int viewLimit = 15;	
		int maxPage = (int)Math.ceil((double)listCount / viewLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;	
			
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, viewLimit, maxPage, startPage, endPage);
		ArrayList<Post> list = new PostService().selectMyPost(pi, memNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/post/postSearchListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
