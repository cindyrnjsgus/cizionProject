package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "jspid";
	String userpw = "jsppw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;



	private static MemberDao dao;

	public static MemberDao getInstance() {
		if(dao==null) {
			dao = new MemberDao();
		}
		return dao;
	}

	private MemberDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
		}
	}//BoardDao

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,userid,userpw);
		} catch (SQLException e) {
		}
	}//getConnection


	public MemberBean loginInfo(String id,String pw) {
		MemberBean bean = new MemberBean();
		getConnection();
		String sql = "select * from member where id=? and pw=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();

			if(rs.next()) {
				bean.setMnum(rs.getInt("mnum"));
				bean.setId(rs.getString("id")) ;
				bean.setPw(rs.getString("pw"));
			}
		} catch (SQLException e) {

		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
			}
		}
		return bean;
	}

	




}



