package com.inews.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.inews.utils.DbCRUD;


public class SubmitServlet extends HttpServlet {

	/**
	 * 在新闻发布界面   提交数据（包括内容和类别）到后台，后跳转到中间servlet（防止刷新）
	 * @author weipeng
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//response.setContentType("text/html;charset=gbk");
		//request.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();	

		int[] varity = new int[1] ; //新闻类别	
		String[] dbnews = new String[10] ; //新闻类别			
		//新加代码异常删除 *
		
		String savePath = this.getServletContext().getRealPath("images");
        File file = new File(savePath);
        //判断上传文件的保存目录是否存在
        if (!file.exists() && !file.isDirectory()) {
            System.out.println(savePath+"目录不存在，需要创建");
            //创建目录
            file.mkdir();
        }
        //消息提示
        String message = "";
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
             //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8"); 
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                return;
            }
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                	
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    System.out.println(name + "=" + value);
                    
                    if(name.equals("content1")){
                    	dbnews[0] = value;  
                    	dbnews[0].replaceAll("\n","<br>");
                    	dbnews[0].replaceAll(" ","&nbsp;");
                    }else if(name.equals("title")){
                    	dbnews[1] = value;                	
                    }else if(name.equals("checkbox")){
                    	dbnews[2] =  value;         //取出选中类别的数值           
                		if(dbnews[2].equals("热点")){
                			varity[0] = 0; 
                		}
                		if(dbnews[2].equals("军事")){
                			varity[0] = 1; 
                		}
                		if(dbnews[2].equals("娱乐")){
                			varity[0] = 2; 
                		}
                		if(dbnews[2].equals("经济")){
                			varity[0] = 3; 
                		}
                		if(dbnews[2].equals("汽车")){
                			varity[0] = 4; 
                		}
                    }else if(name.equals("userid")){
                    	dbnews[3] =  value;              	
                    }
                    
                    //新加代码*
                    //以下代码为新闻信息加入数据库内容代码       
                    
                    //*新加代码        
                }else{//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = item.getName();
                    System.out.println(filename);
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //创建一个文件输出流
                    FileOutputStream out1 = new FileOutputStream(savePath + "\\" + filename);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out1.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out1.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                    message = "文件上传成功！";
                }
            }
        }catch (Exception e) {
            message= "文件上传失败！";
            e.printStackTrace();
            
        }
        request.setAttribute("message",message);
		// *新加代码异常删除	      
        Date dt = new Date();//获取当前时间
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日HH时mm分");
		String date =format.format(dt);
		//将发布的新闻内容插入数据库
		DbCRUD db = new DbCRUD();
		String sql="insert into news(newstitle,newsbody,newsdate,userid,newsimage,newsvideo,typeid,ispublish) values(?,?,?,?,?,?,?,?)";	
		int result=(Integer) db.update(sql,dbnews[1],dbnews[0],date,dbnews[3],"6","7",varity[0],"0");
		result++;
		db.releaseConn();   			
		

  		response.sendRedirect("/iNews/SubmitTempServlet");   
		
	}
	
	

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
