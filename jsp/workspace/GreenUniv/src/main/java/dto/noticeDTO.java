package dto;

public class noticeDTO {
	private int n_no;
	private String n_type;
	private String title;
	private String writer;
	private String wdate;
	private String hits;
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_type() {
		return n_type;
	}
	public void setN_type(String n_type) {
		this.n_type = n_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return "noticeDTO [n_no=" + n_no + ", n_type=" + n_type + ", title=" + title + ", writer=" + writer + ", wdate="
				+ wdate + ", hits=" + hits + "]";
	}

	
	

}
