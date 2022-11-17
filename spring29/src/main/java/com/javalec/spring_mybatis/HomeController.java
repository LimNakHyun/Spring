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
	public String list(HttpServletRequest request, Model model, PagingVO vo) {
		
		CriteriaVO cri = new CriteriaVO();
		int total = contentDao.countBoard(cri);
		
		vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String search(Model model, CriteriaVO cri) {
		
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		vo = new PagingVO(cri, total);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
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
	
	@RequestMapping(value = "/deleteForm", method = RequestMethod.POST)
	public String deleteForm(Model model, CriteriaVO cri) {
		
		model.addAttribute("cri", cri);

		return "/deleteForm";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, CriteriaVO cri) {
		
		int contentDto = contentDao.confirmPwd(cri);
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		if (contentDto == 0) {
			model.addAttribute("condition", "삭제");
			return "/editDelFailPage";
		} else {
			contentDao.deleteDao(cri);
		}
		
		return "/list";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String updateForm(Model model, CriteriaVO cri) {
		
		model.addAttribute("cri", cri);
		
		return "/updatepwd";
	}
	
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public String updatePwd(Model model, CriteriaVO cri) {
		
		int contentDto = contentDao.confirmPwd(cri);
		ContentDto viewlist = contentDao.viewDao(cri);
		
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		
		model.addAttribute("paging", vo);
		
		if (contentDto == 0) {
			model.addAttribute("condition", "수정");
			return "editDelFailPage";
		} else {
			model.addAttribute("cri", cri);
			model.addAttribute("viewlist", viewlist);
			return "/updateForm";
		}
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, ContentDto contentDto, CriteriaVO cri) {
		
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		contentDao.updateDao(contentDto);
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "/list";
	}
	
}
