package com.javalec.spring_mybatis;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_mybatis.dao.ContentDao;
import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.vo.PagingVO;

@Controller
public class HomeController {
	
	
	//injection과 resource Autowired의 차이점을 알아야 한다.
	@Autowired
	private ContentDao contentDao;
	
//	@Autowired
//	private PagingVO vo;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model, PagingVO vo) {
//		model.addAttribute("list", contentDao.listDao());
		int total = contentDao.countBoard();
		vo = new PagingVO(total, 1, 5);
		model.addAttribute("list", contentDao.pagingListDao(vo));
		
		return "/list";
	}
	
//	@RequestMapping("/list")
//	public String list(String search, Model model) {
//		
//		
//		if(search == null) {
//			model.addAttribute("list", contentDao.listDao());
//		} else {
//			model.addAttribute("list", contentDao.searchDao(search));
//		}
//		
//		return "/list";
//	}
	
	@RequestMapping("/pagingList")
//	public String pagingList(String search, Model model, int nowPage, int cntPerPage) {
	public String pagingList(String search, PagingVO vo, Model model, String nowPage, String cntPerPage) {
		int total = contentDao.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		if(search == null) {
			model.addAttribute("list", contentDao.pagingListDao(vo));
		} else {
			model.addAttribute("list", contentDao.pagingListDaoSearch(vo, search));
		}
		
		return "/list";
	}
	
//	@RequestMapping("/pagingtest")
////	public String pagingList(String search, Model model, int nowPage, int cntPerPage) {
//	public String pagingtest(PagingVO vo, Model model) {
//		int total = contentDao.countBoard();
//		int nowPage = 1;
//		int cntPerPage = 5;
//		
//		vo = new PagingVO(total, nowPage, cntPerPage);
//		model.addAttribute("paging", vo);
//		
//		return "/pagingtest";
//	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		
		return "/writeForm";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		
		contentDao.writeDao(request.getParameter("usrname"), request.getParameter("pwd"), request.getParameter("subject"), request.getParameter("content"));
		
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		
		contentDao.cntDao(Integer.parseInt(request.getParameter("num")));
//		model.addAttribute("search", request.getParameter("search"));
		model.addAttribute("viewlist", contentDao.viewDao(Integer.parseInt(request.getParameter("num"))));
		model.addAttribute("pwd",request.getParameter("pwd"));
		
		return "/view";
	}
	
	@RequestMapping("/deleteForm")
	public String deleteForm(HttpServletRequest request, int num, Model model) {
		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		System.out.println("del 게시판 글번호 : " + s);
		model.addAttribute("num", num);
		model.addAttribute("pwd", request.getParameter("pwd"));

		return "/deleteForm";
	}

	@RequestMapping("/delete")
	public String delete(String confirmPwd, int num, Model model) {
		
		ContentDto contentDto = contentDao.confirmPwd(num, confirmPwd);
		
		if (contentDto == null) {
//			System.out.println("confirmPwd : " + confirmPwd + " 비번 틀림");
			model.addAttribute("condition", "삭제");
			return "/editDelFailPage";
			
		} else {
//			System.out.println("confirmPwd : " + confirmPwd + " 맞음 ");
			contentDao.deleteDao(String.valueOf(contentDto.getNum()));
		}
		
		
		return "redirect:list";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(int num, Model model) {
		System.out.println("글번호 : " + num);
		model.addAttribute("num", num);
		return "/updatepwd";
	}
	
	@RequestMapping("/updatePwd")
	public String updatePwd(int num, String confirmPwd, Model model) {
		ContentDto contentDto = contentDao.confirmPwd(num, confirmPwd);
		model.addAttribute("viewlist", contentDao.viewDao(num));
		
		if (contentDto == null) {
			model.addAttribute("condition", "수정");
			return "editDelFailPage";
		} else {
			return "/updateForm";
		}
		
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		
//		String num = request.getParameter("num");
//		String confirmPwd = request.getParameter("confirmPwd");
		
		
		
//		if (contentDto == null) {
//			model.addAttribute("condition", "수정");
//			return "editDelFailPage";
//		} else {
		contentDao.updateDao(request.getParameter("subject"), request.getParameter("content"), request.getParameter("num"));
		model.addAttribute("num", request.getParameter("num"));
//		}
		
		
		return "redirect:view";
	}
	
}
