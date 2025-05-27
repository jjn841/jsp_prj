<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import url="${ url }/common/jsp/external_file.jsp" />
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script type="text/javascript">  
$(function(){
	$("#txt").click(function() {
		$.ajax({
			url:"${ url }/day0515/ajax.txt",
			type: "get",
			
			dataType : "text", //들어가는값은 대소문자 안가림 속성은 가림
			error: function( xhr ){
				$("#output").html("에러코드 : "+ xhr.status+", 에러메세지 : "+ 
						xhr.statusText  );
			},//error
			success: function( textData ) {
			    $("#output").html("<strong>" + textData + "</strong>");
			}//success		
		});
	});//click
	
	$("#html").click(function() {
		$.ajax({
			url : "ajax.html",
			type: "get",
			
			dataType:"html",
			error: function( xhr ) {
				console.log(xhr.status+" / "+ xhr.statusText);
			},
			success:function( htmlData ){
				$("#output").html( htmlData );
				
			}			
			
		});
	});//click
	
	$("#xml").click(function() {
		$.ajax({
			url:"ajax.xml",
			type:"get",
			dataType:"text",
			error: function(xhr) {
				console.log( xhr.status);
			},
			success : function( xmlData) {
				$("#output").html("이름 : "+ $(xmlData).find("name").text()
						+"<br> 메세지 : " +$(xmlData).find("msg").text()
						);
			}		
			
		});//ajax
	});//click
	
	$("#json").click(function() {
		$.ajax({
			url:"ajax.json",
			type: "get",
			
			dataType:"JSON",
			error: function( xhr) {
				console.log(xhr.status);
			},
			success : function( jsonObj ) {
				//JSONObject을 Parsing
				$("#output").html( "이름 : "+jsonObj.name+"<br> 주소: "+ jsonObj.addr );
				$("#name").val( jsonObj.name );
				$("#addr").val( jsonObj.addr );
			}
			
		})
	});//click
	
});//read

</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${ url }/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<input type="button" value="TEXT" class="btn btn-success" id="txt"/>
<input type="button" value="HTML" class="btn btn-danger" id="html"/>
<input type="button" value="XML" class="btn btn-info" id="xml"/>
<input type="button" value="JSON" class="btn btn-warning" id="json"/>

<div id="output"></div>
<input type="text" name="name" id="name"/><br>
<input type="text" name="addr" id="addr"/><br>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="${ url }/common/jsp/footer.jsp"/>
</footer>

</body>
</html>