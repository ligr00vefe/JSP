<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::찾아오시는길</title>
    <link rel="stylesheet" href="../css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <header>
            <a href="#" class="logo"><img src="../img/logo.png" alt="로고"/></a>
            <p>
               	<a href="/Farmstory2/">HOME |</a>
              	     <c:choose>
	                	<c:when test="${empty member}">
	       	         		<a href="/Farmstory2/user/terms.do">회원가입 |</a>
	           	 			<a href="/Farmstory2/user/login.do">로그인 |</a>
	                	</c:when>
	                	<c:otherwise>
							<a href="/Farmstory2/user/logout.do">로그아웃 |</a>                	
	                	</c:otherwise>
					</c:choose>
              	 <a href="#">고객센터</a>
            </p>
            <img src="../img/head_txt_img.png" alt="3만원이상 무료배송, 팜카드 10%적립">
            
            <ul class="gnb">
                <li><a href="/Farmstory2/introduction/greeting.do">팜스토리소개</a></li>
                <li><a href="/Farmstory2/board/list.do?group=market&cate=market"><img src="../img/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory2/board/list.do?group=croptalk&cate=croptalk">농작물이야기</a></li>
                <li><a href="/Farmstory2/board/list.do?group=event&cate=event">이벤트</a></li>
                <li><a href="/Farmstory2/board/list.do?group=community&cate=notice">커뮤니티</a></li>
            </ul>

        </header>

        <div id="sub" class="introduction">
            <div>
                <img src="../img/sub_top_tit1.png" alt="INTRODUCTION"/>
            </div>
            <section>
                <aside>
                    <img src="../img/sub_aside_cate1_tit.png" alt="팜스토리 소개"/>
                    <ul>
                        <li><a href="/Farmstory2/introduction/greeting.do">인사말</a></li>
                        <li class="on"><a href="/Farmstory2/introduction/direction.do">찾아오시는길</a></li>
                    </ul>
                </aside>
                <article>
                    <nav>
                        <img src="../img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는길"/>
                        <p>
                            HOME > 팜스토리소개 > <span>찾아오시는길</span>
                        </p>
                    </nav>
                    <div class="content">
                        <!-- 컨텐츠 내용 시작 -->
                        // 컨텐츠 내용 입력하세요.

                        <!-- 컨텐츠 내용 끝 -->
                    </div>

                </article>
            </section>
        </div>

        <footer>
            <img src="../img/footer_logo.png" alt="푸터로고"/>
            <p>
                (주)더조은 / 사업자번호 123-45-67890 / 통신판매신고 제 2013호 / 등록번호 더조은1234 / 발행인 : 홍길동<br/>
                대표자 : 홍길동 / 개인정보관리자 : 홍길동 / ☎ 051) 123-4567 / 부산광역시 부산진구 부전동 123 5층<br/>
                <span>Copyright ⓒ(주)더조은 All rights reserved.</span> 
            </p>
        </footer>
    </div>    
</body>
</html>