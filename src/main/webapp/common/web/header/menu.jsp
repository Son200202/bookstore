<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value = "/template/web" var="url"/>
<style>
.aa-cart-view-btn {
  float: right;
  border: none;
  color: #fff;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 2px;
  padding: 15px 30px;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -ms-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
}
.aa-cart-view-btn:hover {
  background-color: black;
  color: #fff;
}
 .aa-cartbox {
  float: right;
  text-align: center;
  position: relative;
  height: fit-content;
  width: 130px;
  margin: auto;
  flex: none;
  padding-top: 5px;

  border-radius: 10px;
}
.aa-shipping-box {
    position: relative;
    display: flex;
    justify-content: space-around;
    text-align: center;
    width: 90%;
    height: auto;
}
 .aa-shipping-box .aa-shipping-title {
    font-weight: 600;
}
 .aa-shipping-box .aa-shipping-boxsmall {
    padding: 15px;
    display: flex;
}
.aa-shipping-box .aa-shipping-boxsmall-icon {
    font-size: 25px;
    color: white;
    margin: auto;
    padding: 5px;
    background-color: #fc7b03;
    border-radius: 50%;
}
.aa-shipping-box .aa-shipping-box-text {
    text-align: initial;
    margin: auto;
    padding-left: 10px;
}
 .aa-cartbox .aa-cart-link {
  font-size: 18px;
  position: relative;
  width: 100%;
  height: auto;
  display: block;
  padding: 5px
}
 .aa-cartbox .aa-cart-link .fa-shopping-basket {
  z-index: 99;
  position: relative;
}
 .aa-cartbox .aa-cart-link .aa-cart-title {
  color:#dce6dd;
/*  display: block;*/
  font-size: 16px;
}
 .aa-cartbox .aa-cart-link .aa-cart-notify {
 color: black;
  background-color: #fff;
  border-radius: 50%;
  font-size: 10px;
  font-weight: bold;
  padding: 2px 7px;
  position: absolute;
  right: 70%;
  top: -15px;
  z-index: 10;
  -webkit-animation-name: cartbox-transition;
  -webkit-animation-duration: 2s;
  -webkit-animation-timing-function: linear;
  -webkit-animation-iteration-count: infinite;
  animation-name: cartbox-transition;
  animation-duration: 2s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
}
 .aa-cartbox .aa-cart-link .aa-cart-notify:after,  .aa-cartbox .aa-cart-link .aa-cart-notify:before {
  top: 100%;
  left: 50%;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}
.aa-cartbox .aa-cart-link .aa-cart-notify:after {
  border-color: rgba(255, 102, 102, 0);
  border-width: 5px;
  margin-left: -5px;
}
.aa-cartbox .aa-cart-link .aa-cart-notify:before {
  border-color: rgba(0, 0, 0, 0);
  border-width: 6px;
  margin-left: -6px;
}
.aa-cartbox .aa-cartbox-summary {
  max-height:350px;
  background-color: #fff;
  border: 1px solid #E9E9E9;
  display: none;
  padding: 20px;
  position: absolute;
  right: 0;
  top: 100%;
  width: 300px;
  z-index: 9999;
  overflow:hidden;
}
.aa-cartbox .aa-cartbox-summary .scroll-product{
	max-height:240px;
	overflow-y: scroll;
	
}
.aa-cartbox .aa-cartbox-summary .total-detailproduct{
	padding-top:2px;
}
.aa-cartbox .aa-cartbox-summary:after, .aa-cartbox .aa-cartbox-summary:before {
  bottom: 100%;
  left: 81%;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}
.aa-cartbox .aa-cartbox-summary:after {
  border-color: rgba(255, 255, 255, 0);
  border-bottom-color: #fff;
  border-width: 10px;
  margin-left: -10px;
}
 .aa-cartbox .aa-cartbox-summary:before {
  border-color: rgba(233, 233, 233, 0);
  border-bottom-color: #e9e9e9;
  border-width: 11px;
  margin-left: -11px;
}
.aa-cartbox .aa-cartbox-summary ul li {
  border-bottom: 1px solid #e2e2e2;
  display: block;
  float: left;
  margin-bottom: 15px;
  padding-bottom: 15px;
  width: 100%;
  position: relative;
}
.aa-cartbox .aa-cartbox-summary ul li:last-child {
  border: none;
  margin-bottom: 0px;
}
.aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-img {
  display: block;
  float: left;
  margin-top: -33px;
  justify-content: center;
  align-items: center;
  height: 110px;
  width: 95px;
}
.aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
 .aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-info {
  display: block;
  float: left;
  margin-left: 10px;
  width: 55%;
}
.aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-info h4 {
  font-size: 14px;
  color: #333333;
  margin-bottom: 20px;
  margin-top: 0;
  letter-spacing: 0.5px;
}

.aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-info p {
  font-size: 16px;
}
 .aa-cartbox .aa-cartbox-summary ul li .aa-remove-product {
  border: 1px solid transparent;
  border-radius: 50%;
  color: #c0c0c0;
  font-size: 12px;
  height: 20px;
  line-height: 17px;
  position: absolute;
  right: 0;
  top: 30%;
  width: 20px;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -ms-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
}
.aa-cartbox .aa-cartbox-summary ul li .aa-remove-product:hover, .aa-cartbox .aa-cartbox-summary ul li .aa-remove-product:focus {
  color: #333;
}
.aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-total-title {
  float: left;
  font-weight: bold;
  font-size: 16px;
  font-family: "Lato", sans-serif;
  letter-spacing: 0.5px;
}
.aa-cartbox .aa-cartbox-summary ul li .aa-cartbox-total-price {
  float: right;
  font-weight: bold;
  font-size: 16px;
  font-family: "Lato", sans-serif;
  letter-spacing: 0.5px;
}

.black-text {
  color: black; /* Đổi màu chữ thành màu đen */
  /* Các kiểu khác */
}
.align-left {
            float: left;
}



</style>
<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                  <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-header-bottom-area">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/web/home">TRANG CHỦ</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/introduce">GIỚI THIỆU</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/product">XEM SÁCH</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/contact">LIÊN HỆ</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/account">TÀI KHOẢN</a></li>
                        <li>
			                <a class="aa-cart-link" href="${pageContext.request.contextPath}/web/product/DonHang">
                            <span class="aa-cart-title">ĐƠN HÀNG</span></a>
                        </li>
                        <li> 
			              <!-- cart box -->
                    <div class="aa-cartbox">
                        <a class="aa-cart-link" href="${pageContext.request.contextPath}/web/product/CartDetail">
                            <span class="fas fa-cart-arrow-down"></span>
                            <span class="aa-cart-title" >GIỎ HÀNG</span>

                            <c:if test="${length_orders != NULL}">
                                <span class="aa-cart-notify">${length_orders}</span>
                            </c:if>


                        </a>
                        <div class="aa-cartbox-summary">
                            <ul class="scroll-product">
                                <c:forEach items="${Orders}" var="Order" >
                                    <li>
                                        <a class="aa-cartbox-img" href="#"><img src="${pageContext.request.contextPath}/template/web/images/products/img-test/${Order.getCuonSachEntity().anh_CuonSach}" alt="img"></a>
<%--                                            ${pageContext.request.contextPath}/view/client/cart--%>
                                        <div class="aa-cartbox-info">
                                            <h4>${Order.getCuonSachEntity().ten_CuonSach}</h4>
                                            <p>${Order.soluong} x <fmt:formatNumber
                                                    type="number" maxFractionDigits="3"
                                                    value="${Order.getCuonSachEntity().giabia}"/> VNĐ</p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="total-detailproduct">
                  		<span class="aa-cartbox-total-title">
                        <b>Tổng:</b>
                      </span>
                                <span class="aa-cartbox-total-price">
                        <fmt:formatNumber
                                type="number" maxFractionDigits="3"
                                value="${tongtien}"/> VNĐ
                      </span>
                            </div>
                            <a class="aa-primary-btn" href="${pageContext.request.contextPath}/web/product/CartDetail"><font color="black">Chi tiết</font></a>
                            <a class="aa-primary-btn" href="${pageContext.request.contextPath}/web/checkout"><font color="black">Thanh toán</font></a>
                        </div>
                    </div>
                    <!-- / cart box -->

     		           	</li>
                    	
                        <li class="aa-search"><!-- search box -->
                            <a class="aa-search-box">
                                <form action="${pageContext.request.contextPath}/web/product/Search" method="Get">
                                    <input type="text" name="TuKhoa" id="" placeholder="Tìm kiếm sách..">
                                    <button class="serach-box"><span class="fa fa-search"></span></button>
                                </form>
                            </a>
                            <!-- / search box -->
                           
                        </li>
                        
                       
                    </ul>
                   </div>
                    </div>
                     </div>
                      </div>  
                </div><!--/.nav-collapse -->

            </div>
        </div>
    </div>
</section>