package com.javalec.spring_mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_mybatis.dao.ContentDao;
import com.javalec.spring_mybatis.dto.ContentDto;
import com.javalec.spring_mybatis.dto.UserDto;
import com.javalec.spring_mybatis.vo.CriteriaVO;
import com.javalec.spring_mybatis.vo.PagingVO;

@Controller
public class HomeController {
	
	
	//injection과 resource Autowired의 차이점을 알아야 한다.
	@Autowired
	private ContentDao contentDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {

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

		int refgroup = contentDao.biggestPK() + 1;
		contentDto.setRefgroup(refgroup);
		contentDto.setNum(refgroup);
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
	public String deleteForm(HttpSession session, Model model, CriteriaVO cri) {
		
		model.addAttribute("cri", cri);
		
		if(session.getAttribute("loginCondition") == null) {
			return "/deleteForm";
		}
		
		contentDao.deleteDao(cri);
		
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		return "/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, CriteriaVO cri) {
		
		int contentDto = contentDao.confirmPwd(cri);
		
		if (contentDto == 0) {
			model.addAttribute("condition", "삭제");
			return "/editDelFailPage";
		} else {
			contentDao.deleteDao(cri);
		}
		
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String updateForm(HttpSession session, Model model, CriteriaVO cri) {
		
		model.addAttribute("cri", cri);
		
		if(session.getAttribute("loginCondition") == null) {
			return "/updatepwd";
		}
		
		ContentDto viewlist = contentDao.viewDao(cri);
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		
		model.addAttribute("paging", vo);
		model.addAttribute("viewlist", viewlist);
		
		return "/updateForm";
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
	
	@RequestMapping(value = "/replyForm", method = RequestMethod.POST)
	public String replyForm(Model model, CriteriaVO cri) {
		
		contentDao.cntDao(cri);
		ContentDto view = contentDao.viewDao(cri);
		contentDao.place(view);
		
		int refgroup = view.getRefgroup();
		int refdepth = view.getRefdepth() + 1;
		int reforder = view.getReforder() + 1;
		ContentDto temp = new ContentDto();
		
		temp.setNum(contentDao.biggestPK() + 1);
		temp.setRefgroup(refgroup);
		temp.setRefdepth(refdepth);
		temp.setReforder(reforder);
		
		model.addAttribute("temp", temp);
		model.addAttribute("paging", cri);
		
		return "/replyForm";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(Model model, ContentDto contentDto, CriteriaVO cri) {
		
		contentDao.replyDao(contentDto);
		
		int total = contentDao.countBoard(cri);
		PagingVO vo = new PagingVO(cri, total);
		ArrayList<ContentDto> list = contentDao.pagingListDao(cri);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	@RequestMapping(value = "registForm", method = RequestMethod.GET)
	public String registForm() {
		
		return "/registForm";
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String regist(Model model, UserDto userDto) {
		
		int confirmId = contentDao.confirmId(userDto);
		if(confirmId == 1) {
			model.addAttribute("condition", "중복된 아이디입니다. 회원가입에 실패하였습니다.");
		} else {
			model.addAttribute("condition", "환영합니다! " + userDto.getName() + "님! 회원가입에 성공하였습니다!");
			contentDao.registUser(userDto);
		}
		
		return "/registCondition";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session, Model model, UserDto userDto) {
		
		int confirmId = contentDao.confirmId(userDto);
		boolean loginCondition = false;
		
		if(confirmId == 0) {
			model.addAttribute("condition", "존재하지 않는 아이디입니다.");
		} else {
			int confirmPwd = contentDao.loginPwd(userDto);
			if(confirmPwd == 0) {
				model.addAttribute("condition", "비밀번호가 틀렸습니다.");
			} else {
				model.addAttribute("condition", "로그인에 성공하였습니다!");
				loginCondition = true;
			}
		}
		
		session.setAttribute("id", userDto.getId());
		session.setAttribute("pwd", userDto.getPwd());
		session.setAttribute("loginCondition", loginCondition);
		
		return "/registCondition";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		
		request.getSession().invalidate();
		
		return "/home";
	}
	
}
