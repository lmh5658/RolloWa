<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.2 직원검색</title>

	<!-- animate -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

	<!-- bootstrap -->
	<link href="${contextPath}/resources/css/common/bootstrap.min.css" rel="stylesheet">
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/12ec987af7.js" crossorigin="anonymous"></script>
	
	<!-- Google Fonts Roboto -->
	<link rel="stylesheet"
	    href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
	
	<!-- Google Fonts Jua -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	
	<!-- css -->
	<link href="${contextPath}/resources/css/common/sidebars.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common/mdb.min.css" />
  
	<style>
	.main_content{
	    width: 1200px !important;
	    padding: 20px;
	}
	
	.search_menu{
	    justify-content: center;
	    width: 100%;
	}
	.tr_search th{
	    background-color: rgb(203, 237, 255) !important;
	    text-align: center;
	    width: 20%;
	    vertical-align: middle !important;
	    font-size: 30px;
	}
	.tr_search td{
	    width: 200px;
	    text-align: center;
	}
	.tr_search input {
	    width: 100% !important;
	}
	.btn_center{
	    text-align: center;
	    padding-top: 30px !important;
	}
	.btn_center button {
	    width: 140px;
	    height: 50px;
	    font-size: 20px;
	}
	.employee_count {
	    margin-left: 10px;
	}
	.table_empinfo {
	    text-align: center;
	}
	.table_empinfo th{
	    background-color: rgb(255,247,208) !important;
	    font-size: 19px;
	}
	.table_empinfo td{
	    vertical-align: middle !important;
	}
	.table_empinfo td img{
	    border: 1px solid gainsboro;
	    border-radius: 100%;
	    width: 50px;
	    height: 50px;
		object-fit: cover; /* 다른 사이즈 이미지도 안잘리고 동일하게 조절하기 */
	    margin: -10px;
 	}
 	.profile_img:hover {
	    top: 50% !important;
	    left: 50% !important;
		transform: scale(4);
    	transition: transform 0.5s;
    	border-radius: 0;
    	object-fit: contain;
    	width: 100px;
    	height: auto;
	}
 	
	</style>
</head>
<body>

	<!-- 사이드바 영역 -->
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	
	<!-- 메인 영역 -->
	<div class="main_content">
	    <h2>직원 검색</h2>
	    <hr>
	    
	    <!-- ------------ -->
	    <form id="search_Form" action="검색_처리_페이지_주소_입력" method="GET">
	        <table class="table table_search">
	
	            <tr class="tr_search">
	                <!-- 검색 메뉴 1 : 부서명-->
	                <th>부서명</th>
	                <td>
	                    <select id="department" name="department" class="form-control">
	                        <option value="전체 부서">전체 부서</option>
	                        <option value="부서 1">부서 1</option>
	                        <option value="부서 2">부서 2</option>
	                        <option value="부서 3">부서 3</option>
	                    </select>
	                </td>
	                <!-- 검색 메뉴 2 : 전화번호 -->
	                <th>전화번호</th>
	                <td>
	                    <input type="text" id="phone" name="phone" class="form-control" placeholder="전화번호를 입력하세요.(숫자만 입력)">
	                </td>
	            </tr>
	            <tr class="tr_search">
	                <!-- 검색 메뉴 3 : 팀명 -->
	                <th>팀명</th>
	                <td>
	                    <select name="team" id="team" class="form-control">
	                        <option value="전체 팀">전체 팀</option>
	                        <option value="1팀">1팀</option>
	                        <option value="2팀">2팀</option>
	                        <option value="3팀">3팀</option>
	                    </select>
	                </td>
	                <!-- 검색 메뉴 4 : 이름 -->
	                <th>이름</th>
	                <td>
	                    <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요.">
	                </td>
	            </tr>
	            <tr>
	                <td class="btn_center" colspan="4">
	                    <h2>
	                        <button class="btn btn-outline-primary" type="reset">초기화</button>
	                        <button class="btn btn-primary">검색</button>
	                    </h2>
	                </td>
	            </tr>
	        </table>
	    </form>
	
	    <script>
	        /* 전화번호 : 숫자만 입력되고 나머지 글자는 공백으로 변환 */
	        $("#search_Form input[name=phone]").on("keyup", function(){
	            let regExp = $(this).val().replace(/[^\d]+/g, '');
	            $(this).val(regExp);
	        })
	
	        /* 이름 : 한글만 입력되고 나머지 글자는 공백으로 변환 */
	        $("#search_Form input[name=name]").on("keyup", function(){
	            let regExp = $(this).val().replace(/[^가-힣ㄱ-ㅎ]+/g, '');
	            $(this).val(regExp);
	        })
	    </script>
	
	
	    <!-- 전체 인원수 -->
	    <h5 class="employee_count">전체 50명</h5>
	
	    <!-- 직원 정보 테이블 start-->
	    <table class="table table_empinfo line-shadow">
	        <tr>
	            <th>프로필 사진</th>
	            <th>성명</th>
	            <th>부서</th>
	            <th>팀명</th>
	            <th>직급</th>
	            <th>전화번호</th>
	            <th>이메일</th>
	        </tr>
	        
	        <!-- 이름, 부서, 팀명, 직급, 전화, 이메일 -->
	        <c:choose>
		        <c:when test="${ not empty list }">
		        	<c:forEach var="m" items="${ list }">
				        <tr>

				            <td>
					            <c:choose>
					            	<c:when test="${ not empty m.profileUrl }">
						                <img src="${ m.profileUrl }" class="profile_img">
					            	</c:when>
					            	<c:otherwise>
						                <img src="${contextPath}/resources/images/defaultProfile.png">
					            	</c:otherwise>
					            </c:choose>
				            </td>
				            <td>${ m.userName }</td>
				            <td>${ m.dept }</td>
				            <td>${ m.team }</td>
				            <td>${ m.posi }</td>
				            <td>${ m.phone }</td>
				            <td>${ m.email }</td>
				        </tr>
			        </c:forEach>
		        </c:when>
	        </c:choose>
	        
	    </table>
	    <!-- 직원 테이블 end -->
	
	    <!--페이징 처리 start-->
	    <div class="container">
	        <ul class="pagination justify-content-center">
	        	<li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }"><a class="page-link" href="${ contextPath }/orginfo/empSearch.do?page=${pi.currentPage-1}">Previous</a></li>
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<li class="page-item ${ pi.currentPage == p ? 'disabled' : '' }"><a class="page-link" href="${ contextPath }/orginfo/empSearch.do?page=${p}">${ p }</a></li>
				</c:forEach>
				<li class="page-item ${ pi.currentPage == pi.maxPage ? 'disabled' : '' }"><a class="page-link" href="${ contextPath }/orginfo/empSearch.do?page=${pi.currentPage+1}">Next</a></li> 
	        </ul>
	    </div>
	    <!--페이징 처리 end-->
	    
	    
		<!-- 삭제예정
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">6</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">7</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">8</a></li>
	            <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
        -->
		<!-- ------------ -->
		
	</div>
	<!-- 메인 영역 end-->
		
</body>
</html>

	