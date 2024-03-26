<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 1/5/2021
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%
    if (session.getAttribute("user_admin") == null){
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>


<div class="content-wrapper">
    <div class="container-fluid">

        <div class="row mt-3">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Chuyên mục: Sửa</div>
                        <hr>
                        <c:choose>
                            <c:when test="${fn:contains(message, 'thành công')}">
                                <div><b> <span style="color:green"> ${message}</span></b></div>
                            </c:when>
                            <c:otherwise>
                                <div><b> <span style="color:red"> ${message}</span></b></div>
                            </c:otherwise>
                        </c:choose>

                        <form:form action="" method="post" modelAttribute="customer">
                            <div class="form-group">
                                <label for="input-1">ID</label>
                                <form:input path="ma_Customer" type="text" class="form-control" id="input-1" name="id"/>
<%--                                <input type="text" class="form-control" readonly id="input-1" placeholder="Customer ID" name="id" value="${customer.ma_Customer}" required>--%>
                            </div>
                            <div class="form-group">
                                <label for="input-2">Username</label>
                                <form:input path="taikhoan_Customer" type="text" class="form-control" id="input-2"/>
                                <div><b> <span style="color:red">
                                    <form:errors path="taikhoan_Customer"/>
                                </span></b></div>
<%--                                <input type="text" class="form-control" id="input-2" placeholder="Username" name="customer-username" value="${customer.taikhoan_Customer}" required>--%>
                            </div>
                            <div class="form-group">
                                <label for="input-3">Password</label>
                                <form:input path="matkhau_Customer" type="password" class="form-control" id="input-3"/>

<%--                                <input type="password" class="form-control" id="input-3" placeholder="Mật khẩu" name="customer-password" value="${customer.matkhau_Customer}" required>--%>
                                <input type="checkbox" onclick="myFunction1()">Hiển thị mật khẩu
                                <script>function myFunction1() {
                                    var x = document.getElementById("input-3");
                                    if (x.type === "password") {
                                        x.type = "text";
                                    } else {
                                        x.type = "password";
                                    }
                                }</script>
                                <div><b> <span style="color:red">
                                    <form:errors path="matkhau_Customer"/>
                                </span></b></div>
                            </div>
                            <div class="form-group">
                                <label for="input-4">Tên Customer</label>
                                <form:input path="hoten_Customer" type="text" class="form-control" id="input-4"/>
                                <div><b> <span style="color:red">
                                    <form:errors path="hoten_Customer"/>
                                </span></b></div>
<%--                                <input type="text" class="form-control" id="input-4" placeholder="Tên Admin" name="customer-name" value="${customer.hoten_Customer}" required>--%>
                            </div>
                            <div class="form-group">
                                <label for="input-5">Email</label>
                                <form:input path="gmail_Customer" type="email" class="form-control" id="input-5"/>
                                <div><b> <span style="color:red">
                                    <form:errors path="gmail_Customer"/>
                                </span></b></div>
<%--                                <input type="email" class="form-control" id="input-5" placeholder="Email" name="customer-email" value="${customer.gmail_Customer}" required>--%>
                            </div>
                            <div class="form-group">
                                <label for="input-6">Số điện thoại</label>
                                <form:input path="sdt_Customer" type="number" class="form-control" id="input-6"/>
                                <div><b> <span style="color:red">
                                    <form:errors path="sdt_Customer"/>
                                </span></b></div>
<%--                                <input type="number" class="form-control" id="input-6" placeholder="Số điện thoại" name="customer-sdt" value="${customer.sdt_Customer}" required>--%>
                            </div>
                            <div class="form-group">
                                <label for="input-7">Ví Tiền</label>
                                <form:input path="vitien" type="number" class="form-control" id="input-7"/>
                                <div><b> <span style="color:red">
                                    <form:errors path="vitien"/>
                                </span></b></div>
                                <input type="number" class="form-control" id="input-7" placeholder="Ví tiền" name="customer-vitien" value="${customer.vitien}"required>
                            </div>
                            <div class="form-footer">
                                <button type="reset" class="btn btn-danger"><i class="fa fa-times"></i> <a href="${pageContext.request.contextPath}/admin/user/list">Hủy</a> </button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Cập nhật</button>
                            </div>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>
        <div class="overlay toggle-menu"></div>
    </div>
</div>
