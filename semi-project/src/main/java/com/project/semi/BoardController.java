package com.project.semi;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	BoardService service;	
	
	/* 濡쒓렇�씤 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginform() { //�뤌 異쒕젰�슂泥�
		return "login";//酉곗씠由�
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST,
	produces= {"application/json;charset=utf-8"})
	@ResponseBody //JSON�씪�씠釉뚮윭由� 異붽��빐�빞 �궗�슜媛��뒫
	//date:{'id':$("#id").val(), 'pw':$('#pw').val()}
	public String loginform(String id, String pw) {//�뤌 �엯�젰 �뜲�씠�꽣 �쟾�넚 ajax�슂泥�
		System.out.println(id+":"+pw);
		String result = null; //json�삎�깭�쓽 寃곌낵瑜� �떞�쓣 蹂��닔
		List<MemberDTO> members = service.getAllMember();
		
		//�쉶�썝�떇蹂�
		for(MemberDTO member : members) {
			System.out.println(member); //�쉶�썝�젙蹂댁텧�젰
			if(member.getId().equals(id) && Integer.toString(member.getPassword()).equals(pw)) {
				result = "{\"process\":\"�젙�긽濡쒓렇�씤\"}";										
			}
		}	
		if(result == null) result = "{\"process\":\"鍮꾩젙�긽濡쒓렇�씤\"}";
		
		return result;
	} //loginresult END
	
	
	/*濡쒓렇�씤*/
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String logintest(HttpServletRequest request) { //�뤌 異쒕젰�슂泥�
		System.out.println("濡쒓렇�씤踰꾪듉�겢由�"); //�젙�긽異쒕젰�맖
		String id ="", pw="";
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		System.out.println("濡쒓렇�씤 �엯�젰�젙蹂� - "+id+":"+pw);
		List<MemberDTO> members = service.getAllMember(); //�쉶�썝�젙蹂�
		HttpSession session = request.getSession(); //�꽭�뀡 �깮�꽦
		
		//�쉶�썝�떇蹂�
		for(MemberDTO member : members) {
			System.out.println(member);
			if(member.getId().equals(id) && Integer.toString(member.getPassword()).equals(pw)) {
				//�쉶�썝�씤寃쎌슦
				if(session.isNew()) { //�겢�씪�씠�뼵�듃媛� �꽌踰꾩뿉 理쒖큹�슂泥��븳 寃쎌슦
					//�꽭�뀡媛� �꽕�젙
		            session.setAttribute("id", id);
					session.setAttribute("pw", pw);
					return "/board/list";
				}
				else { // 2踰덉㎏�슂泥�遺��꽣�뒗 �꽭�뀡�젙蹂대�� 媛��졇�삩�떎
					id = (String)session.getAttribute("id");
					pw = (String)session.getAttribute("pw");
					return "/board/list";
				}				
			}
		}									
		return "/";
	}
	
	/* �쉶�썝媛��엯 */
	@RequestMapping(value="signup",method=RequestMethod.GET)
	public String signup() { //�뤌 異쒕젰�슂泥�
		return "signup";//酉곗씠由�
	}
	
	@RequestMapping(value="signup",method=RequestMethod.POST,
			produces= {"application/json;charset=utf-8"})
	@ResponseBody //JSON�씪�씠釉뚮윭由� 異붽��빐�빞 �궗�슜媛��뒫
	public String signup_success(String id, String pw, String name) { //�뤌 異쒕젰�슂泥�
		int password = Integer.parseInt(pw);
		System.out.println("signup: "+id+":"+name+":"+pw);		
		List<MemberDTO> members = service.getAllMember();
		String result = null;
		for(MemberDTO member: members) {
			if(member.getId().equals(id) || member.getName().equals(name)) {
				result = "{\"process\":\"以묐났\"}";
			}
		}
		if(result==null) {
			result = "{\"process\":\"�젙�긽\"}";
			service.member_register(id, password , name);
		}		
		return result;		
	}
	
	/* 寃뚯떆�뙋 */
	@RequestMapping("/board/list")
	public ModelAndView getAllBoard(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		BoardPageDTO dto = new BoardPageDTO();
		
		//�럹�씠吏뺤쿂由�
		int pageNum = Integer.parseInt(req.getParameter("page"));
		System.out.println(pageNum);
		int cntPerPage = 5;
		dto.setPageNum((pageNum-1) * cntPerPage  + 1);
		dto.setCntPerPage(pageNum * cntPerPage);
		
		List<BoardDTO> boardlist = service.getAllBoard(dto);
		mv.addObject("boardlist", boardlist); //(�씠由� , �쟾�떖媛앹껜)
		mv.setViewName("/board/list");
		return mv;
	}
	
	/* 寃뚯떆湲�蹂닿린 */
	@RequestMapping(value="/board/detail",method=RequestMethod.GET)
	public ModelAndView getDetailBoard(HttpServletRequest req) {					
		ModelAndView mv = new ModelAndView();
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("seq="+seq);
		BoardDTO dto = service.getDetailBoard(seq);
		System.out.println("detail");
		mv.addObject("dto", dto); //(�씠由� , �쟾�떖媛앹껜)
		mv.setViewName("/board/boarddetail");
		return mv;
	}
	
	/* 湲��벐湲� */
	@RequestMapping(value="/board/write",method=RequestMethod.GET)
	public String writeform() { //�뤌 異쒕젰�슂泥�			
		return "/board/boardwrite";//酉곗씠由�
	}
	
	@RequestMapping(value="/board/write",method=RequestMethod.POST)
	public String insert(HttpServletRequest req, HttpServletResponse res) { //�뤌 異쒕젰�슂泥�			
		System.out.println(req.getAttribute("id")+":"+req.getAttribute("pw"));
		res.setContentType("text/html;charset=utf-8"); //�븳湲�濡� �씤肄붾뵫
		res.setCharacterEncoding("euc-kr");
		service.insert_content(req.getParameter("title"),req.getParameter("contents"));
		return "/board/list";//酉곗씠由�
	}
	
	/* 寃뚯떆湲� �궘�젣 */
	@RequestMapping(value="delete",method=RequestMethod.POST,
			produces= {"application/json;charset=utf-8"})
	@ResponseBody //JSON�씪�씠釉뚮윭由� 異붽��빐�빞 �궗�슜媛��뒫
	public String content_delete(String seq) { //�뤌 異쒕젰�슂泥�
		int Seq = Integer.parseInt(seq);
		String result = null;
		System.out.println("delete seq: "+Seq);
		service.deleteBoard(Seq);
		result = "{\"process\":\"�궘�젣�셿猷�\"}";
		return result;
	}
	
	
}