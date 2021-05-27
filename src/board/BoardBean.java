package board;

public class BoardBean {
	private int bnum;
	private String writer;
	private String subject;
	private String content;
	private int readcount;
	
	public BoardBean() {
		
	}

	public BoardBean(int bnum, String writer, String subject, String content, int readcount) {
		super();
		this.bnum = bnum;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
	}

	public int getBnum() {
		return bnum;
	}
	
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}
