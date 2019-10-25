<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<!-- Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- collabo/detail.css -->
<link href="${path }/resources/css/collabo/detail.css?ver=1.1" rel="stylesheet"/>
<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<section class="container-fluid" id="content">
	<div class="row collabo-header" >
		<span style="font-size:18px;color:white;font-weight:bold;">대충 트렐로 메뉴</span>
	</div>
	<div class="board" >
		<c:if test="${loginMember != null}">
			<c:if test="${collaboLists != null}">
				<c:forEach items="${collaboLists }" var="list">
					<div class="list-wrapper">
						<div class="list-content">
							<div class="list-header">
								${list.title }
								<button type="button" class="fa fa-align-justify btn-menu" onclick=""></button>
							</div>
						<div id="${list.listNo }" name="listNo_${list.listNo }" class="list-cards"  ondrop="cardDrop(this,event)" ondragover="return false;">
							<c:if test="${collaboCards != null }">
								<c:forEach items="${collaboCards }" var="card">
									<c:if test="${list.listNo == card.listNo }">
										<div id="${card.cardNo }" name="cardNo_${card.cardNo }" class="list-card" ondrop="return false;" draggable="true" ondragstart="cardDrag(this,event)">
											<span class="card-content">
												${card.content }
											</span>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
						<div class="open-card" >
							<span onclick="requestCreateCard(this);" class="fa fa-plus btn-createCard" >Add another card</span>
						</div>
					</div>
				</div> 
				</c:forEach>
			</c:if>
		
				
		
		<!-- Add another list -->
		<div class="list-wrapper" >
			<div class="list-content" >
			
				<div class="dropdown div-drop" >
					<button class="dropdown btn-addList" type="button" onclick='$("#listTitle").val(" ");' name="btn_addList"  data-toggle="dropdown" >
						<span class="fa fa-plus" >Add another list</span>
					</button>
					<div class="dropdown-menu">
						<input type="text" id="listTitle" class="dropdown-item" placeholder="Input List Name"/>
						<Button class="btn-createList dropdown-item" type="button" name="btn_cList" onclick="requestCreateList();" >Create</Button>
					</div>
				</div>
				
			</div>
		</div>
		</c:if>
		<!-- END  -->
	</div>
</section>
<script>
var userId =  "${loginMember.id}";
var collaboNo = 1;
let sock = new SockJS("<c:url value="/collabo/soc"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

sock.onopen = function(){
	var sendData ={
		type : "connect",
		userId : userId,
		collaboNo : collaboNo
	};
	sendMessage(sendData);
}

// 메시지 전송
function sendMessage(sendData) {
/* 	var sendData = {
		type : type,
		userId : userId,
		method : method,
		collaboNo : collaboNo,
		content : content,
		listNo : listNo,
		cardNo : cardNo
	}; */
	var jsonData = JSON.stringify(sendData);
    sock.send(jsonData);
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
      var receive = JSON.parse(msg.data);
      console.log(receive);
      if(receive.type == 'list'){
    	  if(receive.method == 'create'){
    		  responseCreateList(receive);
    	  }
      }
      if(receive.type== 'card'){
    	  if(receive.method == 'create'){
    		  responseCreateCard(receive);
    	  }
      }
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
      
}	
</script>

<script> 
function createWrapper(ele){
	var wrapper=$("<div/>");
	wrapper.attr("class","list-wrapper");
	
	var content=$("<div/>");
	content.attr("class","list-content");
	
	var dropdiv=$("<div/>");
	dropdiv.attr("class","dropdown div-drop");
	
	var btndrop=$("<button/>");
	btndrop.attr("class","dropdown btn-addList");
	btndrop.attr("type","button");
	btndrop.attr("onclick",'$("#listTitle").val(" ");');
	btndrop.attr("name","btn_addList");
	btndrop.attr("data-toggle","dropdown");
	
	var faplus =$("<span/>");
	faplus.text("Add another list");
	faplus.attr("class","fa fa-plus");
	
	btndrop.append(faplus);
	dropdiv.append(btndrop);
	
	var dropmenu=$("<div/>");
	dropmenu.attr("class","dropdown-menu");
	dropdiv.append(dropmenu);
	
	var listTitle = $("<input/>");
	listTitle.attr("class","dropdown-item");
	listTitle.attr("type","text");
	listTitle.attr("id","listTitle");
	listTitle.attr("placeholder","Input List Name");
	
	dropmenu.append(listTitle);
	
	var btncList = $("<button/>");
	btncList.text("Create");
	btncList.attr("class","btn-createList dropdown-item");
	btncList.attr("type","button");
	btncList.attr("name","btn_cList");
	btncList.attr("onclick","requestCreateList();");
	
	dropmenu.append(btncList);
	
	content.append(dropdiv);
	
	wrapper.append(content);
	
	ele.append(wrapper);
}



function responseCreateCard(receive){
	var listCards = $('div[name=listNo_'+receive.listNo+']');
	
	
	var card = $('<div/>');
	var content = $('<span/>');
	content.text(receive.content);
	
	card.attr("class","list-card");
	card.attr("ondrop","return false");
	card.attr("draggable","true");
	card.attr("ondragstart","cardDrag(this,event)");
	card.attr("id",receive.cardNo);
	card.attr("name","cardNo_"+receive.cardNo);
	
	content.attr("class","card-content");
	
	card.append(content);
	listCards.append(card);
}
function requestCreateCard(ele){
	var content = prompt("Card's Title ? ");
	var listNo = $(ele).parent().parent().children('.list-cards').attr('id');
	if(content!=''){
		var sendData = {
				type : "card",
				method : "create",
				content : content,
				userId : userId,
				collaboNo : collaboNo,
				listNo : listNo
		};
		sendMessage(sendData);
	}
}

function requestCreateList(){
	var listTitle= $("#listTitle").val();
	if(listTitle!=''){
	
		var sendData = {
			type : "list",
			method : "create",
			content : listTitle,
			userId : userId,
			collaboNo : collaboNo
		};
		sendMessage(sendData);
	}
}

function responseCreateList(receive){
		var content = $("button[name=btn_cList]").parent().parent().parent();
		var board = content.parent().parent();
		content.empty();
		
		var listHeader = $('<div/>');
		listHeader.attr("class","list-header");
	
		var btnMenu = $('<button>');
		btnMenu.attr("type","button");
		btnMenu.attr("class","fa fa-align-justify btn-menu");
		
		
		var listCards = $('<div/>');
		listCards.attr("class","list-cards");
		listCards.attr("ondrop","cardDrop(this,event)");
		listCards.attr("ondragover","return false;");
		listCards.attr("name","listNo_"+receive.listNo);
		listCards.attr("id",receive.listNo);
		
		var openCard = $('<div/>');
		openCard.attr("class","open-card");
	
		var faplus = $('<span/>');
		faplus.text("Add another card");
		faplus.attr("onclick","requestCreateCard(this);");
		faplus.attr("class","fa fa-plus");
	
		openCard.append(faplus);
		
		listHeader.append(receive.content);
		listHeader.append(btnMenu);
		
		content.append(listHeader);
		content.append(listCards);
		content.append(openCard);
		
		createWrapper(board);
	
}
function requestMoveCard(){
	var 
}


function allowDrop(ev) {
	  ev.preventDefault();
	}

function cardDrag(element, ev) {
  ev.dataTransfer.setData("text",element.id);
  console.log(element.id);
}

function cardDrop(element, ev) {
	console.log(element.id);
	 var id = ev.dataTransfer.getData("text");
	 element.appendChild(document.getElementById(id));
	 ev.preventDefault();
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
