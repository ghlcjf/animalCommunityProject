<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>메세지</h2>

<div>
<input type="hidden" value="<c:out value='${userInfo.name }'/>" id="sessionName"/>
<span id="recMs" name="recMs" style="float:right;cursor:pointer;margin-right:10px;color:pink;">
<img src="/imageFolder/image/msgicon.png" style="width:15px;">
</span>
</div>


</body>

<script type="text/javascript">
let socket = null;
let sock = new SockJS("/echo");
socket =sock;
$(document).ready(function(){
    if(!isEmpty($("#sessionName").val()))
            connectWS();
});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
 
    function connectWS(){
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onmessage = function(e){
            var splitdata =e.data.split(":");
            if(splitdata[0].indexOf("recMs") > -1)
                $("#recMs").append("["+splitdata[1]+"통의 쪽지가 왔습니다.]");
            else
                $("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
//              setTimeout(function(){conntectWs();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
    }
    
    $("#board1").click(function(){
        location.href="/board/main_board.do";
    });
 
$("#chatForm").submit(function(event){
        event.preventDefault();
            sock.send($("#message").val());
            $("#message").val('').focus();    
    });    
</script>





</html>