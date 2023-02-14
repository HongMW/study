package com.lec.ex03_connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lec.db.JDBCConnector;
import com.lec.ex02_board.BoardVO;

public class MyConnector {

	public static void main(String[] args) throws Exception {
		
		Connection conn = JDBCConnector.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement("select * from board");
		rs = pstmt.executeQuery();
		
		System.out.println("==================================================================");
		System.out.println("번호\t\t제목\t\t작성자\t\t내용");
		System.out.println("==================================================================");
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBno(rs.getInt(1));
			board.setSubject(rs.getString("subject"));
			board.setWriter(rs.getString("writer"));
			board.setContent(rs.getString("content"));
			
			System.out.println(board.toString());
			
		}
		
		JDBCConnector.close(conn, pstmt, rs);
	}

}
