<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
	
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<h2>메세지</h2>

<!-- 전체 메세지 컨테이너 -->
<div id="massageContainer">
<input type="hidden" id="name" value="${userInfo.name}">
<ul class="nav nav-tabs">
  <li class="nav-item" style="color:black">
    <a class="nav-link active" style="color:black" data-toggle="tab" aria-current="page" href="#receive">받은 메세지</a>
  </li>
  <li class="nav-item" style="color:black">
    <a class="nav-link" style="color:black" data-toggle="tab" href="#send">보낸 메세지</a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane fade show active" id="receive">
  	<p>받은 메세지</p>
  	
	<table id="receiveList">
		<tr>
			<td>from</td>
			<td>to</td>
			<td>send time</td>
			<td>content</td>
			<td>reply</td>
			<td>delete</td>			
		</tr>
	
	</table>
    
  </div>
  <div class="tab-pane fade" id="send">
    <p>보낸 메세지</p>
    <table id="sendList">
		<tr>
			<td>from</td>
			<td>to</td>
			<td>send time</td>
			<td>content</td>
			<td>delete</td>		
		</tr>
	
	</table>
  </div>
</div>
	
</div>

</body>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">
	const FirstMessageList = function(){
		let name = $('#name').val(); 
		
		$.ajax({
			type:"GET",	
			url:"${context}/messenger/receiveList",
			data:{
				"name":name
			},
			dateType:JSON,
			success : function(data){
				console.log('연결 성공');
				let receiveList = document.getElementById('receiveList');
				for(let i=0;i<data.length;i++){
					let tr = $('<tr></tr>').appendTo(receiveList);
					$('<td></td>').html(data[i].senderName).appendTo(tr);
					$('<td></td>').html(data[i].receiverName).appendTo(tr);
					$('<td></td>').html(data[i].sendTime).appendTo(tr);
					$('<td></td>').html(data[i].messageContent).appendTo(tr);
					$('<td></td>').html('<button class="sendMessageBtn" type="button" value="'+data[i].messageNum+'">답장</button>').appendTo(tr);
					$('<td></td>').html('<button class="deleteReceiveMessageBtn" type="button" value="'+data[i].messageNum+'">삭제</button>').appendTo(tr);
					
				}
				$('.sendMessageBtn').on({
			        "click" : function(){
			        	let num = $(this).val();
			        	
			        	let url = "${context}/message/sendForm/"+num;
			        	window.open(url,'_blank_1','toolbar=no, menubar=no,scrollbars=yes, resizeable=no, width=450, height=200'); 
			        }
				});
				
				
				$('.deleteReceiveMessageBtn').on({
					"click" : function(){
						let num = $(this).val();
						let cc = confirm('삭제하시겠습니까?');
						if(cc){
							
							$.ajax({
								type:"GET",
								url:"${context}/messenger/deleteReceiveBoxMessage",
								data:{
									"messageNum":num
								},
								dateType:JSON,
								success:function(data){
									alert('삭제되었습니다.');
								}
								
							});
							
							
							
						}
						window.location.reload();
						
					}
				});
			
				
				
			}
			
		});
	}
	
	const sendMessageList= function(){
		let name = $('#name').val(); 
		$.ajax({
			type:"GET",	
			url:"${context}/messenger/sendList",
			data:{
				"name":name
			},
			dateType:JSON,
			success : function(data){
				console.log('연결 성공');
				
				let sendList = document.getElementById('sendList');
				for(let i=0;i<data.length;i++){
					let tr = $('<tr></tr>').appendTo(sendList);
					$('<td></td>').html(data[i].senderName).appendTo(tr);
					$('<td></td>').html(data[i].receiverName).appendTo(tr);
					$('<td></td>').html(data[i].sendTime).appendTo(tr);
					$('<td></td>').html(data[i].messageContent).appendTo(tr);
					$('<td></td>').html('<button class="deleteSendMessageBtn" type="button" value="'+data[i].messageNum+'">삭제</button>').appendTo(tr);
				}
				
				$('.deleteSendMessageBtn').on({
					"click" : function(){
						let num = $(this).val();
						let cc = confirm('삭제하시겠습니까?');
						if(cc){
							
							$.ajax({
								type:"GET",
								url:"${context}/messenger/deleteSendBoxMessage",
								data:{
									"messageNum":num
								},
								dateType:JSON,
								success:function(data){
									alert('삭제되었습니다.');
								}
								
							});
							
							
							
						}
						window.location.reload();
						
					}
				});
				
				
				
				
			}
			
		});
	}
	
	
	$(document).ready(function(){
		// 메세지 리스트 리로드
		FirstMessageList();
		sendMessageList();
		
	});

	

	

</script>
</html>