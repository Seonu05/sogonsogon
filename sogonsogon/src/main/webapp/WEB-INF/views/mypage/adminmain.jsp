<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
      .content{
      float:left;
      width:100%;
      height:100%;
      }
      
      .content2{
      float:left; 
      width:72%;
      height:100%;
      }
      
      .count{
      	display: inline-block;
      	border : 1px solid orange;
      	height:10$;
      	width:23%;
      	text-align: center;
      	font-size: 30px;
      	font-weight: bold;
      }
      
      .countDiv{
      	height:5%;
      	width:100%;
      }
      
      #count{
      	background-color: rgba(241, 158, 48,0.7);
      }
      
      .board{
      	border:solid 1px rgba(241, 158, 48,0.7);
      }
      
      div{
      	margin : 10px;
      }
      
      .mb-1{
      	padding : 10px;
      }
      
      .tableTitle{
      	display: inline-block;
      }
      
      .tableTitle>a{
        color:black;
      	text-decoration: none;  
      }
      .tableButton{
      	display:inline-block;
      	float : right;
      	margin:10px 5px;
      }
</style>
</head>
<body>   

  <jsp:include page="../common/header.jsp" />
  
  <div>
  <jsp:include page="adminpage.jsp" />
  </div>
  
  <div class="content">
  <jsp:include page="adminpage2.jsp"/>
	<div class="content2">       
   <div class="countDiv">
	  	<div class="count">
	   		<p align="center" id="count">신고글</p><p id="reportCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">고객센터</p><p id="qnaCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">스터디 방</p><p id="roomCount"></p>
	   	</div>
	   	<div class="count">
	   		<p align="center" id="count">가입 회원</p><p id="memberCount"></p>
	   	</div>
	  </div>
	   	
	   	<div id="report" class="board">
	   		<h4 class="mb-1 tableTitle"><a href="adminreport">신고 게시판</a></h4><button class="btn btn-outline-secondary btn-sm tableButton" onclick="location.href ='adminreport'">메뉴로 이동</button>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>						
                        <th>처리</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty reportList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 신고 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${reportList}">
	              		<tr>		
	              			<jsp:useBean id="now1" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now1}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today == createDate}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${board.qnaNo}</span>
		              		</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today == createDate}">${createTime}</c:when>
		              				<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td><button type="button" class="btn btn-danger btn-sm" onclick="location.href ='${contextPath}/mypage/updateReport/${board.writerNick}/${board.qnaNo}/0'">경고</button>          <button type="button" class="btn btn-dark btn-sm" onclick="location.href ='${contextPath}/mypage/restoreReport/${board.writerNick}/${board.qnaNo}'">X</button></td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	   	<div id="help" class="board">
	   		<h4 class="mb-1 tableTitle"><a href="adminhelp">고객센터</a></h4><button class="btn btn-outline-secondary btn-sm tableButton" onclick="location.href ='adminhelp'">메뉴로 이동</button>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th id="boardNo">글번호</th>
                        <th id="category">분류</th>
                        <th id="title">제목</th>
                        <th id="title">내용</th>
                        <th id="writer">작성자</th>						
                        <th id="create_dt">작성일</th>						
                        <th id="lockStatus">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty helpList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 게시글이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${helpList}">
	              		<tr>		
	              			<jsp:useBean id="now2" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today2" value="${now2}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate2" value="${board.helpCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime2" value="${board.helpCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today2 == createDate2}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${board.helpNo}
	              			<c:if test="${board.lockStatus=='Y'}">
	              				<img src="${contextPath}/resources/images/lock2.png" width="30px" height="30px">
	              			</c:if>
		              		</span>
		              		</td>
		              		<td>${board.helpCategory}</td>
		              		<td>${board.helpTitle}</td>
		              		<td>${board.helpContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${today2 == createDate2 }">${createTime2}</c:when>
		              				<c:otherwise>${createDate2}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>
		              			<c:choose>
		              				<c:when test="${board.answerChk=='N'}"><button type="button" class="btn btn-warning btn-sm" onclick="location.href='answerView/${board.helpNo}'">답변하기</button></c:when>
		              				<c:otherwise><button type="button" class="btn btn-secondary btn-sm">답변완료</button></c:otherwise>
		              			</c:choose>
		              		</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	   	<div id="notice" class="board">
	   		<h4 class="mb-1 tableTitle"><a href="adminnotice">공지 사항</a></h4><button class="btn btn-outline-warning btn-sm tableButton" onclick="location.href ='noticeWrite'">글쓰기</button>
       <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성자</th>						
                        <th>작성일</th>						
                        <th>게시글 상태</th>

                    </tr>
                </thead>
                <tbody>
                <c:choose>
          			<c:when test="${empty noticeList}">
		         		<tr>		
		         			<td colspan="7" align="center">존재하는 공지사항이 없습니다.</td>
		         		</tr>
          			</c:when>	
          			<c:otherwise>
          				<c:forEach var="board" items="${noticeList}">
	              		<tr>		
	              			<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	              			<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createDate" value="${board.qnaCreateDate}" pattern="yyyy-MM-dd"/>
	              			<fmt:formatDate var="createTime" value="${board.qnaCreateDate}" pattern="hh:mm:ss"/>
	              			<td>
		              			<c:if test="${today == createDate}">
	              			<span class="badge badge-primary new">new</span>
		              			</c:if>
		              		<span>${board.qnaNo}</span>
		              		</td>
		              		<td>${board.qnaCategory}</td>
		              		<td>${board.qnaTitle}</td>
		              		<td>${board.qnaContent}</td>
		              		<td>${board.writerNick}</td>
		              		<td>
		              			<c:choose>
			              			<c:when test="${today == createDate}">${createTime}</c:when>
			              			<c:otherwise>${createDate}</c:otherwise>
		              			</c:choose>
		              		</td>
		              		<td>${board.qnaStatus}</td>
	              		</tr>	
          				</c:forEach>
          			</c:otherwise>
          		</c:choose>
                </tbody>
            </table>
	   	</div>
	   	
	</div>
 </div>    
   <jsp:include page="../common/footer.jsp" />

<script>
$(function(){
	$.ajax({
		url : "${contextPath}/mypage/reportCount",
		success : function(count){
			if(count>10){
				$("#reportCount").text(" ▲▲  "+count);
				$("#reportCount").css("color","darkgreen");
			}else if(count>0){
				$("#reportCount").text(" ▲ "+count);
				$("#reportCount").css("color","green");
			}else{
				$("#reportCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});		
	
	$.ajax({
		url : "${contextPath}/mypage/qnaCount",
		success : function(count){
			if(count>10){
				$("#qnaCount").text(" ▲▲  "+count);
				$("#qnaCount").css("color","darkgreen");
			}else if(count>0){
				$("#qnaCount").text(" ▲ "+count);
				$("#qnaCount").css("color","green");
			}else{
				$("#qnaCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});			
	
	$.ajax({
		url : "${contextPath}/mypage/roomCount",
		success : function(count){
			if(count>10){
				$("#roomCount").text(" ▲▲  "+count);
				$("#roomCount").css("color","darkgreen");
			}else if(count>0){
				$("#roomCount").text(" ▲ "+count);
				$("#roomCount").css("color","green");
			}else{
				$("#roomCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});	
	
	$.ajax({
		url : "${contextPath}/mypage/memberCount",
		success : function(count){
			if(count>10){
				$("#memberCount").text(" ▲▲  "+count);
				$("#memberCount").css("color","darkgreen");
			}else if(count>0){
				$("#memberCount").text(" ▲ "+count);
				$("#memberCount").css("color","green");
			}else{
				$("#memberCount").text(" - "+count);
			}
		}, error : function(count){
			console.log("Ajax 통신 실패");
		} 
	});	
});

$(".new").parent().parent().css("background-color","bisque");

$("#report td:not(:last-child)").on("click",function(){
	if($(this).parent().children().children().eq(0).text()=="new"){
		var boardNo = $(this).parent().children().children().eq(1).text(); 				
	}else{
		var boardNo = $(this).parent().children().children().eq(0).text(); 	
	}
	location.href = "${contextPath}/mypage/reportView/"+boardNo;
}).on("mouseenter", function(){
	$(this).parent().css("cursor", "pointer");
});  

$("#help td:not(:last-child)").on("click",function(){

	if($(this).parent().children().children().eq(0).text()=="new"){
		var boardNo = $(this).parent().children().children().eq(1).text(); 				
	}else{
		var boardNo = $(this).parent().children().children().eq(0).text(); 	
	}
	location.href = "${contextPath}/mypage/helpView/"+boardNo;
}).on("mouseenter", function(){
	$(this).parent().css("cursor", "pointer");
});  


$("#notice td:not(:last-child)").on("click",function(){

	if($(this).parent().children().children().eq(0).text()=="new"){
		var boardNo = $(this).parent().children().children().eq(1).text(); 				
	}else{
		var boardNo = $(this).parent().children().children().eq(0).text(); 	
	}
	location.href = "${contextPath}/mypage/noticeView/"+boardNo;
}).on("mouseenter", function(){
	$(this).parent().css("cursor", "pointer");
});  
</script>
</body>
</html>