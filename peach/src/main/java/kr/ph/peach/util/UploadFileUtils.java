package kr.ph.peach.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	/***
	 * 파일을 uploadPath에 복사한 후 복사한 파일경로와 이름을 합쳐서 문자열로 반환하는 메서드
	 * 파일을 업로드한 날짜에 맞춰서 년/월/일 폴더가 생성되고 그 안에 업로드 
	 * @param uploadPath
	 * @param originalFileName
	 * @param fileData
	 * @return
	 * @throws IOException 
	 */
	public static String uploadFile(String uploadPath, String originalFileName, byte[] fileData) throws IOException {
	
		//같은 파일명을가지는 파일을 업로드할 때 덮어쓰기가 되지 않게 처리
		UUID uuid = UUID.randomUUID();
		String savedFileName = uuid.toString() + "_" + originalFileName; //8-4-4-4-12_파일명
	
		//한 폴더에 파일이 몰리지 않게 날짜별로 업로드 파일을 관리 
		//2023/09/01
		//String savedPath = calcPath(uploadPath);//업로드 날짜를 기준으로 년/월/일 폴더가 없으면 생성하고 생성된 경로를 반환
		
		//파일을 복사
		//빈 파일을 생성
		File target = new File(uploadPath, savedFileName);
		FileCopyUtils.copy(fileData, target);
		return uploadFileName(uploadPath, savedFileName);
	}
	private static String uploadFileName(String savedPath, String savedFileName) {
		String fileName = savedFileName;
		return fileName;
	}
	public static void deleteFile(String uploadPath, String si_name) {
		File file = new File(uploadPath, si_name);
		if(file.exists()) {
			file.delete();
		}
	}
}
