<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
div[class$="-management"] {
  background-color: #b0b0b0; /* 진한 회색 */
  padding: 10px;
}
dl{ background-color: #e0e0e0; padding : 10px; }
.menu-title { cursor: pointer;}
</style>
<script type="text/javascript">  
$(function(){

	    $(".toggle-menu .menu-title").click(function() {
	      $(this).siblings(".submenu").slideToggle();
	    });
	
});//read

</script>
</head>
<body>
<div>
	<div class="header" style="display: flex; justify-content: space-between; align-items: center; padding: 10px;">
		<div class="logo-container" style="display: flex; align-items: center;">
		<img src="http://localhost/jsp_prj/test/images/logo.png"  style="width: 250px; height: auto; margin-right: 10px;" />
		<h2>관리자 페이지</h2>
		</div>
		<div class="button-container" style="display: flex; gap: 10px; align-items: center;">
		<img src="http://localhost/jsp_prj/test/images/mainlink_img.png" alt="메인페이지로 이동" style="width: 50px; height: auto;"/>
		<img src="http://localhost/jsp_prj/test/images/logoutlink_img.png" alt="로그아웃" style="width: 50px; height: auto;"/>
		<hr>
		</div>
		
	</div>
	<div class="sidebar" style="width: 250px; border: 1px solid #ccc;">
		<div class="admin-info" style="background-color: black; color: white; padding: 10px;">
		<span>담당 관리자</span><br>
		<span>관리자 이름</span>
		</div>
		<div class="page -management" >
		<div class="member-management toggle-menu"> 
		<img src=""/><span class="menu-title">회원관리</span>
		<dl class="submenu">
    	<dd>회원목록</dd>
  		</dl>
		</div>
		<div class="admin-management toggle-menu"> 
		<img src=""/><span class="menu-title">관리자 관리</span>
		<dl class="submenu" style="display: none;">
    	<dd>관리자목록</dd>
  		</dl>
		</div>
		<div class="theater-management toggle-menu"> 
		<img src=""/><span class="menu-title">상영관 관리</span>
		<dl class="submenu" style="display: none;">
    	<dd>상영관 목록</dd>
    	<dd>상영관 등록</dd>
    	</dl>
		</div>
		<div class="movie-management toggle-menu"> 
		<img src=""/><span class="menu-title">영화관리</span>
		<dl class="submenu" style="display: none;">
    	<dd>영화 리스트</dd>
    	<dd>영화 등록</dd>
    	<dd>영화 리뷰 관리</dd>
    	</dl>
		</div>
		<div class="screenStatus-management toggle-menu"> 
		<img src=""/><span class="menu-title">상영영화 관리</span>
		<dl class="submenu" style="display: none;">
    	<dd>상영스케줄 목록</dd>
    	<dd>상영 등록</dd>
		</dl>
		</div>
		<div class="inquiry-management toggle-menu"> 
		<img src=""/><span class="menu-title">문의관리</span>
		<dl class="submenu" style="display: none;">
    	<dd>공지/뉴스</dd>
    	<dd>1:1문의</dd>
    	</dl>
		</div>
		</div>
	</div>
	
	<div class="main">
	</div>

</div>
</body>
</html>
