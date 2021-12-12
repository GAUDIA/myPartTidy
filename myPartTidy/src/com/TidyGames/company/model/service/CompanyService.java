package com.TidyGames.company.model.service;

import com.TidyGames.company.model.dao.CompanyDao;
import com.TidyGames.company.model.vo.Company;
import static com.TidyGames.common.JDBCTemplate.*;

import java.sql.Connection;

public class CompanyService {
	
	/**
	 * 게임사 등록
	 * @param c
	 * @return
	 */
	public int insertCompany(Company c) {
		Connection conn = getConnection();
		int result = new CompanyDao().insertCompany(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
