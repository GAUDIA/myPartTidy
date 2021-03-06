<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.TidyGames.report.model.vo.Report, com.TidyGames.common.model.vo.*"%>
<!DOCTYPE html>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int listCount = pi.getListCount();
	 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
		box-sizing: border-box;
		color:white;
		/* border: 1px solid rgba(255, 255, 255, 0.555); */
	}
	#outer{
        width:1500px;
        /* height:1500px; */
        margin:auto;
    }
    #outer>div{float:left;}
    #line_1{
        width:100%;
        height:2px;
        background: rgba(255, 255, 255, 0.555);
    }
    #intro{
        font-size: 33px;
        font-weight: 900;
        color :white;
        margin: 25px 80px 0px 45px;
    }
    #line_3{
        width:165px;
        height:3px;
        background: rgba(255, 255, 255, 0.555);
        margin: 8px 0px 0px 45px;
    }
    #box{
    	width:1290px;	
    	/* border:1px solid rgba(255, 255, 255, 0.222); */
        /* height: */
        
    }
    #tableBox{
        width:1250px;
        height:700px;
        /* margin-left:145px; */
        margin: 30px 0px 100px 45px;
        background-color: rgb(197, 197, 197); 
        border: 10px solid rgba(255, 255, 255, 0.555);
    }
    #tableTop div{
        float:left;
        /* width:400px; */
        /* border:1px solid white; */
    }
    #leftTop{   
        margin:20px;
        margin: 50px 20px 20px 20px;
        /* margin-left:80px; */
    }
    #leftTop span{
        font-size:25px;
        font-weight: bolder;
        color:black;
        margin: 0px 50px 0px 40px;
    }
    #rightTop{
        margin: 55px 20px 20px 500px;
    }
    #table{
        margin:auto;
        width:1100px;
        /* background-color: gray; */
    }
    #table *{
        height:15px;
    }
    #table th{font-size:18px;}
    #table td{padding:5px;}
    #btn{
    padding: 0px;
    margin: 0px;
    width: 78px;
    height: 30px;
    font-size: 14px;
    }
    #checkBox{
        width:20px;
        height:20px;
        margin-top:3px;
    }
    #blacklist{
        color:orange;
    }
    #table a{
        color:black;
    }
    #tableOut1{
        width:100%;
        height:92%;
    }
    #tableOut2{
        width:100%;
        height:8%;
    }

</style>
</head>
<body style="background:#0e332c;">

    <%@ include file="../common/topbar.jsp"%>
    <%@ include file="../common/navibar.jsp"%>
    
    
    <div id="outer">
        <div id="line_1"></div>
        <div>
            <%@ include file="../common/adminSidebar.jsp" %>
        </div>
        
        <div id="box">
            <div id="intro">???????????????</div>
            <div id="line_3"></div>
            
      
    	    <div id="tableBox">
                <div id="tableTop">
                    <div id="leftTop">
                        <div>
                            <span>??????????????? ??????</span>
                        </div>
                    </div>
                    <div id="rightTop">
                        <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-dark" disabled>?????? ID</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" disabled>
                                <span class="caret"></span>
                                </button>
                                <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">?????????</a>
                                </div>
                        </div>

                        <div>
                            <input type="text" id="selectKeyword" name="keyword" placeholder="????????? ?????? ??????">
                        </div>
                        <button class="btn btn-sm btn-dark" onclick="" >??????</button>
                    </div>
                </div>
                <div id="tableOut1">
                <table id="table" class="table table-hover">
                    <thead>
                        <tr align="center">
                            <th width="30">No.</th>
                            <th width="100">?????????</th>
                            <th width="130">?????????</th>
                            <th width="170">?????? ??????</th>
                            <th width="130">?????????</th>
                            <th width="100">??????</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        	<!-- if -->
                        <% for(Report r : list) { %>
	                        <tr align="center">
	                            <td width="30"><%= r.getReportNo() %></td>
	                            <td><%= r.getReportedName() %></td>
	                            <td><a><%= r.getReported() %></a></td>
	                            <td>
	                            	<% if(r.getEtc() != null) { %>
	                            		<%= r.getEtc() %>
	                            	<% }else { %>
	                            		<%= r.getReportSort() %>
	                            	<% } %>
	                            </td>
	                            <td><%= r.getReportDate() %></td>
	                            <td style="padding:4px">
	                              <button onclick="unblock();" id="btn" class="btn btn-outline-dark">?????? ??????</button>
	                            </td>
	                        </tr>
                        <% } %>

                    </tbody>
                  </table>
                </div>

                <div id="tableOut2">
                    
	                <% if(!list.isEmpty()) { %>
	                    <div class="paging-area" align="center">
	                        <!-- ??? ?????????????????? ???????????? ???????????? -->
	 						<% if(currentPage != 1) { %>
	            				<button onclick="location.href='<%=contextPath%>/blacklist.re?cpage=<%=currentPage-1%>';"> &lt; </button>
	           				 <% } %>
	                        
	                        <% for(int p=startPage; p<=endPage; p++) { %>
	                        <!-- ????????? ?????? ????????? ?????? ??????????????? ?????? ?????? ?????????  -->
	                            <% if(p == currentPage) { %>
	                                <button disabled><%= p %></button>
	                            <% }else { %>
	                                <button onclick="location.href='<%= contextPath %>/blacklist.re?cpage=<%= p %>';"><%= p %></button>
	                            <% } %>
	                        <% } %>
	                        
	                        <% if(currentPage != maxPage) { %>
	                            <button onclick="loaction.href='<%= contextPath %>/blacklist.re?cpage<%=currentPage+1%>';"> &gt; </button>
	                            <!-- ?????? ???????????? ????????? ???????????? ??? ???????????? ?????? ???????????? -->
	                        <% } %>
	                    <% } %>
                    </div>

                </div>
                
                </div>
                
            </div>


        <footer>
            <div style="height:100px">
    
            </div>
        </footer>
    
    </div>

	<script>
        function unblock(){
        	
            if(confirm("?????? ????????? ????????? ?????????????????????????")) {
                
            	$("#table>tbody>tr").click(function(){
    	          location.href='<%= contextPath %>/unblock.re?user=' + $(this).children().eq(2).text();
            	})
            }
        }

	</script>


</body>
</html>