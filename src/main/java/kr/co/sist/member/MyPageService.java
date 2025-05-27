package kr.co.sist.member;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataEncryption;
import kr.co.sist.member.login.loginResultDTO;

public class MyPageService {
	public boolean modifyMember(MyPageDTO mpDTO,HttpSession session) {
		boolean flag = false;
		
		MyPageDAO mpDAO=MyPageDAO.getInstance();
		
		try {
			//세션에서 아이디를 꺼내와서 DTO 에 설정
		
			mpDTO.setId(((loginResultDTO)session.getAttribute("userData")).getId());
		
			String key="abcdef0123456789";
			DataEncryption dd=new DataEncryption(key);
			//이미지를 선택하지 않았을 떄 이미지 처리
			if(mpDTO.getImgName().isEmpty()) {
				mpDTO.setImgName("default.jpg");
			}//end if
			try {
				mpDTO.setTel(dd.encrypt(mpDTO.getTel()));
			}catch(Exception e) {
				e.printStackTrace();
			}
			mpDAO.updateMember(mpDTO);
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return flag;
	}//modifyMember
}//class
