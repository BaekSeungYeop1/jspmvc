<%--
  Created by IntelliJ IDEA.
  User: keept
  Date: 2021-08-24
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jstl -->
<html>
<head>
    <title>전체 글 목록 보기</title>
</head>
<body>
<!-- BoardListCmd.java에서 가져온 데이터를 어떻게 jsp 파일에 html 형태로 보여줄 것인가? -->

<table>
    <tr>
        <td>글번호</td>
        <td>작성자</td>
        <td>제목</td>
        <td>작성일</td>
        <td>작성시각</td>
        <td>조회수</td>
        <td>댓글수</td>
    </tr>
    <!-- gstl if 태그를 써서 글번호가 짝수인 글의 목록만 보여 주시요 -->
    <c:forEach items="${boardRowList}" var="row">
        <c:if test="${(row.id%2)==0}">
        <tr>
            <td>${row.id}</td>
            <td>${row.author}</td>
            <td>${row.subject}</td>
            <td>${row.writeDate}</td>
            <td>${row.writeTime}</td>
            <td>${row.readCount}</td>
            <td>${row.commentCount}</td>
        </tr>
        </c:if>
    </c:forEach>
</table>



</body>
</html>
