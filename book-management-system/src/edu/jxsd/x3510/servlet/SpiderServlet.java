package edu.jxsd.x3510.servlet;



import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.dao.BookManagement;
import edu.jxsd.x3510.spider.DownPageFromURL;
import edu.jxsd.x3510.spider.FunctionUtils;
import edu.jxsd.x3510.spider.GetBookBySpider;




/**
 * Servlet implementation class Spider
 */
public class SpiderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SpiderServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType;
		actionType = request.getParameter("actionType");
		if(actionType.equals("spider")){
			this.spider(request,response);
		}else if(actionType.equals("removeBook")){
			this.removeBook(request,response);
		}else if(actionType.equals("saveBook")){
			this.saveBook(request,response);
		}
	}	
	
	private void saveBook(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		BookManagement bm = new BookManagement();
		HttpSession session = request.getSession();
		ArrayList<Book> bookList = null;
		bookList = (ArrayList<Book>) session.getAttribute("bookList");
		for (int size = 0; size < bookList.size(); size++) {
			if (bm.checkBookByISBN(bookList.get(size).getISBN())) {
				bm.bookAdd(bookList.get(size));
			} else {
				System.out.println("ͼ���Ѵ���");
			}
		}
		System.out.println("spiderȡ����ͼ���Ѿ�ȫ���������ݿ�");
		response.sendRedirect("/book-management-system/jsp/spider.jsp");
	}


	private void removeBook(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		ArrayList<Book> bookList = null;
		bookList = (ArrayList<Book>) session.getAttribute("bookList");
		String i = request.getParameter("i");
		bookList.remove(Integer.parseInt(i));
		response.sendRedirect("/book-management-system/jsp/spider.jsp");
	}


	protected void spider(HttpServletRequest request, HttpServletResponse response) throws ClientProtocolException, IOException {
		BookManagement bm = new BookManagement();
		PrintWriter writer = response.getWriter();
		writer.write("���ڴӶ����ȡͼ������ݣ����Ժ�");
		SpiderServlet getBook = new SpiderServlet();
		ArrayList<Book> bookList = null;
		String search = null;
		String bookTypeName = "��ѧ";
		search = request.getParameter("search");
		bookList = getBook.setBook(request, response, search, bookTypeName);
		HttpSession session = request.getSession();
		session.setAttribute("bookList", bookList);
		if(bookList == null){
			System.out.println("spiderû��ȡ��ͼ��");
		}
		response.sendRedirect("/book-management-system/jsp/spider.jsp");
	}
	
	//���������search ����ȡ ͼ����Ϣ
	protected  ArrayList<Book> setBook(HttpServletRequest request, HttpServletResponse response,String search,String bookTypeName) throws ClientProtocolException, IOException{
		SpiderServlet down = new SpiderServlet();
		ArrayList<Book> bookList = new ArrayList<Book>();
		ArrayList<String> urlList = null;
		DownPageFromURL dp = new DownPageFromURL();
		String [][] bookType = new String[6][];
		bookType[0] = new String[]{"��ѧ","С˵","��ѧ","���","�й���ѧ","����","ɢ��","�������"};
		bookType[1] = new String[]{"����","����","����","�ഺ","����","����","���"};
		bookType[2] = new String[]{"��ʷ","��ʷ","����","����"};
		bookType[3] = new String[]{"����","����","����","��־"};
		bookType[4] = new String[]{"����","����ѧ","����","����","����","Ӫ��"};
		bookType[5] = new String[]{"�Ƽ�","����","������","�������","�й���ѧ","���"};
		String imageURL = null;
		String bookImageSaveAddress = null;
		Book book = null;
		FunctionUtils fu = new FunctionUtils();
		int size = 0;
		String[] NAPM = null;
		String context = null;
		for(int i = 0;i < 6;i++){
			for(int j = 1;j < bookType[i].length;j++){
				if(search.equals(bookType[i][j])){
					urlList = fu.getAllUrlByType(search);
					bookTypeName = bookType[i][0];
				}
			}
		}
		if(urlList == null){
			urlList = fu.getAllUrl(search);
		}
		size = urlList.size();
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time=df.format(date); 
		for(int i =0 ;i < size ;i++){
			context = dp.getContext(urlList.get(i));
			book = new Book();
			NAPM = fu.getBookNAPM(context);
			book.setBookTypeName(bookTypeName);
			book.setReadingRoomName(bookTypeName+"������");
			book.setBookName(NAPM[0]);
			book.setAuthor(NAPM[1]);
			book.setPress(NAPM[2]);
			book.setISBN(fu.getBookISBN(context));
			imageURL = fu.getBookImage(context);
			if(imageURL != null){
				bookImageSaveAddress = down.downImage(request, response, imageURL, book.getISBN());
				System.out.println("bookimage"+bookImageSaveAddress);
				book.setBookImage(bookImageSaveAddress);
			}	
			book.setSummargNote(fu.getBookSummary(context));
			book.setPrice(fu.getBookPrice(context));
			book.setStorageTime(time);
			if(book.getAuthor()==null||book.getBookImage()==null||book.getBookName()==null||book.getBookTypeName()==null||book.getISBN()==null||book.getPress()==null||book.getPrice()==0){
				continue;
			}
			System.out.println(book.getAuthor());
			System.out.println(book.getBookImage());
			System.out.println(book.getBookName());
			System.out.println(book.getISBN());
			System.out.println(book.getPress());
			System.out.println(book.getPrice());
			System.out.println(book.getStorageTime());
			System.out.println(book.getSummargNote());
			bookList.add(book);
		}
		return bookList;
	}
	
	//����ͼ��ͼƬ�ĵ�ַ����ͼƬ�������������ر��浽�����ϵĵ�ַ
	protected static String downImage(HttpServletRequest request, HttpServletResponse response,String url,String ISBN) throws ClientProtocolException, IOException{
		HttpClient httpclient = new DefaultHttpClient();
		InputStream instream = null;
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("tomcat��·�� "+path);
		//String path = request.getContextPath();
		//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String bookImageSaveAddress = path+"/images/book/"+ISBN+".jpg";
		File file = new File(bookImageSaveAddress);
		String filePath=file.getAbsolutePath();
		String serverPath = "http://localhost:8080/book-management-system/images/book/"+ISBN+".jpg";
		System.out.println("����·��"+filePath);
		try {
			HttpGet httpget = new HttpGet(url);
			System.out.println("executing request " + httpget.getURI());
			HttpResponse httpResponse = httpclient.execute(httpget);
			HttpEntity entity = httpResponse.getEntity();
			System.out.println("----------------------------------------");
			System.out.println(httpResponse.getStatusLine());
			if (entity != null) {
				System.out.println("Response content length: "
						+ entity.getContentLength());
				instream = entity.getContent();
				OutputStream out = new BufferedOutputStream(new FileOutputStream(file));
				byte[] buff = new byte[(int) entity.getContentLength()];
				for (int i = 0; (i = instream.read(buff)) > 0;) {
					out.write(buff, 0, i);
				}
				out.close();
				instream.close();
				}
			;
			System.out.println("----------------------------------------");
			httpget.abort();
		} finally {
			httpclient.getConnectionManager().shutdown();
		}
		return serverPath;
	}
}
