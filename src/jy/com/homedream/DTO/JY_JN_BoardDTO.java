package jy.com.homedream.DTO;

public class JY_JN_BoardDTO {

	private int bno;
	private int mem_no;
	private String btitle;
	private String bcontent;
	private int likeno; // 좋아요
	private int readno; // 조회수
	private String writedate;
	private String file_name;
	private String id;
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getLikeNo() {
		return likeno;
	}
	public void setLikeNo(int likeno) {
		this.likeno = likeno;
	}
	public int getReadNo() {
		return readno;
	}
	public void setReadNo(int readno) {
		this.readno = readno;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
}
