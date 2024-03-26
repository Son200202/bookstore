<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/11/2021
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    if (session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/web/login");
    }
%>
<c:url value="/template/web" var="url"/>


<style>
    
    .menu {
      width: 200px;
      background-color: #970001;
      color: white;
    }

    .menu ul {
      list-style: none;
      padding: 0;
      margin: 0;
      color: white;
    
    }

    .menu li {
      padding: 10px 15px;
      border-bottom: 1px solid #555;
      color: white;
    }

    .menu li:hover {
      background-color: #555;
    }

    .content {
      flex: 1;
      padding: 20px;
    }
  </style>
<!-- Cart view section -->
<section id="aa-myaccount">
<div class="menu">
    <ul>
      <li><a style="color: white;" href="${pageContext.request.contextPath}/web/account">ĐỔI THÔNG TIN TÀI KHOẢN</a></li>
      <li><a style="color: white;" href="${pageContext.request.contextPath}/web/resetpassword">ĐỔI MẬT KHẨU</a></li>
    </ul>
  </div>
    <div class="container">
            <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="row">
 
                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-register">
                                <h4>ĐỔI THÔNG TIN TÀI KHOẢN</h4>
                                <form name="formRegister" class="aa-login-form" method="post" action="${pageContext.request.contextPath}/web/account">
                                    <p style="color:#06f10a; display:block">
                                        ${success}
                                    </p>
                                    <p style="color:#ff0000; display:block">
                                        ${errMessage}
                                    </p>
                                    <label>Họ tên<span>*</span></label>
                                    <input class="form-control" type="text" placeholder=${kh.hoten_Customer } name="name" value="${kh.hoten_Customer}" required>
                                    <label>Email <span>*</span></label>
                                    <input class="form-control" style="display: block;width: 100%;height: 40px;border: 1px solid #ccc; padding: 10px" type="email"  placeholder="useremail@gmail.com" name="email" value="${kh.gmail_Customer}" required>
                                    <p style="color:#ff0000; display:block">
                                        ${errGmail}
                                    </p>
                                    <label>Số điện thoại<span>*</span></label>
                                    <input class="form-control" placeholder="8888888888" pattern="[0-9]{10}" maxlength="10" name="sdt" value="${kh.sdt_Customer}" required>
                                    <p style="color:#ff0000; display:block">
                                        ${errSdt}
                                    </p>
                                    <label>Username<span>*</span></label>
                                    <input class="form-control" type="text" placeholder="Username" name="username" value="${kh.taikhoan_Customer}" required>
                                    <p style="color:#ff0000; display:block">
                                        ${errTaikhoan} <br>
                                        ${error}
                                    </p>
                                    

                                    <button type="reset" class="aa-browse-btn" value="Reset">Đặt lại</button>
                                    <button type="submit" class="aa-browse-btn">LƯU</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->
