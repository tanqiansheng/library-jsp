package cn.tanqiansheng.books.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.tqs.jdbc.JdbcUtils;
import cn.tqs.jdbc.TxQueryRunner;
import cn.tanqiansheng.books.user.domain.User;
/*
 * 
* <p>Title: UserDao</p>  
* <p>Description: </p>  用户模块持久层
* @author tqs
* @date 2020年6月10日
 */
@SuppressWarnings("unused")
public class UserDao {
	private QueryRunner qr=new TxQueryRunner();
	
	public void add(User user) throws SQLException{
		String sql="insert into t_user values(?,?,?,?,?,?)";
		Object[] params={user.getUid(),user.getLoginname(),user.getLoginpass(),
				user.getEmail(),user.isStatus(),user.getActivationCode()};
		qr.update(sql,params);
	}
	/*
	 * 校验Email是否注册
	 */
	public boolean ajaxValidateEmail(String email) throws SQLException {
		String sql = "select count(1) from t_user where email=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), email);
		return number.intValue() == 0;
	}
	
	/*
	 * 校验用户名是否注册
	 */
	public boolean ajaxValidateLoginname(String loginname ) throws SQLException{
		String sql="select count(1) from t_user where loginname=?";
		Number number=(Number) qr.query(sql, new ScalarHandler(),loginname);
		return number.intValue()==0;
	}
	/*
	 * 修改用户状态
	 */
	public void updateStatus(String uid, boolean status) throws SQLException {
		String sql = "update t_user set status=? where uid=?";
		qr.update(sql, status, uid);
	}
	/*
	 * 通过激活码查询用户
	 */
	public User findByCode(String code) throws SQLException{
		String sql="select * from t_user where activationCode=?";
		return qr.query(sql, new BeanHandler<User>(User.class),code);
		
	}
	/*
	 * 通过用户名和密码查询
	 */
	public User findByLoginnameAndLoginpass(String loginname,String loginpass) throws SQLException{
		String sql="select * from t_user where loginname=? and loginpass=?";
		return qr.query(sql, new BeanHandler<User>(User.class),loginname,loginpass);
	}
	
		public List<User> sele() throws SQLException{
			String sql="select * from t_user";
			return qr.query(sql, new BeanListHandler<User>(User.class));
		}
	public static void main(String[] args) throws SQLException {
		UserDao dao=new UserDao();
		System.out.println(	dao.findByCode("D00FAA82457748FF8C1B912042E615B39F3602053E154181B98CDD48D9ECFC96"));
		System.out.println(	dao.findByLoginnameAndLoginpass("赵云","123"));
//		System.err.println(JdbcUtils.getConnection());
	/*	List<User> list=dao.sele();
		for(User user:list){
			System.err.println(user);
			
		}*/
		
	}
}


