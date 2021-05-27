package member;

public class MemberBean {
	private int mnum;
	private String id;
	private String pw;
	
	private int count;
	
	public MemberBean() {
		
	}
	
	

	public MemberBean(int mnum, String id, String pw, int count) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pw = pw;
		this.count = count;
	}



	public MemberBean(int mnum, String id, String pw) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pw = pw;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}

	
	
	
}
