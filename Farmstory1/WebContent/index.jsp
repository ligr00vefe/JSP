<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@ page import="kr.co.farmstory1.config.SQL"%>
<%@ page import="kr.co.farmstory1.config.DBConfig"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./_header.jsp" %>
<%
	// 1,2단계
	Connection conn = DBConfig.getConnection();

	// 3단계
	Statement stmt = conn.createStatement();
		
	// 4단계
	ResultSet rs = stmt.executeQuery(SQL.SELECT_LATEST_ARTICLE);
	
	// 5단계
	List<ArticleBean> latestList = new ArrayList<>();
	
	while(rs.next()) {
		ArticleBean latestArticle = new ArticleBean();
		
		latestArticle.setSeq(rs.getInt(1));
		latestArticle.setTitle(rs.getString(2));
		latestArticle.setRdate(rs.getString(3).substring(2, 10));
		
		latestList.add(latestArticle);
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();
	
%>

            <main>
                <div class="slider">
                    <img src="/Farmstory1/img/main_slide_img_tit.png" alt="사람과 자연을 사랑하는 팜스토리">
                    <ul>
                        <li><img src="/Farmstory1/img/main_slide_img1.jpg" alt="slide_img1"></li>
                        <li><img src="/Farmstory1/img/main_slide_img2.jpg" alt="slide_img2"></li>
                        <li><img src="/Farmstory1/img/main_slide_img3.jpg" alt="slide_img3"></li>
                    </ul>
                    <div class="banner">
                        <img src="/Farmstory1/img/main_banner_txt.png" alt="GRAND OPEN">
                        <img src="/Farmstory1/img/main_banner_tit.png" alt="30% 할인 이벤트">
                        <img src="/Farmstory1/img/main_banner_img.png" alt="과일">
                    </div>
                </div>

                <div class="quick">
                    <a href="#"><img src="/Farmstory1/img/main_banner_sub1_tit.png" alt="오늘의 식단"></a>
                    <a href="#"><img src="/Farmstory1/img/main_banner_sub2_tit.png" alt="나도 요리사"></a>
                </div>

                <div class="lastest">
                    <div>
                        <img src="/Farmstory1/img/main_latest1_tit.png" alt="텃밭가꾸기">
                        <img src="/Farmstory1/img/main_latest1_img.jpg" alt="이미지1">
                        <table>
                        
                        	<% 
                        		for(int i=0; i<5; i++) { 
                        			ArticleBean latestArticle = latestList.get(i);
                        	%>
                        	
                            <tr>
                                <td>></td>
                                <td><a href="./board/view.jsp?seq=<%= latestArticle.getSeq() %>&group=croptalk&cate=grow"><%= latestArticle.getTitle() %></a></td>
                                <td><%= latestArticle.getRdate() %></td>
                            </tr>                            
                            
                            <% } %>
                            
                        </table>
                    </div>
                    <div>
                        <img src="/Farmstory1/img/main_latest2_tit.png" alt="귀농학교">
                        <img src="/Farmstory1/img/main_latest2_img.jpg" alt="이미지2">
                        <table>
                        
                            <% for(int i=5; i<10; i++) { 
                        			ArticleBean latestArticle = latestList.get(i);
                        	%>
                        	
                            <tr>
                                <td>></td>
                                <td><a href="./board/view.jsp?seq=<%= latestArticle.getSeq() %>&group=croptalk&cate=school"><%= latestArticle.getTitle() %></a></td>
                                <td><%= latestArticle.getRdate() %></td>
                            </tr>                            
                            
                            <% } %>
                            
                        </table>                        
                    </div>
                    <div>
                        <img src="/Farmstory1/img/main_latest3_tit.png" alt="농작물이야기">
                        <img src="/Farmstory1/img/main_latest3_img.jpg" alt="이미지3">
                        <table>
                        
                            <% for(int i=10; i<15; i++) { 
                        			ArticleBean latestArticle = latestList.get(i);
                        	%>
                        	
                            <tr>
                                <td>></td>
                                <td><a href="./board/view.jsp?seq=<%= latestArticle.getSeq() %>&group=croptalk&cate=croptalk"><%= latestArticle.getTitle() %></a></td>
                                <td><%= latestArticle.getRdate() %></td>
                            </tr>                            
                            
                            <% } %>
                            
                        </table>
                    </div>
                </div>
                <div class="info">
                    <div class="cs">
                        <img src="/Farmstory1/img/main_sub2_cs_tit.png" alt="고객센터안내">
                        <div>
                            <img src="/Farmstory1/img/main_sub2_cs_img.png" alt="이미지">
                            <img src="/Farmstory1/img/main_sub2_cs_txt.png" alt="1666-777">
                            <ol>
                                <li>평일: AM 09:00 ~ PM 06:00</li>
                                <li>점심: PM 12:00 ~ PM 01:00</li>
                                <li>토, 일요일, 공휴일 휴무</li>
                            </ol>
                        </div>
                        <div>
                            <a href="#"><img src="/Farmstory1/img/main_sub2_cs_bt1.png" alt="고객문의"></a>
                            <a href="#"><img src="/Farmstory1/img/main_sub2_cs_bt2.png" alt="자주묻는 질문"></a>
                            <a href="#"><img src="/Farmstory1/img/main_sub2_cs_bt3.png" alt="배송조회"></a>
                        </div>
                    </div>
                    <div class="account">
                        <img src="/Farmstory1/img/main_sub2_account_tit.png" alt="계좌안내">
                        <ul>
                            <li>기업은행 123-456789-01-01-012</li>
                            <li>국민은행 01-1234-56789</li>
                            <li>우리은행 123-456789-01-01-012</li>
                            <li>하나은행 123-456789-01-01</li>
                            <li>예 금 주 (주)팜스토리</li>
                        </ul>
                    </div>
                    <div></div>
                </div>

                <div class="adv_side">
                    <a href="#">
                        <img src="/Farmstory1/img/float_banner_tit.png" alt="">
                    </a>
                    <a href="#">
                        <img src="/Farmstory1/img/float_banner_txt.png" alt="">
                    </a>
                </div>

            </main>
            
<%@ include file="./_footer.jsp" %>
           
            