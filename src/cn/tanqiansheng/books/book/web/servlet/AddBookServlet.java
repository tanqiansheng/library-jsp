package cn.tanqiansheng.books.book.web.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.tqs.commons.CommonUtils;
import cn.tanqiansheng.books.book.domain.Book;
import cn.tanqiansheng.books.book.service.BookService;
/*
 * 
* <p>Title: AddBookServlet</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020年6月12日
*  1. commons-fileupload的上传三步
*  创建工具
*   2. 创建解析器对象
*   3. 解析request得到List<FileItem>
*    4. 把List<FileItem>封装到Book对象中
 */
@SuppressWarnings("serial")
public class AddBookServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 创建工具
		 */
		FileItemFactory factory= new DiskFileItemFactory();
		/*
		 * 创建解析器对象
		 */
		ServletFileUpload sfu=new ServletFileUpload(factory);
		//单文件上传上限80kb
		sfu.setSizeMax(80*1021);
		/*
		 * request得到list<fileitem>
		 */
		List<FileItem> fileItemList=null;
		try {
			fileItemList=sfu.parseRequest(request);
		} catch (FileUploadException e) {
			error("上传的文件超出了80KB", request, response);
			return;
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		for(FileItem fileItem : fileItemList) {
			if(fileItem.isFormField()) {//如果是普通表单字段
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}}
		Book book = CommonUtils.toBean(map, Book.class);
		FileItem fileItem = fileItemList.get(1);//获取大图
		String filename = fileItem.getName();
		// 截取文件名，因为部分浏览器上传的绝对路径
				int index = filename.lastIndexOf("\\");
				if(index != -1) {
					filename = filename.substring(index + 1);
				}
				//避免重名文件名
				filename = CommonUtils.uuid() + "_" + filename;
				if(!filename.toLowerCase().endsWith(".jpg")) {
					error("上传的图片扩展名必须是JPG", request, response);
					return;
				}
				String savepath = this.getServletContext().getRealPath("/book_img");
				File destFile = new File(savepath, filename);
				try {
					fileItem.write(destFile);//它会把临时文件重定向到指定的路径，再删除临时文件
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				
				
				// 校验尺寸
				// 1. 使用文件路径创建ImageIcon
				ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
				// 2. 通过ImageIcon得到Image对象
				Image image = icon.getImage();
				// 3. 获取宽高来进行校验
				if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
					error("您上传的图片尺寸超出了350*350！", request, response);
					destFile.delete();//删除图片
					return;
				}
				
				// 把图片的路径设置给book对象
				book.setImage_w("book_img/" + filename);
				
				// 获取文件名
				fileItem = fileItemList.get(2);//获取小图
				filename = fileItem.getName();
				// 截取文件名，因为部分浏览器上传的绝对路径
				index = filename.lastIndexOf("\\");
				if(index != -1) {
					filename = filename.substring(index + 1);
				}
				// 给文件名添加uuid前缀，避免文件同名现象
				filename = CommonUtils.uuid() + "_" + filename;
				// 校验文件名称的扩展名
				if(!filename.toLowerCase().endsWith(".jpg")) {
					error("上传的图片扩展名必须是JPG", request, response);
					return;
				}
			
		
				savepath = this.getServletContext().getRealPath("/book_img");
				/*
				 * 2. 创建目标文件
				 */
				destFile = new File(savepath, filename);
				/*
				 * 3. 保存文件
				 */
				try {
					fileItem.write(destFile);//它会把临时文件重定向到指定的路径，再删除临时文件
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				// 校验尺寸
				// 1. 使用文件路径创建ImageIcon
				icon = new ImageIcon(destFile.getAbsolutePath());
				// 2. 通过ImageIcon得到Image对象
				image = icon.getImage();
				// 3. 获取宽高来进行校验
				if(image.getWidth(null) > 350 || image.getHeight(null) > 350) {
					error("您上传的图片尺寸超出了350*350！", request, response);
					destFile.delete();//删除图片
					return;
				}
				
				// 把图片的路径设置给book对象
				book.setImage_b("book_img/" + filename);
				
				// 调用service完成保存
				book.setBid(CommonUtils.uuid());
				BookService bookService = new BookService();
				bookService.add(book);
				
				// 保存成功信息转发到msg.jsp
				request.setAttribute("msg", "添加图书成功！");
				request.setAttribute("code","success");
				request.getRequestDispatcher("/jsps/page/msg.jsp").forward(request, response);
			}
			
	
	
	private void error(String msg, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/jsps/book/add.jsp").forward(request, response);
	}

}
