package com.project.semi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("service")
public class BoardServiceImpl implements BoardService {
    @Autowired
	BoardMybatisDAO dao;
	
    @Override
	public List<BoardDTO> getAllBoard() {
		return dao.getAllBoard();
	}
	
	@Override	
	public List<BoardDTO> getAllBoard(BoardPageDTO dto) {
		return dao.getAllBoard(dto);
	}
	
	@Override
	public BoardDTO getDetailBoard(int seq) {		
		return dao.getDetailBoard(seq);
	}

	@Override
	public List<MemberDTO> getAllMember() {		
		return dao.getAllMember();
	}

	@Override
	public void member_register(String id, int password, String name) {
		// TODO Auto-generated method stub
		dao.member_register(id, password, name);		
	}

	@Override
	public void insert_content(String title, String contents) {
		dao.insert_content(title, contents);		
	}

	@Override
	public void deleteBoard(int seq) {		
		dao.deleteBoard(seq);
	}

}
