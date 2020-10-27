<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("cate");
%>
<div id="sub" class="market">
    <div>
        <img src="/Farmstory1/img/sub_top_tit2.png" alt="MARKET">
    </div>
    <section>
        <aside>
            <img src="/Farmstory1/img/sub_aside_cate2_tit.png" alt="장보기">
            <ul>
                <li class="on"><a href="./list.jsp?group=market&cate=market">장보기</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="/Farmstory1/img/sub_nav_tit_cate2_tit1.png" alt="장보기">
                <p>
                    HOME > 장보기 > <span>장보기</span>
                </p>
            </nav>
            <div class="content">
                <!-- 컨텐츠 내용 시작 -->