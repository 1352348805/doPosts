package com.doposts.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 基础DAO
 */
public class BaseDao {

	private Connection conn;

	public BaseDao(Connection conn) {
		this.conn = conn;
	}



	/**
	 * 	 数据库增删改方法
	 *
	 * @param sql    预编译sql语句
	 * @param params 预编译参数
	 * @return 数据库影响行数
	 * @throws SQLException 数据库异常
	 */
	protected int executeUpdate(String sql, Object... params) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	/**
	 * 执行查询使用的方法
	 *
	 * */
	protected ResultSet executeQuery(String sql, Object... params) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return rs;
	}

}
