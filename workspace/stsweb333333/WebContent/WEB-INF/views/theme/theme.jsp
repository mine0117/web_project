<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="css/css_theme/theme.css">
  <link rel="stylesheet" href="common/common.css">
  <title>테마맛집</title>
</head>
<body>
		 <div class="center">
    <header class="header ">
      <div class="top">
        <!-- 로고와 제목 -->
        <div class="title">
          <img class="logo" src="common/image/logo.gif" alt="logo">
          <h2>서울맛집찾기</h2>
        </div>

        <!-- 검색창 -->
        <div class="search">
            <input class="searchtext" type="text"/>
            <button type="button">검색</button>
        </div>
      </div>
      <!-- 공통 네비게이션 -->
      <nav>
        <div class="nav">
          <ul class="">
            <li><a href="#">지역별맛집</a></li>
            <li><a class="active" href="#">테마별맛집</a></li>
            <li><a href="#">예약맛집</a></li>
            <li><a href="#">Q & A</a></li>
            <button type="button" class="login">로그인</button>
            <button type="button" class="login">회원가입</button>
          </ul>
        </div>
      </nav>
    </header>

    <!-- 내용 -->
    <section>
      <!-- 테마 리스트 -->
      <div class="themelist">
        <ul class="">
          <li>
            <a class="active" href="#">
              <img src="image_theme/family_.png" alt="가족모임">
              <p>가족모임</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/couple_.png" alt="">
              <p>연인과함께</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/friend_.png" alt="가족모임">
              <p>친구와함께</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/weather_.png" alt="가족모임">
              <p>날씨에따라</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/withbeer_.png" alt="가족모임">
              <p>치맥/피맥</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/dessert_.png" alt="가족모임">
              <p>달콤후식</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/fresh_.png" alt="가족모임">
              <p>건강식</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/tv_.png" alt="가족모임">
              <p>tv맛집</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/pork_.png" alt="가족모임">
              <p>돼지고기</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/beef_.png" alt="가족모임">
              <p>소고기</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/chicken_.png" alt="가족모임">
              <p>닭</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/fish_.png" alt="가족모임">
              <p>해산물</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/noodle_.png" alt="가족모임">
              <p>면요리</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/fastfood_.png" alt="가족모임">
              <p>분식/즉석</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/buffet_.png" alt="가족모임">
              <p>무한뷔페</p>
            </a>
          </li>
          <li>
            <a href="#">
              <img src="image_theme/infinite_.png" alt="가족모임">
              <p>무한리필</p>
            </a>
          </li>
        </ul>
      </div><!--//테마 리스트-->

      <span class="themename">
        <p>테마명 ></p>
        <select name="" id="">
          <option value="">선택1</option>
          <option value="">선택2</option>
        </select>
      </span>

      <!-- 음식점 리스트 -->
      <div class="reslist">
        <ul>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>
            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
          <li>
            <a href=""><img class="foodimg"src="image_theme/res/food1.jpg" alt="음식"></a>

            <div class="one"><!-- 음식점 정보 -->
              <a>오후정 강남점</a>
              <span>
                <img src="image_theme/ico/ico_addr.png" alt="주소">
                <p>서울 강남구 역삼동</p>
              </span>
              <span>
                <img src="image_theme/ico/ico_num.png" alt="주소">
                <p>02-552-0204</p>
              </span>
              <span class="star"><img src="image_theme/ico/ico_star_off.png" alt="별점"></span>
              <p><span>
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_on.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
                <img src="image_theme/ico/ico_star_off.png" alt="별점">
              </span>
              <span class="score">3.2</span></p>
            </div><!-- //음식점 정보 -->
          </li>
        </ul>
      </div><!-- //음식점 리스트-->

    </section>
  </div><!-- //center -->
</body>


 <jsp:include page="../../../resources/common/footer/footer.jsp"></jsp:include>

</html>