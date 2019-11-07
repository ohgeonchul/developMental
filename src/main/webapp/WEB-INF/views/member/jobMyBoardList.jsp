<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

  <style>
/* CSS used here will be applied after bootstrap.css */

body{ margin-top:50px;}
.nav-tabs .glyphicon:not(.no-margin) { margin-right:10px; }
.tab-pane .list-group-item:first-child {border-top-right-radius: 0px;border-top-left-radius: 0px;}
.tab-pane .list-group-item:last-child {border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;}
.tab-pane .list-group .checkbox { display: inline-block;margin: 0px; }
.tab-pane .list-group input[type="checkbox"]{ margin-top: 2px; }
.tab-pane .list-group .glyphicon { margin-right:5px; }
.tab-pane .list-group .glyphicon:hover { color:#FFBC00; }
a.list-group-item.read { color: #222;background-color: #F3F3F3; }
hr { margin-top: 5px;margin-bottom: 10px; }
.nav-pills>li>a {padding: 5px 10px;}

.ad { padding: 5px;background: #F5F5F5;color: #222;font-size: 80%;border: 1px solid #E5E5E5; }
.ad a.title {color: #15C;text-decoration: none;font-weight: bold;font-size: 110%;}
.ad a.url {color: #093;text-decoration: none;}

    .w-0{ width: 0%;}
    .w-5{ width: 5%;}
    .w-10{ width: 10%;}
    .w-25{ width: 25%;}
    .w-30{ width: 30%;}
    .w-40{ width: 40%;}
    .w-45{ width: 45%;}
  </style>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>


    
    
    <div id="main-container">
      <div class="py-4 col-lg-10 container submenu-container">

        <div class="card card-fluid" id="job-listings">

          <div class="card-header my-0 py-0 px-0">
            <!-- <a href="${path}"><img src="${path}/resources/images/home.png" alt=""></a> -->
            <div class="d-flex align-items-center p-3 my-0 text-white w-100 bg-dark rounded">
              <i class="fa fa-briefcase text-white mr-3 my-2" style="font-size:42px;"></i>
               <div class="lh-100 ml-2">
                <p class="h3 mb-0 text-white lh-100">나의 게시판</p><br>
                <!-- <button class="btn btn-light" style="border-radius: 10px;">
                  <p class="h5 mb-0 text-dark lh-100">내가 쓴 구인구직 게시판</p>
                  <small><i class="fa fa-globe"></i> 국내/해외취업을 선택할 수 있습니다.</small>
                </button>
                <button class="btn btn-light" style="border-radius: 10px;">
                    <p class="h5 mb-0 text-dark lh-100">내가 쓴 스터디 게시판</p>
                    <small><i class="fa fa-book"></i> 스터디그룹을 구하세요! </small>
                </button>
                <button class="btn btn-light" style="border-radius: 10px;">
                    <p class="h5 mb-0 text-dark lh-100">자유 게시판</p>
                    <small><i class="fa fa-code"></i> 자유롭게 게시글을 작성해보세요 </small>
                </button> -->
              </div>
            </div>
          </div>

          <div class="card-body">
              <div class="container">
                  <!-- <div class="row">
                      <div class="col-md-3 col-lg-2">
                          <div class="btn-group">
                              <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Mail<span class="caret"></span>
                              </button>
                              <ul class="dropdown-menu" role="menu">
                                  <li class="dropdown-item"><a href="#">Mail</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">Contacts</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">Tasks</a>
                                  </li>
                              </ul>
                          </div>
                      </div>
                      <div class="col-md-9 col-lg-10">
                         
                          <div class="btn-group">
                              <button type="button" class="btn btn-secondary">
                                  <div class="form-check" style="margin: 0;">
                                      <label>
                                          <input type="checkbox">
                                      </label>
                                  </div>
                              </button>
                              <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span><span class="sr-only">Toggle Dropdown</span>
                              </button>
                              <ul class="dropdown-menu" role="menu">
                                  <li class="dropdown-item"><a href="#">All</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">None</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">Read</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">Unread</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">Starred</a>
                                  </li>
                                  <li class="dropdown-item"><a href="#">Unstarred</a>
                                  </li>
                              </ul>
                          </div>
                          <button type="button" class="btn btn-secondary" data-toggle="tooltip"
                          title="Refresh">&#xA0;&#xA0;&#xA0;<span class="glyphicon glyphicon-refresh"></span>&#xA0;&#xA0;&#xA0;</button>
                          
                          <div class="btn-group">
                              <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span>
                              </button>
                              <ul class="dropdown-menu" role="menu">
                                  <li class="dropdown-item"><a href="#">Mark all as read</a>
                                  </li>
                                  <li class="divider dropdown-item"></li>
                                  <li class="text-center dropdown-item"><small class="text-muted">Select messages to see more actions</small>
                                  </li>
                              </ul>
                          </div>
                          <div class="float-right"> <span class="text-muted"><b>1</b>&#x2013;<b>50</b> of <b>160</b></span>
                              <div
                              class="btn-group btn-group-sm">
                                  <button type="button" class="btn btn-secondary"> <span class="glyphicon glyphicon-chevron-left"></span>
                                  </button>
                                  <button type="button" class="btn btn-secondary"> <span class="glyphicon glyphicon-chevron-right"></span>
                                  </button>
                          </div>
                      </div>
                  </div>
              </div> -->
              <hr>
              <div class="row">
                  <div class="col-md-3 col-lg-2"> 
                    <!-- <a href="#" class="btn btn-danger btn-sm btn-block" role="button"><i class="glyphicon glyphicon-edit"></i> Compose</a> -->
                      <!-- <hr> -->
                      <ul class="nav nav-pills flex-column">
                          <li class="active nav-item"><a href="#" class="nav-link"><span class="badge float-right">32</span> Inbox </a>
                          </li>
                          <li class="nav-item"><a href="#" class="nav-link">Starred</a>
                          </li>
                          <li class="nav-item"><a href="#" class="nav-link">Important</a>
                          </li>
                          <li class="nav-item"><a href="#" class="nav-link">Sent Mail</a>
                          </li>
                          <li class="nav-item"><a href="#" class="nav-link"><span class="badge float-right">3</span>Drafts</a>
                          </li>
                      </ul>
                  </div>
                  <div class="col-md-9 col-lg-10">
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs">
                          <li class="active nav-item"><a href="#home" data-toggle="tab" class="nav-link"><span class="glyphicon glyphicon-inbox">
              
                                  </span>Primary</a>
                          </li>
                          <li class="nav-item"><a href="#profile" data-toggle="tab" class="nav-link"><span class="glyphicon glyphicon-user"></span>
              
                                      Social</a>
                          </li>
                          <li class="nav-item"><a href="#messages" data-toggle="tab" class="nav-link"><span class="glyphicon glyphicon-tags"></span>
              
                                      Promotions</a>
                          </li>
                          <li class="nav-item"><a href="#settings" data-toggle="tab" class="nav-link"><span class="glyphicon glyphicon-plus no-margin">
              
                                  </span></a>
                          </li>
                      </ul>
                      <!-- Tab panes -->
                      <div class="tab-content">
                          <div class="tab-pane fade in active" id="home">
                              <div class="list-group"> <a href="#" class="list-group-item">
              
                                              <div class="form-check">
              
                                                  <label>
              
                                                      <input type="checkbox">
              
                                                  </label>
              
                                              </div>
              
                                              <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
              
                                                  display: inline-block;">Mark Otto</span> <span class="">Nice work on the lastest version</span>
              
                                              <span class="text-muted" style="font-size: 11px;">- More content here</span> <span class="badge">12:10 AM</span> <span class="float-right"><span class="glyphicon glyphicon-paperclip">
              
                                                  </span></span></a><a href="#" class="list-group-item">
              
                                                      <div class="form-check">
              
                                                          <label>
              
                                                              <input type="checkbox">
              
                                                          </label>
              
                                                      </div>
              
                                                      <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
              
                                                          display: inline-block;">Jason Markus</span> <span class="">This is big title</span>
              
                                                      <span class="text-muted" style="font-size: 11px;">- I saw that you had..</span> <span class="badge">12:09 AM</span> <span class="float-right"><span class="glyphicon glyphicon-paperclip">
              
                                                          </span></span></a><a href="#"
                                  class="list-group-item read">
              
                                                              <div class="form-check">
              
                                                                  <label>
              
                                                                      <input type="checkbox">
              
                                                                  </label>
              
                                                              </div>
              
                                                              <span class="glyphicon glyphicon-star"></span><span class="name" style="min-width: 120px;
              
                                                                  display: inline-block;">Jane Patel</span> <span class="">This is big title</span>
              
                                                              <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span class="badge">11:30 PM</span> <span class="float-right"><span class="glyphicon glyphicon-paperclip">
              
                                                                  </span></span></a>
                              </div>
                          </div>
                          <div class="tab-pane fade in" id="profile">
                              <div class="list-group">
                                  <div class="list-group-item"> <span class="text-center">This tab is empty.</span>
                                  </div>
                              </div>
                          </div>
                          <div class="tab-pane fade in" id="messages">...</div>
                          <div class="tab-pane fade in" id="settings">This tab is empty.</div>
                      </div>
                      <div class="row-md-12">
                          <div class="card bg-light card-body mb-3"> <a href="http://www.bootply.com/XXmcPas41w">Edit on Bootply</a>
                          </div>
                      </div>
                  </div>
              </div>
              </div>
            <!-- <div class="media mb-2">
              <div class="media-body d-flex pl-3 my-0 py-0">
                <div class="">
                 
                  <div id="apiCallFrm" class="form form form-inline" >
                    <input type="text" class="form-control form-control-sm" placeholder="예. Java" id="skillTxt" required />
                    <input type="text" class="form-control form-control-sm mx-2" placeholder="예. Germany" id="locTxt" required />
                    <button type="button" class="btn btn-outline-light text-dark border-dark" id="apiCallBtn" value="Search github">
                      <i class="fa fa-github" aria-hidden="true"></i>&nbsp;해외취업 검색
                    </button>
                  </div>
                </div>
                <div class="ml-auto">
                  <c:if test="${loginMember !=null}">
                    <a class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary" href="${path}/job/jobEnroll">
                      <i class="fa fa-edit">&nbsp;</i>구인 글
                    </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <button id="postJobBtn" class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary">
                      <i class="fa fa-edit"></i>구인 글
                    </button>
                  </c:if>
                </div>
                <script>
                  $('#postJobBtn').click(function(){
                    $("#loginModal").modal('show');
                  });
                </script>

              </div>
            </div>  -->

            

          <!-- <div id="githubJobBoardList" class="rounded">
              <img src="${path}/resources/images/icons8-api-32.png" width="30px" height="30px" class="img-fluid" alt=""/>
              <table class="table table-sm table-hover jobmodal-tbl2" style="font-size:14px;">
                <c:if test="${newList == null}">
                    <div class="m-0 p-0 w-100 text-center"><i class="text-muted">해외취업 리스트가 없습니다! 검색어를 입력해주세요.</i></div>
                </c:if>
                <c:if test="${newList != null}">
                  <thead>
                    <tr>
                      <th class="text-center w-0" style="display:none">NO.</th>
                      <th class="text-center w-10">로고</th>
                      <th class="text-center w-10">회사명</th>
                      <th class="text-center w-25">제목</th>
                      <th class="text-center w-40">글내용</th>
                      <th class="text-center w-10">작성일</th>
                     
                      <th class="text-center w-5">
                        <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" class="img-fluid" alt="">
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="j" items="${newList}" varStatus="status">
                      <tr class="table-secondary">
                        <td class="text-center" style="display:none">0</td>
                        <td class="text-center">
                          <c:if test="${fn:substring(j['imageURL'],2,6) =='path'}">
                            <img src="${path}${j['imageURL']}" class="img-fluid" alt="">
                          </c:if>
                          <c:if test="${fn:substring(j['imageURL'],2,6) !='path'}" >
                            <img src="${j['imageURL']}" class="imageURL img-fluid" alt="">
                          </c:if>
                        </td>
                        <td class="text-center">${j['WRITER']}</td>
                        <td class="text-center job-title">${j['TITLE']}</td>
                        <td class="hide-html-tag " >${j['CONTENT']}</td>
                        <td class="text-center"><fmt:formatDate value="${j['REGDATE']}" pattern="yy-MM-dd" /></td>
                        <td class="text-center">${j['REGDATE']}</td>
                        <td class="text-center">${j['STATUS']}</td>
                        <td class="text-center">${j['APPLICANTS']}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <script src="${path }/resources/js/jobListClick.js"></script>
                </c:if>
              </table>
            </div>  -->
                <!-- <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
                    <thead>
                        <tr>
                            <th class="text-center w-10">전체 게시글 : 10</th>
                            <th class="text-center w-25"></th>
                          </tr>
                    </thead>
                </table>
            <div id="databaseJobBoardList" class="my-3 rounded">
             
              
              <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
                <thead>
                  <tr>
                    <th class="text-center w-0" style="display:none">번호</th>
                    <th class="text-center w-10">작성 게시판</th>
                    <th class="text-center w-10">제목</th>
                    <th class="text-center w-30">글내용</th>
                    <th class="text-center w-15">작성자</th>
                    <th class="text-center w-20">작성날짜</th>
                    <th class="text-center"><i></i></th>

                   
                   
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="j" items="${list}" varStatus="status">
                    <tr class="">
                     
                      <td class="text-center" style="display:none">
                        ${j['no']}
                      </td>
                      <td class="text-center">
                       
                          Job
                      </td>
                      <td class="text-center">${j['writer']}</td>
                      <td class="text-center job-title">${j['title']}</td>
                      <td>${j['content']}</td>
                      <%-- <td class="text-center"><fmt:formatDate value="${j['regDate']}" pattern="yy-MM-dd" /></td> --%>
                      <td class="text-center">${j['regDate']}</td>
      
                      <%-- <td class="text-center">${j['status']}</td> --%>
                      <td class="text-center">${j['applicants']}</td>
                      <td class="text-center"><button class="btn btn-primary float-right">삭제</button></td>
                    </tr>
                  </c:forEach>
                </tbody>
                <script src="${path }/resources/js/jobListClick.js"></script>
              </table>

            </div>
            <nav aria-label="Page navigation example" id="pageBar">
             
            </nav> -->
          </div>
        </div> 

        <style>
          td img {
            height: 10px;
            width: 50%;
            object-fit: cover;
          }
          td {
            max-width: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 0px;
          }
          table { width:500px;table-layout:fixed; }
          table tr { height:1em;  }
          /* table tr {
            line-height: 25px;
            min-height: 25px;
            height: 25px;
          } */
          @media (max-width: 768px) { /* use the max to specify at each container level */
            .job-title {    
              width:100px;  /* adjust to desired wrapping */
              display:table;
              white-space: pre-wrap; /* css-3 */
              white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
              white-space: -pre-wrap; /* Opera 4-6 */
              white-space: -o-pre-wrap; /* Opera 7 */
              word-wrap: break-word; /* Internet Explorer 5.5+ */
            }
          }
          .modal-content{
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;

            -moz-box-shadow: 2px 2px 2px #535353;
            -webkit-box-shadow: 2px 2px 2px #535353;
            box-shadow: 2px 2px 2px #535353;
          }
        </style>
        <!-- bootstrap Modal : Job content -->
        <!-- Modal -->
        <div class="modal fade" id="jobmodal" tabindex="-1" role="dialog" aria-labelledby="jobmodalTitle" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-centered" role="document"></div>
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
          integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="
          crossorigin="anonymous"></script>
        
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
          integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script>
          $(function(){
            $('.w-0').css({'width': '0%', });
            $('.w-5').css({'width': '5%', });
            $('.w-10').css({'width': '10%', });
            $('.w-25').css({'width': '25%', });
            $('.w-30').css({'width': '30%', });
            $('.w-40').css({'width': '40%', });
            $('.w-45').css({'width': '45%', });


            var $apiLoading = $('.apiLoading').hide();
            $(document)
            .ajaxStart(function () {
              $apiLoading.show();
            })
            .ajaxStop(function () {
              $apiLoading.hide();
            });


            $('td.hide-html-tag *').css({
              'display': 'none',
            })

            $('.jobmodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
            $('.jobmodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

            $('.jobmodal-tbl1 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('.jobmodal-tbl2 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('#skillTxt, #locTxt').bind("enterKey",function(e){
              $('#apiCallBtn')[0].click();
            });
            $('#skillTxt, #locTxt').keyup(function(e){
              if(e.keyCode == 13) {
                $(this).trigger("enterKey");
              }
            });

            $('#apiCallBtn').click(function(){

              var apiParams = {
                "skill": $('#skillTxt').val(),
                "loc": $('#locTxt').val(),
              };

              if($('#skillTxt').val() =="" || $('#locTxt').val() =="") {
                alert("Fill out search fields!");
                return;
              }

              $.ajax({
                type: "POST",
                url: "${path}/job/jobBoardList",
                data: apiParams,
                dataType: "html",
                success: function(data) {
                  html = $('<div>').html(data);
                  // $('#main-container').html(html.find('div.submenu-container'));

                  $('#githubJobBoardList').html(html.find('.jobmodal-tbl2'));
                  // $('#pageBar').html(html.find('#pageBar'));

                  $('.w-0').css({'width': '0%', });
                  $('.w-5').css({'width': '5%', });
                  $('.w-10').css({'width': '10%', });
                  $('.w-25').css({'width': '25%', });
                  $('.w-30').css({'width': '30%', });
                  $('.w-40').css({'width': '40%', });
                  $('.w-45').css({'width': '45%', });
                },
                error: function(status, error) {
                  alert("ajax api parameter call Error!");
                }
              });
            });

          });

          function addRowEvent(tr){
            var githubData = {};
            var no,writer,title,content,regDate,count,status,applicants;
            tr.each(function (i, el) {
              var tds = $(this).find('td');

              githubData = {};

              console.log(tds.eq(0).text()); //no
              console.log(tds.eq(0).text().trim()); //no
              githubData["no"]= (tds.eq(0).text()).trim() ==""? 0:tds.eq(0).text().trim();
              githubData["imageURL"]= tds.eq(1).find('img.imageURL').attr("src");
              githubData["writer"]= tds.eq(2).text();
              githubData["title"]= tds.eq(3).text();
              githubData["content"]= tds.eq(4).text();
              // githubData["regDate"]= new Date(tds.eq(5).text());
              githubData["regDateRaw"]= tds.eq(5).text();
              // githubData["count"]= tds.eq().text();
              // githubData["status"]= tds.eq().text();
              githubData["applicants"]= tds.eq(6).text();
                    // <th class="text-center w-0" style="display:none">번호</th>
                    // <th class="text-center w-10">로고</th>
                    // <th class="text-center w-10">회사명</th>
                    // <th class="text-center w-25">제목</th>
                    // <th class="text-center w-40">글내용</th>
                    // <th class="text-center w-10">작성일</th>
                    // <!-- <th class="text-center">Status</th> -->
                    // <th class="text-center w-5">
                    //   <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" alt="">
                    // </th>
            });

            console.log(githubData);

            $.ajax({
              type: "POST",
              url: "${path }/job/jobContentView.do",
              dataType: "html",
              data: githubData,
              success: function(data){
                var html = $('<div>').html(data);
                $('#job-dialog').html(html.find('#jobmodal-content'));
              },
              error: function (data) { // 데이터 통신에 실패
                alert("JSON data failed to retrieve!");
              }
            });
          }
        </script>
      </div>
    </div>
  </main>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
