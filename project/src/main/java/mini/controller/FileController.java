package mini.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileController {
	@RequestMapping(value="/file_uploader")
	public void fileUpload(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FileController 실행");
		String URL= request.getRequestURL().toString();
		URL = URL.substring(0, URL.lastIndexOf('/') + 1) + "multiupload/";
		
		try {
			// 파일 정보
			String sFileInfo = "";
			// 파일명 수신
			String filename = request.getHeader("file-name");
			// 파일 확장자 소문자로 변경
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
			
			// 이미지 검증 배열 변수
			String[] allow_file = { "jpg", "png", "bmp", "gif" };

			// 파일들이 이미지 인지 확인
			int cnt = 0;
			for (int i = 0; i < allow_file.length; i++) {
				if (filename_ext.equals(allow_file[i])) {
					cnt++;
				}
			}
			
			// 이미지가 아닐 경우
			if (cnt == 0) {
				PrintWriter pw = response.getWriter();
				pw.print("Not Allow_" + filename);
				pw.flush();
				pw.close();
			} else {
				// 이미지이므로 신규 파일 디렉토리 설정 및 업로드
				// 파일 기본 경로
				String dstFilePath = request.getSession().getServletContext().getRealPath("/");

				// 파일 기본 경로_상세 경로
				String filePath = dstFilePath + "multiupload" + File.separator;

				File file = new File(filePath);
				if (!file.exists()) {
					file.mkdirs();
				}

				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = formatter.format(new Date());
				realFileNm = today + UUID.randomUUID().toString();
				String saveFileNm = realFileNm;
				realFileNm += filename.substring(filename.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
				System.out.println(filePath);
				System.out.println(rlFileNm);
				/**서버에 파일 쓰기*/
				InputStream is = request.getInputStream();
				OutputStream os = new FileOutputStream(rlFileNm);
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while (true) {
					int numRead = is.read(b, 0, b.length);
					if(numRead == -1) {
						break;
					}
					os.write(b, 0, numRead);
				}
				
				if (is != null) {
					is.close();
				}
				os.flush();
				os.close();
				
				/**서버에 파일 쓰기*/
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본 파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName=" + filename;
				sFileInfo += "&sFileURL=" + URL + realFileNm;
				PrintWriter pw = response.getWriter();
				pw.print(sFileInfo);
				pw.flush();
				pw.close();
			}
		} // try end
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
