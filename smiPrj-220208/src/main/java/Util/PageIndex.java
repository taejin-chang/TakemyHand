package Util;

import java.net.URLEncoder;

public class PageIndex {
	public static String pageList(int page,int totpage,String url,String addtag) {
		int idx_pre, idx_start;
		  	
		String s_pre = "";    // Prev ���� ����
		String s_idx = "";    // ��ȣ ���� ����
		String s_next = "";   // Next ���� ����

		idx_start = ((page-1) / 10) * 10 + 1 ;  // ���� ������ ���
		idx_pre = ((page-1) / 10);              // Priview ������ ���

	  	// Prev ǥ�� �κ�
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*10)+addtag+"'>"
	  				+ "<img src=//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif width=30 height=7></a>";
	  	} else {
	  		s_pre = "<img src=//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif width=30 height=7> ";
	  	}

	  	// ��ȣ ǥ�úκ�	
	  	for(int i=0;i<10;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <div class='xans-element- xans-product xans-product-normalpaging ec-base-paginate' style=float: left;><ol><li class='xans-record'><a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + addtag + "'> " + idx_start + "</a></li></ol></div>";
	  		}
	  	}
		// Next ǥ�úκ�
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+addtag+"'>"
	  				+ "<img src=//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif width=30 height=7></a>";
	  	} else {
	  		s_next = " <img src=//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next;  // Html �� ����
	  	return outHtml;
	}

	public static String pageListHan(int page,int totpage,String url,String query, String key) {
		int idx_pre, idx_start;
		  	
		String s_pre = "";    // Prev ���� ����
		String s_idx = "";    // ��ȣ ���� ����
		String s_next = "";   // Next ���� ����

		idx_start = ((page-1) / 10) * 10 + 1 ;  // ���� ������ ���
		idx_pre = ((page-1) / 10);              // Priview ������ ���

	  	// Prev ǥ�� �κ�
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*10)+"&search="+query+"&key="+ URLEncoder.encode(key)+"'>"
	  				+ "<img src=//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif></a>";
	  	} else {
	  		s_pre = "<img src=//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif> ";
	  	}

	  	// ��ȣ ǥ�úκ�	
	  	for(int i=0;i<10;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + "&search="+query+"&key=" + URLEncoder.encode(key) + "'> " + idx_start + " </a> ";
	  		}
	  	}
		// Next ǥ�úκ�
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+ "&search="+query+"&key="+ URLEncoder.encode(key)+"'>"
	  				+ "<img src=//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif></a>";
	  	} else {
	  		s_next = " <img src=//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next;  // Html �� ����
	  	return outHtml;
	}

}
