package com.project.semi;

import java.util.List;

public interface BoardService {
	public List<BoardDTO> getAllBoard();
	public List<BoardDTO> getAllBoard(BoardPageDTO dto);
	public BoardDTO getDetailBoard(int seq);
	public List<MemberDTO> getAllMember();
	public void member_register(String id, int password, String name);
	public void insert_content(String title, String contents);
	public void deleteBoard(int seq);
}