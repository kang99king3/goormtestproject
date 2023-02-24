<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    body {font-family: "맑은 고딕", Georgia, Serif;}
    h1, h2, h3, h4, h5, h6 {
      font-family: "Playfair Display";
      letter-spacing: 5px;
    }
</style>
</head>
<body>
    <!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
    <a href="#home" class="w3-bar-item w3-button">Gourmet au Catering</a>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="#menu" class="w3-bar-item w3-button">Menu</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>
      <a href="HkController.do?command=boardlist" class="w3-bar-item w3-button">BoardList</a>
    </div>
  </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
  <img class="w3-image" src="img/main.jpg" alt="Hamburger Catering" width="1600" height="800">
  <div class="w3-display-bottomleft w3-padding-large w3-opacity">
    <h1 class="w3-xxlarge">Yun woo</h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">

  <!-- About Section -->
  <div class="w3-row w3-padding-64" id="about">
    <div class="w3-col l6 w3-padding-large">
     <img src="img/star.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" style="width:100%">
      </div>
      
    <div class="w3-col m6 w3-padding-large">
      <h1 class="w3-center">About Star</h1><br>
      <h5 class="w3-center">Tradition since 1889</h5>
      <p class="w3-large" style="font-family:맑은 고딕;">별이 영어로 star라고 일반적으로 알려져 있지만, 사실 영단어 star는 항성만을 뜻한다. 한자문화권에서 별을 항성과 행성으로 나눴던 것처럼, 고대 그리스에서도 별을 고정된 별과 떠도는 별로 구분했는데, 
          이게 전해져 오다가 행성은 떠돌이라는 뜻의 <span class="w3-tag w3-light-grey">planet</span>이라는 이름이 붙고, 항성은 그냥 star라고 부르게 되었다.[1] 그래서 천문학에서 star는 오직 항성만을 뜻하며, 행성은 star가 아니라 planet이다. 
          </p>
      <p class="w3-large w3-text-grey w3-hide-medium" style="font-family:맑은 고딕;">문제는 민간에서 여전히 sun, moon, star 분류법을 관습적으로 사용한다는 점이다. 때문에 star는 별일수도 항성일 수도 있다. 가령 일론 머스크의 starlink와 starship이 대표적인 예이다. 이는 문맥에 따라 파악하는 수밖에 없다.</p>
    </div>
  </div>
  
  <hr>
  
  <!-- Menu Section -->
  <div class="w3-row w3-padding-64" id="menu">
    <div class="w3-col l6 w3-padding-large">
      <h1 class="w3-center">여름 여행지</h1><br>
      <h4>경주 송대말등대</h4>
      <p class="w3-text-grey">경주는 한곳에 모여있는 유적지와 산책 코스로 관광하기도 좋고, 바다도 가까워 여름 여행지로 추천한다. 특히나 경주 송대말등대는 경주 스노쿨링 장소로도 유명해 바다 수영에도 제격이다.</p><br>
    
      <h4>강릉 향호해변</h4>
      <p class="w3-text-grey">커피거리가 가까운 경포해변과 포토스팟이 많은 안목해변도 좋지만, 북적이는 바다는 간혹 진을 빼놓곤 한다. 나와 같은 이들을 위해 한적한 매력의 강릉 향호해변을 소개한다.</p><br>
    
      <h4>부산 광안리해변</h4>
      <p class="w3-text-grey">부산하면 대표적으로 떠오르는 광안리 해변, 여유로운 광합성을 즐길 수 있고, 요트투어와 같은 액티비티를 할 수 있어 모두에게 사랑받는 곳이다. 반짝이고 화려한 느낌의 해운대와는 달리, 다소 한적한 광안리는 힐링을 즐기기에 적합하다.</p><br>
    
      <h4>여수 모사금해수욕장</h4>
      <p class="w3-text-grey">여름이 되면 흥얼거리는 노래인 여수 밤바다 덕분인지, 바다 하면 여수가 자연스레 떠오른다. 그중 여수 드라이브코스로도 유명한 여수 모사금해수욕장을 소개한다.</p><br>
    
      <h4>제주 김녕해수욕장</h4>
      <p class="w3-text-grey">바다 수영에 진심이라면 빼놓을 수 없는 제주도. 그중에서도 에디터는 김녕 해수욕장을 추천한다. 김녕 해수욕장 방파제로 인해 피서지 무드를 자아내 이국적인 느낌도 든다.</p>    
    </div>
    
    <div class="w3-col l6 w3-padding-large">
      <img src="img/summer.jpg" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
    </div>
  </div>
  <!-- Menu Section -->
  <div class="w3-row w3-padding-64" id="menu">
    <div class="w3-col l6 w3-padding-large">
      <img src="img/img-17.jpg" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
    </div>
    
    <div class="w3-col l6 w3-padding-large">
      <img src="img/img-16.jpg" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
    </div>
      
    <div class="w3-col l6 w3-padding-large">
      <img src="img/img-22.jpg" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
    </div>
    <div class="w3-col l6 w3-padding-large">
      <img src="img/img-25.jpg" class="w3-round w3-image w3-opacity-min" alt="Menu" style="width:100%">
    </div>
  </div>
  <hr>

  <!-- Contact Section -->
  <div class="w3-container w3-padding-64" id="contact">
    <h1>Contact</h1><br>
    <p>We offer full-service catering for any event, large or small. We understand your needs and we will cater the food to satisfy the biggerst criteria of them all, both look and taste. Do not hesitate to contact us.</p>
    <p class="w3-text-blue-grey w3-large"><b>Catering Service, 42nd Living St, 43043 New York, NY</b></p>
    <p>You can also contact us by phone 00553123-2323 or email catering@catering.com, or you can send us a message here:</p>
    <form action="HkController.do" target="_blank" method="post">
      <input type="hidden" name="command" value="insertboard"/>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Name" required name="id"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Title" required name="title"></p>
      <p><input class="w3-input w3-padding-16" type="datetime-local" placeholder="Date and time" required name="date" value="2020-11-16T20:00"></p>
      <p><input class="w3-input w3-padding-16" type="text" placeholder="Message \ Special requirements" required name="content"></p>
      <p><button class="w3-button w3-light-grey w3-section" type="submit">SEND MESSAGE</button></p>
    </form>
  </div>
  
<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

</body>
</body>
</html>
