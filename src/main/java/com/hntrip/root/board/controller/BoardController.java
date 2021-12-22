package com.hntrip.root.board.controller;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.board.service.BoardService;

@Controller

@RequestMapping("board")
public class BoardController {
	@Autowired
	BoardService bs;
	/*
	@GetMapping("fileUpload")
	public String dragAndDrop(Model model) {
		return "/board/fileUpload";
	}
	*/
	
	
	@PostMapping("fileUpload/post")
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
        
        Iterator<String> itr =  multipartRequest.getFileNames();
        
        String filePath = "D:\\image_repo"; //설정파일로 뺀다.
        
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            
            
            MultipartFile mpf = multipartRequest.getFile(itr.next());
     
            String originalFilename = mpf.getOriginalFilename(); //파일명
     
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
     
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
     
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                         
       }
         
        return "success";
    }
	
	
	
	
	@GetMapping("main")
	public String main() {
		return "/board/main";
	}
	
	
	@GetMapping("list")
	public void list(Model model) {
		model.addAttribute("list", bs.getList());
	}
	@GetMapping("registertest")
	public String testregister() {
		return "/board/registertest";
	}
	@GetMapping("register")
	public String register() {
		return "/board/register";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("writeNo") int writeNo, Model model) {
		model.addAttribute("board", bs.get(writeNo));
	}
	@PostMapping("/modify")
	public String modify(BoardDTO board, RedirectAttributes rttr) {
		if (bs.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("writeNo") int writeNo, RedirectAttributes rttr) {
		if (bs.remove(writeNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	
	
	@PostMapping("registerSave")
	public String registerSave(MultipartHttpServletRequest mul,
			HttpServletRequest request) {
		bs.registerSave(mul, request);
		
		return "redirect:/board/register";
	}

}
