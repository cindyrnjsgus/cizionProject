package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comment.CommentBean;


public class BoardDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "jspid";
	String userpw = "jsppw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	

	private static BoardDao dao;

	public static BoardDao getInstance() {
		if(dao==null) {
			dao = new BoardDao();
		}
		return dao;
	}

	private BoardDao() {
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

	
	
	
	
	
	
	public ArrayList<BoardBean> getArticles() {
		getConnection();

		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select * from board";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				BoardBean article = new BoardBean();

				article.setBnum(rs.getInt("bnum"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setContent(rs.getString("content"));
				article.setReadcount(rs.getInt("readcount"));

				lists.add(article);
			}
		} catch (SQLException e) {
		} finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
			}
		}
		return lists;


	}//getArticles
	
	public BoardBean getArticle(int bnum) {
		BoardBean article = null;
		getConnection();
		String sql_update = "update board set readcount = readcount+1 where bnum=?";
		String sql = "select * from board where bnum=?";
		
		try {
			ps = conn.prepareStatement(sql_update);
			ps.setInt(1, bnum);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bnum);
			rs = ps.executeQuery();
			if(rs.next()) {
				article = new BoardBean();

				article.setBnum(rs.getInt("bnum"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setContent(rs.getString("content"));
				article.setReadcount(rs.getInt("readcount"));
			}
			
		} catch (SQLException e) {
		} finally {
				try {
					if(conn!=null)
						conn.close();
					if(ps!=null)
						ps.close();
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
				}
		}
		return article;
		
	}
	
	



}//BoardDao
