<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.TidyGames.company.model.vo.Company" %>
<%
	ArrayList<Company> list = (ArrayList<Company>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#listco{color:orange;}
	div{
        box-sizing: border-box;
    }
    #outer{
        width:1500px;
        margin:auto;
        color:white;
    }
    #outer>div{
        float:left;
    }
    #line_1{
        width:100%;
        height:2px;
        background: rgba(255, 255, 255, 0.555);
    }
	#list-area{
		width:1000px;
		margin-top:50px;
		margin-left:150px;
	}

	td{text-align:center;}
	table {
		text-align:center;
		valign:middle;
	}
	#tbl{
		color:white;
	}
	#tbl>tbody>tr:hover{
        background:lightgrey;
    	color:black;
    	opacity:0.9;
    	cursor:pointer;
    }
     .paging-area button{
    	border:none;
    }
	#searchbtn{color:white; background:#0e332c; border:none;}
</style>
</head>
<body style="background-color: #0e332c;">

	<%@ include file="../common/topbar.jsp"%>
    <%@ include file="../common/navibar.jsp"%>

	<div id="outer">
		<div id="line_1"></div>
        <div>
            <%@ include file="../common/adminSidebar.jsp" %>
        </div>
	
		<div id="list-area">
		    <h2>게임사 목록 조회</h2>
		    <br>
		    <h6>* 클릭시 상세조회 창으로 넘어갑니다</h6>
		    <br>
		    <form action="">
	            <table class="table table-sm table-bordered" id="tbl">
	                <thead>
	                	<th width="60">No</th>
	                    <th>게임사</th>
	                    <th>아이디</th>
	                    <th>등록코드</th>
	                    <th>등록일자</th>
	                </thead>
	                <tbody>
	                	<% if(list.isEmpty()) { %>
		                    <tr>    
		                        <td colspan="5">조회된 게시글이 없습니다.</td>
		                    </tr>
	                    <% }else { %>
	                    	<% for(Company c : list) { %>
			                    <tr>	
			                    	<td><%=c.getCompanyNo()%></td>
			                        <td><%=c.getCompanyName()%></td>
			                        <td><%=c.getCompanyId()%></td>
			                        <td><%=c.getCompanyPwd()%></td>
			                        <td><%=c.getCompanyEnroll()%></td>
			                    </tr>
	                    	<% } %>
	                    <% } %>
	                </tbody>
	            </table>
		
		    </form>
		
		    <br><br><br>
		
		    <div class="paging-area" align="center">
		
		        <button> &lt; </button>
		        <button>1</button>
		        <button>2</button>
		        <button>3</button>
		        <button>4</button>
		        <button>5</button>
		        <button>6</button>
		        <button>7</button>
		        <button>8</button>
		        <button>9</button>
		        <button>10</button>
		        <button> &gt; </button>
		
		    </div>
		    
		    <br><br>
		    
			<div class="search-area" align="center">
				<form>
					<input type="text" style="width:500px; height:30px;" placeholder="게임사 검색">
				    <button type="submit" id="searchbtn"><i class="fas fa-search"></i></button>			
				</form>
			</div>
		</div>

	</div>
	
	<script>
		$(function(){
			$(".list-area>tbody>tr").click(function(){
				//현재 필요한 글 번호를 num변수에 담음
				const num = $(this).children().eq(0).text();
				
				
				console.log(num);
				
				// 요청할url?키=밸류&키=밸류...(네이버검색창에서확인)
				// 요청시전달값(키=밸류 행렬) == 쿼리스트링
				// * num안의 숫자를 넘길 때 쿼리스트링 직접 제시해주면 된다
				
				// /jsp/detail.no?키(num)=밸류(클릭한글번호가담긴변수)
				// num 변수는 문자열로 쓰면 안됨!! 변수를 가리켜야 함 (주의)
				location.href = '<%=contextPath%>/detail.no?num=' + num;
				// href로 요청하는 것은 GET방식!이라고 보면 된다
			})
		})
	</script>
	
	
</body>
</html>