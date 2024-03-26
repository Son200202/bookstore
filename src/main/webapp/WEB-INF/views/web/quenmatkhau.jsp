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
<c:url value="/template/web" var="url"/>
<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="row">

                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-register">
                                <h4>Quên mật khẩu</h4>
                                <form name="formRegister" class="aa-login-form" method="post" action="${pageContext.request.contextPath}/web/quenmatkhau">
                                    <p style="color:#06f10a; display:block">
                                        ${success}
                                    </p>
                                    <p style="color:#ff0000; display:block">
                                        ${errMessage}
                                    </p>
                 
                                    <label>Email <span>*</span></label>
                                    <input class="form-control" style="display: block;width: 100%;height: 40px;border: 1px solid #ccc; padding: 10px" type="email"  placeholder="Nhập email mà bạn đã dùng để đăng ký tài khoản" name="gmail" value="${gmail}" required>
                                   
                                    <button type="submit" class="aa-browse-btn">Gửi mã về gmail</button>
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
