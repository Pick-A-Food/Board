<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<div id="wrapper">
  <%@ include file="sidebar.jsp" %>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <%@ include file="top_bar.jsp" %>
      <div class="container-fluid">
        <h1 class="h3 mb-2 text-gray-800">${boardDetail.title}</h1>
<%--        <p class="mb-4"> 맞-조 list</p>--%>
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
              
              <span style="float:left">
                ${boardDetail.writer}
              </span>
              <span class="date-form" style="float:right">
                ${boardDetail.regdate}
              </span>
              
            </h6>
          </div>
          <div class="card-body">
            <span>${boardDetail.content}</span>
          </div>
          </div>
          <form action="/board/update/${boardDetail.bno}" method="post" style ='display:inline-block;'>
            <button class="btn btn-primary">수정</button>
          </form>
          <form action="/board/delete/${boardDetail.bno}" method="post" style ='display:inline-block;'>
            <button class="btn btn-danger">삭제</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
    const date = document.querySelector(".date-form");
    
    date.innerHTML = date.innerHTML.split("T")[0];
</script>