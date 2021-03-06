package InteriorDTO;

/*
�̸�        ��?       ����             
--------- -------- -------------- 
B_NO      NOT NULL NUMBER         - �� ��ȣ
M_USERID  NOT NULL VARCHAR2(20)   - ȸ�� ���̵�
M_WRITER  NOT NULL VARCHAR2(20)   - ȸ���̸�(�ۼ���)
B_TITLE   NOT NULL VARCHAR2(1000) - ��� ����
B_CONTENT NOT NULL VARCHAR2(2000) - ��� ����
B_IMG              VARCHAR2(100)  - ÷������
B_DATE             DATE           - �ۼ���
B_COUNT            NUMBER         - ��ȸ��
B_STATUS  NOT NULL NUMBER         - ���� : �Ϲݱ�(0), ��б�(1)

*/
public class BoardDTO {
	private int b_no;
	private String m_userid;
	private String b_title;
	private String b_content;
	private String b_date;
	private int b_count;
	private String b_img;
	private String p_no;
	private int status;
	private int ref;
	private int restep;
	private int relevel;

	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getM_userid() {
		return m_userid;
	}

	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
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
