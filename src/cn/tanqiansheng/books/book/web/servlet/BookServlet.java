package cn.tanqiansheng.books.book.web.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tqs.commons.CommonUtils;
import cn.tqs.servlet.BaseServlet;
import cn.tanqiansheng.books.book.domain.Book;
import cn.tanqiansheng.books.book.service.BookService;
import cn.tanqiansheng.books.pager.PageBean;
/*
 * 
* <p>Title: BookServlet</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020年6月11日
 */
@SuppressWarnings("serial")
public class BookServlet extends BaseServlet {
	private BookService bookService=new BookService();
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	/*
	 * 获取分页当前分页参数的方法
	 */
	private int getPc(HttpServletRequest req){
		int pc=1;
		String param=req.getParameter("pc");
		if(param != null&&!param.trim().isEmpty())
			try{
			pc=Integer.parseInt(param);}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
		return pc;
	}
	/*
	 * 获取分页url分页参数的方法
	 */
	private String getUrl(HttpServletRequest req){
		String url=req.getRequestURI()+"?"+req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index=url.lastIndexOf("&pc=");
		if(index !=-1){
			url=url.substring(0,index);
		}
		return url;
	}
	/*
	 *list分页 
	 */
	public String findByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pc=getPc(req);
		String url=getUrl(req);
//		String cid = req.getParameter("cid");
		System.err.println(url+" "+pc);
		String cid="5F79D0D246AD4216AC04E9C5FAB3199E";
		PageBean<Book> pb = bookService.findByCategory(cid, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	/*
	 * 按id装载显示desc
	 */
	public String load(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid=req.getParameter("bid");
		Book book=bookService.load(bid);
		req.setAttribute("book", book);
		return "f:/jsps/book/desc.jsp";
		
	}
	/*
	 * 按作者分页查询
	 */
	public String findByAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int pc=getPc(req);
		String url=getUrl(req);
		String author=req.getParameter("author");
		PageBean<Book> pb=bookService.findByAuthor(author, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	/*
	 * 按书名分页查询
	 */
	public String findByBname(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		int pc=getPc(req);
		String url=getUrl(req);
		String bname=req.getParameter("bname");
		PageBean<Book> pb=bookService.findByBname(bname, pc);
		/*
		 * 设置其他参数 url
		 */
		pb.setUrl(url);
		/*
		 * 返回pagebean
		 */
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	/*
	 * 按版权分页查询
	 */
	public String findByPress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 得到pc
		 */
		int pc=getPc(req);
		/*
		 * 得到url
		 */
		String url=getUrl(req);
		/*
		 * 获取参数查询条件
		 */
		String press=req.getParameter("press");
		System.err.println(press);
		/*
		 * 获取pagebean的部分参数  beanList pc ps tp  
		 */
		PageBean<Book> pb=bookService.findByPress(press, pc);
		pb.setUrl(url);

		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}
	/*
	 * 多条件查询
	 */
	public String findByCombination(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 得到pc
		 */
		int pc=getPc(req);
		String url=getUrl(req);
		Book criteria=CommonUtils.toBean(req.getParameterMap(), Book.class);
	
		PageBean<Book> pb=bookService.findByCombination(criteria, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	}

	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bid = req.getParameter("bid");
		Book book = bookService.load(bid);
		String savepath = this.getServletContext().getRealPath("/");//获取真实的路径
		new File(savepath, book.getImage_w()).delete();//删除文件
		new File(savepath, book.getImage_b()).delete();//删除文件
		
		bookService.delete(bid);//删除数据库的记录
		req.setAttribute("code", "success");
		req.setAttribute("msg", "删除图书成功！");
		return "f:/jsps/page/msg.jsp";
	}
	/*
	 * 修改图书
	 */
	public String edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map map = req.getParameterMap();
		Book book = CommonUtils.toBean(map, Book.class);
		bookService.edit(book);
		req.setAttribute("code", "success");
		req.setAttribute("msg", "修改图书成功！");
		return "f:/jsps/page/msg.jsp";
	}
	
}
