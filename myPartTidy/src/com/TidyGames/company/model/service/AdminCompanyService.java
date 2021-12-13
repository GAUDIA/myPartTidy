package com.TidyGames.company.model.service;

import static com.TidyGames.common.JDBCTemplate.close;
import static com.TidyGames.common.JDBCTemplate.commit;
import static com.TidyGames.common.JDBCTemplate.getConnection;
import static com.TidyGames.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.TidyGames.company.model.dao.AdminCompanyDao;
import com.TidyGames.company.model.vo.Company;

public class AdminCompanyService {
	
	/**
	 * 게임사 등록
	 * @param c
	 * @return
	 */
	public int insertCompany(Company c) {
		Connection conn = getConnection();
		int result = new AdminCompanyDao().insertCompany(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 게임사 목록 조회
	 * @return
	 */
	public ArrayList<Company> selectCompanyList(){	
		Connection conn = getConnection();
		ArrayList<Company> list = new AdminCompanyDao().selectCompanyList(conn);
		close(conn);
		return list;
	}
	
	
	public Company selectCompanyDetail(int companyNo) {
		Connection conn = getConnection();
		Company c = new AdminCompanyDao().selectCompanyDetail(conn, companyNo);
		close(conn);
		return c;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}