<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<body>
<!-- 경고창 띄우고 페이지 이동시키는 화면 (JS + el태그) -->
   <script type="text/javascript">
   
      let context = "${context}";
      
      <%-- 경고창 띄우기 --%>
      <c:if test="${alertMsg != null}">
         alert("${alertMsg}");      
      </c:if>

      <%-- 페이지 뒤로가기 --%>
      <c:if test="${back != null}">
         //window.history.back(); => 뒤로가기 기능(go Back)
         history.back();   
      </c:if>
   
      <%-- url 출력 --%>
      <c:if test="${url != null}">
         //location.href: 현재 페이지의 url 출력
         location.href = '${url}'; 
      </c:if>
   </script>
</body>
</html>