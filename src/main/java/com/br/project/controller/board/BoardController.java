package com.br.project.controller.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.project.dto.board.BoardDto;
import com.br.project.dto.common.AttachmentDto;
import com.br.project.dto.common.PageInfoDto;
import com.br.project.dto.member.MemberDto;
import com.br.project.service.board.BoardService;
import com.br.project.service.common.department.DepartmentService;
import com.br.project.util.FileUtil;
import com.br.project.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

	private final BoardService boardService;
	private final DepartmentService departmentService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	/**
	 * @method : 공지사항 목록조회
	 */
	@RequestMapping(value="/list.do")
	public ModelAndView selectBoardList(@RequestParam(value="page", defaultValue="1") int currentPage
									   ,@RequestParam Map<String, String> filter
									   ,ModelAndView mv) {
		// 게시글 페이징바 생성
		PageInfoDto pageInfo = pagingUtil.getPageInfoDto(boardService.selectTotalBoardCount(filter), currentPage, 5, 10);
		
		// 응답페이지 지정 및 응답데이터 반환
		mv.addObject("boardList", boardService.selectBoardList(pageInfo, filter));		// 게시글 목록
		mv.addObject("pageInfo", pageInfo);
		mv.addObject("departmentList", departmentService.selectDepartmentList("DEPT01"));		// 부서 목록
		mv.addObject("filter", filter);
		mv.setViewName("/board/list");
		
		return mv;
	}
	
	/**
	 * @method : 공지사항 목록조회 (AJAX)
	 */
	@RequestMapping(value="/list.ajax")
	@ResponseBody
	public Map<String, Object> ajaxSelectBoardList(@RequestParam HashMap<String, String> filter){
		
		// 게시글 페이징바 생성
		PageInfoDto pageInfo = pagingUtil.getPageInfoDto(boardService.selectTotalBoardCount(filter), 
														 Integer.parseInt(filter.get("page")), 5, 10);
		
		// 응답데이터 반환 (게시글목록)
		Map<String, Object> response = new HashMap<>();

		response.put("boardList", boardService.selectBoardList(pageInfo, filter));
		response.put("pageInfo", pageInfo);
		
		return response;
	}
	
	/**
	 * @method : 공지사항 등록페이지 반환
	 */
	@RequestMapping(value="/post.page")
	public String showBoardPostForm() {
		return "board/post";
	}
	
	/**
	 * @method : 공지사항 등록
	*/ 
	@RequestMapping(value="/post.do")
	public String postBoard(BoardDto board
						 ,List<MultipartFile> uploadFiles
						 ,HttpSession session
						 ,RedirectAttributes redirectAttributes) {
		try {
			List<AttachmentDto> attachmentList = new ArrayList<>();
			// 첨부파일 있을경우, 첨부파일 업로드
			for(MultipartFile uploadFile : uploadFiles) {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					Map<String, String> fileInfo = fileUtil.fileUpload(uploadFile, "board");
					
					AttachmentDto attachment = AttachmentDto.builder()
															.attachPath(fileInfo.get("filePath"))
															.originName(fileInfo.get("originalName"))
															.modifyName(fileInfo.get("filesystemName"))
															.refType("BD")
															.build();
					
					attachmentList.add(attachment);
				}
			}

			// 공지사항 등록
			String writerNo = String.valueOf(((MemberDto)(session.getAttribute("loginMember"))).getUserNo());
			board.setRegistEmp(writerNo);
			board.setModifyEmp(writerNo);
			board.setAttachmentList(attachmentList);
			
			Map<String, Object> result = boardService.insertBoard(board);
			
			redirectAttributes.addFlashAttribute("alertTitle", "공지사항 등록서비스");
			String status = board.getStatus() == "Y" ? "등록" : "저장";
			if(attachmentList.isEmpty()) {
				// 첨부파일이 없는 게시글일 경우
				if((int)result.get("boardResult") > 0) {
					redirectAttributes.addFlashAttribute("alertMsg", "공지사항이 " + status + "되었습니다.");
				}else {
					redirectAttributes.addFlashAttribute("alertMsg", "공지사항 " + status + "이 정상적으로 처리되지 않았습니다.");
				}
			}else {
				// 첨부파일이 있는 게시글일 경우
				List<AttachmentDto> failedFiles = (List<AttachmentDto>)result.get("failedFiles");
				if(failedFiles.isEmpty()) {
					redirectAttributes.addFlashAttribute("alertMsg", "공지사항이 " + status + "되었습니다.");
				}else {
					redirectAttributes.addFlashAttribute("alertMsg", "공지사항은 " + status + "되었으나, 일부 첨부파일이 정상적으로 처리되지 않았습니다.");
					for(AttachmentDto file : failedFiles) {
						new File(file.getAttachPath(), file.getModifyName()).delete();
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/list.do";
	}
	
	
	

	
}
