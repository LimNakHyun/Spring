package com.javalec.spring_mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_mybatis.dao.ContentDao;
import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.vo.CriteriaVO;
import com.javalec.spring_mybatis.vo.PagingVO;

@Controller
public class HomeController {
	
	
	//injection과 resource Autowired의 차이점을 알아야 한다.
	@Autowired
	private ContentDao contentDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "/home";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, PagingVO vo) {
		CriteriaVO cri = new CriteriaVO();
		int total = contentDao.countBoard(cri);
		
		vo = new PagingVO(cri, total);
		
		model.addAttribute("paging", vo);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String search(Model model, PagingVO vo, CriteriaVO cri) {
		int total = contentDao.countBoard(cri);
		
		vo = new PagingVO(cri, total);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", contentDao.pagingListDao(cri));
		
		return "/list";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.POST)
	public String writeForm(Model model, PagingVO vo) {

		model.addAttribute("paging", vo);
		
		return "/writeForm";
	}
	
	@RequestMapping("/write")
	public String write(Model model, ContentDto contentDto) {

		contentDao.writeDao(contentDto);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewGet(Model model, PagingVO vo, CriteriaVO cri) {
		
		contentDao.cntDao(cri);
		ContentDto view = contentDao.viewDao(cri);
		model.addAttribute("viewlist", view);
		model.addAttribute("paging", vo);
		
		return "/view";
	}
	
	@RequestMapping("/deleteForm")
	public String deleteForm(HttpServletRequest request, int num, Model model) {
		
		model.addAttribute("num", num);
		model.addAttribute("pwd", request.getParameter("pwd"));

		return "/deleteForm";
	}

	@RequestMapping("/delete")
	public String delete(String confirmPwd, int num, Model model) {
		
		ContentDto contentDto = contentDao.confirmPwd(num, confirmPwd);
		
		if (contentDto == null) {
			model.addAttribute("condition", "삭제");
			return "/editDelFailPage";
			
		} else {
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
	public String updatePwd(int num, String confirmPwd, Model model, PagingVO vo, CriteriaVO cri) {
		ContentDto contentDto = contentDao.confirmPwd(num, confirmPwd);
		model.addAttribute("viewlist", contentDao.viewDao(cri));
		
		if (contentDto == null) {
			model.addAttribute("condition", "수정");
			return "editDelFailPage";
		} else {
			return "/updateForm";
		}
		
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, Model model) {
		
		contentDao.updateDao(request.getParameter("subject"), request.getParameter("content"), request.getParameter("num"));
		model.addAttribute("num", request.getParameter("num"));
		
		return "redirect:view";
	}
	
}
