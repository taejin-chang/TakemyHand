package InteriorDTO;
/*
create table orders (
	o_no number not null ,	-- 주문번호
	m_userid varchar2(20) not null, -- 회원ID
	m_tel varchar2(20) not null,  	-- 휴대폰
	m_email varchar2(60) not null,	-- 이메일
	o_amount number(5) not null,	-- 주문 상품 건수 
    o_guest varchar2(20) not null ,  -- 받는사람(수취인)
    zipcode VARCHAR2(20) not null, -- zipcode 
	m_add1	varchar2(100) not null, -- 기본주소
	m_add2 varchar2(100) ,			-- 나머지 주소
	o_stat varchar2(100) default 0 not null ,  -- 주문상태   주문시 : 1 ---> 기본값 0 으로입력
	o_msg varchar2(200) , 			-- 요청사항
	p_no varchar2(20)  not null,	-- 상품번호
	primary key(o_no)			-- 기본키 : 주문번호
);
*/
public class OrdersDTO {
	private int o_no;
	private String m_userid;
	private String m_tel;
	private int o_amount;
	private String o_guest;
	private String zipcode;
	private String m_add1;
	private String m_add2;
	private String o_stat; // 입금완료 : 1
	private String o_msg;
	private String p_no;
	private int o_price;
	
	public OrdersDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getM_userid() {
		return m_userid;
	}

	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public int getO_amount() {
		return o_amount;
	}

	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}

	public String getO_guest() {
		return o_guest;
	}

	public void setO_guest(String o_guest) {
		this.o_guest = o_guest;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getM_add1() {
		return m_add1;
	}

	public void setM_add1(String m_add1) {
		this.m_add1 = m_add1;
	}

	public String getM_add2() {
		return m_add2;
	}

	public void setM_add2(String m_add2) {
		this.m_add2 = m_add2;
	}

	public String getO_stat() {
		return o_stat;
	}

	public void setO_stat(String o_stat) {
		this.o_stat = o_stat;
	}

	public String getO_msg() {
		return o_msg;
	}

	public void setO_msg(String o_msg) {
		this.o_msg = o_msg;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	
	
	
}
