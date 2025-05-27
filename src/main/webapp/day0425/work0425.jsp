<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.76/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 thead {
    background-color: #007bff;
    color: white;  /* 텍스트 색상을 하얀색으로 */
  }
 #tbody tr:hover {background-color: #f0f0f0;}
  .sun { color: red; }    /* 일요일은 빨간색 */
  .sat { color: blue; }   /* 토요일은 파란색 */
  .weekday { color: black; } /* 평일은 검은색 */
   /* 테이블에 보더를 적용하는 스타일 */
  table {
    width: 100%;
    border-collapse: collapse;  /* 테이블 셀 간 경계선 겹침 방지 */
  }
  
  /* 모든 td, th에 대해 보더 적용 */
  table td, table th {
    border: 1px solid #dee2e6; /* 테두리 색상 및 두께 */
    padding: 8px;  /* 패딩 추가로 보기 좋게 */
  }
</style>


<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
	
});//read


</script>
</head>
<body>
<header data-bs-theme="dark">
  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
<main>
<div id="container">

<label></label>
<table>
<thead>
<tr>
	<th>일</th>
	<th>월</th>
	<th>화</th>
	<th>수</th>
	<th>목</th>
	<th>금</th>
	<th>토</th>
</tr>	
</thead>
<tbody id="tbody">
<% 
	LocalDate ld = LocalDate.now();//현재 시간 얻기
	int nowYear=ld.getYear();
	int lastDayOfMonth=ld.lengthOfMonth();
	int firstDayOfMonth = ld.withDayOfMonth(1).getDayOfWeek().getValue();
	int nowMonth=ld.getMonthValue();//현재날짜
	int nowDay = ld.getDayOfMonth();//이번달 마지막 날짜
// 한 달의 첫 번째 날짜의 요일에 맞춰 빈 칸을 추가해야 함
        int day = 1; // 날짜 시작
        boolean isFirstRow = true; // 첫 번째 줄을 구별하는 변수 (빈 칸을 채우기 위해)
        
        // 달력 출력
        for (int row = 0; row < 6; row++) {  // 최대 6행 (28~31일까지)
          out.print("<tr>");
          for (int col = 1; col <= 7; col++) {
            if (row == 0 && col < firstDayOfMonth) {
              // 첫 번째 행에서 시작 요일까지 빈 칸 출력
              out.print("<td></td>");
            } else if (day <= lastDayOfMonth) {
              // 날짜가 출력되는 부분
              // 요일에 따른 클래스를 추가
              DayOfWeek dayOfWeek = ld.withDayOfMonth(day).getDayOfWeek();
              String dayClass = "";
              if (dayOfWeek == DayOfWeek.MONDAY) {
                dayClass = "sun";  // 일요일은 빨간색
              } else if (dayOfWeek == DayOfWeek.SUNDAY) {
                dayClass = "sat";  // 토요일은 파란색
              } 
              
              out.print("<td class='" + dayClass + "'>" + day + "</td>");
              day++;
            } else {
              // 날짜가 끝난 후 빈 칸
              out.print("<td></td>");
            }
          }
          out.print("</tr>");
        }
      %>
    </tbody>

</table>
</div>
</main>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>