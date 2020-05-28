package com.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

public class Base64ImageUtil {
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

	//base64字符串转化成图片  
	public static boolean GenerateImage(String imgStr, String savePath, String saveName) {
		if(imgStr == null)
			return false;
		Decoder decoder = Base64.getDecoder();
		try {
			byte[] b = decoder.decode(imgStr);
			for (int i = 0; i < b.length; i++) {
				if (b[i] < 0)
					b[i] += 256;
			}
			String imgFilePath = savePath + saveName;
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
