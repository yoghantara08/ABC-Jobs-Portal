<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ page isELIgnored = "false" %> 
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/threads.css" rel="stylesheet" />
</head>
<body>
	<div class="root">
      <%@ include file="../components/navbar.jsp" %>

      <main>
        <div class="mt-4 container d-flex flex-column flex-md-row">
          <!-- Sidebar -->
          <%@ include file="../components/thread-sidebar.jsp" %>

          <!-- Content -->
          <div class="content">
            <!-- Search -->
            <div class="search-bar">
              <form action="thread-search" method="get" class="d-flex">
                <input type="text" name="keyword" placeholder="Search thread" />
                <button type="submit" class="btn btn-outline-secondary btn-search">
                  <i class="fa-solid fa-magnifying-glass"></i>
                </button>
              </form>
            </div>

            <!-- List Thread -->
            <div class="list-thread mt-3">
              <c:forEach items="${searchThread}" var="thread">
              <div class="thread mb-3">
              	<div class="d-flex">
	              	<div class="image me-3">
	              	  <a href="view-profile?name=${thread.getProfile().getFirst_name()}&id=${thread.getProfile().getId_profile()}" class="text-decoration-none">
	                    <img src="${thread.getProfile().getPicture()}" alt="User Profile" />
	                  </a>
	                </div>
	                <div class="detail">
	                  <h5 class="title">${thread.getTitle()}</h5>
	                  <a href="view-profile?name=${thread.getProfile().getFirst_name()}&id=${thread.getProfile().getId_profile()}" 
	                     class="text-decoration-none">${thread.getProfile().getFirst_name()} ${thread.getProfile().getLast_name()}
	                  </a>
	                  <div class="tags">
	                  	<a href="thread-search?keyword=${thread.getTags().getFirst_tag()}" class="text-decoration-none">
	                  	  <button class="btn btn-outline-secondary mt-2">${thread.getTags().getFirst_tag()}</button>
	                  	</a>
	                    <c:if test="${thread.getTags().getSecond_tag() != ''}">
	                      <a href="thread-search?keyword=${thread.getTags().getSecond_tag()}" class="text-decoration-none">
	                        <button class="btn btn-outline-secondary mt-2">${thread.getTags().getSecond_tag()}</button>
	                      </a>
	                	</c:if>
	                  </div>
	                </div>
              	</div>
                <div class="mt-2 text-end me-2">
                  <a href="thread?id=${thread.getId_thread()}" class="text-decoration-none">
                    <button class="btn btn-primary">Read Post</button>
                  </a>
                </div>
              </div>
              </c:forEach>
              
              <c:if test="${searchThread == null || searchThread.isEmpty()}">
                <div class="mt-4 text-center">
              	  <h4 class="text-secondary">Thread not found.</h4>
                </div>
              </c:if>
            </div>
          </div>
        </div>
      </main>

	<%@ include file="../components/footer.jsp" %>
    </div>
</body>
</html>