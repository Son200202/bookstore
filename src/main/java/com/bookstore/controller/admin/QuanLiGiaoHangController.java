package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletResponse;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import com.bookstore.entity.*;
import com.bookstore.service.*;
import com.bookstore.service_impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.mail.javamail.JavaMailSender;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
@Controller
@RequestMapping("/admin/")
public class QuanLiGiaoHangController {
    @Autowired
    DonHangService donhangService = new DonHangService_impl();
    @Autowired
    GiaoHangService giaoHangService= new GiaoHangService_impl();
    @Autowired
    ShipperService shipperService = new ShipperService_impl();
    @Autowired
	JavaMailSender mailSender;
    @RequestMapping("giaohang/empty")
    public String GiaoHang(ModelMap model) {
        return "admin/emptyDH";

    }
    @RequestMapping(value = "giaohang/list", method = RequestMethod.GET)
    public String GiaoHangList(ModelMap model) {

        List<GiaoHangEntity> list = giaoHangService.findTT_GH();
        model.addAttribute("list", list);
        return "admin/viewlistGH";
    }
    @RequestMapping(value = "giaohang/phancong", method = RequestMethod.GET)
    public String PhanCong(ModelMap model) {
        List<ShipperEntity> listSP = shipperService.findAll();
        model.addAttribute("listSP", listSP);
        List<DonHangEntity> listDHCG = donhangService.Find_DHCG();
        model.addAttribute("listDHCG", listDHCG);
        if (listDHCG.size() != 0) {
            return "admin/phancongGH";

        } else {
            return "admin/emptyDH";
        }
    }
    @RequestMapping("giaohang/phancong_2")
    public String PhanCong_2(ModelMap model, @RequestParam(value = "id", required = false) String id,
    		HttpServletResponse response, HttpServletRequest request) throws IOException {
    	int t = 0;

        response.setContentType("text/html;charset=UTF-8");
        if (id == null) {
            List<DonHangEntity> listDHCG = donhangService.Find_DHCG();
            List<DonHangEntity> listDH_DaChon = new ArrayList<DonHangEntity>();
            
            for (DonHangEntity donHangEntity : listDHCG) {
                if (request.getParameter(String.valueOf(donHangEntity.getMa_DH())) != null) {
                    listDH_DaChon.add(donHangEntity);
                    t++;
                }
            }
            
            if(t == 0) {
            	model.addAttribute("error", "bạn phải chọn đơn hàng để phân công");
            	 PrintWriter out = response.getWriter();
                 out.print("<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>");
                 out.println("<html>");
                 out.println("<head>");
                 out.println("<title>Loi</title>");
                 out.println("</head>");
                 out.println("<body>");
                 out.println("<script>");
                 out.println("alert('Phải chọn đơn hàng trước khi phân công cho shipper')");
                 out.println("location.href = \"./phancong\";");
                 out.println("</script>");
                 out.println("</body>");
                 out.println("</html>");
                 out.close();
                return "admin/phancongGH";
            }
            List<ShipperEntity> shipperEntities = new ArrayList<ShipperEntity>();
            shipperEntities = shipperService.findAll();
            HttpSession session = request.getSession();
            session.setAttribute("listDH_DaChon", listDH_DaChon);
            model.addAttribute("shipperEntities", shipperEntities);
            return "admin/phancongGH_2";

        } else {
            HttpSession session = request.getSession();
            List<DonHangEntity> listDH_DaChon = (List<DonHangEntity>) session.getAttribute("listDH_DaChon");
            for (DonHangEntity donHangEntity : listDH_DaChon) {
                GiaoHangIDKey giaoHangIDKey = new GiaoHangIDKey();
                GiaoHangEntity giaoHangEntity = new GiaoHangEntity();
                giaoHangIDKey.setMa_DH(donHangEntity.getMa_DH());
                giaoHangIDKey.setMa_Shiper(Integer.valueOf(id));
                giaoHangEntity.setId(giaoHangIDKey);
                giaoHangService.save(giaoHangEntity);
                
                // send mail
                ShipperEntity shipper = shipperService.findById(Integer.valueOf(id));
                
                MimeMessage message = mailSender.createMimeMessage();
        		MimeMessageHelper helper = new MimeMessageHelper(message);

        		try {
        			helper.setFrom("no-reply-email");
        			helper.setTo(shipper.getGmail_Shipper());
        			helper.setSubject("BOOK STORE, Có đơn hàng mới được phân công!");
        			helper.setText("Bạn được phân công giao đơn hàng có mã đơn là: " + donHangEntity.getMa_DH() );
        		} catch (MessagingException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
        		mailSender.send(message);
        		
            }
            
            session.removeAttribute("listDH_DaChon");
            return "redirect:/admin/giaohang/phancong";

        }
    }
    
//    @RequestMapping("giaohang/Search")
//    public String Search(@RequestParam("TuKhoa") String TuKhoa,
//                         ModelMap model){
//    	List<GiaoHangEntity> giaoHangList = new ArrayList<GiaoHangEntity>();
//    	 GiaoHangEntity giaoHang = new GiaoHangEntity();
//        if (TuKhoa == null)
//            TuKhoa= "";
//        
//        if (giaoHangService.Search(TuKhoa) != null) {
//            giaoHangList = giaoHangService.Search(TuKhoa);
//            
//            }
//             
//            try {
//            	int number = Integer.parseInt(TuKhoa);
//            	if (giaoHangService.!= null) {
//            	giaoHang =  giaoHangService.findById(number);
//            	}
//                boolean a = false;
//               
//            	if (giaoHang != null) {
//                	for (GiaoHangEntity c : giaoHangList) {
//                		if( giaoHang.getMa_Admin() == c.getMa_Admin()) {
//                			a =true;
//                			break;
//                		}
//                	}
//                	
//                }
//            
//            	if (!a && giaoHang != null) {
//                	giaoHangList.add(giaoHang);
//                 }
//            } catch (NumberFormatException e) {
//                System.out.println("Chuỗi không thể chuyển thành số nguyên.");
//            }
//            
//            
//           
//            model.addAttribute("adminList", adminsList);
//           
//            model.addAttribute("message",   "thành công");
//
//            return "/admin/viewlistadmin";
//        }
}
