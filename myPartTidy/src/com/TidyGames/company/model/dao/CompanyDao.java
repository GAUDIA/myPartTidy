package com.TidyGames.company.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.TidyGames.common.JDBCTemplate.*;

import com.TidyGames.company.model.vo.Company;

public class CompanyDao {
	
	private Properties prop = new Properties(); // 전역변수 private

	public CompanyDao() {
		
		String filePath = CompanyDao.class.getResource("/db/sql/company-admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 게임사 등록
	 * @param conn
	 * @param c
	 * @return
	 */
	public int insertCompany(Connection conn, Company c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCompany");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCompanyName());
			pstmt.setString(2, c.getCompanyHead());
			pstmt.setString(3, c.getCompanyComment());
			pstmt.setString(4, c.getCompanyId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
