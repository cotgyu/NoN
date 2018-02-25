package com.Edu.Controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.JsonNode;
import com.teamsearch.project02.domain.Member;
import com.teamsearch.project02.etc.KakaoLogin;
import com.teamsearch.project02.service.MemberService;

@Controller
// @SessionAttributes({"member","m"})
public class MemberController {

	private MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/joinResult")
	public String joinResult(Model model, Member member, String id, String pass, String name, String nick,
			String email1, String email2, String birth1, String birth2, String birth3, String zipCode, String address1,
			String address2, String mobile1, String mobile2, String mobile3, String gender, String emailGet,
			String phone1, String phone2, String phone3) {

		member.setId(id);
		member.setName(name);
		member.setNick(nick);
		member.setPass(pass);
		member.setEmail(email1 + "@" + email2);
		member.setBirth(birth1 + "/" + birth2 + "/" + birth3);
		member.setZipCode(zipCode);
		member.setAddress1(address1);
		member.setAddress2(address2);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		member.setGender(gender);
		member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		member.setEmailGet(Boolean.valueOf(emailGet));
		member.setRegDate(new Timestamp(System.currentTimeMillis()));

		memberService.joinMember(member);
		return "redirect:main";
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {
		session.removeAttribute("member");
		session.invalidate();
		return "redirect:main";
	}

	@RequestMapping("/updateResult")
	public String m_update(Member member, String u_name, String u_nick, String u_email1, String u_email2,
			String u_birth1, String u_birth2, String u_birth3, String u_zipCode, String u_address1, String u_address2,
			String u_mobile1, String u_mobile2, String u_mobile3, String u_gender, String u_emailGet, String u_phone1,
			String u_phone2, String u_phone3, HttpSession session) {

		Member s_member = null;
		s_member = (Member) session.getAttribute("member");

		member.setId(s_member.getId());
		member.setName(u_name);
		member.setNick(u_nick);
		member.setEmail(u_email1 + "@" + u_email2);
		member.setBirth(u_birth1 + "/" + u_birth2 + "/" + u_birth3);
		member.setZipCode(u_zipCode);
		member.setAddress1(u_address1);
		member.setAddress2(u_address2);
		member.setMobile(u_mobile1 + "-" + u_mobile2 + "-" + u_mobile3);
		member.setGender(u_gender);
		member.setPhone(u_phone1 + "-" + u_phone2 + "-" + u_phone3);
		member.setEmailGet(Boolean.valueOf(u_emailGet));

		System.out.println(member.getId() + member.getName() + member.getNick() + member.getNick());
		memberService.Update(member);
		return "redirect:main";
	}

	@RequestMapping("/ForgotPasswordResult")
	public String ForgotPassword(Member member, String id, String pass) {
		member.setId(id);
		member.setPass(pass);
		memberService.forgotPass(member);
		return "redirect:main";
	}

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("여기를 오긴 오는거야??");
		JsonNode token = KakaoLogin.getAccessToken(code);
		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println(profile);
		Member member = KakaoLogin.changeData(profile);
		Member member1 = null;
		System.out.println(member.getId());
		member.setId("kakao_" + member.getId());
		member.setNick("kakao_" + member.getNick());

		session.setAttribute("memeber", member);
		session.setAttribute("isLogin", true);
		session.setAttribute("nick", member.getNick());
		String nick = (String) session.getAttribute("nick");
		System.out.println(nick);
		member1 = memberService.nickCheck(nick);
		if(member1 == null) {
			memberService.kakaologin(member);
		}
		
		return "redirect:main";
	}
}
