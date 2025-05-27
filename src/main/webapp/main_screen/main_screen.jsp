<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/movie_prj/common/external_file.jsp"/>
<style>
#container {
    min-height: 650px;
    margin-top: 30px;
    margin-left: auto;
    margin-right: auto;
    width: 70%;
}

#trailer-container {
    width: 100%;
    margin: 40px auto;
    position: relative;
    padding-bottom: 30%; /* 더 얇은 화면비율 */
    height: 0;
}

#trailer-container iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}

.movie-chart {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4열 */
    gap: 20px; /* 아이템 간 간격 */
    width: 100%;
    margin: 60px auto;
}

.movie-chart h2 {
    grid-column: span 4; /* 4개의 열을 차지하는 텍스트 */
    font-size: 24px;
    font-weight: bold;
    text-align: left;
    color: #333;
    margin-bottom: 20px;
}

.movie-item {
    position: relative;
    width: 100%;
}

.movie-item img {
    width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    transition: transform 0.2s;
}

.movie-item img:hover {
    transform: scale(1.03);
}
.movie-item .rating-icon {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 20px; 
    height: 20px;
}


.movie-item .rank {
    position: absolute;
    bottom: 5px;
    left: 5px;
    font-size: 80px;
    font-style: italic;
    color: white;
    border-radius: 4px;
}

 
</style>
<script type="text/javascript">
</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/header.jsp"/>
</header>
<main>
<div id="container">
<div id="trailer-container">
    <iframe 
        src="https://www.youtube.com/embed/J8qqMLZPPTo" 
        frameborder="0" 
        allowfullscreen>
    </iframe>
</div>
 <!-- 영화 차트 -->
        <div class="movie-chart">
            <!-- 무비차트 제목 -->
            <h2>무비차트</h2>
		
		            <div class="movie-item">
		    <img src="http://localhost/movie_prj/main_screen/images/movie_1.jpg" alt="영화 1">
		    <img src="https://i.namu.wiki/i/g_VAsyPtPWVWXj2Xwh50VuGJNasfuRP7EXsIBNJFuJ7uM0qUwUQTomIiYp36VaUfjO-_p8B0nZ3R6PtXmu_XwaFuh8E3NHIwTxuEWRMQ7oyGOFNJF3Jep6bfxNIqIamtihoAgcNkaELR4aqLVAq7pQ.svg" alt="관람 등급 아이콘" class="rating-icon">
		    <div class="rank">1</div> <!-- 순위 -->
		</div>
		<div class="movie-item">
		    <img src="http://localhost/movie_prj/main_screen/images/movie_2.jpg" alt="영화 2">
		    <img src="https://i.namu.wiki/i/c4gbRUKYTVYyRwXE-yTKjSfq7w1CZjvYUV2swif9FtqvD-afTZUttU7cqzEq2IhxNykxrI20c0ruGu8E8UB3jv7m1qiDfxihl2eShY3-PYL4xaDHTmLwfhQNvu42HFg_VLzTULC6-0tTfgD5pCit7Q.svg" alt="관람 등급 아이콘" class="rating-icon">
		    <div class="rank">2</div>
		</div>
		<div class="movie-item">
		    <img src="http://localhost/movie_prj/main_screen/images/movie_3.jpg" alt="영화 3">
		    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKcAAACnCAMAAABDyLzeAAAAaVBMVEXZLDX////eSE/iXmXxr7P1y8386+z2ztDuo6fbOkLjYWjslprtm6DeTFP53t/dQkrhWWDjZm3qjZLaNj/ogojfUVj+9/jxsLPlbXPmdHnaMTrzvcD41tj77e7++Pjyt7rof4T0w8bvqKsLZxsxAAACuklEQVR4nO3d0XaiMBAG4OBWEAQRUOyixcr7P+SqLAqlk0Rxm5k9/3/VC07Od6xMIOBEef34zSZLlPsk2abxBzJ1+6ue51vXvkG2+bweO8u4cA0bpYjLr8631DXq26S7ofNYuRYRqXZ9Z+6ao0l+dzauLdo0nTPg+k9vUwWt0w9dSwwJ/atz6dphTHxxfvCrm19TlGcn53O9y/Ls5DCfm5J4auXaYJWVil0TrBKrd9cEq/xWa9cEq0Rq5ppglZniPWd2kaFEEAQZJfS+z22SSPclcYh1DtF0Z25y7qcqzymnX7CvTE6fOOChTL7UWFMjv9b5a6qzkeGsPmQ438mReTnpk5mVkyqe3JwbIc6DDGeiGZmTcyHESRZPXk66ePJyHmU4w1o3Mh+npniycmqKJyenrnhycsZCnLriaec8fEb9ZJpp43lnZvgEzM7xsjp9Zj7v1BZPK+f4kWT6emehLZ5WzsVoUPpy9mnnp4HJxRnIcM5MTCbOpRCnuXizcEZGJg/njhyQl/OWNzjhhBNOOOGEE85e9qPRyIdmTp33Q7rQl2FOneVx2U+sWbBy6nwgcMIJJ5xwwgknnP+x8yTESb0oyM1pfuTAxFm84M3Kn3AqlS3mdiHfaP0Zp3XIrwiccMIJJ5xwwsnLSV51MHOSh8AJJ5xwwgknnHDCqXcyW18iD3kgcMIJJ5xwwgknnHDCCadc59R+QVbr3tOZk/sv2TjTye8zBDI6PSIIgkiLlP60MmaBSEz/ZCn9qKX095bSL11AO/+2//wL2oP+64SXfv4e/zNpcd3Hoea5Zcs9s7rdv+PAu8t3dfkp5fVG8eiaos31zqu9oeX8FW0bYP298T5xPemLk9d3eitee0l12XYdkW8LGXXDb5uZcHFrqNVbcCljXlNoEveeLA8XhoLNOuHwsYbJOh/+sPsPliE90NTv91MAAAAASUVORK5CYII=" alt="관람 등급 아이콘" class="rating-icon">
		    <div class="rank">3</div>
		</div>
		<div class="movie-item">
		    <img src="http://localhost/movie_prj/main_screen/images/movie_4.jpg" alt="영화 4">
		    <img src="https://i.namu.wiki/i/UA7u1h1BSfp2wQ8gGmQa-wCcl00QxF7MwSityvaTIGsyhx01dEhR69yKEAhsnQbikYCVNhDUudEZ5rpYIY89fDMjOlfi3MxlHe-eJq41Tl10V2FYy8kIF524tp9s0KHprIERPemzcL-uZhjIT23syQ.svg" alt="관람 등급 아이콘" class="rating-icon">
		    <div class="rank">4</div>
		</div>

            
        </div>
    </div>
	


</main>
<footer>
<c:import url="http://localhost/movie_prj/common/footer.jsp"/>
</footer>
</body>
</html>