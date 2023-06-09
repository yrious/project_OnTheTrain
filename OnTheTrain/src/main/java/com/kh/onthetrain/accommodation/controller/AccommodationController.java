package com.kh.onthetrain.accommodation.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.accommodation.model.vo.Reservation;
import com.kh.onthetrain.accommodation.model.vo.Review;
import com.kh.onthetrain.accommodation.service.AccommodationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class AccommodationController {
	
	@Autowired 
	private AccommodationService service;
	
	@GetMapping("/accommodation/list")
	public String list(){
		
		
		return "accommodation/list";
	}
	
	@GetMapping("/accommodation/reservation")
	public ModelAndView reservation(ModelAndView modelAndView, @RequestParam int no){
		
		Accommodation accommodation = service.findProductByNo(no);
		List<Review> reviews = service.getReviewsByAccommodationNo(no);
		double average = reviews.stream().mapToInt(review -> review.getStarPoint()).average().orElse(0.0);
		
//		System.out.println(accommodation);
//		System.out.println(reviews);
//		System.out.println(average);
		
		modelAndView.addObject("accommodation", accommodation);
		modelAndView.addObject("reviews", reviews);
		modelAndView.addObject("average", average);
		modelAndView.setViewName("accommodation/reservation");
		
		return modelAndView;
	}
	
	@GetMapping("/accommodation/review")
	public String review(Model model, @RequestParam int no) {
	    Accommodation accommodation = service.findProductByNo(no);
	    model.addAttribute("accommodation", accommodation);
	    return "accommodation/review";
	}
	
	//리뷰작성 업로드 
	@PostMapping("/accommodation/review")
	public ModelAndView createReview(ModelAndView modelAndView, Review review) {
	    // 리뷰 생성 로직 수행
	    int result = service.insertReview(review);
	    
	    if(result > 0 ) {
	    	modelAndView.addObject("msg", "성공");
	    	modelAndView.addObject("location", "/accommodation/reservation?no=" + review.getAccommodationNo());
	    	
	    } else {
	    	modelAndView.addObject("location", "/accommodation/review");
			modelAndView.addObject("msg", "실패");
		}
	   
	   modelAndView.setViewName("common/msg");
	   
	    return modelAndView;
	    
	}
	
	@GetMapping("/accommodation/review/update")
	public ModelAndView update(ModelAndView modelAndView, @RequestParam int no) {
		
		Review review = service.getReviewByNo(no);
		Accommodation accommodation = service.findProductByNo(review.getAccommodationNo());
	    
		modelAndView.addObject("review", review);
		modelAndView.addObject("accommodation", accommodation);
		modelAndView.setViewName("accommodation/update");
		
	    return modelAndView;
	}
	
	@PostMapping("/accommodation/review/update")
	public ModelAndView update(ModelAndView modelAndView, Review review) {
		
		System.out.println(review);
	    // 리뷰 생성 로직 수행
	    int result = service.updateReview(review);
	    
	    if(result > 0 ) {
	    	modelAndView.addObject("msg", "성공");
	    	modelAndView.addObject("location", "/accommodation/reservation?no=" + review.getAccommodationNo());
	    	
	    } else {
	    	modelAndView.addObject("location", "/accommodation/review");
			modelAndView.addObject("msg", "실패");
		}
	   
	   modelAndView.setViewName("common/msg");
	   
	    return modelAndView;
	    
	}
	
	//리뷰삭제
	@GetMapping("/accommodation/review/delete")
	public ModelAndView delete(ModelAndView modelAndView, @RequestParam int no) {
		Review review = service.getReviewByNo(no);
	
		
		if ( review != null ) {
			int result = service.deleteReview(review.getNo());
			
			if (result > 0) {
			    modelAndView.addObject("msg", "리뷰가 삭제되었습니다.");
			} else {
			    modelAndView.addObject("msg", "리뷰 삭제를 실패하였습니다.");
			}
		} else {
			modelAndView.addObject("msg", "존재하지 않는 리뷰입니다.");
		}
		
		modelAndView.addObject("location", "/accommodation/reservation?no=" + review.getAccommodationNo());
		modelAndView.setViewName("common/msg");

		return modelAndView;


	}
//	리뷰새창 
	@RequestMapping("/newpage")
	public ModelAndView openNewPage() {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("review"); // 뷰 이름 설정
	    return mav;
	}
	
	@PostMapping("/accommodation/reservation")
	public ModelAndView insertReservation(ModelAndView modelAndView, @ModelAttribute  Reservation reservation) {
	    // 리뷰 생성 로직 수행
		System.out.println(reservation);
	    int result = service.insertReservation(reservation);
	    
	    if(result > 0 ) {
	    	modelAndView.addObject("msg", "성공");
//	    	modelAndView.addObject("location", "/mypage/myPageTicketWating?no=" + reservation.getAccommodationNo());
	    	modelAndView.addObject("location", "/accommodation/reservation?no=" + reservation.getAccommodationNo());
	    	
	    } else {
	    	modelAndView.addObject("location", "/accommodation/reservation?no=" + reservation.getAccommodationNo());
			modelAndView.addObject("msg", "실패");
		}
	   
	   modelAndView.setViewName("common/msg");
	   
	    return modelAndView;
	    
	}
	
	
	

}
