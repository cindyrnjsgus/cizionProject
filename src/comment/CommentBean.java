package comment;

public class CommentBean {
	private int cnum;
	private int bnum;
	private int mnum;
	private String ccomment;
	private int good;
	private int bad;
	private String id;
	
	public CommentBean() {
		
	}

	public CommentBean(int cnum, int bnum, int mnum, String ccomment, int good, int bad, String id) {
		super();
		this.cnum = cnum;
		this.bnum = bnum;
		this.mnum = mnum;
		this.ccomment = ccomment;
		this.good = good;
		this.bad = bad;
		this.id = id;
	}
	
	public CommentBean(int cnum, int bnum, int mnum, String ccomment, int good, int bad) {
		super();
		this.cnum = cnum;
		this.bnum = bnum;
		this.mnum = mnum;
		this.ccomment = ccomment;
		this.good = good;
		this.bad = bad;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getCcomment() {
		return ccomment;
	}

	public void setCcomment(String ccomment) {
		this.ccomment = ccomment;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	

	
	

}
