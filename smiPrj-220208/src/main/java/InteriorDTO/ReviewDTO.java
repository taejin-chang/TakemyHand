package InteriorDTO;
/*
이름        널?       유형             
--------- -------- -------------- 
R_NO      NOT NULL NUMBER         - 글 번호
M_USERID  NOT NULL VARCHAR2(20)   - 회원 아이디
R_TITLE   NOT NULL VARCHAR2(20)   - 글 제목
R_CONTENT NOT NULL VARCHAR2(2000) - 글 내용
R_DATE             DATE           - 작성일
R_COUNT            NUMBER         - 조회수

R_IMG              VARCHAR2(500)  - 첨부파일
P_NO               VARCHAR2(20)   - 상품 번호
STATUS             NUMBER(1)   - 상태 0삭제글, 1 일반글
REF                NUMBER(4)      - 게시글 그룹       
RESTEP             NUMBER(4)      - 게시글 그룹의 글순서
RELEVEL            NUMBER(4)      - 게시글 깊이
*/

public class ReviewDTO {
	private int r_no;
	private String m_userid;
	private String r_title;
	private String r_content;
	private String r_date;
	private int r_count;
	private String r_img;
	private String p_no;
	private int status;
	private int ref;
	private int restep;
	private int relevel;

public ReviewDTO() {
	// TODO Auto-generated constructor stub
}

public int getR_no() {
	return r_no;
}

public void setR_no(int r_no) {
	this.r_no = r_no;
}

public String getM_userid() {
	return m_userid;
}

public void setM_userid(String m_userid) {
	this.m_userid = m_userid;
}

public String getR_title() {
	return r_title;
}

public void setR_title(String r_title) {
	this.r_title = r_title;
}

public String getR_content() {
	return r_content;
}

public void setR_content(String r_content) {
	this.r_content = r_content;
}

public String getR_date() {
	return r_date;
}

public void setR_date(String r_date) {
	this.r_date = r_date;
}

public int getR_count() {
	return r_count;
}

public void setR_count(int r_count) {
	this.r_count = r_count;
}

public String getR_img() {
	return r_img;
}

public void setR_img(String r_img) {
	this.r_img = r_img;
}

public String getP_no() {
	return p_no;
}

public void setP_no(String p_no) {
	this.p_no = p_no;
}

public int getStatus() {
	return status;
}

public void setStatus(int status) {
	this.status = status;
}

public int getRef() {
	return ref;
}

public void setRef(int ref) {
	this.ref = ref;
}

public int getRestep() {
	return restep;
}

public void setRestep(int restep) {
	this.restep = restep;
}

public int getRelevel() {
	return relevel;
}

public void setRelevel(int relevel) {
	this.relevel = relevel;
}



}
	