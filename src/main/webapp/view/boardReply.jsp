<%--
  Created by IntelliJ IDEA.
  User: baek
  Date: 2021-09-08
  Time: 오후 7:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>답글 쓰기</title>
</head>
<body>
<form action="../boardReplyInsert.bbs" method="post">
  <table>
    <tr>
      <td colspan="2">답글 추가하기</td>
    </tr>
    <tr>
      <td><label for="subject">제목</label></td>
      <td><input type="text" name="subject" id="subject"/></td>
    </tr>
    <tr>
      <td><label for="author">작성자</label></td>
      <td><input type="text" name="author" id="author"/></td>
    </tr>
    <tr>
      <td><label for="content">내용</label></td>
      <td><input type="text" name="content" id="content"/></td>
    </tr>
    <tr>
      <td><label for="password">수정삭제비밀번호</label></td>
      <td><input type="password" name="password" id="password"/></td>
    </tr>
    <tr>
      <!-- 취소 버튼을 누르면 boardList.bbs로 가도록 처리해 보시오. -->
      <td colspan="2">
        <input type="hidden" name="replyRootId" value="<%= request.getParameter("replyRootId")%>"/>
        <input type="hidden" name="depth" value="<%= request.getParameter("depth")%>"/>
        <input type="hidden" name="orderNum" value="<%= request.getParameter("orderNum")%>"/>
        <input type="submit" value="[글쓰기]"/>
        <a href="../boardList.bbs">[취소]</a>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
