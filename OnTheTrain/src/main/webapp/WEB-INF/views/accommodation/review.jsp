<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 리뷰 작성</title>
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
     <link href="${ path }/css/accommodation/accommodationReservation.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="${ path }/css/accommodation/review.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	  <h5>후기 작성</h5>
	  <hr class="line">
	  <form action="${path}/accommodation/review" method="post">
	    <!-- 숙소 정보 -->
	    <div class="accommodation-info">
	      <h6><c:out value="${accommodation.name}"/></h6>
	    </div>
	
	    <!-- 숙소 번호 입력(hidden) -->
	    <input type="hidden" name="accommodationNo" value="${accommodation.no}">
	
	    <!-- 작성자 정보 입력 -->
	    <div class="writer-input">
	      <label for="writer"></label>
	      <input name="memberNo" type="hidden" value="${loginMember.no}"/>
	      <c:if test="${not empty loginMember}">
	        <input type="hidden" name="writer" id="writer" value="<c:out value='${loginMember.nickname}'/>">
	      </c:if>
	      ${loginMember.nickname}
	    </div>
	    <div><fmt:formatDate type="date" value="${reviews.createDate}"/></div>
	
	    <!-- 평점 입력 -->
	    <div>
	      <!-- star-rating을 Vue.js로 바인딩 -->
	      <div class="star-rating">
	        <input type="radio" id="5-stars" name="starPoint" value="5">
	        <label for="5-stars" class="star pr-4">★</label>
	        <input type="radio" id="4-stars" name="starPoint" value="4">
	        <label for="4-stars" class="star">★</label>
	        <input type="radio" id="3-stars" name="starPoint" value="3">
	        <label for="3-stars" class="star">★</label>
	        <input type="radio" id="2-stars" name="starPoint" value="2">
	        <label for="2-stars" class="star">★</label>
	        <input type="radio" id="1-star" name="starPoint" value="1">
	        <label for="1-star" class="star">★</label>
	      </div>
	
	      <!-- 리뷰 내용 입력 -->
	      <div class="form-group col-12">
	        <textarea id="content" name="content" style="width:300px; height:200px; resize: none;" maxlength="150" placeholder="리뷰를 입력하세요." required v-model="content"></textarea>
	        <div class="textLengthWrap">
	          <span class="textCount">${ content.length }자</span>
	          <span class="textTotal">/150자</span>
	        </div>
	      </div>
	      <button id="apply-Button" class="apply-button" type="submitReview">리뷰작성</button>
	      <button class="cancel-button" type="reset">초기화</button>
	    </div>
	  </form>
	</div>
		
	<script>

    $(document).ready(function() {
        $('#content').on('input', function() {
            let content = $(this).val();

            // 글자수 세기
            if (content.length == 0 || content == '') {
                $('.textCount').text('0자');
            } else {
                $('.textCount').text(content.length + '자');
            }

            // 글자수 제한
            if (content.length > 150) {
                // 200자 부터는 타이핑 되지 않도록
                $(this).val($(this).val().substring(0, 150));
                // 200자 넘으면 알림창 뜨도록
                alert('글자수는 150자까지 입력 가능합니다.');
            };
        });
    });
    
    /* $("#apply-Button").on('click',function() => {
    	alert('ddd');
    }); */
    
    /* function submitReviewAndClosePopup() {
        // 여기에 리뷰 제출 처리 코드 작성
        // ...

        // 팝업창 닫기
        window.close();
        // 부모창 새로고침
        opener.location.reload();
      } */
    
	</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
