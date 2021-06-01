<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.image{
    float: left;
    width: 410px;
    height: 410px;
}
img{
  vertical-align: top;
}
.prod-buy{
    position: relative;
    float: right;
    width: 479px;
    font-size: 12px
}
.prod-image {
    position: relative;
    float: left;
    width: 490px;
    text-align: center;
}
</style>
<title>상품 상세 페이지</title>
</head>

<!-- 재 검색 -->
<body style="text-align: center;">
  <div >
    <h1>
      <a href="Coupang"><img src="../resources/image/main.png"></a>
    </h1>
    <div>
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
      </select> <input style="width: 300px" type="text" id="search"
        placeholder="찾고 싶은 상품을 검색해 보세요!"> <input type="button"
        class="btn_search" value="검색">
    </div>
  </div>

  <!-- 카테고리 -->
  <div></div>

  <!-- 이미지, 이름, 평점, 가격, 날짜, 판매자, 택배사, 갯수, 장바구니,구매-->
  <div>
    <div class="prod-image">
      <input type="hidden" class="productImage" value="${vo.productImage}">
      <img src="${vo.productImage }">
    </div>

    <div class="prod-buy">
      <div>
        <input type="hidden" class="productName" value="${vo.productName}">
        <h2>${vo.productName}</h2>
        <span class="stars"></span>
      </div>

      <div>
        <input type="hidden" class="Base_productPrice" value="${vo.productPrice}">
        <strong><span class="productPrice" id="productPrice">${vo.productPrice}원</span></strong>
      </div>

      <br>

      <div>
        <span class="deldate"></span>
      </div>

      <br>

      <div>
        <c:if test="${not empty vo.productSeller}">
          <span>판매자 : ${vo.productSeller}</span>
        </c:if>
        <br>
        <c:if test="${not empty vo.productCourier}">
          <span>택배사 : ${vo.productCourier}</span>
        </c:if>
      </div>

      <div>
        <input class="productAmount" type="text" id="productAmount" value="1">
        <button class="btn_plus" id="btn_plus">∧</button>
        <button class="btn_minus" id="btn_minus">∨</button>

        <button class="btn_cart" id="btn_cart">장바구니 담기</button>
        <button class="btn_buy" id="btn_buy">구매하기</button>
      </div>
    </div>
  </div>

  <input type="hidden" value="${vo.productNo}" class="hid_no">
  <input type="hidden" value="${vo.categoryCode}" class="hid_category">

  <!-- 상품 상세, 제품평(리뷰), 상품문의 -->
  <div></div>

  <script type="text/javascript">
			$(document).ready(function() {
				// 배송 날짜
				var date = new Date();
				var month = date.getMonth()+1;
				var day = date.getDate()+1;
				var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
				var deldate = week[date.getDay() + 1] + "(내일) "
						+ month + "월 " + day + "일" ;
				console.log(deldate);
				$('.deldate').html(deldate + '까지 도착');

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

				// 최대 수량 10개로 한정
				function check_plus() {
					btn_p = document.getElementById('btn_plus');
					if($('.productAmount').val()==10){
						btn_p.disabled = true;
					} else {
						btn_p.disabled = false;
					}
				}

				// 개수가 1개 이하일떄 minus 버튼 비활성화
 				function check_minus() {
					btn_m = document.getElementById('btn_minus');
					if($('.productAmount').val()==1){
						btn_m.disabled = true;
					} else {
						btn_m.disabled = false;
					}
				}

				check_minus();
				var price = parseInt($('.productPrice').html());

				$('.btn_plus').click(function(){ // plus 버튼 클릭
					var amount = parseInt($('.productAmount').val()) + 1;
					console.log(amount);
					document.getElementById("productAmount").value = amount;
					check_minus();

					console.log(price);
					var changePrice = price * amount;
					console.log(changePrice);
					$('#productPrice').text(changePrice+"원");

					check_plus();
				}); // end btn_plus

				$('.btn_minus').click(function(){ // minus 버튼 클릭
					var amount = parseInt( $('.productAmount').val()) - 1;
					console.log(amount);
					document.getElementById("productAmount").value = amount;
					check_minus();

					console.log(price);
					var changePrice = price * amount;
					console.log(changePrice);
					$('#productPrice').text(changePrice+"원");

					check_plus();
				}); // end btn_plus


				$('.btn_cart').click(function(){
					var image = $('.productImage').val();
					var name = $('.productName').val();
					var price = parseInt($('.Base_productPrice').val());
					var amount = parseInt($('.productAmount').val());
					var totalPrice = parseInt($('.productPrice').html());
					var key_localStorage = $('.productName').val();

					var url_productNo = $('.hid_no').val();
					var url_category = $('.hid_category').val();

					console.log(url_productNo);
					console.log(url_category);


					var obj = {
							'cartImage' : image,
							'cartName' : name,
							'cartPrice' : price,
							'cartAmount' : amount,
							'cartTotalprice' : totalPrice,
							'productNo' : url_productNo,
							'category' : url_category
					}

					console.log(obj);
					var JSONObj = JSON.stringify(obj);

					$.ajax({
						type : 'post',
						url : 'cart',
		  				headers : {
		  					'Content-Type' : 'application/json',
		  					'X-HTTP-Method-Override' : 'POST'
		  				},
						data : JSONObj,
						success : function(result) {
							if(result == 1){
								alert('장바구니 등록 성공!');
							} else {
								alert('장바구니 등록 실패!');
							}
						}
					}); // end ajax
				}); // end btn_cart

            	$('.btn_buy').click(function(){
            		var image = $('.productImage').val();
					var name = $('.productName').val();
					var price = parseInt($('.Base_productPrice').val());
					var amount = parseInt($('.productAmount').val());
					var totalPrice = parseInt($('.productPrice').html());
					var key_localStorage = $('.productName').val();

					var url_productNo = $('.hid_no').val();
					var url_category = $('.hid_category').val();

					console.log(url_productNo);
					console.log(url_category);


					var obj = {
							'cartImage' : image,
							'cartName' : name,
							'cartPrice' : price,
							'cartAmount' : amount,
							'cartTotalprice' : totalPrice,
							'productNo' : url_productNo,
							'category' : url_category
					}

					console.log(obj);
					var JSONObj = JSON.stringify(obj);
					var test = 'test';
					$.ajax({
						type : 'get',
						url : 'buy',
		  				headers : {
		  					'Content-Type' : 'application/json',
		  					'X-HTTP-Method-Override' : 'GET'
		  				},
						data : JSONObj
					}); // end ajax
            }); // end btn_buy
         }); // end document
   </script>
</body>
</html>
