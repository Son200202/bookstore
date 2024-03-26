package com.bookstore.controller.admin;

import com.bookstore.entity.CategoryEntity;
import com.bookstore.entity.ReviewEntity;
import com.bookstore.service.*;
import com.bookstore.service_impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/admin/")
public class QuanLiReviewController {
    @Autowired
    ReviewService reviewService=new ReviewService_impl();

    @RequestMapping(value = "review/list", method = RequestMethod.GET)
    public String ReviewList(ModelMap model ) {
        List<ReviewEntity> reviewList = reviewService.findAll();
        model.addAttribute("reviewList", reviewList);
        return "/admin/reviewviewlist";
    }
    
    @RequestMapping("review/Search")
    public String Search(@RequestParam("TuKhoa") String TuKhoa,
                         ModelMap model){
    	 List<ReviewEntity> ReviewList = new ArrayList<ReviewEntity>();
    	 ReviewEntity review = new ReviewEntity();
        if (TuKhoa == null)
            TuKhoa= "";
        if (reviewService.Search(TuKhoa) != null) {
        ReviewList = reviewService.Search(TuKhoa);
        
        }
         
        try {
        	int number = Integer.parseInt(TuKhoa);
        	if (reviewService.findById(number) != null) {
        	review = reviewService.findById(number);
        	}
            boolean a = false;
           
        	if (review != null) {
            	for (ReviewEntity c : ReviewList) {
            		if( review.getMa_Review() == c.getMa_Review()) {
            			a =true;
            			break;
            		}
            	}
            	
            }
        
        	if (!a && review != null) {
            	ReviewList.add(review);
             }
        } catch (NumberFormatException e) {
            System.out.println("Chuỗi không thể chuyển thành số nguyên.");
        }
        
        
        model.addAttribute("reviewList", ReviewList);
        model.addAttribute("message",   "thành công");

        return "/admin/reviewviewlist";
        
        
       
    }
}
