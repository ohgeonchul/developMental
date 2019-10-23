<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="pageTitle" value="admin test"/>
</jsp:include>
<style>
	table#table{  
		margin:0 auto;
		width:50%;
	}
</style>

<section id="content">
	<table class="table">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">계정상태</th>
			<th scope="col">회원번호</th>
			<th scope="col">아이디</th>
			<th scope="col">회원명</th>
			<th scope="col">닉네임</th>
			<th scope="col">이메일</th>
			<th scope="col">주소</th>
			<th scope="col">전화번호</th>
			<th scope="col">SNS</th>
			<th scope="col">신고카운트</th>
		</tr>
		<c:forEach items="${list }" var="m" varStatus="s">
		<tr>
			<td>${s.count }</td>
			<td>
				<!-- status가 1이면 이용가능(Y), 0이면 이용 불가 -->
				<c:if test="${m.status==1}">
					<input type="radio" name="${m.id }_status" value="Y" checked/>Y
					<input type="radio" name="${m.id }_status" value="N"/>N
				</c:if>
				<c:if test="${m.status==0}">
					<input type="radio" name="${m.id }_status" value="Y"/>Y
					<input type="radio" name="${m.id }_status" value="N" checked/>N
				</c:if>
			</td>
			<td>${m.no }</td>
			<td>${m.id }</td>
			<td>${m.name}</td>
			<td>${m.nickName }</td>
			<td>${m.email }</td>
			<td>${m.addr }</td>
			<td>${m.tel }</td>
			<td>${m.sns }</td>
			<td>${m.rmessage }</td>
			<td>
				<button type="button" name="btn_s" class="btn btn-outline-secondary" >회원 상태변경</button>
			</td>
			<td>
				<button type="button" name="btn_d" class="btn btn-outline-secondary" >삭제</button>
			</td>
			<td>
				<button type="button" name="btn_v" class="btn btn-outline-secondary" >정보 열람</button>
			</td>
		</tr>
	
		</c:forEach>
	</table>
	<script>
 	$("button[name=btn_s]").click(function(){
		var tr = $(this).parent().parent();
		var td = tr.children();
		
		var no = td.eq(2).text();
		var status=td.eq(1).children().prop("checked")?1:0;
		
 		if(status==1){
 			confirm("계정을 활성화 합니다.")
 			if(confirm){
				location.href="${pageContext.request.contextPath}/admin/statusUpdate?no="+no+"&status="+status;
 			}
 		}else if(status==0){
 			confirm("계정을 비활성화 합니다.")
 			if(confirm){
 				location.href="${pageContext.request.contextPath}/admin/statusUpdate?no="+no+"&status="+status;
 			}
 		}else{
 			alert("오류! 관리자에게 문의하세요");
 		}
	}); 
 	
	$("button[name=btn_d]").click(function(){
		var tr = $(this).parent().parent();
		var td = tr.children();
		
		var id=td.eq(3).text();
		confirm("삭제된 계정정보는 복구되지 않습니다. 정말로 삭제합니까?")
		if(confirm){
			location.href="${pageContext.request.contextPath}/admin/memberDelete?id="+id;
		}
	});
	
	$("button[name=btn_v]").click(function(){
		var tr = $(this).parent().parent();
		var td = tr.children();
		
		var id = td.eq(3).text();
		confirm("회원정보는 열람만 가능하며 수정할 수 없습니다.")
		if(confirm){
			location.href="${pageContext.request.contextPath}/admin/memberView?id="+id;
		}
	});
	
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</section>
