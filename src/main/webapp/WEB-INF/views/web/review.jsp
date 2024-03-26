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


<style>
    /* CSS sử dụng class để tùy chỉnh vùng văn bản */
    .custom-textarea {
      width: 100%;
      height: 300px;
      resize: none; /* Ngăn không cho người dùng thay đổi kích thước */
    }
  </style>
<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-register">
                                <h4>Nơi để bạn viết những trải nghiệm với BOOK STORE</h4>
                                
                                
                                <form name="formRegister" class="aa-login-form" method="post" action="${pageContext.request.contextPath}/web/review">
                                    <p style="color:#06f10a; display:block">
                                        ${message}
                                    </p>
                                    <p style="color:#ff0000; display:block">
                                        ${errMessage}
                                    </p>
                 
                                    <label>Review <span>*</span></label>
                                    <textarea name="review" placeholder="Tối da 4000 từ" class="custom-textarea aa-login-form" rows="5" cols="40" required>

									</textarea>
                                    <button type="submit" class="aa-browse-btn">Gửi Review</button>
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
