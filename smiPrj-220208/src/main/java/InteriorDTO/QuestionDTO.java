package InteriorDTO;
/*
�̸�        ��?       ����             
--------- -------- -------------- 
Q_NO      NOT NULL NUMBER         - ���Ǳ۹�ȣ
M_USERID  NOT NULL VARCHAR2(20)   - ȸ�����̵�
M_WRITER  NOT NULL VARCHAR2(20)   - ȸ���̸�(�ۼ���)
Q_TITLE   NOT NULL VARCHAR2(100)  - ���� ����
Q_CONTENT NOT NULL VARCHAR2(2000) - ���� ����
Q_DATE             DATE           - ���� �ۼ���
Q_COUNT            NUMBER         - ���� ��ȸ
Q_STATUS           VARCHAR2(20)   - ���� : �Ϲݱ�(0), ��б�(1)
Q_ANDATE           DATE           - ��� �ۼ���
Q_ANSWER           VARCHAR2(2000) - ��� ����
P_NO               VARCHAR2(20)   - ��ǰ ��ȣ
Q_ANNO             VARCHAR2(20)   - ��� ��ȣ

*/
public class QuestionDTO {
	private int q_no;
	private String m_userid;
	//private String m_writer;
	private String q_title;
	private String q_content;
	private String q_date;
	private int q_count;
	private String q_status;
	private int ref;
	private int reStep;
	private int reLevel;
	private String p_no;
	
	public QuestionDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getM_userid() {
		return m_userid;
	}

	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}
	/*
	public String getM_writer() {
		return m_writer;
	}

	public void setM_writer(String m_writer) {
		this.m_writer = m_writer;
	}
	*/
	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public int getQ_count() {
		return q_count;
	}

	public void setQ_count(int q_count) {
		this.q_count = q_count;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	
}