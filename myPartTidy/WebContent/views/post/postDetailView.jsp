<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.TidyGames.post.model.vo.Post, com.TidyGames.common.model.vo.PageInfo,
				 com.TidyGames.post.model.vo.PostFile, java.util.ArrayList"
%>
<%
	Post p = (Post)request.getAttribute("post");
	Post lpn = (Post)request.getAttribute("lpn");
	Post fpn = (Post)request.getAttribute("fpn");
	ArrayList<PostFile> flist = (ArrayList<PostFile>)request.getAttribute("flist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#community {
	color: orange;
}

.include-area {
	width: 1500px;
	margin: auto;
	align: center;
	border-bottom: 2px solid rgba(255, 255, 255, 0.555);
}

.outer {
	size: auto;
	background-color: #0e332c;
	color: white;
	width: 1200px;
	margin: auto;
	margin-top: 50px;
}

.underline {
	border-bottom: 2px solid rgba(83, 79, 79, 0.333);
}

.view-form {
	size: auto;
	background-color: lightgray;
	width: 1200px;
	margin: auto;
}

#read-form {
	margin: auto;
	width: 1100px;
}

#enroll-form input, textarea {
	width: 100%;
	box-sizing: border-box;
}

table {
	color: black;
}
.like {
	cursor:pointer;
}
</style>
</head>
<body style="background-color: #0e332c;">

	<div class="include-area">
		<%@ include file="../common/topbar.jsp"%>
		<%@ include file="../common/navibar.jsp"%>
	</div>
	
	

	<div class="outer">

		<h2>
			TIDY COMMUNITY <i class="far fa-comments"></i>
		</h2>
		
		<br>
		<div align="right">
			<% if(loginUser != null && loginUser.getMemNo() == p.getMemNo()) { %>
				<a href="<%= contextPath %>/updateForm.po?cpage=<%=pi.getCurrentPage()%>&num=<%= p.getPostNo() %>" class="btn btn-sm btn-info">수정</a> 
				<button data-toggle="modal" data-target="#deleteModal" class="btn btn-sm btn-danger">삭제</button>
			<% } else if(loginUser != null) { %>
				<button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModal">신고</button>
			<% } %>
		</div>
		<br>
		<div class="view-form">
			<br>
			<br>
			<div id="read-form">

				<div class="underline">
					<table>
						<tr>
							<th width="60"><h5>제목</h5></th>
							<td colspan="7"><h6><%=p.getPostName()%></h6></td>
						</tr>
						<tr>
							<td colspan="8" height="20"></td>
						</tr>
						<tr>
							<th width="60">작성자</th>
							<td width="100"><%=p.getPostWriter()%></td>
							<th width="60">작성일</th>
							<td width="200"><%=p.getPostEnroll()%></td>
							<th width="70">조회수</th>
							<td width="80"><%=p.getPostView()%></td>
							<th width="70">추천수</th>
							<td width="80"><%=p.getPostLike()%></td>
						</tr>
						<tr>
							<td colspan="8" height="20"></td>
						</tr>
					</table>
				</div>

				<div class="underline">
					<table>
						<tr>
							<td colspan="7" height="20"></td>
						</tr>
						<tr>
							<th width="50" style="display: flow-root"><h5>내용</h5></th>
							<td colspan="6"><pre><%=p.getPostContent()%></pre></td>
						</tr>
						<tr>
							<th></th>
							<% for(int i=0; i<flist.size(); i++) { %>
								<td colspan="2">
                        			<img src="<%=contextPath%>/<%=flist.get(i).getFilePath() + flist.get(i).getFileChange()%>" width="300" height="200" onerror="this.style.display='none'">
                        		</td>
                        	<% } %>
						</tr>
						<tr>
							<td colspan="7" height="20"></td>
						</tr>
					</table>
					<table>
							<% if(flist.isEmpty()) { %>
								<th width="80">첨부파일</th>
								<td>첨부파일이 없습니다</td>
							<% } else { %>
									<th width="1000">첨부파일</th>
								<% for(int i=0; i<flist.size(); i++) { %>
									<tr><td><a download="<%= flist.get(i).getFileOrigin() %>" href="<%=contextPath%>/<%=flist.get(i).getFilePath() + flist.get(i).getFileChange()%>"><%= flist.get(i).getFileOrigin() %></td></tr></a>
								<% } %>
							<% } %>
					</table>
					<br>
				 </div>

					<table>
						<tr>
							<td colspan="7" height="20"></td>
						</tr>
						<tr>
							<td></td>
							<td><i class="far fa-comment-dots fa-lg"></i></td>
							<th>댓글</th>
							<td width="50">123</td>
							<td><i class="far fa-heart fa-lg"></i></td>
							<th>추천</th>
							<td><%=p.getPostLike()%></td>
						</tr>
						<tr>
							<td colspan="7" height="20"></td>
						</tr>
					</table>
				

				<div class="comment-view">
					<table align="center">
						<thead>
							<tr>
								<td colspan="2" width="870">
									<textarea rows="3" style="resize:none"></textarea>
								</td>
								<td colspan="2" style="text-align:center">
									<button class="btn btn-secondary">댓글등록</button>
								</td>
							</tr>
							<tr>
								<td colspan="4" height="20"></td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<!-- 댓글 -->

				<br>
			</div><!-- read-form -->
		</div><!-- view-form -->
	</div><!-- outer -->
	<br>
	<div align="center">
		<% if(p.getPostNo() != fpn.getFirstPost()) { %>
			<a href="<%=contextPath%>/detail.po?cpage=<%=pi.getCurrentPage()%>&num=<%=p.getPrevNo()%>" class="btn btn-sm btn-secondary"><i class="fas fa-angle-double-left fa-lg"></i></a> 
		<% } %>
		<a href="<%=contextPath%>/list.po?cpage=<%=pi.getCurrentPage()%>" class="btn btn-sm btn-secondary"><i class="fas fa-align-justify fa-lg"></i></a> 
		<% if(p.getPostNo() != lpn.getLastPost()) { %>
			<a href="<%=contextPath%>/detail.po?cpage=<%=pi.getCurrentPage()%>&num=<%=p.getNextNo()%>" class="btn btn-sm btn-secondary"><i class="fas fa-angle-double-right fa-lg"></i></a>
		<% } %>
	</div>
	<br>
	<br>
	
	
	
	<%-- deleteModal --%>
	<div class="modal" id="deleteModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">잠깐!</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        	정말 게시물을 삭제하시겠습니까? 예를 누르면 삭제됩니다.
	      </div>
	      <div class="modal-footer">
	      	<button id="deletePost" class="btn btn-info">예</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 글 신고 버튼 모달 -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">신고 사유를 선택해주세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div>
						<input type="radio" id="r1" name="report" value="1" checked><label
							for="r1">욕설, 비방, 혐오</label>
					</div>
					<div>
						<input type="radio" id="r2" name="report" value="2"><label
							for="r2">부적절한 홍보</label>
					</div>
					<div>
						<input type="radio" id="r3" name="report" value="3"><label
							for="r3">루머 유포</label>
					</div>
					<div>
						<input type="radio" id="r4" name="report" value="4"><label for="r4">음란, 청소년 유해</label>
					</div>
					<div>
						<input type="radio" id="r5" name="report" value="5"><label for="r5">개인 정보 유출, 명예훼손</label>
					</div>
					<div>
						<input type="radio" id="r6" name="report" value="6"><label for="r6">도배, 스팸</label>
					</div>
					<div>
						<input type="radio" id="r7" name="report" value="7">기타(신고사유를 직접 입력해주세요)
					</div>
					<br>
					<div>
						<label for="r7"><textarea cols="60" rows="4"
								style="resize: none" placeholder="신고 사유 입력 (최대 160자 이내)"></textarea>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="reportPno" name="reportPno" value="<%=p.getPostNo()%>">
						<input type="hidden" id="reportMem" name="reportMem" value="<%=p.getMemNo()%>">
						<button id="postReport" class="btn btn-info">신고완료</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 댓글 신고 버튼 모달 -->
		<div class="modal" id="reportReplyModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">신고 사유를 선택해주세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div>
						<input type="radio" id="rr1" name="report" value="1" checked><label
							for="rr1">욕설, 비방, 혐오</label>
					</div>
					<div>
						<input type="radio" id="rr2" name="report" value="2"><label
							for="rr2">부적절한 홍보</label>
					</div>
					<div>
						<input type="radio" id="rr3" name="report" value="3"><label
							for="rr3">루머 유포</label>
					</div>
					<div>
						<input type="radio" id="rr4" name="report" value="4"><label for="rr4">음란, 청소년 유해</label>
					</div>
					<div>
						<input type="radio" id="rr5" name="report" value="5"><label for="rr5">개인 정보 유출, 명예훼손</label>
					</div>
					<div>
						<input type="radio" id="rr6" name="report" value="6"><label for="rr6">도배, 스팸</label>
					</div>
					<div>
						<input type="radio" id="rr7" name="report" value="7">기타(신고사유를 직접 입력해주세요)
					</div>
					<br>
					<div>
						<label for="rr7"><textarea cols="60" rows="4"
								style="resize: none" placeholder="신고 사유 입력 (최대 160자 이내)"></textarea>
					</div>
					<div class="modal-footer">
						<button id="replyReport" class="btn btn-info">신고완료</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<script>
			$(function(){
				
				selectReplyList(); //모든 요소가 만들어진 뒤 바로 호출하는 메소드
				
				$("#deletePost").click(function(){
					var url = "<%= contextPath %>/delete.po?cpage=<%=pi.getCurrentPage()%>&num=<%= p.getPostNo() %>";
					location.href = url;
				});
				
				
				//글신고
				$("#postReport").click(function(){
					const reportNo = $("#reportPno").val();
					console.log(reportNo);
					const reportedMemNo = $("#reportMem").val();
					console.log(reportedMemNo);
				});
				
				//댓글신고
				$("#replyReport").click(function(){
					const reportNo = $("#reportRno").val();
					console.log(reportNo);
					const reportedMemNo = $("#reportRmem").val();
					console.log(reportedMemNo);
				});
				
				$("#canNotLike").click(function(){
					alert('로그인한 회원만 이용할 수 있는 기능입니다');
				});
			})
			
			// ajax로 해당 게시글에 딸린 댓글 목록 조회
			function selectReplyList(){
				$.ajax({
					url:"rlist.po",
					data:{pno:<%=p.getPostNo()%>},
					success:function(list){
						
						console.log(list);
						let result = "";
						for(let i=0; i<list.length; i++) {
							result += "<input type='hidden' id='reportRno' name='reportRno' value='" + list[i].replyNo + "'>"
							       + "<input type='hidden' id='reportRmem' name='reportRmem' value='" + list[i].writerNo + "'>"
					               + "<tr><th width='70'>" + list[i].replyWriter + "</th>"
					               + "<td width='800'>" + list[i].replyContent + "</td>"
					               + "<td width='50'><a>수정</a></td>"
					               + "<td width='50'><button class='btn btn-sm btn-danger'>삭제</button></td></tr><td></td>"   
					               + "<td style='font-size:smaller'>" + list[i].replyEnroll + "</td>"
					               + "<td colspan='2' align='right'><button class='btn btn-sm btn-warning' data-toggle='modal' data-target='#reportReplyModal'>신고</button></td>"
								   +  "<tr><td colspan='4' height='20'></td></tr>"				   
						}
						
						$(".comment-view tbody").html(result);					
						
					},error:function(){
						console.log("댓글목록조회 ajax통신 실패");
					}
				})
					
				
			}
			
		</script>
</body>
</html>