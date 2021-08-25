package kr.ac.daegu.jspmvc.controller;

import kr.ac.daegu.jspmvc.biz.BoardCmd;
import kr.ac.daegu.jspmvc.biz.BoardInsertCmd;
import kr.ac.daegu.jspmvc.biz.BoardListCmd;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.bbs")
public class BoardFrontController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String cmdURI = requestURI.substring(contextPath.length());
        // log
        System.out.println("requestURI = " + requestURI);
        System.out.println("contextPath = " + contextPath);
        System.out.println("cmdURI = " + cmdURI);

        BoardCmd cmd = null;
        String viewPage = null;

        // 글 목록 조회 처리(/jspmvc/boardList.bbs)
        if(cmdURI.equals("/boardList.bbs")){
            cmd = new BoardListCmd();
            cmd.execute(request, response);
            viewPage = "view/boardList.jsp";
        }

        // 글 추가하기()
        if (cmdURI.equals("/boardInsert.bbs")){
            // enduser 작성한 글을 db에 insert 시키는 비즈니스 로직 작성
            cmd = new BoardInsertCmd();
            cmd.execute(request,response);
            viewPage="boardList.bbs";
        }


        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);

    }
}
