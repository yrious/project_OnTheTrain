<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>온더트레인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   	<link rel="stylesheet" href="${path}/bootstrap5/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${path}/css/admin/csNoticeWrite.css">
    <script src="${ path }/js/common/jquery-3.6.3.js"></script>
    
	<%@ include file="../common/header.jsp" %>
    
</head>
<body>
<section>
  <div class="seciton-container">
      <div class="content" id="heading-conatiner">
        <h4>고객센터</h4>
      </div>
      <div class="content boxContainer">
        <a href="${path}/cs/notice" id="box1">공지사항</a>
        <a href="${path}/cs/faq" id="box2">자주묻는 질문</a>
        <a href="${path}/cs/qna" id="box3">1:1:문의</a>
      </div>
      

      <div class="content" id="content-tablehead">
    
      </div>  
        
       	<form name="noticeForm" id="noticeForm" action="${ path }/cs/notice/write" method="POST" onsubmit="return Validation();" enctype="multipart/form-data">
      <div class="content" id="content-list">
       		 <table>
                    <tbody>
                       <tr id="tbline1">
                            <td class="tbhead">구분</td>
                            <td>
                            	<select name="type" id="type" class="selecttype" required>
	    							<option value="안내" selected>안내</option>
	    							<option value="이벤트">이벤트</option>
	    							<option value="기타">기타</option>
								</select>
							</td>
                      </tr>
                        <tr id="tbline2">
                            <td class="tbhead">제목</td>
                            <td>
								<input type="text" name="title" id="noticetitle" class="texttype1" maxlength="30" placeholder="최대 30자 이내" required>
                            </td>
                        </tr>
                        <tr id="tbline3">
                            <td class="tbhead">내용</td>
                            <td>
								 <textarea name="content" id="textareabox" maxlength="500" cols="140" rows="15" required></textarea>
							</td>
                        </tr>
                        <tr id="tbline4">
                            <td class="tbhead">상단고정</td>
                            <td>
								<input type="checkbox" id="fix" name="fix" value="1"> <label for="fix">공지로 등록 (3개까지 가능)</label>
							</td>
                        </tr>
                        <tr id="tbline4">
                            <td class="tbhead">첨부파일</td>
                            <td>
								<div class="filebox">
								    <label for="file"><span id=txt1>파일선택</span></label> 
								    <input class="upload-name" value="파일이름" placeholder="첨부파일" readonly>
								    <input type="file" id="file" name="file">
								</div>
							</td>
                        </tr>
                    </tbody>
                </table>
 			
      </div>
      
      <div class="content" id="content-btn">
        
    	<div id="btnarea">
	        <button type="submit" class="noticeBtn" id="okayBtn">작성완료</button>
	        <button class="noticeBtn" id="cancleBtn" onclick="cancel(); return false;">취소</button>
	        </div>
      	</div>  
		</form>
      
  </div>
</section>
    <script src="${path}/bootstrap5/assets/js/bootstrap.bundle.min.js"></script>
    <script>
        function cancel() {
  		  window.location.href = "${ path }/cs/notice";
  		}
        
        $("#file").on('change',function(){
        	  var fileName = $("#file").val().split('/').pop().split('\\').pop();
        	  $(".upload-name").val(fileName);
        	});

        
        function Validation(){
	        	const checkbox = document.querySelector('#fix');
	        	var isfixed = false;
	        	
	  	        if (!checkbox.checked) { 
	  	        	return true;
	  	        }else{
	        	  // 고정이 3개 인지 확인
					$.ajax({
						type: 'POST',
						url: '${path}/notice/fixCheck',
						// 개수가 1~2개이면 true, 3개이상이면 false
						success: (data) => {
							
							if(data){
								// 1~2개면 통과
								isfixed=true;
								console.log(isfixed);
								return true;
							} else {
								// 3개이상
								alert('상단고정 게시글 개수가 제한을 초과했습니다. 가장 오래된 고정 게시글이 해제됩니다.');
							}
							
						},
						error: (error)=> {
							alert(error);
						}
						
					});
	        	  
	  	        } 
	    }
	    
    </script>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>