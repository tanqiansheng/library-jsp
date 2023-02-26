package cn.tanqiansheng.books.user.service;
/*
 * 
* <p>Title: UserService</p>  
* <p>Description: </p>u用户模块业务层  
* @author tqs
* @date 2020年6月10日
 */

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import cn.tqs.commons.CommonUtils;
import cn.tqs.mail.Mail;
import cn.tqs.mail.MailUtils;
import cn.tanqiansheng.books.user.dao.UserDao;
import cn.tanqiansheng.books.user.domain.User;

public class UserService {
	private UserDao userDao=new UserDao();
	
	/*
	 * 注册功能
	 */
	public void regist(User user){
		//补数据
		user.setUid(CommonUtils.uuid());
		user.setStatus(false);
		user.setActivationCode(CommonUtils.uuid()+CommonUtils.uuid());
		//插入数据
		try {
			userDao.add(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		//发邮件
		Properties prop=new Properties();
		try {
			prop.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		/*
		 * 登录邮件服务器，得到session
		 */
		String host = prop.getProperty("host");//服务器主机名
		String name = prop.getProperty("username");//登录名
		String pass = prop.getProperty("password");//登录密码
		Session session = MailUtils.createSession(host, name, pass);
		
		
		/*
		 * 创建Mail对象
		 */
		String from = prop.getProperty("from");
		String to = user.getEmail();
		String subject = prop.getProperty("subject");
		String content = MessageFormat.format(prop.getProperty("content"), user.getActivationCode());
		Mail mail = new Mail(from, to, subject, content);
		/*
		 * 发送邮件
		 */
		try {
			MailUtils.send(session, mail);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	
	}

	
	
	/*
	 *  用户名注册校验
	 */
	
	public boolean ajaxValidateLoginname(String loginname) {
		try {
			return userDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	/*
	 *  Email校验
	 */
	public boolean ajaxValidateEmail(String email) {
		try {
			return userDao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/*
	 * 激活功能
	 */
	
	public void activatioin(String code) throws RuntimeException {
		
		try {
			User user = userDao.findByCode(code);
			if(user == null) throw new RuntimeException("无效的激活码！");
			if(user.isStatus()) throw new RuntimeException("您已经激活过了，不要二次激活！");
			userDao.updateStatus(user.getUid(), true);//修改状态
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/*
	 * 登录
	 */
	public User login (User user){
		try {
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
