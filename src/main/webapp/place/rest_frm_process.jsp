<%@page import="kr.co.sist.place.PlaceService"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="java.util.Random"%>
<%@page import="kr.co.sist.member.login.loginResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../common/jsp/login_chk.jsp" %> 
 
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rDTO" class="kr.co.sist.place.RestDTO" scope="page"/><!--request.getparam보단 usebean을 많이씀  -->
<jsp:setProperty name="rDTO" property="*" />
<%
//useBean으로 입력되는 parameter는 subject, content만 존재 
rDTO.setId( ((loginResultDTO)session.getAttribute("userData")).getId() );
rDTO.setIp(request.getRemoteAddr());
/* ip변조 방지를 위해 인설트하는 시점의 아이피를 얻는다  */

PlaceService bs=new PlaceService();
pageContext.setAttribute("writeFlag", bs.writeRestaurant(rDTO));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<script type="text/javascript">  
<c:choose>
	<c:when test="${ writeFlag }">
	alert("맛집이 등록되었습니다.");
	location.href="${url}/place/restaurant_list.jsp";
	</c:when>
	<c:otherwise>
	alert("맛집 등록이 실패하였습니다.");
	history.back();	
	</c:otherwise>
</c:choose>

</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${ url }/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">


</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="${ url }/common/jsp/footer.jsp"/>
</footer>

</body>
</html>