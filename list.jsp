<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

div {
    display: block;
}

ul {
  list-style-type: none;
}

li {
  display: inline-block;
}

/* 검색 리스트 css */
.list_ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.list_li {
  float: left;
  position: relative;
  width: 250px;
  height: 400px;
  margin-bottom: 10px;
  padding: 0 0x 0px 0px;
  font-size: 12px;
  color: #888;
  border-bottom: 1px solid #eee;
}


.img {
  width: 230px;
  height: 230px;
}

/* a태그 스타일 제거 */
a { text-decoration : none;} /* 하이퍼링크 밑줄 제거 */
a:link { color: black;} /* 클릭 X */
a:visited { color: black;} /* 클릭 O */
a:hover { color: black;} /* 마우스 오버 */
a:active { color: black;} /* 클릭 */


/* 페이징 css */
.paging {
  position: fixed;
  bottom: 0;
  width: 100%;
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body style="text-align: center;">
  <div>
    <h1>
      <a href="Coupang"><img src="../resources/image/main.png"></a>
    </h1>

    <select name="category" id="category">
      <option value="all">전체</option>
      <option value="fashion">패션</option>
      <option value="child">유아</option>
      <option value="food">식품</option>
      <option value="household">가정용품</option>
      <option value="digital">가전디지털</option>
      <option value="car">자동차</option>
      <option value="hobby">취미</option>
      <option value="pet">반려동물</option>
    </select>
    <input style="width: 300px" type="text" id="search" value="${productName}">
    <input type="button" class="btn_search" value="검색">
  </div>

  <hr>

  <div>
    <p>'${productName}'에 대한 ${count}개의 검색 결과</p>
  </div>


  <div class="search-sorting">
    <div id="searchSortingOrder">
      <ul class="sort_ul">
        <li class="sort_li">
          <input type="radio" name="sort" id="review_rating" value="review_rating" checked="checked">
          <label>높은 평점순</label>
        </li>
        <li class="sort_li">
          <input type="radio" name="sort" id="product_price asc" value="product_price asc"
          <c:if test = "${sort eq 'product_price asc'}">checked="checked"</c:if>
           />
          <label>낮은 가격순</label>
        </li>
        <li class="sort_li">
          <input type="radio" name="sort" id="product_price desc" value="product_price desc"
          <c:if test = "${sort eq 'product_price desc'}">checked="checked"</c:if>>
          <label>높은 가격순</label>
        </li>
        <li class="sort_li">
          <input type="radio" name="sort" id="sales_rate" value="sales_rate"
          <c:if test = "${sort eq 'sales_rate'}">checked="checked"</c:if>>
          <label>판매량순</label>
        </li>
      </ul>
    </div>
    <div>
      <ul class="listsize_ul">
        <li class="listsize_li">
          <input type="radio" name="pagesize" id="8" value="8" checked="checked">
          <label>8개씩 보기</label>
        </li>
        <li class="listsize_li">
          <input type="radio" name="pagesize" id="16" value="16"
          <c:if test = "${pagesize eq '16'}">checked="checked"</c:if>>
          <label>16개씩 보기</label>
        </li>
        <li class="listsize_li">
          <input type="radio" name="pagesize" id="24" value="24"
          <c:if test = "${pagesize eq '24'}">checked="checked"</c:if>>
          <label>24개씩 보기</label>
        </li>
        <li class="listsize_li">
          <input type="radio" name="pagesize" id="32" value="32"
          <c:if test = "${pagesize eq '32'}">checked="checked"</c:if>>
          <label>32개씩 보기</label>
        </li>
      </ul>
    </div>
  </div>

  <hr>
  <br>

  <ul class="list_ul">
    <c:forEach var="vo" items="${list}">
      <li class="list_li"><a href="../main/detail?productNo=${vo.productNo}&categoryCode=${vo.categoryCode}" target="_blank">
          <dl>
            <dt>
              <img class="img" src="${vo.productImage }">
            </dt>
            <dd>
              <p>${vo.productName }</p>
              <p>
                <strong>${vo.productPrice }원</strong>
              </p>
              <p class="deldate"></p>
              <span>
                 <c:choose>
                  <c:when test="${vo.reviewRating eq '0'}">
                    ☆☆☆☆☆
                  </c:when>
                  <c:when test="${vo.reviewRating eq '1'}">
                    ★☆☆☆☆
                  </c:when>
                  <c:when test="${vo.reviewRating eq '2'}">
                    ★★☆☆☆
                  </c:when>
                  <c:when test="${vo.reviewRating eq '3'}">
                    ★★★☆☆
                  </c:when>
                  <c:when test="${vo.reviewRating eq '4'}">
                    ★★★★☆
                  </c:when>
                  <c:when test="${vo.reviewRating eq '5'}">
                    ★★★★★
                  </c:when>
                </c:choose>
              </span>
              <span class="rating_count">
                <input type="hidden" class="rating_count">
              </span>
            </dd>
          </dl>
      </a></li>
    </c:forEach>
  </ul>

  <br>

  <div class="paging">
    <hr>
    <ul>
      <!-- 이전 버튼 -->
      <c:if test="${pageMaker.hasPrev}">
        <li><a href="list?page=${pageMaker.startPageNo - 1}&sort=${sort}&pagesize=${pagesize}">이전</a></li>
      </c:if>

      <c:forEach begin="${pageMaker.startPageNo}" end="${pageMaker.endPageNo}" var="num">
        <li><a href="list?page=${num}&sort=${sort}&pagesize=${pagesize}">${num}</a></li>
      </c:forEach>

      <!-- 다음 버튼 -->
      <c:if test="${pageMaker.hasNext}">
        <li><a href="list?page=${pageMaker.endPageNo + 1}&sort=${sort}&pagesize=${pagesize}">다음</a></li>
      </c:if>
    </ul>
  </div>

  <script type="text/javascript">
			$(document).ready(function() {
						// 배송 날짜
						var date = new Date();
						var month = date.getMonth()+1;
						var day = date.getDate()+1;
						var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
						var deldate = week[date.getDay() + 1] + "(내일) " + month + "월 " + day + "일" ;
						console.log(deldate);
						$('.deldate').html(deldate + '까지 도착');

						// 정렬
						$("input[name='sort']").change(function(){
							console.log("정렬변경");
							$("input:radio[id='"+$(this).attr('id')+"']").prop("checked", true);
							location.href=
								"list?page=" + ${pageMaker.criteria.page} + "&sort=" + $('input[name="sort"]:checked').val() + "&pagesize=" + $('input[name="pagesize"]:checked').val();
						}); // end sort

						// 페이징(페이지당 목록 개수)
						$("input[name='pagesize']").change(function(){
							$("input:radio[id='"+$(this).attr('id')+"']").prop("checked", true);
							location.href=
								"list?page=" + ${pageMaker.criteria.page} + "&sort=" + $('input[name="sort"]:checked').val() + "&pagesize=" + $('input[name="pagesize"]:checked').val();

						}); // end pagesize

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
					}); // end document
		</script>

</body>
</html>
