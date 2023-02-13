package com.lec.ex01_basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SelectOneMain {

	final static String DRV = "oracle.jdbc.OracleDriver";
	final static String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String USR = "scott";
	final static String PWD = "tiger";
	final static String USER = "hr";
	final static String PSWD = "hr";
	
	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	public static void main(String[] args) {
		
		try {
			Class.forName(DRV);
			conn = DriverManager.getConnection(URL, USR, PWD);
			
			String sql = "select * from emp where empno=? and job=?";
			int row = 0;
			
			// emp테이블에서 한개의 row읽기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 7369);
			pstmt.setString(2, "CLERK");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int empno = rs.getInt(1);
				String ename = rs.getString(2);
				String hiredate = rs.getString("hiredate");
				System.out.println("사원번호=" + empno + ", 사원이름=" + ename + ", 입사일자=" + hiredate);
			} else {
				System.out.println("자료를 찾지 못했습니다!");
			}
		} catch (Exception e) {
			System.out.println("DB연결실패!!");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
			}
		}
		
		try {
			Class.forName(DRV);
			conn = DriverManager.getConnection(URL, USER, PSWD);
			
			String sql = "select * from employees where employee_id=? and job_id=?";
			int row = 0;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 106);
			pstmt.setString(2, "IT_PROG");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int employee_id = rs.getInt(1);
				String first_name = rs.getString(2);
				String last_name = rs.getString("last_name");
				String email = rs.getString("email");
				String phone_number = rs.getString("phone_number");
				System.out.println("사원번호 = " + employee_id + ", 사원이름(f) = " + first_name + ", 사원이름(l) = " + last_name + ", 이메일 = " + email + ", 전화번호 = " + phone_number);
			} else {
				System.out.println("자료를 찾지 못했습니다!");
			}
		} catch (Exception e) {
			System.out.println("DB연결실패!!");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				
			}
		}
	}
	// 실습. hr에서 employees에서 사원 1명만 읽어서 사원정보를 출력(사번, 사원이름(f+l), email, 전화번호)

}

 
