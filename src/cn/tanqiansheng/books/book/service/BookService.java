package cn.tanqiansheng.books.book.service;
/*
 * 
* <p>Title: BookService</p>  
* <p>Description: </p>  图书模块业务层
* @author tqs
* @date 2020年6月11日
 */

import java.sql.SQLException;

import cn.tanqiansheng.books.book.dao.BookDao;
import cn.tanqiansheng.books.book.domain.Book;
import cn.tanqiansheng.books.pager.PageBean;

public class BookService {
	private BookDao bookDao=new BookDao();
/*
 * 按分类查
 */
	public PageBean<Book> findByCategory(String cid, int pc) {
		try {
			return bookDao.findByCategory(cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 按id查询
	 */
	public Book load(String bid){
		try {
			return bookDao.findByBid(bid);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
		
	}
	/*
	 * 按作者条件分页查询
	 */
	public PageBean<Book>  findByAuthor(String author,int pc){
		try {
			return bookDao.findByAuthor(author, pc);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/*
	 * 按书名条件分页查询
	 */
	public PageBean<Book>  findByBname(String bname,int pc){
		try {
			return bookDao.findByName(bname, pc);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/*
	 * 按版权条件分页查询
	 */
	public PageBean<Book>  findByPress(String press,int pc){
		try {
			return bookDao.findByPress(press, pc);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/*
	 * 按多条件条件组合分页查询
	 */
	public PageBean<Book>  findByCombination(Book criteria,int pc){
		try {
			return bookDao.findByCombination(criteria, pc);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/**
	 * 添加图书
	*/
	public void add(Book book) {
		try {
			bookDao.add(book);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
/*
 * 删除图书
 */
	public void delete(String bid) {
		try {
			bookDao.delete(bid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/*修改图书
	 */
	public void edit(Book book) {
		try {
			bookDao.edit(book);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) {
		BookService se=new BookService();
//		PageBean<Book>  pbs=se.findByCategory("5F79D0D246AD4216AC04E9C5FAB3199E",1);
//		System.err.println(pbs.getBeanList());
//		System.err.println(se.load("000A18FDB38F470DBE9CD0972BADB23F"));
//		System.err.println(se.findByAuthor("霍斯特曼", 1));
		System.err.println(se.findByPress("清华大学出版社", 1));
	}
}
