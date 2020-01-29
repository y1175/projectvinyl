package hs.com.homedream.question;

public class QuestionDTO {
	private int q_no;
	private int mem_no;
	private String title;
	private String content;
	private String qdate;
	private int readno;
	private String filename;
	private String mem_name;
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public int getReadno() {
		return readno;
	}
	public void setReadno(int readno) {
		this.readno = readno;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
}
