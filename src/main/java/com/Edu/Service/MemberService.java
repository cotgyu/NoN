package com.Edu.Service;

import java.util.ArrayList;

import com.Edu.Domain.Member;

public interface MemberService {
	
	public Member loginCheck(String id) throws Exception;
	
	// 카카오 아이디 중복 체크
	public Member idCheck(String id);
	
	//멤버리스트 받아오기
	public ArrayList<Member> getMemberList();
	
	//회원가입
	public void joinMember(Member member);
	
	//정보수정
	public void Update(Member member);
	
	//비밀번호찾기에서 id값 받아서 이메일인증하기 로그인할때도 이거쓰자... ajax이용.
	public Member login(String id);
	
	//비밀번호 찾기
	public void forgotPass(Member member);

	//카카오로그인
	public void kakaologin(Member member);
		
	
	//네이버로그인
	public void naverlogin(Member member);

	
	
	/*//페이스북 로그인
	public void onAuthenticationBinding(Member member, User facebookUser);*/
}
