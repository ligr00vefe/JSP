<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside_${group}.jsp"/>
  
				<section id="board" class="view">
				    <h3>글보기</h3>
				    <table>
				        <tr>
				            <td>제목</td>
				            <td><input type="text" name="title" value="${vo.title}" readonly/></td>
				        </tr>
				        
				        <c:if test="${vo.file == 1}">
				        
				         <tr>
				             <td>첨부파일</td>
				             <td>
				                 <a href="${vo.fv.oldname}">2020년 상반기 매출자료.xls</a>
				                 <span>${vo.fv.download}회 다운로드</span>
				             </td>
				         </tr>
				         
				     </c:if>
				     
				         <tr>
				             <td>내용</td>
				             <td>
				                 <textarea name="content" readonly>${vo.content}</textarea>
				             </td>
				         </tr>       
				     
				    </table>
				    <div>
				        <a href="#" class="btnDelete">삭제</a>
				        <a href="/Farmstory2/board/modify.do" class="btnModify">수정</a>
				        <a href="/Farmstory2/board/list.do" class="btnList">목록</a>
				    </div>  
				    
				   <!--  <script>
				
						$(document).ready(function(){
							
							var $btnDel   = $('.commentList > article > div > a:first-child');
															
							// 폼 전송 버튼 클릭
							$btnDel.click(function(e){
								e.preventDefault();		
								
								var $tag = $(this);
								var $href = $tag.attr('href');
								
								
								$.ajax({
									url: $href,
									type: 'get',
									// data: json,	서버로부터 전송 받을거라 필요 없음
									dataType: 'json',	// Model로부터 redirect 받을 값을 json 형태로 받겠다는 뜻 
									success: function(data){
										
										if(data.result == 1) {
											alert("댓글 삭제 완료");	
										}													
										
									}
								});
								
								// 태그 삭제(댓글 삭제 후 현재 뷰에 출력되어 있는 댓글 삭제)						
								$tag.parent().parent().remove();
														
										
								// return false; 를 하거나 e.preventDefault를 사용하여 form전송을 막음
								
							});// 댓글 삭제 버튼 클릭 끝
							
							
						});
					
					</script> -->
					
					<script>
					
						$(function(){
							
							var $currentComment = "";
							
							var $btnModify   = $('.commentList .modify');
							var $btnComplete = $('.commentList .complete');
							var $btnCancel   = $('.commentList .cancel');
							var $btnDelete	 = $('.commentList .delete');
							
							// 취소 클릭
							$btnCancel.click(function(e){
								e.preventDefault();
								alert("취소 클릭");
								// textarea 비활성화
								var $textarea = $(this).parent().prev();
								$textarea.attr('readonly', true);
								$textarea.val($currentComment);
								
								// 수정완료, 취소 메뉴 노출
								var $parent = $(this).parent();
								$parent.children().eq(0).removeClass('off');
								$parent.children().eq(1).addClass('off');
								$parent.children().eq(2).addClass('off');
								$parent.children().eq(3).removeClass('off');
							});
							
							// 수정 클릭
							$btnModify.click(function(e) {
								e.preventDefault();
								alert("수정 클릭");
								
								
								// textarea 활성화
								var $textarea = $(this).parent().prev();
									$textarea.attr('readonly', false);
									$textarea.val().focus();
								
								// 취소를 누를 경우 원래의 댓글로 복원하기 위해 현재 댓글을 보관
								$currentComment = $textarea.val();
								
								// 수정완료, 취소 메뉴 노출
								var $parent = $(this).parent();
									$parent.children().eq(0).addClass('off');
									$parent.children().eq(1).removeClass('off');
									$parent.children().eq(2).removeClass('off');
									$parent.children().eq(3).addClass('off');								
								
							});
														
							// 수정 완료
							$btnComplete.click(function(e){
								e.preventDefault();
								alert("수정완료 클릭");
								// alert('수정완료');
								
								/*
								$.ajax({									
									url : '',  	  // 데이터를 전송할 주소
									type: '',     // 전송방식
									data:'',  	  // 전송할 데이터
									dataType: '', // 서버에 요청하고 리턴 받을 데이터타입
									success: function(data){
										
									}
								});
								*/
								var $parent = $(this).parent();
								var $content = $(this).parent().prev().val();
								var $seq = $(this).parent().next().val();
								
								var jsonData = {
										'content': $content,
										'seq': $seq
								}	
									
								$.post('/Farmstory2/board/CommentModifyService.do', jsonData, function(result){
									
									var data = JSON.parse(result);
									
									if(data.result == 1) {
										
										// 삭제 노출, 수정완료 숨김, 취소 메뉴 숨김
										$parent.children().eq(0).removeClass('off');
										$parent.children().eq(1).addClass('off');
										$parent.children().eq(2).addClass('off');
										$parent.children().eq(3).removeClass('off');
										$parent.prev().attr('readonly', true);
									}
								});					
							});
						});	// jQuery end
					
					</script>
				         
				    
				    <!-- 댓글리스트 -->
				    <section class="commentList">
				        <h3>댓글목록</h3>
				        
				        <c:forEach var="comment" items="${comments}">
				        				        
				         <article class="comment">				         	 
				             <span>
				                 <span>${comment.nick}</span>
				                 <span>${comment.rdate }</span>
				             </span>
				             <textarea name="comment" readonly>${comment.content}</textarea>
				             <div>
				                 <a href="#" class="del">삭제</a>
				                 <a href="#" class="cancel off">취소</a>              			           
				                 <a href="#" class="complete off">수정완료</a>              			           
				                 <a href="#" class="modify">수정</a>              			           
				             </div>
				             <input type="hidden" name="seq" value="${comment.seq}"/>
				         </article>
				         
				        </c:forEach>
				        
				        <c:if test="${empty comments}">
				             
				              <p class="empty">등록된 댓글이 없습니다.</p>
				              
			            </c:if>
				             
			         </section>
				
					<script>
					
						function getToday(){												
							
							var $date  = new Date();
						    var $year  = $date.getFullYear();
						    var $month = $date.getMonth()+1;
						    var $day   = $date.getDate();
						    
						    if($month < 10){
						        $month = "0"+$month;
						    }
						    if($day < 10){
						        $day = "0"+$day;
						    }
						 
						    var $today = $year+'-'+$month+'-'+$day;
							var $rdate = $today.substring(2);
							
							return $rdate;
						}
						
						$(document).ready(function(){						
									
							var $btnWrite = $('.commentForm .btnWrite');
							
							// 폼 전송 버튼 클릭
							$btnWrite.click(function(e){
								e.preventDefault();			
																		
								// 서버 데이터 전송
								var $group   = $('.commentForm input[name=group]').val();
								var $cate    = $('.commentForm input[name=cate]').val();
								var $parent  = $('.commentForm input[name=parent]').val();
								var $uid     = $('.commentForm input[name=uid]').val();
								var $nick    = $('.commentForm input[name=nick]').val();
								var $comment = $('.commentForm textarea[name=comment]');
								
								var jsonData = {
										"group" : $group,
										"cate" : $cate,
										"parent": $parent,
										"uid": $uid,
										"comment": $comment.val()
										};
								
								/* alert(json.parent);
								alert(json.uid);
								alert(json.comment); */
								
								$.ajax({
									url: '/Farmstory2/board/comment.do',
									type: 'post',
									data: jsonData,	// 전송 객체
									dataType: 'json',
									success: function(data){
										
										if(data.result == 1) {
											
											// 화면 부분갱신 작업
											var $strHtml = "<article class='comment'>"
														 + "<span>"
															 + "<span class='nick'></span>"
															 + "<span class='rdate'></span>"
														 + "</span>"
														 + "<textarea name='comment' readonly></textarea>"							 	
														 + "<div>"
															 + "<a href='#' class='delete'>삭제</a>"
															 + "<a href='#' class='cancel off'>취소</a>"
															 + "<a href='#' class='complete off'>취소완료</a>"
														 	 + "<a href='#' class='modify'>수정</a>"
														 + "</div>"
													 + "</article>";
													 
											// 문서객체화		 
											var $html = $.parseHTML($strHtml);
													 
											// dom 객체화
											var $dom = $($html);
											
											// 태그 내용 채우기
											// var $delHref = '/Farmstory2/deleteComment.do?seq=${comment.seq}&parent=${comment.parent}';
											
											$dom.find('.nick').text($nick);
											$dom.find('.rdate').text(getToday());
											$dom.find('textarea').text($comment.val());
											// $dom.find('.delComment').attr('href', $delHref);						
											
											$('.commentList').append($dom);
											
											$comment.val("");
										}								
									}
								});										
																						
								// return false; 를 하거나 e.preventDefault를 사용하여 form전송을 막음
								
							});// 폼 전송 버튼 클릭 끝
											
						});
					
					</script>
					
				
				    <!-- 댓글입력폼 -->
				    <section class="commentForm">
				    
				        <h3>댓글쓰기</h3>
				        <form action="#" method="post">
				        	<input type="hidden" name="group" value="${requestScope.group}" />
				        	<input type="hidden" name="parent" value="${vo.seq}" />
				        	<input type="hidden" name="cate" value="${requestScope.cate}" />
				        	<input type="hidden" name="uid" value="${sessionScope.member.uid}" />
				        	<input type="hidden" name="nick" value="${sessionScope.member.nick}" />
				            <textarea name="comment"></textarea>
				            <div>
				                <a href="#" class="btnCancel">취소</a>
				                <input type="submit" class="btnWrite" value="작성완료"/>
				            </div>
				        </form>
				    </section>
				
				</section>
	            <!-- 컨텐츠 내용 끝 -->
                
            </div>
        </article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>