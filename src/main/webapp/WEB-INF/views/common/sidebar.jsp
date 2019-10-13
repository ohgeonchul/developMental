<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <!-- Custom CSS -->
  <link rel="stylesheet" href="${path }/resources/css/sidebar.css">
  <!-- Scrollbar Custom CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

  <!-- Sidebar  -->
  <nav id="sidebar">
    <div class="sidebar-header">
      <h3>${ param.pageTitle }</h3>
    </div>

    <ul class="list-unstyled components">
      <p>Boards</p>
      <li class="active">
        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">Home</a>
        <ul class="collapse list-unstyled" id="homeSubmenu">
            <li>
                <a href="#">Home 1</a>
            </li>
            <li>
                <a href="#">Home 2</a>
            </li>
            <li>
                <a href="#">Home 3</a>
            </li>
        </ul>
      </li>
      <li>
        <a href="#">About</a>
      </li>
      <li>
        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">Pages</a>
        <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
                <a href="#">Page 1</a>
            </li>
            <li>
                <a href="#">Page 2</a>
            </li>
            <li>
                <a href="#">Page 3</a>
            </li>
        </ul>
      </li>
      <li>
        <a href="#">Portfolio</a>
      </li>
      <li>
        <a href="#">Contact</a>
      </li>
    </ul>

    <ul class="list-unstyled CTAs">
      <li>
        <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>
      </li>
      <li>
        <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a>
      </li>
    </ul>
  </nav>
