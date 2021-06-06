<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>장바구니 페이지</title>
</head>

<style type="text/css">
.cartTable {
  width: 898px;
  border-top: 0;
}

body, div, dl, dt, dd, ul, ol, menu, li, h1, h2, h3, h4, h5, h6, pre,
  form, fieldset, input, textarea, blockquote, th, td, p {
  margin: 0;
  padding: 0;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

body, input, textarea, select, button, table {
  font-family: 돋움, Dotum, sans-serif;
  font-size: 100%;
}

* {
  margin: 0;
  padding: 0;
}

table {
  display: table;
  border-collapse: separate;
  box-sizing: border-box;
  text-indent: initial;
  border-spacing: 2px;
  border-color: grey;
}

thead {
  display: table-header-group;
  vertical-align: middle;
  border-color: inherit;
}

.cartTable .head {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}

tr {
  display: table-row;
  vertical-align: inherit;
  border-color: inherit;
}

.cartTable .head th {
    background: #fafafa;
    text-align: center;
}

.cartTable th {
  height: 40px;
  font-size: 13px;
}



.all-select-event span {
  position: absolute;
}

a, blockquote, body, button, dd, div, dl, dt, fieldset, form, h1, h2, h3,
  h4, h5, h6, input, li, ol, p, pre, select, span, td, textarea, th, ul
  {
  margin: 0;
  padding: 0;
  color: #111;
  font-family: Dotum, \\B3CB\C6C0, sans-serif;
}

tbody {
  display: table-row-group;
  vertical-align: middle;
  border-color: inherit;
}

.cartTable .cart-bundle-title {
    text-align: left;
    line-height: 16px;
}

.cartTable td {
    border-bottom: 1px solid #ddd;
    line-height: 35px;
    text-align: center;
}

.cartTable input {
    font-size: 12px;
}

.cart-deal-item td:nth-child(2) {
    width: 80px;
    overflow: hidden;
}

.cart-bundle-title {
  padding: 26px 22px 24px;
  text-align: left;
}

.cart-bundle-title .bundle, .cart-bundle-title .global, .cart-bundle-title .rocket, .cart-bundle-title .rocket-install {
    float: left;
    line-height: 16px;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.5px;
}

.cart-deal-item {
  position: relative;
}

.last-cart-sc-items {
  border-bottom: 1px solid #eee !important;
}

.cart-deal-item td:first-child {
    width: 50px;
    overflow: hidden;
}

element.style {
  visibility: visible;
}

.cartTable .cart-bundle-title {
    text-align: left;
    line-height: 16px;
}

a {
  text-decoration: none;
}

.cart-deal-item td.product-box {
    padding: 10px 5px 10px 15px;
    text-align: left;
    vertical-align: top;
    z-index: 100;
}

.cartTable input {
    font-size: 12px;
}

label {
    cursor: default;
}

.cart-deal-item td:nth-child(3) {
  width: 568px;
  overflow: hidden;
}

.product-name-part {
  border-bottom: 1px solid #e2e5e7;
  padding-bottom: 5px;
  letter-spacing: -1px;
}

.product-box .option-item.modify-float {
    float: none;
}

.product-name-part+.option-item {
    border-top: 0;
}

.product-box .option-item {
    float: left;
    width: 100%;
    border-top: 1px dashed #dde0e3;
    padding: 4px 0;
}

.product-item-name.modify-color, .product-name.modify-color {
  color: #555;
}

.product-item-name, .product-name {
  margin-right: 5px;
  font-weight: 700;
  font-size: 14px;
  line-height: 22px;
  color: #55575f;
}

.delivery-date, .delivery-date.modify-padding {
  padding-top: 6px;
}

.delivery-date {
  visibility: hidden;
  font-size: 13px;
  color: #111;
  line-height: 15px;
  letter-spacing: -.5px;
  clear: both;
}

element.style {
  display: inline-block;
}

.async-content .arrive-date {
  display: none;
}

.delivery-date .arrive-date {
  height: 15px;
}

.delivery-fee {
  border-left: 1px solid #ddd;
  font-size: 12px;
  color: #888;
}

a, blockquote, body, button, dd, div, dl, dt, fieldset, form, h1, h2, h3,
  h4, h5, h6, input, li, ol, p, pre, select, span, td, textarea, th, ul
  {
  margin: 0;
  padding: 0;
  color: #111;
  font-family: Dotum, \\B3CB\C6C0, sans-serif;
}

.delivery-date .delivery-message {
  font-size: 11px;
  color: #00891a;
}

.delivery-enterprise {
  padding: 4px 0 0;
  font-size: 12px;
  line-height: 14px;
  color: #e52528;
}

.delivery-enterprise>img {
  width: 14px;
  line-height: 14px;
  margin-right: 2px;
  position: relative;
  top: -1px;
}

img {
  vertical-align: top;
}

button, fieldset, img {
    border: 0;
}

.option-item-info {
    float: left;
    max-width: 330px;
    position: relative;
}

.option-price-part {
  float: right;
  font-size: 12px;
  line-height: 24px;
}

.badge-list {
  float: right;
  clear: both;
  overflow: hidden;
}

.unit-cost {
  color: #888;
  letter-spacing: 0;
  vertical-align: top;
}

.sr-only {
  position: absolute;
  height: 1px;
  width: 1px;
  overflow: hidden;
  clip: rect(1px, 1px, 1px, 1px);
  clip: rect(1px, 1px, 1px, 1px);
}

.select-select {
  display: inline-block;
}

.quantity-select {
  width: 52px;
}

.select-text {
  display: none;
}

.unit-price-area {
  display: inline-block;
  width: 70px;
  margin-left: 4px;
  padding-top: 3px;
  vertical-align: top;
  line-height: 18px;
  text-align: right;
}

.delete-option {
  position: relative;
  display: inline-block;
  width: 18px;
  height: 18px;
  margin-top: 3px;
  background:
    url(//img1a.coupangcdn.com/image/cart/generalCart/cart_sprite_170201.png)
    -114px 0 no-repeat;
  vertical-align: top;
  z-index: 120;
}

user agent stylesheet
option {
  font-weight: normal;
  display: block;
  white-space: nowrap;
  min-height: 1.2em;
  padding: 0px 2px 1px;
}

.cart-deal-item td:nth-child(4) {
  width: 88px;
}

.cart-deal-item .unit-total-price {
  position: relative;
  line-height: normal;
  border-left: 1px solid #ddd;
  font-size: 12px;
  color: #888;
}

.cart-deal-item td {
    padding: 10px 0;
    z-index: 1;
}

.cartTable td {
    border-bottom: 1px solid #ddd;
    line-height: 35px;
    text-align: center;
}

.cart-deal-item td {
    padding: 10px 0;
    z-index: 1;
}

.bundle-price-total td {
    position: relative;
    padding: 20px 35px 16px 0;
    background: #f7f7f7;
    font-size: 12px;
    line-height: 29px;
    text-align: right;
}
.sr-only {
    position: absolute;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px,1px,1px,1px);
}
.bundle-price-total .number {
    display: inline-block;
    font: normal 15px/15px tahoma;
    color: #111;
    vertical-align: 0;
}
.symbol-minus, .symbol-plus {
    display: inline-block;
    width: 18px;
    height: 18px;
    margin: 0 8px;
    vertical-align: -5px;
}
.symbol-plus {
    background: url(//img1a.coupangcdn.com/image/order/mathematics-symbol.png) no-repeat;
    background-position: 0 0;
}

.symbol-equal, .symbol-plus1 {
    display: inline-block;
    width: 18px;
    height: 18px;
}

.symbol-equal {
    margin: 0 8px;
    background: url(//img1a.coupangcdn.com/image/order/mathematics-symbol.png) no-repeat;
    vertical-align: -5px;
    background-position: -36px 0;
}

.bundle-price-total .total-order-price.number {
    font-weight: 700;
}

.order-table-foot {
    clear: both;
    position: relative;
    padding: 20px 0 35px;
}

.selected-delete {
    display: inline-block;
    margin-left: 10px;
    padding: 5px 6px;
    border: 1px solid #ccc;
    text-align: center;
    font-size: 12px;
    color: #111;
}

.cart-no-item {
    width: 896px;
    border-left: 0;
    border-right: 0;
    padding: 60px 0;
    color: #898989;
    text-align: center;
}

.cart-no-item .txt {
    font-weight: 700;
    font-size: 14px;
    color: #55575f;
}

.cart-no-item .login-area {
    margin-top: 13px;
    font-size: 12px;
    line-height: 23px;
    color: #777881;
}

.cart-no-item .login {
    display: inline-block;
    width: 80px;
    height: 23px;
    margin-left: 5px;
    background: url(//img1a.coupangcdn.com/image/static/product/cart/btn_cart_login.gif) no-repeat;
    vertical-align: -7px;
}
.order-buttons, .summary-area {
    margin-top: 30px;
    text-align: center;
    position: relative;
}
.goPayment, .goShopping {
    font-size: 22px;
    font-weight: 700;
    display: inline-block;
    position: relative;
    width: 216px;
    line-height: 18px;
    border: 2px solid #0073e9;
    border-radius: 4px;
    padding: 22px 0 19px;
    text-align: center;
}
.goShopping {
    background: #fff;
    color: #0073e9;
    margin-right: 5px;
}
.goPayment {
    background: #0073e9;
    color: #fff;
}
.order-buttons .item-disabled, .summary-area .item-disabled {
    position: absolute;
    display: none;
    height: 100%;
    width: 220px;
    top: 0;
    left: 50%;
    opacity: .3;
    background: #fff;
    margin-left: 5px;
}
</style>

<body>
  <h1>
    <a href="Coupang"><img src="../resources/image/main.png"></a>
  </h1>

  <div>
    <h2>장바구니</h2>
    <table class="cartTable">
      <colgroup>
        <col width="50">
        <col width="80">
        <col width="*">
        <col width="90">
        <col width="90">
      </colgroup>
      <thead>
        <c:if test="${not empty list}">
          <tr>
            <th scope="col" class="all-select-event">
              <label>
                <input type="checkbox" class="all-deal-select" checked="checked">
                <span>&nbsp;&nbsp;전체선택</span>
              </label>
            </th>
            <th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>
            <th scope="col" id="th-unit-total-price">상품금액</th>
            <th scope="col" id="th-delivery-fee">배송비</th>
          </tr>
        </c:if>
      </thead>


      <tbody>
        <tr>
          <td colspan="5" class="cart_bundle-title">
            <hr> <!-- thead 스타일 작업후 지우기 -->
            <h2 class="title bundle">판매 상품</h2>
          </td>
        </tr>

        <c:if test = "${empty NotLogin && empty list}">
	      <tr>
            <td colspan="5" class="cart-bundle-title">장바구니에 담은 상품이 없습니다.</td>
          <tr>
        </c:if>

        <c:forEach var="vo" items="${list}">
          <tr class="cart-deal-item count0 cart-sc-items last-cart-sc-items">

            <td class="product-select-event">
              <input type="checkbox" class="dealSelectChk" checked="checked" name="SelectChk">
              <input type="hidden" class="cartNo" value="${vo.cartNo}">
            </td>

            <td>
              <a href="detail?productNo=${vo.productNo}&categoryCode=${vo.category}" class="moveProduct">
                <img src="${vo.cartImage }" width="100" height="100" class="product-img img">
                <input type="hidden" value="${vo.cartImage }" class="ImgVal">
              </a>
            </td>

            <td class="product-box">
              <input type="hidden" class="customerID" value="${vo.customerId}">
              <div class="product-name-part">
                <a href="detail?productNo=${vo.productNo}&categoryCode=${vo.category}">${vo.cartName }</a>
              </div>
              <div class="option-item modify-float">
                <div class="option-item-info">
                  <div class="option-name">
                    <span class="option-item-name" style="display: none;">${vo.cartName }</span>
                  </div>
                  <div class="delivery-date partner modify-padding" style="visibility: visible;">
                    <span class="arrive-date" style="display: inline-block;">
                      <span class="arrive-date-txt"></span>
                      <span class="arrive-date-day"></span>
                      <span class="arrive-date-date"></span>
                      도착 예정
                    </span>
                  </div>
                  <div class="option-price part">
                    <span class="unit-cost">${vo.cartPrice }</span>원
                    <span class="select-select">
                    <select class="quantity-select" name="quantity-select">
                        <option value="1" <c:if test="${vo.cartAmount == 1}">selected</c:if>>1</option>
                        <option value="2" <c:if test="${vo.cartAmount == 2}">selected</c:if>>2</option>
                        <option value="3" <c:if test="${vo.cartAmount == 3}">selected</c:if>>3</option>
                        <option value="4" <c:if test="${vo.cartAmount == 4}">selected</c:if>>4</option>
                        <option value="5" <c:if test="${vo.cartAmount == 5}">selected</c:if>>5</option>
                        <option value="6" <c:if test="${vo.cartAmount == 6}">selected</c:if>>6</option>
                        <option value="7" <c:if test="${vo.cartAmount == 7}">selected</c:if>>7</option>
                        <option value="8" <c:if test="${vo.cartAmount == 8}">selected</c:if>>8</option>
                        <option value="9" <c:if test="${vo.cartAmount == 9}">selected</c:if>>9</option>
                        <option value="10" <c:if test="${vo.cartAmount == 10}">selected</c:if>>10</option>
                    </select>
                    </span>
                    <span class="unit-price-area">
                    <span class="unit-price">
                        <span class="sr-only">구매가격</span>
                        ${vo.cartTotalprice}원
                    </span>
                    </span><a href="cart" class="delete-option"></a>
                  </div>
                </div>
              </div>
            </td>

            <td class="unit-total-price" headers="th-unit-total-price">
              <div class="unit-total-sale-price">${vo.cartTotalprice}원</div>
            </td>

            <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">무료</td>

          </tr>
        </c:forEach>

        <tr class="bundle-price-total">
          <td colspan="5">
            <h3 class="sr-only">주문금액 정보</h3>
            상품 가격
            <span class="total-product-price number">0</span>원
            <span class="coupon-area">
              <span class="symbol symbol-plus">
                <span class="sr-only">더하기</span>
              </span>
              배송비
              <span class="delivery-charge number">0</span>원
              <span class="symbol symbol-equal">
                <span class="sr-only">결과는</span>
              </span>
              주문금액
              <span class="total-order-price number">0</span>원
            </span>
          </td>
        </tr>
      </tbody>
    </table>

    <c:if test="${not empty list}">
    <div class="order-table-foot">
      <span class="all-select-product">
        <a href="cart" class="selected-delete">전체 삭제</a>
      </span>
    </div>


    <div class="order-buttons">
      <!-- 메인페이지 -->
      <a id="continueShoopingBtn" class="goShopping logging" href="Coupang">계속 쇼핑하기</a>
      <!-- 구매하기 -->
      <a href="javascript:void(0)" class="goPayment narrow" id="btnPay">구매하기</a>
      <div class="item-disabled" style="display: none;"></div>
    </div>
    </c:if>
  </div>

  <c:if test = "${not empty NotLogin && empty list}">
  <div class="cart-no-item">
     <p class="txt">장구니에 담은 상품이 없습니다.</p>

     <p class="login-area">
        <span>로그인을 하시면, 장바구니에 보관된 상품을 확인하실 수 있습니다.</span>
        <a href="../member/login?rtnUrl=../main/cart" class="login"></a>
     </p>
  </div>
  </c:if>



<script type="text/javascript">
	$(document).ready(function(){
		// 날짜
		var date = new Date();
		var month = date.getMonth()+1;
		var day = date.getDate()+1;
		var week = new Array('(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)');
		var delweek = week[date.getDay() + 1];
		var deldate = month+"/"+day;

		$('.arrive-date-txt').html('내일'); // 내일
		$('.arrive-date-day').html(delweek); // (요일)
		$('.arrive-date-date').html(deldate); // 날짜

		function priceSet() {
			// 리스트 총가격 설정
			var totalPrice = 0;
			var total = $('.unit-total-sale-price').text().split('원');
	    	for (var i = 0; i < total.length - 1; i++) {
	    		console.log(parseInt(total[i]));
	    		totalPrice += parseInt(total[i]);
			}
	    	console.log(totalPrice);

	    	$('.total-product-price').html(totalPrice);
	    	$('.total-order-price').html(totalPrice);
		}

		// 페이지 로드시 가격표시
		priceSet();

		// 전체선택 체크박스
		$('.all-deal-select').click(function(){
			if($('.all-deal-select').is(":checked")){ // 전체 선택시
				$('.dealSelectChk').prop('checked', true);
				priceSet();
			}else{ // 전체 헤제시
				$('.dealSelectChk').prop('checked', false);

				var totalPrice = 0;
				$('.total-product-price').html(totalPrice);
		    	$('.total-order-price').html(totalPrice);
			}
		}); // end all-deal-select


		// 개별 체크박스
		$('.dealSelectChk').click(function(){
  			// 개별 체크박스 헤제시 전체선택 체크박스도 해제
			if($('dealSelectChk').is(":checked")){
				$('.all-deal-select').prop('checked', true);
			} else {
				$('.all-deal-select').prop('checked', false);
			}

			var check_length = $('input:checkbox[name=SelectChk]').length;
			console.log(check_length);
			if($('input[name="SelectChk"]:checked').length == check_length){
				$('.all-deal-select').prop('checked', true);
			} else {
				$('.all-deal-select').prop('checked', false);
			}

			var rowData = new Array();
			var checkbox = $('input:checkbox[name=SelectChk]:checked');
// 			var checkbox = $(this);

			var add = 0;

			checkbox.each(function(i) {
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();

				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());

				var total = td.eq(3).find('.unit-total-sale-price').text().replace('원','');
				console.log(total);

				add += parseInt(total);
			}); // checkbox.each(function(i)

			console.log(add);
			$('.total-product-price').html(add);
	    	$('.total-order-price').html(add);
		}); // end dealSelectChk

		// select 태그 변경 -> 물품 수량 변경시 총가격 변경하기
        $(".quantity-select").change(function() {

        	var rowData = new Array();
//         	var select =$('select[name=quantity-select]');
        	var select =$(this);

        	select.each(function(i) {

				console.log(i+1 + "번 째 상품");

				var tr = select.parent().parent().parent().parent().parent().parent().eq(i);
				var td = tr.children();

				console.log("tr"); console.log(tr);
				console.log("td"); 	console.log(td);

				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());

				var amount = td.eq(2).find("select").val();
				var price = td.eq(2).find('.unit-cost').text();
				var totalPrice = amount * price;

				console.log("amount : " + amount);
				console.log("price : " + price);
				console.log(totalPrice);

				td.eq(2).find('.unit-price').html(totalPrice+"원");
				td.eq(3).find('.unit-total-sale-price').html(totalPrice+"원");

				var name = td.eq(2).find('.product-name-part').text().trim();
				console.log(name);

				var id = td.eq(2).find('.customerID').val();
				console.log(id);

				var obj = {
						'name' : name,
						'id' : id,
						'amount' : amount,
						'totalPrice' : totalPrice
				}

				$.ajax({
					type : 'post',
					url : 'cart_update',
					data : obj
				}); // end ajax
				location.reload(true);
         	}); // end select
       }); // end quantity-select

	   // x 클릭시(a태그) 발생하는 이벤트
       $('.delete-option').click(function(){

    	   	var rowData = new Array();
       	   	var delete_tag = $(this);

       	 	delete_tag.each(function(i) {

			console.log(i+1 + "번 째 상품");

			var tr = delete_tag.parent().parent().parent().parent().parent().eq(i);
			var td = tr.children();

			console.log("tr"); console.log(tr);
			console.log("td"); 	console.log(td);

			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());

			var customerId = td.eq(2).find('.customerID').val();
			console.log(customerId);

			var name = td.eq(2).find('.product-name-part').text().trim();
			console.log(name);

			var obj = {
					'customerId' : customerId,
					'name' : name
			}

			$.ajax({
				type : 'post',
				url : 'cart_delete',
				data : obj
			}); // end ajax
       	 }); // end delete_tag
       }); // end delete-option

       // 전체삭제 버튼 클릭 이벤트
       $('.selected-delete').click(function(){
			var customerId = $('.customerID').val();
			console.log(customerId);

			$.ajax({
				type : 'post',
				url : 'cart_delete_all',
				data : {
					'customerId' : customerId
				}
			}); // end ajax
      }); //  selected-delete

      // 구매 버튼 클릭 이벤트
      $('#btnPay').click(function(){

        // 체크된 버튼의 id 값을 가져옴
  		var rowData = new Array();
  		var ArrayNo = new Array();
  		var checkbox = $('input:checkbox[name=SelectChk]:checked');

    	var buyURL = "buy?";

  		checkbox.each(function(i) {
  			// checkbox.parent() : checkbox의 부모는 <td>이다.
  			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
  			var tr = checkbox.parent().parent().eq(i);
  			var td = tr.children();

  			// 체크된 row의 모든 값을 배열에 담는다.
  			rowData.push(tr.text());

			var No = td.eq(0).find('.cartNo').val();
			console.log(No);

			ArrayNo.push(No);
			buyURL += ('ArrayNo=' + ArrayNo[i] + '&');
  		}); // checkbox.each(function(i)
  		console.log(ArrayNo);

  		if(ArrayNo[0] == null){
  			alert("1개 이상의 상품을 선택해주세요.");
  		} else {
  			$('#btnPay').prop('href', buyURL.slice(0,-1));
  		}

//  	 	// 날짜
//  	 	var datetxt = td.eq(2).find('.arrive-date-txt').text().trim();
//  	 	var dateday = td.eq(2).find('.arrive-date-day').text().trim();
//  	 	var datedate = td.eq(2).find('.arrive-date-date').text().trim();
//  	 	var deldate = datetxt + dateday +" "+ datedate;
//  	 	var buydate = dateday +" "+ datedate;

      }); // end btnPay(구매버튼 클릭)
	}); // end of document


</script>
</body>
</html>
