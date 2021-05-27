package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardBean;
import board.BoardDao;
import member.MemberBean;

public class CommentDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "jspid";
	String userpw = "jsppw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;



	private static CommentDao dao;

	public static CommentDao getInstance() {
		if(dao==null) {
			dao = new CommentDao();
		}
		return dao;
	}

	private CommentDao() {
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

	public int getCommentWriter(int bnum,int mnum) {
		int cnt = 0;
		MemberBean bean = new MemberBean();
		getConnection();
		
		String count_sql = "select count(*) from comm where bnum = ? and mnum = ?";
		try {
			ps = conn.prepareStatement(count_sql);
			ps.setInt(1, bnum);
			ps.setInt(2, mnum);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			} 
			System.out.println("cnt:"+cnt);
			
			
		} catch (SQLException e) {
		}finally {
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
		return cnt;
	}

	public void writeComment(int bnum, int mnum, String comment) {
		getConnection();
		
		String sql = "insert into comm(cnum, bnum, mnum, ccomment) values(comm_seq.nextval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bnum);
			ps.setInt(2, mnum);
			ps.setString(3, comment);
			ps.executeUpdate();

		} catch (SQLException e) {
		}finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
	}//writeComment


	public ArrayList<CommentBean> getComments(int bbnum) {
		ArrayList<CommentBean> lists = new ArrayList<CommentBean>();

		getConnection();

		String sql = "select c.cnum,c.bnum,c.mnum,c.ccomment,c.good,c.bad,m.id"
				+ " from comm c, member m"
				+ " where bnum = ? and c.mnum = m.mnum";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bbnum);
			rs = ps.executeQuery();
			while(rs.next()) {
				CommentBean bean = new CommentBean();
				bean.setCnum(rs.getInt("cnum"));
				bean.setBnum(rs.getInt("bnum"));
				bean.setMnum(rs.getInt("mnum"));
				bean.setCcomment(rs.getString("ccomment")) ;
				bean.setGood(rs.getInt("good"));
				bean.setBad(rs.getInt("bad"));

				bean.setId(rs.getString("id"));

				lists.add(bean);
			}
		} catch (SQLException e) {
		}finally {
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


	}//getComments
	

	public void updateGood(int cnum) {
		getConnection();

		String sql = "update comm set good=good+1 where cnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			ps.executeUpdate();
		} catch (SQLException e) {
		}finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
	}//updateGood


	public void updateBad(int cnum) {
		getConnection();

		String sql = "update comm set bad=bad-1 where cnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			ps.executeUpdate();
		} catch (SQLException e) {
		}finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
	}//updateBad
	
	public void deleteComment(int cnum) {
		getConnection();
		
		String sql = "delete comm where cnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			ps.executeUpdate();
		} catch (SQLException e) {
		}finally {
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
	}//deleteComment
	
	public ArrayList<CommentBean> getThisComment(int ccnum) {
		ArrayList<CommentBean> list = new ArrayList<CommentBean>();
		getConnection();
		String sql = "select * from comm where cnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ccnum);
			rs = ps.executeQuery();
			while(rs.next()) {
				int cnum = rs.getInt("cnum");
				int bnum = rs.getInt("bnum");
				int mnum = rs.getInt("mnum");
				String ccomment = rs.getString("ccomment");
				int good = rs.getInt("good");
				int bad = rs.getInt("bad");
				
				CommentBean bean = new CommentBean(cnum,bnum,mnum,ccomment,good,bad);
				list.add(bean);

			}
		} catch (SQLException e) {
		}finally {
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
		return list;
	}//getThisComment
	
	
	  public void updateThisComment(int upcnum, String upcomment) { 
		  getConnection(); 
		  String sql = "update comm set ccomment = ? where cnum = ?";
		  try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, upcomment);
			ps.setInt(2, upcnum);
			ps.executeUpdate();
		} catch (SQLException e) {
		}
	}//updateThisComment
	 




}
