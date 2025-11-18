package com.sist.model;

import java.io.File;
import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.sist.vo.*;
@Controller
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  
	    maxFileSize = 5 * 1024 * 1024L,   
	    maxRequestSize = 20 * 1024 * 1024L 
)
public class ImageUploadModel {
  @RequestMapping("test/upload.do")
  public String test_upload(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../test/upload.jsp";
  }
  @RequestMapping("test/upload_result.do")
  public String test_upload_result(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
	    URL url=this.getClass().getClassLoader().getResource(".");
		File file=new File(url.toURI());
		//System.out.println(file.getPath());
		String path=file.getPath();
		path=path.replace("\\", File.separator);
		//System.out.println(path);
		path=path.substring(0,path.lastIndexOf(File.separator));
		path=path.substring(0,path.lastIndexOf(File.separator));
		//System.out.println(path);
		path=path+File.separator+"uploads";
		File dir=new File(path);
		if(!dir.exists())
		{
			dir.mkdir();
		}
		
	        // ✅ 올바른 ServletContext 접근
	        ServletContext context = request.getServletContext();
	        String uploadPath = context.getRealPath("/uploads");

	        List<ImageVO> list = new ArrayList<>();

	        for (Part part : request.getParts()) {
	            if ("images".equals(part.getName()) && part.getSize() > 0) {
	                String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
	                String fileName = System.currentTimeMillis() + "_" + originalFileName;
	                String savePath = uploadPath + File.separator + fileName;
	                part.write(savePath);

	                String fileUrl = request.getContextPath() + "/uploads/" + fileName;
	                list.add(new ImageVO(fileName, fileUrl));
	            }
	        }

	        request.setAttribute("list", list);

	     } catch (Exception e) {
	        e.printStackTrace();
	    }
	  return "../test/upload_result.jsp";
  }
}
