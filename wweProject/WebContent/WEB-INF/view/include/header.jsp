<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding ="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>pclass</title>
    <%--
        contextPath를 context변수에 저장
        ex) 이 프로젝트에서는 cntextPath가 jsp임으로 jsp가 context변수가 담긴다.
    --%>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript" src="/resources/js/common/urlEncoder.js"></script>
    <script type="text/javascript" src="/resources/js/common/asyncPageError.js"></script>
    <link href="/resources/css/chatting/chatting.css" rel="stylesheet">
</head>
