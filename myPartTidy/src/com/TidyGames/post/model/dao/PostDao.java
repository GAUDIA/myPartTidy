package com.TidyGames.post.model.dao;

import static com.TidyGames.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.TidyGames.common.model.vo.PageInfo;
import com.TidyGames.post.model.vo.Post;

public class PostDao {
	
	private Properties prop = new Properties(); 

	public PostDao() {
		
		String filePath = PostDao.class.getResource("/db/sql/post-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectPostListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPostListCount");
		
		try {
			pstmt = conn.prepareStatement(sql); 
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Post> selectPostList(Connection conn, PageInfo pi) {
		
		ArrayList<Post> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPostList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getViewLimit() + 1;
			int endRow = startRow + pi.getViewLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Post(rset.getInt("post_no"),
								  rset.getString("mem_nick"),
								  rset.getString("post_name"),
								  rset.getInt("post_view"),
								  rset.getInt("post_like"),
								  rset.getString("post_modify"),
								  rset.getString("post_notice")));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
		
	

}
