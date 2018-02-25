package com.Edu.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamsearch.project02.domain.Member;
import com.teamsearch.project02.etc.EmailConfirm;
import com.teamsearch.project02.service.MemberService;

@Controller
public class AjaxProcessController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/dupleCheck.ajax")
	@ResponseBody
	public Map<String,Boolean> dupleCheck(String id,String nick) {
		Member member = null;
		System.out.println("ajaxController로 넘어왔습니다. id="+id+"   nick = " + nick);
		Map<String,Boolean> map = new HashMap<String,Boolean>();
		if(id != null && nick == null) {
			System.out.println("정상적으로 id 트루에 옵니다.");
			member = memberService.loginCheck(id);
			System.out.println("에이작스받아왔어.");
			if(member == null) {
				map.put("result", true);
			}
			else {
				map.put("result", false);
			}
		}
		else if(id == null && nick != null) {
			member = memberService.nickCheck(nick);
			if(member == null) {
				map.put("result", true);
			}
			else {
				map.put("result", false);
			}
		}
		else {
			System.out.println("dupleCheck.ajax에서 에러");
		}
		System.out.println("ajaxController map을 리턴하기 전입니다.");
		return map;
	}
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public Map<String,String> emailCheck(String email1,String email2){
		String email = null;
		Map<String,String> map = new HashMap<String,String>();
		if(!email1.equals("")||!email2.equals("")) {
			email = email1+"@"+email2;
		}
		else {
			System.out.println("ajax EmailCheck error");
		}
		
		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum=emailconfirm.connectEmail(email);
		map.put("authNum", authNum);
		System.out.println("이메일 인증 발송 완료  key값 : " + authNum);
		return map;
	}
	
	//용도:비밀번호찾기,로그인체크
	@RequestMapping("/forgotPass.ajax")
	@ResponseBody
	public Member forgotPass(String id,String pass,
			HttpSession session,HttpServletResponse repsonse){
		Member member = null;
		System.out.println("여길오긴오나??");
		
		member = memberService.login(id);
		if(member !=null) {
			if(member.getId().equals(id)&&member.getPass().equals(pass)) {
				System.out.println("로그인성공 id = "+ id + "비밀번호 = " + pass);
				session.setAttribute("isLogin", true);
				session.setAttribute("member", member);
				session.setAttribute("id", id);
				
			}
		}
		else {
			System.out.println("포갓패스 실패");
		}
		return member;
	}
	
	

}
