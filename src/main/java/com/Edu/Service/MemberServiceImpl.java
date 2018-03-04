package com.Edu.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Service;

import com.Edu.Dao.MemberDao;
import com.Edu.Domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private FacebookConnectionFactory connectionFactory;
	
	@Autowired 
	private OAuth2Parameters oAuth2Parameters;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member loginCheck(String id) {
		System.out.println("서비스에 로긴첵 id = " + id);
		return memberDao.loginCheck(id);
	}

	@Override
	public Member nickCheck(String nick) {
		return memberDao.nickCheck(nick);
	}

	@Override
	public ArrayList<Member> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void joinMember(Member member) {
		memberDao.joinMember(member);
	}

	@Override
	public void Update(Member member) {
		memberDao.Update(member);
	}

	@Override
	public Member login(String id) {
		return memberDao.login(id);
	}

	@Override
	public void forgotPass(Member member) {
		memberDao.forgotPass(member);
	}

	@Override
	public void kakaologin(Member member) {
		// TODO Auto-generated method stub
		memberDao.kakaologin(member);
		
	}

	@Override
	public String facelogin() {
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations(); 
		String authorizeUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters); 
		return authorizeUrl;

		
	}

}
