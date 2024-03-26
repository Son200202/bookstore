<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/11/2021
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value="/template/web" var="url"/>

<!-- Start slider -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-login">
                                <h4>Đăng nhập</h4>
                                <form class="aa-login-form" name="loginform" onsubmit="validate();" action="${pageContext.request.contextPath}/web/login" method="post">
                                    <label >Username<span>*</span></label>
                                    <input type="text" placeholder="Username" name="user" value="${sessionScope.taikhoan_dk}" required>
                                    <label >Mật khẩu<span>*</span></label>
                                    <input type="password" placeholder="Password" name="password" required>
                                    
                                    <div class="form-floating mb-3">
										<botDetect:captcha  id="exampleCaptcha" userInputID="captchaCode"/>
									</div>
									<label>                                                              </label>
									<div>
										    <input class="form-floating mb-3" id="captchaCode" type="text" name="captchaCode" placeholder="capchaCode"
										            value="${basicExample.captchaCode}"/>
										     <p class="text-danger">${message }</p>
									</div>
						
                                    <p class="rememberme" style="display: block"><input type="checkbox" id="rememberme"> Ghi nhớ </p>

                                    <p style="color:#ff0000; display:block">
                                        ${errorMessage}
                                    </p>
                                    
                                    
							<div class="form-floating mb-3 float-left">
								<span></span> <a style="color: blue;" href="${pageContext.request.contextPath}/web/quenmatkhau"><u>Quên mật khẩu</u></a>
								
								
							</div>
							
                                    <button type="submit" class="aa-browse-btn">Đăng nhập</button>

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
