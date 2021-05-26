<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>쇼핑몰 메인 페이지</title>
</head>
<header>
  <div>
   <c:if test="${empty customerId}">
      <button type="button" id="btn_login">로그인</button>
   </c:if>
   <c:if test="${not empty customerId}">
      <button type="button" id="btn_logout">로그아웃</button>
   </c:if>
  </div>
</header>
<body style="text-align: center;">
  <div>
    <h1>
      <a href="Coupang"><img src="../resources/image/main.png"></a>
    </h1>
    <div class="">
      <select name="category" id="category">
        <option class="all" value="all" selected="selected">전체</option>
        <option value="fashion">패션</option>
        <option value="child">유아</option>
        <option value="food">식품</option>
        <option value="household">가정용품</option>
        <option value="digital">가전디지털</option>
        <option value="car">자동차</option>
        <option value="hobby">취미</option>
        <option value="pet">반려동물</option>
      </select>
      <input style="width: 300px" type="text" id="search" placeholder="찾고 싶은 상품을 검색해 보세요!">
      <input type="button" class="btn_search" value="검색">
     <button type="button" id="btn_myPage">마이페이지</button>
     <button type="button" id="btn_cart">장바구니</button>
    </div>
  </div>

  <script type="text/javascript">
         $(document).ready(function() {
            var categoryCode = "all";
            console.log(categoryCode);

            $("select[name=category]").change(function() {
               categoryCode = $(this).val(); // select태그 value값 가져오기
               console.log(categoryCode);
            }); // end select

            $('.btn_search').click(function() { // 검색 버튼 클릭
                     var productName = $('#search').val();
                     console.log(productName);

                     $.ajax({
                        type : 'post',
                        url : 'Coupang',
                        data : {
                           productName : productName,
                           categoryCode : categoryCode
                        },
                        success : function(data) {
                           location.href = "list"
                        }
                     }); // end ajax
                  }); // end btn_search

            $('#search').keypress(function(e) {
               if(e.which == 13){
                  $('.btn_search').click();
                  return false;
               }
            })

            $('#btn_login').click(function(){
               location = encodeURI('/project/member/login');
            }); // end btn_login_click()
            $('#btn_logout').click(function(){
               location = encodeURI('/project/member/logout');
            }); // end btn_logout_click()

            $('#btn_myPage').click(function(){
               location = encodeURI('/project/main/myPage');
            }); // end btn_myPage_click()

            $('#btn_cart').click(function(){
            	location.href = "cart";
            }); // end btn_myPage_click()
         }); // end document
   </script>
</body>
</html>
