package com.wwe.common.util.file;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

public class FileUtils {
	private final int maxSize = 1024 * 1024 * 50; // 업로드 가능 최대 용량
	Map<String , List> multiParamMap = new HashMap<String, List>();
	
	public Map<String, List> fileUpload(HttpServletRequest request){
		
		List<FileVo> fileDataList = new ArrayList<FileVo>();
		MultipartParser mp;
		
		try {
			mp = new MultipartParser(request, maxSize);
			Part part;
			
			while((part = mp.readNextPart()) != null) {
				if(part.isParam()) {
					ParamPart params = (ParamPart) part;
					List<String> paramList = getParamValue(params);
					multiParamMap.put(params.getName(), paramList);
				}else if(part.isFile()) {
					FilePart userFile = (FilePart) part;
					if(userFile.getFileName() != null) {
						FileVo fileData = getFileData(userFile,(String)request.getAttribute("filterPath"));
						fileDataList.add(fileData);
						saveFile(userFile,fileData);
					}
				}
			}
			multiParamMap.put("fileData", fileDataList);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return multiParamMap;
	}
	
	public void deleteFile(String path) {
		File file = new File("C:\\CODE\\wweStorage/"+path);
		file.delete();
	}
	
	private void saveFile(FilePart userFile, FileVo fileData) throws IOException {
		String path = "C:\\CODE\\wweStorage/" + fileData.getFilePath();
		new File(path).mkdirs();
		File file = new File(path + fileData.getFileRename());
		System.out.println(file.length());
		userFile.writeTo(file);
	}
	
	private List<String> getParamValue(ParamPart params) throws UnsupportedEncodingException{
		// 종류가 파라미터일 경우 실행
		String paramName = params.getName();
		String paramValue = params.getStringValue("UTF-8");
		
		List<String> paramList = null;
		
		if(multiParamMap.get(paramName) == null) {
			paramList = new ArrayList<String>();
			paramList.add(paramValue);
		}else {
			paramList = multiParamMap.get(paramName);
			paramList.add(paramValue);
			
		}
		
		System.out.println(paramList);
		return paramList;
	}
	
	private FileVo getFileData(FilePart userFile,String filterPath) throws UnsupportedEncodingException {
		
		String originFileName = new String(userFile.getFileName().getBytes("iso-8859-1"),"UTF-8");
		String renameFileName = getRenameFileName(originFileName);
		
		FileVo fileData = new FileVo();
		
		fileData.setFileName(originFileName);
		fileData.setFileRename(renameFileName);
		
		fileData.setFilePath(filterPath+"/"+getSubPath());
		
		return fileData;
	}
	
	private String getSubPath() {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DAY_OF_MONTH);
		String subPath = year + "/" + month + "/" + date + "/";
		
		return subPath;
	}
	
	// 유니크한 파일명 생성
	private String getRenameFileName(String originFileName) {
		// 랜덤으로 유니크한 문자열을 생성
		UUID renameFileID = UUID.randomUUID();
		// 마지막 . 을 기준으로 나눈나 (마지막 . 이후는 확장자 명이기 때문)
		String renameFileName = renameFileID.toString() + originFileName.substring(originFileName.lastIndexOf("."));
		return renameFileName;
	}
	
}
