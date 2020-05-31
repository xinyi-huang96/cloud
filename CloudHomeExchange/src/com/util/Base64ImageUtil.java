package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Base64.Decoder;

public class Base64ImageUtil {
	/*
	//图片转化成base64字符串  
	public static String GetImageStr(String imgFilePath) {	
		//将图片文件转化为字节数组字符串，并对其进行Base64编码处理 
		InputStream in = null;
		byte[] data = null;
		try {
			in = new FileInputStream(imgFilePath);
			data = new byte[in.available()];
			in.read(data);
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Encoder encoder = Base64.getEncoder();
        String encode = encoder.encodeToString(data);
        return encode;
	}
*/
	//base64字符串转化成图片  
	public static boolean GenerateImage(String imgStr, String savePath) throws IOException{
		if(imgStr == null)
			return false;
		File file = new File(savePath);
		OutputStream out=null;
		if(!file.getParentFile().exists()) {
		    //先得到文件的上级目录，并创建上级目录，在创建文件
           file.getParentFile().mkdirs();
	     }
		try {
			out = new FileOutputStream(file);
			//Base64解码 
			Decoder decoder = Base64.getMimeDecoder();
			byte[] buffer = decoder.decode(imgStr);  
			for(int i = 0; i < buffer.length; ++i) {  
				if(buffer[i]<0) {//调整异常数据  
					buffer[i]+=256;  
				}  
			}
			out.write(buffer);
			out.flush();
			out.close(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}
}
