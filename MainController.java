package mall.spring.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.spring.project.domain.ProductVO;
import mall.spring.project.pageutil.PageCriteria;
import mall.spring.project.pageutil.PageMaker;
import mall.spring.project.service.CoupangService;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private CoupangService coupangService;

	@GetMapping("/Coupang")
	public void CoupangGET() {
		logger.info("CoupangGET() 실행");
	}

	@PostMapping("/Coupang")
	public void CoupangPOST(String productName, String categoryCode, HttpServletRequest request) throws IOException {
		logger.info("CoupangPOST() 실행");

		// 다시 검색시 있던 list 세션 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("productName");
		session.removeAttribute("categoryCode");
		logger.info("list 세션 삭제");

		session.setAttribute("productName", productName);
		session.setAttribute("categoryCode", categoryCode);
	}

	@GetMapping("/list")
	public void ListGET(Model model, Integer page, Integer perPage, HttpServletRequest request, String sort,
			String pagesize) {
		logger.info("ListGET() 실행");
		logger.info("page = " + page + ", perPage = " + perPage);

		if (sort == null) {
			sort = "review_rating";
		}
		if (pagesize == null) {
			pagesize = "8";
		}

		perPage = Integer.parseInt(pagesize);

		logger.info(sort);
		logger.info(pagesize);

		// Paging 처리
		PageCriteria criteria = new PageCriteria();

		if (page != null) {
			criteria.setPage(page);
		}
		if (perPage != null) {
			criteria.setNumsPerPage(perPage);
		}

		HttpSession session = request.getSession();
		String productName = (String) session.getAttribute("productName");
		String categoryCode = (String) session.getAttribute("categoryCode");
		logger.info("productName: " + productName + ", categoryCode: " + categoryCode);

		List<ProductVO> list = coupangService.read(productName, categoryCode, criteria, sort);
		model.addAttribute("list", list);
		logger.info("vo 목록 : " + list);

		int count = coupangService.read_count(productName, categoryCode);
		model.addAttribute("count", count);
		logger.info("count: " + count);

		// PageMaker 객체 생성후 페이징 데이터 생성
		PageMaker maker = new PageMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(count);
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		model.addAttribute("productName", productName);
		model.addAttribute("categoryCode", categoryCode);

		model.addAttribute("sort", sort);
		model.addAttribute("pagesize", pagesize);

		logger.info("==========================================================================");
	}

	@GetMapping("detail")
	public void detailGET(Model model, int productNo, String categoryCode) {
		logger.info("detailGet() 호출");
		logger.info("productNo : " + productNo);
		logger.info("categoryCode : " + categoryCode);

		ProductVO vo = coupangService.read_No(productNo);
		logger.info(vo.toString());

		model.addAttribute("vo", vo);
	}


}
