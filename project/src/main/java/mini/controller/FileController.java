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
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileController {
	@RequestMapping(value="/file_uploader")
	public void fileUpload(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("파일 업로더 컨트롤러 실행");
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
			
			System.out.println("cnt : " + cnt);

			// 이미지가 아닐 경우
			if (cnt == 0) {
				System.out.println("이미지가 아니올시다");
				PrintWriter pw = response.getWriter();
				pw.print("Not Allow_" + filename);
				pw.flush();
				pw.close();
			} else {
				// 이미지이므로 신규 파일 디렉토리 설정 및 업로드
				// 파일 기본 경로
				String dstFilePath = request.getSession().getServletContext().getRealPath("/");
				System.out.println("dstFilePath : " + dstFilePath);

				// 파일 기본 경로_상세 경로
				String filePath = dstFilePath + "resources" + File.separator + "editor" + File.separator + "multiupload"
						+ File.separator;
				System.out.println("filePath : " + filePath);

				File file = new File(filePath);
				if (!file.exists()) {
					System.out.println("폴더 생성 완료");
					file.mkdirs();
				}

				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = formatter.format(new Date());
				realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
				System.out.println("realFileNm : " + realFileNm);
				String rlFileNm = filePath + realFileNm;
				System.out.println("rlFileNm : " + rlFileNm);
				/**서버에 파일 쓰기*/
				InputStream is = request.getInputStream();
				System.out.println("InputStream 생성 완료");
				OutputStream os = new FileOutputStream(rlFileNm);
				System.out.println("OutputStream 생성 완료");
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				int numRead = is.read(b, 0, b.length);
				while (numRead != -1) {
					System.out.println("파일 전송 중");
					os.write(b, 0, numRead);
				}
				System.out.println("파일 업로드 완료");
				
				if (is != null) {
					is.close();
				}
				System.out.println("InputStream close");
				os.flush();
				os.close();
				System.out.println("OutputStream close");
				
				
				/**서버에 파일 쓰기*/
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본 파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName=" + filename;
				sFileInfo += "&sFileURL=" + "/resources/editor/multiupload/" + realFileNm;
				System.out.println("sFileInfo : " + sFileInfo);
				PrintWriter pw = response.getWriter();
				pw.print(sFileInfo);
				pw.flush();
				pw.close();
				System.out.println("끝");
			}
		} // try end
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}
