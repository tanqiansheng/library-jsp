package cn.tanqiansheng.books.book.dao;
/*
 * 
* <p>Title: BookDao</p>  
* <p>Description: </p>  图书模块持久层
* @author tqs
* @date 2020年6月11日
 */

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.tqs.jdbc.TxQueryRunner;
import cn.tanqiansheng.books.book.domain.Book;
import cn.tanqiansheng.books.pager.Expression;
import cn.tanqiansheng.books.pager.PageBean;
import cn.tanqiansheng.books.pager.PageConstants;

public class BookDao {
	private QueryRunner qr=new TxQueryRunner();
	
	/*
	 * 按bid查询
	 */
	public Book findByBid(String bid) throws SQLException{
		String sql="SELECT * FROM t_book  WHERE bid=?";
	    return	qr.query(sql, new BeanHandler<Book>(Book.class),bid);
		
	}
	/*
	 * 按作者查询
	 */
	public PageBean<Book> findByAuthor(String author,int pc) throws SQLException{
		List<Expression> exprList=new ArrayList<Expression>();
		exprList.add(new Expression("author","like","%"+author+"%"));
		return findByCriteria(exprList, pc);
		
	}

	/*
	 * 按书名模糊查询
	 */
	public PageBean<Book> findByName(String bname,int pc) throws SQLException{
		List<Expression> exprList=new ArrayList<Expression>();
		exprList.add(new Expression("bname","like","%"+bname+"%"));
		return findByCriteria(exprList, pc);
		
	}
	public PageBean<Book> findByPress(String press,int pc) throws SQLException{
		List<Expression> exprList=new ArrayList<Expression>();
		exprList.add(new Expression("press","like","%"+press+"%"));
		return findByCriteria(exprList, pc);
		
	}
	public PageBean<Book> findByCombination(Book criteria, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("bname", "like", "%" + criteria.getBname() + "%"));
		exprList.add(new Expression("author", "like", "%" + criteria.getAuthor() + "%"));
		exprList.add(new Expression("press", "like", "%" + criteria.getPress() + "%"));
		return findByCriteria(exprList, pc);
	}
	
	/*
	 * 按书名分类查询
	 */
	public PageBean<Book> findByCategory(String cid, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cid", "=", cid));
		return findByCriteria(exprList, pc);
	}
	
	
	
	
	
	
	
	
	/*
	 * list 分页
	 */
	private PageBean<Book> findByCriteria(List<Expression > exprList,int pc) throws SQLException{
		/*
		 * 1. 得到ps
		 * 2. 得到tr
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		int ps=PageConstants.BOOK_PAGE_SIZE;
		
		StringBuilder whereSql=new StringBuilder(" where 1=1 ");
		/*
		 * 获取问号个数
		 */
		List<Object> params=new ArrayList<Object>();
		for(Expression expr:exprList){
			whereSql.append(" and ").append(expr.getName()).append(" ")
			.append(expr.getOperator()).append(" ");
			
			if(!expr.getOperator().equals(" is null")){
				whereSql.append("?");
				params.add(expr.getValue());
			}
			
		}	
		/*
		 * 总记录数
		 */
		
		String  sql="select count(*) from t_book"+whereSql;
		Number numbet=(Number) qr.query(sql, new ScalarHandler(),params.toArray());
		int tr=numbet.intValue();
		
		/*
		 * 
		 * 得到beanlist，当页的记录
		 */
		sql="select *  from t_book"+whereSql + " order by orderBy limit ?,?";
		params.add(pc-1);
		params.add(ps);
		List<Book> beanList=qr.query(sql, new BeanListHandler<Book>(Book.class),params.toArray());
		
		/*
		 * 创建pagebean 设置参数
		 */
		PageBean<Book> pb=new PageBean<Book>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}
	/**
	 * 添加图书
	 */
	public void add(Book book) throws SQLException {
		String sql = "insert into t_book(bid,bname,author,price,currPrice," +
				"discount,press,publishtime,edition,pageNum,wordNum,printtime," +
				"booksize,paper,cid,image_w,image_b)" +
				" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {book.getBid(),book.getBname(),book.getAuthor(),
				book.getPrice(),book.getCurrPrice(),book.getDiscount(),
				book.getPress(),book.getPublishtime(),book.getEdition(),
				book.getPageNum(),book.getWordNum(),book.getPrinttime(),
				book.getBooksize(),book.getPaper(),"5F79D0D246AD4216AC04E9C5FAB3199E",
				book.getImage_w(),book.getImage_b()};
		qr.update(sql, params);
	}
/*
 * 修改图书
 */
	public void edit(Book book) throws SQLException {
		String sql = "update t_book set bname=?,author=?,price=?,currPrice=?," +
				"discount=?,press=?,publishtime=?,edition=?,pageNum=?,wordNum=?," +
				"printtime=?,booksize=?,paper=?,cid=? where bid=?";
		Object[] params = {book.getBname(),book.getAuthor(),
				book.getPrice(),book.getCurrPrice(),book.getDiscount(),
				book.getPress(),book.getPublishtime(),book.getEdition(),
				book.getPageNum(),book.getWordNum(),book.getPrinttime(),
				book.getBooksize(),book.getPaper(), 
				"5F79D0D246AD4216AC04E9C5FAB3199E",book.getBid()};
		System.err.println(book.toString());
		System.err.println(qr.update(sql, params));
		
	}
	/*
	 * 删除图书
	 */
	public void delete(String bid) throws SQLException {
		String sql = "delete from t_book where bid=?";
		System.err.println(qr.update(sql, bid));
		/*qr.update(sql, bid);*/
	}
}
