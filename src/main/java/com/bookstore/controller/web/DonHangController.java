package com.bookstore.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.entity.ChiTietDonHangEntity;
import com.bookstore.entity.CuonSachEntity;
import com.bookstore.entity.CustomerEntity;
import com.bookstore.entity.DonHangEntity;
import com.bookstore.service.ChiTietDonHangService;
import com.bookstore.service.DonHangService;
import com.bookstore.service.ProductService;
import com.bookstore.service_impl.ChiTietDonHangService_impl;
import com.bookstore.service_impl.CustomerService_impl;
import com.bookstore.service_impl.DonHangService_impl;
import com.bookstore.service_impl.ProductService_impl;
@Controller
public class DonHangController {
		@Autowired
	    DonHangService donHangService = new DonHangService_impl();
	    @Autowired
	    ProductService productService = new ProductService_impl();
	    @Autowired
	    ChiTietDonHangService chiTietDonHangService = new ChiTietDonHangService_impl();
       @RequestMapping(value = "/web/product/DonHang", method = RequestMethod.GET)
	    public String GetDonHangDetail(ModelMap model, HttpSession session) {
    	   List<DonHangEntity> donhangList = donHangService.findAll();
    	   List<DonHangEntity> donhangList_Show = new ArrayList<>(); 
    	   if (session.getAttribute("user") == null) {
    		   return "web/login";
    	   }
    	   CustomerEntity person = (CustomerEntity) session.getAttribute("person");
	        for (DonHangEntity DonHang : donhangList){
	        if(DonHang.getMa_Customer() == person.getMa_Customer()) {
	        	donhangList_Show.add(DonHang);
	        }
	        }
	        
           model.addAttribute("donhangList", donhangList_Show);
           model.addAttribute("message",  "thành công");
          
	        return "web/viewlistCTDHdetails";
	    }
       
	    @RequestMapping(value = "/web/product/HuyDon",  method = RequestMethod.GET)
	    public String HuyDon(HttpSession session, ModelMap model,   @RequestParam("ma_DonHang") Integer ma_DonHang, HttpServletResponse response) throws IOException {
	    	 DonHangEntity donHangEntity = donHangService.findById(ma_DonHang);
	    	 response.setContentType("text/html;charset=UTF-8");
	     	 if(donHangEntity.getActiveDH().equalsIgnoreCase("Chưa giao")) {	    		 
		         
		         List<ChiTietDonHangEntity> ListChiTietDonhang  =  chiTietDonHangService.findAll();
		         
		         for ( ChiTietDonHangEntity chiTietDonHang : ListChiTietDonhang) {
		        	 if(chiTietDonHang.getDonHangEntity().getMa_DH() == ma_DonHang) {
				        CuonSachEntity cuonSachEntity =   chiTietDonHang.getCuonSachEntity();
				        cuonSachEntity.setSoluong(cuonSachEntity.getSoluong() + chiTietDonHang.getSoluong());
				        productService.update(cuonSachEntity);
		        	 }
		        }
		         
		         donHangEntity.setActiveDH("Đã hủy");
		         donHangEntity.setGhichu("Đơn đã hủy");
		         donHangService.update(donHangEntity);
	    	 } else {
		        
		        
            	 PrintWriter out = response.getWriter();
                 out.print("<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>");
                 out.println("<html>");
                 out.println("<head>");
                 out.println("<title>Loi</title>");
                 out.println("</head>");
                 out.println("<body>");
                 out.println("<script>");
                 out.println("alert('Hủy đơn không thành công! Chỉ có thể hủy đơn hàng chưa giao')");
                 out.println("location.href = \"./DonHang\";");
                 out.println("</script>");
                 out.println("</body>");
                 out.println("</html>");
                 out.close();
                 return "web/viewlistCTDHdetails";
	  		 }
	         	List<DonHangEntity> donhangList = donHangService.findAll();
	    	   List<DonHangEntity> donhangList_Show = new ArrayList<>(); 
	    	   if (session.getAttribute("user") == null) {
	    		   return "web/login";
	    	   }
	    	   CustomerEntity person = (CustomerEntity) session.getAttribute("person");
		        for (DonHangEntity DonHang : donhangList){
		        if(DonHang.getMa_Customer() == person.getMa_Customer()) {
		        	donhangList_Show.add(DonHang);
		        }
		        }
		        
	           model.addAttribute("donhangList", donhangList_Show);
	           model.addAttribute("message",  "thành công");
	        return "web/viewlistCTDHdetails";
	    }
    
}
