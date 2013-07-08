package edu.jxsd.x3510.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.sun.mail.iap.Response;

import edu.jxsd.x3510.bean.Admin;
import edu.jxsd.x3510.bean.Book;
import edu.jxsd.x3510.bean.BorrowBook;
import edu.jxsd.x3510.bean.Comment;
import edu.jxsd.x3510.bean.GiveBackBook;
import edu.jxsd.x3510.bean.Reader;
import edu.jxsd.x3510.bean.ReserveBook;
import edu.jxsd.x3510.dao.BookManagement;
import edu.jxsd.x3510.dao.ReaderManagement;

public class ReaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReaderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String actionType;
		actionType = request.getParameter("actionType");
		if (actionType.equals("login")) {
			try {
				this.login(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (actionType.equals("register")) {
			try {
				this.register(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (actionType.equals("myLibrary")) {
			try {
				this.myLibrary(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (actionType.equals("resetPassword")) {
			try {
				this.resetPassword(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (actionType.equals("readerView")) {
			this.readerView(request, response);
		} else if (actionType.equals("readerPage")) {
			this.readerPage(request, response);
		} else if (actionType.equals("readerDelete")) {
			this.readerDelete(request, response);
		} else if (actionType.equals("readerPage")) {
			this.readerPage(request, response);
		} else if (actionType.equals("readerDelete")) {
			this.readerDelete(request, response);
		} else if (actionType.equals("resetSelfPassword")) {
			try {
				this.resetSelfPassword(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(actionType.equals("changeemail")){
			try {
				this.changeemail(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(actionType.equals("resetTel")){
			try {
				this.resetTel(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(actionType.equals("activate")){
			try {
				this.activate(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if (actionType.equals("delCheckedReader")) {
			this.delCheckedReader(request, response);
		}else if (actionType.equals("login1")) {
			this.login1(request, response);
		}else if(actionType.equals("deleteReserve")){
			try {
				this.deleteReserve(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	private void deleteReserve(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		int readerID=Integer.parseInt(request.getParameter("readerID"));
		int bookID=Integer.parseInt(request.getParameter("bookID"));
		Reader reader=new Reader();
		ReaderManagement rm=new ReaderManagement();
		rm.ReserveDeleteByID(readerID,bookID);
		HttpSession session=request.getSession();
		reader=rm.checkReaderID(readerID);
		session.setAttribute("reader",reader);
		try {
			response.sendRedirect("/book-management-system/ReaderServlet?actionType=myLibrary");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	  
		
		
	}

	private void login1(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html; charset=GB2312");
		HttpSession session=request.getSession();
		Admin admin=new Admin();
		
		String adminName=request.getParameter("adminName");
		byte []a=adminName.getBytes("ISO-8859-1");
		adminName=new String(a);
		
		System.out.println("用户名"+adminName);
		admin=(Admin)session.getAttribute("admin");
		Reader reader=null;
		ReaderManagement rm=new ReaderManagement();
		reader=rm.ToReader(adminName);
		if(reader!=null){
		session.setAttribute("reader", reader);
		session.setAttribute("login", reader.getReaderName());
		session.setAttribute("register", "注销");
		try {
			response.sendRedirect("/book-management-system/jsp/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
	}

	private void delCheckedReader(HttpServletRequest request,
			HttpServletResponse response) {
		ArrayList <Reader> al = new ArrayList <Reader> ();
		HttpSession session = request.getSession();
		String str1=request.getParameter("ID");
		String ID[]=str1.split(",");
		String str="";
		for(int i=0;i<ID.length;i++){
			str+="'"+ID[i]+"'";
			if(i!=ID.length-1){
				str+=",";
			}
		}
		ReaderManagement rm=new ReaderManagement();
		boolean rs=rm.delCheckedReader(str);
		if(rs){
			try {
				int pageCount = 0;
				int pageNow = 1;
				int recordSize = 0;
				int pageSize = 5;
				recordSize = rm.getRecordSize();
				if (recordSize % pageSize == 0) {
					pageCount = recordSize / pageSize;
				} else {
					pageCount = recordSize / pageSize + 1;
				}
				al = rm.getFirstPage(pageNow, pageSize);
				session.setAttribute("adminName", session.getAttribute("adminName"));
				session.setAttribute("readList", al);
				session.setAttribute("pageCount", pageCount);
				session.setAttribute("pageNow", pageNow);
				response.sendRedirect("/book-management-system/jsp/usertable.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
	}

	private void activate(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		ReaderManagement rm = new ReaderManagement();
		String email = request.getParameter("email");
		int activate = 0;
		activate = Integer.parseInt(request.getParameter("activate"));
		Reader reader = null;
		reader = rm.checkEmailReset(email);
		reader.setActivate(activate);
		if(rm.readerActivate(reader)){
			response.sendRedirect("/book-management-system/jsp/login.jsp");
		}else{
			System.out.println("用户没有激活");
		}
		//;
	}

	//我的图书馆 ，修改联系信息
	private void resetTel(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		ReaderManagement rm = new ReaderManagement();
		String email = request.getParameter("email");
		Reader reader = null;
		reader = rm.checkEmailReset(email);// 根据传过来的email 找到reader
		reader.setTel(request.getParameter("tel"));
		rm.resetTel(reader);
		HttpSession session=request.getSession();
		session.setAttribute("reader", reader);
		response.sendRedirect("/book-management-system/ReaderServlet?actionType=myLibrary");
	}
	


	private void changeemail(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		ReaderManagement rm=new ReaderManagement();
		String email=request.getParameter("email");
		Reader reader=new Reader();
		reader=rm.checkEmailReset(email);
		if(reader!=null){
			session.setAttribute("email", email);
			try {
				response.sendRedirect("/book-management-system/jsp/changemail.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void resetSelfPassword(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		ReaderManagement rm = new ReaderManagement();
		String email=request.getParameter("email");
		Reader reader =new Reader();
		reader = rm.checkEmailReset(email);// 根据传过来的email 找到reader
		if(reader!=null){
		try {
			session.setAttribute("email", email);
			response.sendRedirect("/book-management-system/jsp/selfResetForm.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else{
			try {
				response.sendRedirect("/book-management-system/jsp/exit.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void readerDelete(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int readerID = Integer.parseInt(request.getParameter("readerID"));
		ReaderManagement rm = new ReaderManagement();
		HttpSession session = request.getSession();
		if (rm.readerDeleteByID(readerID)) {
			this.readList(request, response);
		} else {
			try {
				response.sendRedirect("/book-management-system/jsp/readerDeleteError.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void readerPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pageCount = 0;// 总页数
		int pageNow = Integer.parseInt(request.getParameter("pageNow"));// 当前页
		System.out.println(pageNow + "00000");
		int recordSize = 0;// 总的记录条数
		int pageSize = 5;// 每页条数
		ArrayList readList = new ArrayList();
		ReaderManagement rm = new ReaderManagement();
		recordSize = rm.getRecordSize();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		readList = rm.getCurrentPageReaders(pageNow, pageSize);
		HttpSession session = request.getSession();
		session.setAttribute("readList", readList);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/usertable.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void readList(HttpServletRequest request,// 所有用户的列表函数
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<Book> readList = new ArrayList();
		ReaderManagement rm = new ReaderManagement();
		HttpSession session = request.getSession();
		readList = rm.getAllReader();
		session.setAttribute("readList", readList);
		try {
			response.sendRedirect("/book-management-system/jsp/usertable.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void readerView(HttpServletRequest request,HttpServletResponse response) {//读者信息的查看
		ArrayList <Reader> al = new ArrayList <Reader> ();
		ReaderManagement rm = new ReaderManagement();
		HttpSession session = request.getSession();
		if (session.getAttribute("adminName")==null||(((String)session.getAttribute("adminName")).equals("登录"))) {
			try {
				response.sendRedirect("/book-management-system/jsp/loginfirst.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
		int pageCount = 0;
		int pageNow = 1;
		int recordSize = 0;
		int pageSize = 5;
		recordSize = rm.getRecordSize();
		if (recordSize % pageSize == 0) {
			pageCount = recordSize / pageSize;
		} else {
			pageCount = recordSize / pageSize + 1;
		}
		al = rm.getFirstPage(pageNow, pageSize);
		session.setAttribute("adminName", session.getAttribute("adminName"));
		session.setAttribute("readList", al);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);
		try {
			response.sendRedirect("/book-management-system/jsp/usertable.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
	}

	// 取到当前借阅 , 历史借阅,预约信息

	// 忘记密码后 重置密码
	private void resetPassword(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, Exception {
		// TODO Auto-generated method stub
		ReaderManagement rm = new ReaderManagement();
		String email = request.getParameter("email");
		Reader reader = null;
		reader = rm.checkEmailReset(email);// 根据传过来的email 找到reader
		reader.setReaderPassword(request.getParameter("password"));
		rm.resetForm(reader);
		response.sendRedirect("/book-management-system/jsp/exit2.jsp");
	}
  
	// 取到当前借阅 , 历史借阅,预约信息
	private void myLibrary(HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		ReaderManagement rm = new ReaderManagement();
		HttpSession session = request.getSession();
		ArrayList<BorrowBook> borrowList = new ArrayList<BorrowBook>();
		ArrayList<GiveBackBook> givebackList = new ArrayList<GiveBackBook>();
		ArrayList<ReserveBook> reserveList = new ArrayList<ReserveBook>();
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		ArrayList<GiveBackBook> fineList = new ArrayList<GiveBackBook>();
		Reader reader = new Reader();
		Admin admin=new Admin();
		
		if (session.getAttribute("reader") == null&&session.getAttribute("admin")==null) {
			try {
				response.sendRedirect("/book-management-system/jsp/loginfirst.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else{
			reader = (Reader) session.getAttribute("reader");
			String readerName = reader.getReaderName();
			borrowList = rm.currentborrow(readerName);
			session.setAttribute("borrowList", borrowList);
			givebackList = rm.historyBorrow(readerName);
			session.setAttribute("givebackList", givebackList);
			reserveList = rm.reserveBooks(readerName);
			session.setAttribute("reserveList", reserveList);
			commentList = rm.myComments(readerName);
			session.setAttribute("commentList", commentList);
			fineList = rm.fine(readerName);
			session.setAttribute("fineList", fineList);
			try {
				response.sendRedirect("/book-management-system/jsp/myLibrary.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*admin=(Admin)session.getAttribute("admin");
		 borrowList = rm.currentborrow(adminName);
		 String adminName=admin.getAdminName();
		 session.setAttribute("borrowList", borrowList);
		 givebackList = rm.historyBorrow(adminName);
		 session.setAttribute("givebackList", givebackList);
		 reserveList = rm.reserveBooks(adminName);
		 session.setAttribute("reserveList", reserveList);
		 commentList = rm.myComments(adminName);
		 session.setAttribute("commentList", commentList);
		 fineList = rm.fine(adminName);
		 session.setAttribute("fineList", fineList);*/
	}

	/*
	 * private void checkReader(HttpServletRequest request, HttpServletResponse
	 * response) throws SQLException, IOException { // TODO Auto-generated
	 * method stub String readerName=request.getParameter("readerName"); String
	 * readerPssword=request.getParameter("readerPassword"); Reader reader=new
	 * Reader(); HttpSession session=request.getSession(); ReaderManagement rm =
	 * new ReaderManagement(); reader=rm.checkReader(readerName,readerPssword);
	 * if(reader!=null){
	 * 
	 * } response.sendRedirect("/book-management-system/jsp/index.jsp");
	 * 
	 * }
	 */

	// 把myLibrary里的数据全部取出来

	
	private void register(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException,
			ServletException {
		// TODO Auto-generated method stub
		String readerName = request.getParameter("readerName");
		String email = request.getParameter("Email");
		String code = request.getParameter("inputCode");
		Reader reader;
		HttpSession session = request.getSession();
		ReaderManagement rm = new ReaderManagement();
		if(!code.equals((String)session.getAttribute("randNum"))){
			request.setAttribute("codeMsg","error");
			request.getRequestDispatcher("jsp/register.jsp").forward(
					request, response);
		}
		else if (rm.checkEmail(email) || rm.checkReaderName(readerName)) {
			if (rm.checkEmail(email)) {
				request.setAttribute("email", "error");
				request.getRequestDispatcher("jsp/register.jsp").forward(
						request, response);
			}
			if (rm.checkReaderName(readerName)) {
				request.setAttribute("readerNameMsg", "error");
				request.getRequestDispatcher("jsp/register.jsp").forward(
						request, response);
			}
		} else {
			reader = new Reader();
			reader.setSex(request.getParameter("sex"));
			reader.setReaderName(request.getParameter("readerName"));
			reader.setAcademy(request.getParameter("academy"));
			reader.setReaderPassword(request.getParameter("readerPassword"));
			reader.setClassName(request.getParameter("className"));
			reader.setTel(request.getParameter("tel"));
			reader.setEmail(request.getParameter("Email"));
			reader.setActivate(0);
			if (rm.readerRegister(reader)) {
				session.setAttribute("reader", reader);
				response.sendRedirect("/book-management-system/MailServlet?actionType=comfirmRegister&email="+reader.getEmail()+"");
			}
		}

	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, SQLException {
		// TODO Auto-generated method stub
		Admin admin = null;
		String adminName = null;
		String password = null;
		
		Reader reader = null;
		String readerName = null;
		String readerPassword = null;
		
		Reader reader1 = null;
		String readerName1 = null;
		String readerPassword1 = null;
		readerName = request.getParameter("adminName");
		readerPassword1=request.getParameter("password");
		
		readerName = request.getParameter("user_name");
		readerPassword = request.getParameter("password");
		
		HttpSession session = request.getSession();
		adminName = request.getParameter("user_name");
		password = request.getParameter("password");
		ReaderManagement rm = new ReaderManagement();
		
		reader1=rm.checkReader(adminName, password);
		admin = rm.checkAdmin(adminName, password);
		reader = rm.checkReader(readerName, readerPassword);
		if (admin != null) {
			session.setAttribute("admin", admin);
			session.setAttribute("login", admin.getAdminName());
			session.setAttribute("register", "注销");
			response.sendRedirect("/book-management-system/jsp/admin.jsp");
		} else if (reader != null) {
			session.setAttribute("reader", reader);
			session.setAttribute("login", reader.getReaderName());
			session.setAttribute("register", "注销");
			response.getWriter().write(password);
			/*response.sendRedirect("/book-management-system/jsp/index.jsp");*/
			
		} else if(reader1!=null){
			session.setAttribute("reader", reader);
			session.setAttribute("login", reader.getReaderName());
			session.setAttribute("register", "注销");
			response.sendRedirect("/book-management-system/jsp/index.jsp");
		}
			else {
			request.setAttribute("msg", "error");
			request.getRequestDispatcher("jsp/login.jsp").forward(request,
					response);
			// response.sendRedirect("/book-management-system/jsp/login.jsp?msg=error");
		}
	}

}
