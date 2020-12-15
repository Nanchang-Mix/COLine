package com.yuanlrc.base.controller.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 下载控制器统一管理类
 * @author llq
 *
 */
@RequestMapping("/download")
@Controller
public class DownloadController {

	@Value("${ylrc.upload.file.path}")
	private String uploadFilePath;//文件保存位置
	
	/**
	 * 统一文件下载方法
	 * @param fid
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/download_file")
	public void downloadFile(@RequestParam(name="filename",required=true)String filename,
			@RequestParam(name="downloadname",required=true,defaultValue="")String downloadname,
			HttpServletRequest request,
			HttpServletResponse response){
		if(StringUtils.isEmpty(downloadname)){
			downloadname = filename;
		}
		try {
			File file = new File(uploadFilePath+filename);
			response.setContentLength(Integer.valueOf(file.length()+""));
			response.setContentType(Files.probeContentType(Paths.get(uploadFilePath+filename)));
			String suffix = filename.substring(filename.lastIndexOf("."),filename.length());
			response.setHeader("Content-Disposition","attachment;filename=" + new String(downloadname.getBytes("UTF-8"), "ISO8859-1")+suffix);
			writefile(response, file);
		} catch (Exception e) {
			//e.printStackTrace();
		}
	}
	
	
	/**
	 * 写文件 方法
	 * 
	 * @param response
	 * @param file
	 * @throws IOException 
	 */
	public void writefile(HttpServletResponse response, java.io.File file) {
		byte[] buff = new byte[1024];
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			ServletOutputStream outputStream = response.getOutputStream();
			int i = bis.read(buff);
			while(i != -1){
				outputStream.write(buff, 0, i);
				i = bis.read(buff);
			}
			bis.close();
			fis.close();
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
	}
	
}
