<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    if (session.getAttribute("user_admin") == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<body>
<div class="content-wrapper">
    <div class="container-fluid">
        <!--End Row-->


        <div class="row">
            <div class="col-lg-12">
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Đơn hàng cần giao</h5>
                        <div class="table-responsive">
                            <form action="${pageContext.request.contextPath}/admin/giaohang/phancong_2" method="get">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tên khách hàng</th>
                                        <%--                                    <th scope="col">MẬt khẩu</th>--%>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Ngày đặt</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th scope="col">Ghi chú</th>
                                        <th scope="col">Giao hàng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listDHCG}" var="donhang">
                                        <tr>
                                            <td scope="row">${donhang.ma_DH}</td>
                                            <td>${donhang.getCustomerEntity().getHoten_Customer()}</td>
                                            <td>${donhang.diachi}</td>
                                            <td>${donhang.ngaydat}</td>
                                            <td>${donhang.tongtien}</td>
                                            <td>${donhang.ghichu}</td>
                                            <td>
                                                <input type="checkbox" id="sp1" name="${donhang.ma_DH}"
                                                       value="${donhang.ma_DH}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <br>
                                <div class="container">
                                    <div class="row">
                                        <div class="col text-center">
                                            <button type="submit" class="btn btn-success"><i
                                                    class="fa fa-check-square-o"></i> Shipper giao hàng
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

