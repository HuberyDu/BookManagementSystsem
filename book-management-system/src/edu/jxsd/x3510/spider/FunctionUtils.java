package edu.jxsd.x3510.spider;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.client.ClientProtocolException;

public class FunctionUtils {
	static int PAGESIZE = 3;
	static String regExUrl = "http://book\\.douban\\.com/subject/[0-9]+/";// ƥ��ͼ�����ַ
	static String regExNAPM = "<meta name=\"keywords\" content=\".*\">";// ƥ�����������ߣ������磬�����·�
	static String regExISBN = "<span class=\"pl\">ISBN:</span>[0-9 \"]+";// ƥ��ISBN
	static String regExPrice = "<span class=\"pl\">����:.*";// ƥ��ͼ�鶨��
	static String regExImage = "http://img3.douban.com/mpic/s[0-9]+.jpg";// ƥ��ͼ��ͼƬ
	static String regExSummary = "<div class=\"intro\">[\\s\\S]*?</div>";// ƥ��ͼ����
	static DownPageFromURL dp = new DownPageFromURL();

	//ͨ������������� �õ�url��ַ
	public ArrayList<String> getAllUrlByType(String search) throws ClientProtocolException,
			IOException {
		ArrayList<String> urlList = new ArrayList<String>();
		String url = null;
		int start = 0;
		
		for(int i =0 ;i < PAGESIZE;i++){
			start = 20 * i;
			url = "http://book.douban.com/tag/"+search+"?start="+start+"&type=T";	
			String context = dp.getContext(url);
			Pattern p = Pattern.compile(regExUrl);
			Matcher m = p.matcher(context);
			String urlSearch = "";
			while (m.find()) {
				if (urlSearch.equals(m.group())) {

				} else {
					urlSearch = m.group();
					urlList.add(urlSearch);
					System.out.println(urlSearch);
				}
			}
		}	
		return urlList;
	}
	
	
	
	//ͨ���������������߻�ISBN �õ�url��ַ
	public ArrayList <String>getAllUrl(String search) throws ClientProtocolException,
			IOException {
		ArrayList<String> urlList = new ArrayList<String>();
		String url = null;	
		url = "http://book.douban.com/subject_search?search_text="
				+ search + "&cat=1003";
		String context = dp.getContext(url);
		Pattern p = Pattern.compile(regExUrl);
		Matcher m = p.matcher(context);
		String urlSearch = "";
		while (m.find()) {
			if (urlSearch.equals(m.group())) {

			} else {
				urlSearch = m.group();
				urlList.add(urlSearch);
				System.out.println(urlSearch);
			}
		}
		return urlList;
	}

	//�ַ���ƥ�� ͼ����
	public String getBookSummary(String context) throws ClientProtocolException,
			IOException {
		String summary = null;
		Pattern p = Pattern.compile(regExSummary);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		p = Pattern.compile("<p>.*</p>");
		m = p.matcher(res);
		if (m.find()) {
			summary = m.group();
		}
		return summary;
	}

	//�ַ���ƥ�� �õ����� ���� ������ ����ʱ��
	public String[] getBookNAPM(String context) throws ClientProtocolException,
			IOException {
		String[] NAPM = new String[4];//0������1������2�ǳ�����3�ǳ���ʱ��
		Pattern p = Pattern.compile(regExNAPM);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		String[] results = res.split("\"");
		results = results[3].split(",");
		if(results.length > 4){
			for (int i = 0; i < 4; i++) {
				NAPM[i] = results[i];
			}
		}else{
			for (int i = 0; i < results.length; i++) {
				NAPM[i] = results[i];
			}
			for(int i = results.length;i<4;i++){
				NAPM[i] = null;
			}
		}
		return NAPM;
	}

	//�ַ���ƥ�� �õ�ͼ��۸�
	public float getBookPrice(String context) throws ClientProtocolException,
			IOException {
		float price = 0;
		Pattern p = Pattern.compile(regExPrice);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		p = Pattern.compile("[0-9.]+");
		m = p.matcher(res);
		if (m.find()) {
			price = Float.parseFloat(m.group());
		}

		return price;
	}

	//�ַ���ƥ��õ�ISBN
	public String getBookISBN(String context) throws ClientProtocolException,
			IOException {
		String price = null;
		Pattern p = Pattern.compile(regExISBN);
		Matcher m = p.matcher(context);
		String res = " ";
		if (m.find()) {
			res = m.group();
		}
		p = Pattern.compile("[0-9]+");
		m = p.matcher(res);
		if (m.find()) {
			price = m.group();
		}
		return price;
	}

	//�õ�ͼ��ͼƬ ��ַ
	public String getBookImage(String context) throws ClientProtocolException,
			IOException {
		String image = null;
		Pattern p = Pattern.compile(regExImage);
		Matcher m = p.matcher(context);
		if (m.find()) {
			image = m.group();
		}
		return image;
	}

	
	
	public static void main(String[] arg) throws ClientProtocolException,
			IOException {
		String url = "http://book.douban.com/subject/5290564/";
		String context = dp.getContext(url);
		FunctionUtils fu = new FunctionUtils();
	/*	 * String url =
		 * "http://book.douban.com/subject_search?search_text=����&cat=1003";
		 * String context = dp.getContext(url); System.out.println(context);*/
		 
		// ArrayList<String> urlList = null;
		// urlList = fu.getAllUrl("����");
		// fu.getBookISBN("http://book.douban.com/subject/5292912/");
		// fu.getBookImage("http://book.douban.com/subject/5292912/");
	//	fu.getBookNAPM("http://book.douban.com/subject/5292912/");
		fu.getBookSummary(context);
	}
}
