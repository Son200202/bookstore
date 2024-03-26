
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
    if (session.getAttribute("user_admin") == null){
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<div class="content-wrapper">
    <div class="container-fluid">
        <!--End Row-->
        <div class="row">
            <div class="col-lg-12">
                <button class="add-catalog"><a href="${pageContext.request.contextPath}/admin/product/add">Thêm Cuốn sách</a></button>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách Cuốn sách</h5>
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${fn:contains(message, 'thành công')}">
                                    <div><b> <span style="color:green"> ${message}</span></b></div>
                                </c:when>
                                <c:otherwise>
                                    <div><b> <span style="color:red"> ${message}</span></b></div>
                                </c:otherwise>
                            </c:choose>
                            <table class="table tablee table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">Đầu Sách</th>
                                    <th scope="col" class="limit-width"><span>Tên Cuốn Sách</span></th>
                                    <th scope="col">Tác Giả</th>
                                    <th scope="col">Số Lượng</th>
                                    <th scope="col">Ảnh Cuốn Sách</th>
                                    <th scope="col">Discount</th>
                                    <th scope="col">Giá Bán</th>
                                    <th scope="col">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cuonsachList}" var="cuonsach">
                                    <tr>
                                        <td>${cuonsach.getCategoryEntity().getTen_DauSach()}</td>
                                        <td class="limit-width"><span>${cuonsach.ten_CuonSach}</span></td>
                                        <td>${cuonsach.tacgia}</td>
                                        <td>${cuonsach.soluong}</td>
                                        <td><a class="aa-product-img" href="#"><img width="100" height="125" src="${pageContext.request.contextPath}/template/web/images/products/img-test/${cuonsach.anh_CuonSach}"></a></td>
                                        <td>${cuonsach.discount}</td>
                                        <td>${cuonsach.giabia}</td>
                                        <td>
                                            <button type="reset" class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/product/delete?cuonsach_id=${cuonsach.ma_CuonSach}">Xóa</a></button>
                                            <button class="btn btn-success"><a href="${pageContext.request.contextPath}/admin/product/edit?cuonsach_id=${cuonsach.ma_CuonSach}">Sửa</a></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${navigationDaoImpl.totalPages > 1}">
    <div class="text-center d-flex justify-content-center ">
        <nav aria-label="Page navigation example">
            <ul class="pagination pagination-lg">
                <c:forEach items="${navigationDaoImpl.navigationPages}" var = "page">
                    <c:choose>
                        <c:when test="${page != -1 && page == navigationDaoImpl.currentPage }">
                            <li class="page-item active">
                                <a href="#" class="page-link">${page} </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item" >
                                <a href="${pageContext.request.contextPath}/admin/product/list?page=${page}" class="page-link">${page}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <%-- <li class="page-item"><a class="page-link" href="#">2</a></li>
                     <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                </c:forEach>
            </ul>
        </nav>
    </div>
</c:if>

