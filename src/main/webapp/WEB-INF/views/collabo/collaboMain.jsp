<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="This is Very Nice Tools!"/>
</jsp:include>

<div class="container" style="margin-top:110px;margin-bottom:130px;">
	<div class="row">
		<div class="col-3">
			<div class="card" style="width:300px;height:215px;">
				<div class="card-body">
					<h4 class="card-title">이것은 카드입니다.</h4>
					<hr/>
					<div class="card-text" style="margin-top:35px;">
						<h5>참여자</h5>
						<div style="margin-top:15px;">
						testuser1 testuser1 testuser1<br/>
						testuser1 testuser1 testuser1
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
			<div class="col-3">
			<div class="card" style="width:300px;height:215px;">
				<div class="card-body">
					<h4 class="card-title">이것은 카드입니다.</h4>
					<hr/>
					<div class="card-text" style="margin-top:35px;">
						<h5>참여자</h5>
						<div style="margin-top:15px;">
						testuser1 testuser1 testuser1<br/>
						testuser1 testuser1 testuser1
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
			<div class="col-3">
			<div class="card" style="width:300px;height:215px;">
				<div class="card-body">
					<h4 class="card-title">이것은 카드입니다.</h4>
					<hr/>
					<div class="card-text" style="margin-top:35px;">
						<h5>참여자</h5>
						<div style="margin-top:15px;">
						testuser1 testuser1 testuser1<br/>
						testuser1 testuser1 testuser1
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
</div>
</div>
<script>
$(".card").attr("onclick","alert('test')");

</script>
<style>
	.card:hover{
		background-color:#E0E0E0;
	}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
