<%--
  Created by IntelliJ IDEA.
  User: baek
  Date: 2021-08-26
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>글 읽기</title>
</head>
<body>
<!-- 글번호, 제목, 작성자, 내용, 작성일, 작성시각, 조회수(+1), 댓글수 -->
<table>
    <tr>
        <td>글번호</td>
        <td>${boardData.id}</td>
    </tr>
    <tr>
        <td>제목</td>
        <td>${boardData.subject}</td>
    </tr>
    <tr>
        <td>작성자</td>
        <td>${boardData.author}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td>${boardData.content}</td>
    </tr>
    <tr>
        <td>작성일</td>
        <td>${boardData.writeDate}</td>
    </tr>
    <tr>
        <td>작성시각</td>
        <td>${boardData.writeTime}</td>
    </tr>
    <tr>
        <td>조회수</td>
        <td>${boardData.readCount}</td>
    </tr>
    <tr>
        <td>댓글수</td>
        <td>${boardData.commentCount}</td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="boardList.bbs">[글 목록 보기]</a>
            <a href="./view/boardPasswordToUpdate.jsp?id=${boardData.id}">[수정하기]</a>
            <a href="./view/boardPasswordToDelete.jsp?id=${boardData.id}">[삭제하기]</a>
            <a href="./view/boardReply.jsp?replyRootId=${boardData.replyRootId}&depth=${boardData.depth}&orderNum=${boardData.orderNum}">[답글쓰기]</a>
            <!-- ORDER : 패스워드 확인 하고 boardPasswordToDelete.jsp -->
        </td>
    </tr>
    <tr>
        <td><label for="commentAuthor">작성자</label></td>
        <td><label for="commentContent">댓글 내용</label></td>
    </tr>
    <form action="commentInsert.bbs" method="post">
        <tr>
            <input type="hidden" name="boardId" value="${boardData.id}"/>
            <td><input type="text" name="commentAuthor" id="commentAuthor"/></td>
            <td><input type="text" name="commentContent" id="commentContent"/></td>
            <td><input type="submit" value="확인"></td>
        </tr>
    </form>
</table>
<!-- 댓글 보여줌 start -->
<table>
    <c:forEach items="${comments}" var="cmt">
        <tr>
            <td>${cmt.author}</td>
            <td>${cmt.content}</td>
            <td>${cmt.writeDate}</td>
            <td>${cmt.writeTime}</td>
        </tr>
    </c:forEach>
</table>
<!-- 댓글 보여줌 end -->
<!-- [글 목록 보기][수정하기][삭제하기] 글 목록보기 클릭하면 boardList.bbs로 foward -->
</body>
</html>
