<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>QnA</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
            body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
	}
    table { text-align: center;}

    #category, #create_dt, #status{width: 120px;}

    #write{float: left;}

    .clearfix{width: 1060px; height: 33px; padding-top:5px; padding-bottom: 70px;}
    .hint-text,.write-Btn{width: 33%;}
    #writeBtn{	text-decoration:none;
    			border:1px solid #e4e4e4;
    			float:right; font-size:13px; 
    			color:#ff7600; border-radius:2px;
    			background-color:#fff; padding:6px 14px;}
    #writeBtn:hover{border:1px solid #ff7600; background-color:#fff6ed;}			
    .page{width: 34%; float: left;}

	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-wrapper .btn {
		float: right;
		color: #333;
    	background-color: #fff;
		border-radius: 3px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-wrapper .btn:hover {
        color: #333;
		background: #f2f2f2;
	}
	.table-wrapper .btn.btn-primary {
		color: #fff;
		background: #03A9F4;
	}
	.table-wrapper .btn.btn-primary:hover {
		background: #03a3e7;
	}
	.table-title .btn {		
		font-size: 13px;
		border: none;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
	.table-title {
		color: #fff;
		background: #ff9d38;		
		padding: 16px 25px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.show-entries select.form-control {        
        width: 60px;
		margin: 0 5px;
	}
	.table-filter .filter-group {
        float: right;
		margin-left: 15px;
    }
	.table-filter input, .table-filter select {
		height: 34px;
		border-radius: 3px;
		border-color: #ddd;
        box-shadow: none;
	}
	.table-filter {
		padding: 5px 0 15px;
		border-bottom: 1px solid #e9e9e9;
		margin-bottom: 5px;
	}
	.table-filter .btn {
		height: 34px;
	}
	.table-filter label {
		font-weight: normal;
		margin-left: 10px;
	}
	.table-filter select, .table-filter input {
		display: inline-block;
		margin-left: 5px;
	}
	.table-filter input {
		width: 200px;
		display: inline-block;
	}
	.filter-group select.form-control {
		width: 110px;
	}
	.filter-icon {
		float: right;
		margin-top: 7px;
	}
	.filter-icon i {
		font-size: 18px;
		opacity: 0.7;
	}	
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 70px;
	}
	table.table tr th:last-child {
		width: 80px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.view {        
		width: 30px;
		height: 30px;
		color: #2196F3;
		border: 2px solid;
		border-radius: 30px;
		text-align: center;
    }
    table.table td a.view i {
        font-size: 22px;
		margin: 2px 0 0 1px;
    }   
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
	.status {
		font-size: 30px;
		margin: 2px 2px 0 0;
		display: inline-block;
		vertical-align: middle;
		line-height: 10px;
	}
    .text-success {
        color: #10c469;
    }
    .text-wait {
        color: #ff5b5b;
    }
    .pagination {
        float: center;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        font-size: 13px;
    }

    .write-Btn{float: right;}
    
    #col-sm-4>hr{background-color:white;}
    
    img{width:23px; height:23px;}

        </style>
        <script>
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
            </script>
       
    </head>
    <body>
    <jsp:include page="../common/header.jsp"/>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2><b>고객센터</b><hr></h2>                            
                            <h5>궁금한 내용을 남겨주세요. 자세히 답변 드립니다.</h5>
                        </div>

                    </div>
                </div>
                <div class="table-filter">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="show-entries">
                                <span>목록</span>
                                <select class="form-control">
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                </select>
                                <span>개씩 보기</span>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                            <div class="filter-group">
                                <input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
                            </div>
                            <div class="filter-group">
                                <select class="form-control">
                                    <option>제목</option>
                                    <option>내용</option>							
                                </select>
                            </div>
                            <div class="filter-group">
                                <select class="form-control">
                                    <option>분류</option>
                                    <option>사이트 이용법</option>
                                    <option>기타</option>
                                </select>
                            </div>
                            <span class="filter-icon"><i  class="fa fa-filter"></i></span>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover" id="list-table">
                    <thead>
                        <tr>
                            <th id="boardNo">글번호</th>
                            <th id="category">분류</th>
                            <th id="title">제목</th>
                            <th id="writer">작성자</th>						
                            <th id="create_dt">작성일</th>						
                            <th id="status">답변/미답변</th>
                            <th></th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                  <c:when test="${empty helpList}">
                     <tr>
                        <td colspan="7">존재하는 게시글이 없습니다.</td>
                     </tr>
                  </c:when>                   
                  <c:otherwise>
                     <c:forEach var="help" items="${helpList}">
                        <!-- helpList에 있는 요소를 반복접근 하여 help라는 변수에 저장하여 내부에서 사용 -->
                        <tr>
                           <td>${help.helpNo}</td>
                           <td>${help.helpCategory}</td>
                           
                           <td>
                           		<c:if test="${help.lockStatus == 'Y'}">
		                        	<img src="${contextPath}/resources/images/lock2.png">
		                  		</c:if>  
                           			${help.helpTitle}
                           			<!--<input type="text" value="${help.lockStatus}" id="lock_YN" name="lock_YN">
                           			
                           			<c:choose>
	                           			<c:when test="${help.helpWriter == loginMember.memberNick}">
	                           			<input type="text" value="Y" id="writer_YN" name="lock_YN">
			                  			</c:when> 
	                           			<c:when test="${help.helpWriter != loginMember.memberNick}">
	                           			<input type="text" value="N" id="writer_YN" name="lock_YN">
			                  			</c:when> 
		                  			</c:choose>-->
                           			
                           </td>
                           <td>${help.helpWriter}</td>                           
                           <td>    
                              <jsp:useBean id="now" class="java.util.Date"/>
                              <%-- Date now = new Date(); (현재시간) --%>
                                 
                              <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                              <fmt:formatDate var="createDate" value="${help.helpCreateDate}" pattern="yyyy-MM-dd"/>
                              <fmt:formatDate var="createTime" value="${help.helpCreateDate}" pattern="hh:mm:ss"/>
                              <c:choose>   
                                 <c:when test="${today == createDate}">
                                    ${createTime}
                                 </c:when>
                                 <c:otherwise>
                                    ${createDate}
                                 </c:otherwise>
                              </c:choose>
                           </td>
                           <td><span class="status text-wait">&bull;</span> 미답변</td>
                           <td><a class="view" title="자세히" data-toggle="tooltip"><i style="cursor : pointer;" class="material-icons">&#xE5C8;</i></a></td>
                        </tr>
                     </c:forEach>
                  </c:otherwise>
                   </c:choose>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>10</b> out of <b>${hInfo.allCount}</b> entries</div>
                    
                    
                    <c:set var="url" value="${searchParameter}?cp="/>
         			<c:set var="listUrl" value="../list/${url}${hInfo.currentPage}" scope="session"/>
                    <div class="page">
                        <ul class="pagination">
                        	<c:if test="${hInfo.currentPage > hInfo.pagingBarSize }">         
			                   <li class="page-item">			                   
			                      <!-- fmt 태그를 이용한 소수점 제거 -->
			                      <c:set var="prev" value="${hInfo.currentPage-1}"/>	                      
			                         <%--<a class="page-link text-primary" href="${pInfo.boardType}?cp=${prev}">&lt;</a> --%>
			                         <a href="${url}${prev}">Previous</a>
			                   </li>
			                   <li><a href="${url}1">1</a></li>
			                   <li><a>...</a><li>
                            </c:if>                       
                            
                            <c:forEach var="p" begin="${hInfo.startPage }" end="${hInfo.endPage }">
								
								<c:choose>
			                   
								<c:when test="${p == hInfo.currentPage}">
			                         <li class="page-item active" ><a>${p}</a></li>
			                    </c:when>
								<c:otherwise>
			                         <li class="page-item ">
			                            <%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${p}">${p}</a>--%>
			                            <a href="${url}${p}">${p}</a>
			                         </li>
								</c:otherwise>
								</c:choose>            
			                </c:forEach>
                            
                            
                            
                           <c:if test="${hInfo.maxPage > hInfo.endPage}">
                           <li><a>...</a><li>
						   <li><a href="${url}${hInfo.maxPage}">${hInfo.maxPage}</a></li> 
                            <li class="page-item">
		                   		<c:set var="next" value="${hInfo.currentPage+1 }"/>
		                  		<%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${next}">&gt;</a>--%>
		                  		<a class="page-link" href="${url}${next}">Next</a>
		                   </li>
		                   </c:if>
                        </ul>
                    </div>
                    <c:if test="${!empty loginMember}">
                    <div class="write-Btn"><a id="writeBtn" type="button" href="${contextPath}/help/helpwrite">글쓰기</a></div>
                	</c:if>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
        
        <script>
        
        	//detail view 가기
        	$(function(){
        		$(".view").on("click",function(){
        			

        			var boardNo = $(this).parent().parent().children().eq(0).text();
        			var boardUrl = "${contextPath}/help/no=" + boardNo + "?cp=${hInfo.currentPage}";
        			
        			location.href = boardUrl;
        			
        			
        		});
        		
        		
        	});
        	
        
        
        </script>
        
    </body>
</html>