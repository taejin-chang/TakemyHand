package InteriorDTO;
/*
	c_no varchar2(20) not null ,	-- 장바구니 번호
	p_no varchar2(20) not null,		-- 상품번호
	m_userid varchar2(20) not null, -- 회원ID
	c_amount number not null,		-- 총수량
	p_imgsrc varchar2(2000),	 	-- 상품 이미지 파일명
	c_sum number not null,			-- 합계
	primary key(c_no)			-- 기본키 : 장바구니 번호
*/
public class CartDTO {
	private int c_no;
	private String p_no;
	private String m_userid;
	private int c_amount;
	private String p_imgsrc;
	private int c_sum;
	private String p_name;
	private String p_kinds;
	private int o_group;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getM_userid() {
		return m_userid;
	}

	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}

	public int getC_amount() {
		return c_amount;
	}

	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}

	public String getP_imgsrc() {
		return p_imgsrc;
	}

	public void setP_imgsrc(String p_imgsrc) {
		this.p_imgsrc = p_imgsrc;
	}

	public int getC_sum() {
		return c_sum;
	}

	public void setC_sum(int c_sum) {
		this.c_sum = c_sum;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_kinds() {
		return p_kinds;
	}

	public void setP_kinds(String p_kinds) {
		this.p_kinds = p_kinds;
	}

	public int getO_group() {
		return o_group;
	}

	public void setO_group(int o_group) {
		this.o_group = o_group;
	}
	
	
	
	
	
}