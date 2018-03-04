package com.Edu.Dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Edu.Domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.Edu.mapper.MemberMapper";
	
	@Override
	public Member loginCheck(String id) {
		System.out.println("다오에 로긴첵 id = " + id);
		return sqlSession.selectOne(NAME_SPACE+".loginCheck", id);
	}

	@Override
	public Member nickCheck(String nick) {
		return sqlSession.selectOne(NAME_SPACE+".nickCheck", nick);
	}

	@Override
	public ArrayList<Member> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void joinMember(Member member) {
		sqlSession.insert(NAME_SPACE+".joinMember", member);
		
	}

	@Override
	public void Update(Member member) {
		sqlSession.update(NAME_SPACE+".updateMember", member);
	}

	@Override
	public Member login(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE+".forgotPassword",id);
	}

	@Override
	public void forgotPass(Member member) {
		// TODO Auto-generated method stub
		sqlSession.update(NAME_SPACE+".updatePass",member);
		
	}

	@Override
	public void kakaologin(Member member) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAME_SPACE+".kakao", member);
		
	}

}
