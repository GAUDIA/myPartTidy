<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.TidyGames.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	Member searchId = (Member)session.getAttribute("searchId");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, input, span{
        box-sizing: border-box;
    }
    .outer{
        width: 1500px;
        height: 800px;
        background-color: #0e332c;
        margin: auto;
        margin-top: 50px;
    }
    #logo>*:hover{
        text-decoration: none;
    }
    #content{
        width: 600px;
        height: 600px;
        background-color: rgba(255, 255, 255, 0.5);
        margin: auto;
        margin-top: 50px;
        border-radius: 100px;
        position: relative;
    }
    #find_id_form{
        width: 80%;
        height: 70%;
        position: absolute;
        margin: auto;
        top: 0px;
        bottom: 0px;
        left: 0px;
        right: 0px;        
    }
    .search_user>*{
        margin-bottom: 5px;
    }
    .search_user>div{
        width:20%;
        float: left;
        color: white;
        font-size: 15px;
        font-weight: bold;
    }
    .next_btn{
        width: 70px;
        height: 35px;
        border-radius: 10px;
        background-color: #0e332c;
        border: none;
        color: white;
        font-weight: bold;
        font-size: 14px;
        margin-top: 80px;
    }
    .code_btn{
        width: 25%; 
        height: 30px;
        border-radius: 5px;
        background-color: #0e332c;
        border: none;
        color: white;
        font-weight: bold;
        font-size: 14px;
    }

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #0e332c;">

	<% if(alertMsg != null){  %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
	
    <div class="outer">
        <header>
            <div id="logo" align="center">
                <a href="<%= contextPath %>">
                    <img src="<%=contextPath%>/resources/image/tidyLogo.png" style="width:80px; height: 50px;"> <br>
                    <span style="color: white; font-size: 25px; font-weight: bold;">TIDY GAMES</span>
                </a>
            </div>
        </header>

        <content>
            <div id="content" align="center">
                <form action="<%= contextPath %>/searchId.me" method="post">
                    <div id="find_id_form">
                        <span style="color: white; font-size: 20px; font-weight: bold;">????????? ??????</span>
                        <br><br><hr>

                        <div align="left">
                            <span style="color: white; font-size: 15px; font-weight: bold;">
                                ??? ???????????? ?????? ??????<br>
                            </span>
                            <span style="color: lightgray; font-size: 15px;">
                                ????????? ????????? ????????? ????????? ????????? ??????????????????.
                            </span>
                        </div>
                        <br><br>

                        <div align="left" class="search_user">
                            <div>??????</div>
                            <input type="text" name="searchName" id="name" style="width: 80%;" required>
                            <br>
                            <div>????????? ??????</div>
                            <input type="email" name="searchEmail" id="email" style="width: 80%;" required>
                        </div>
                        <br><br><br>

                        <button type="submit" class="next_btn">??????</button>

                    </div>
                </form>
                <script>
                    
                </script>
            </div>
        </content>
    </div>
</body>
</html>