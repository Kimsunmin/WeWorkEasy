package com.wwe.common.exception.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wwe.common.exception.CustomException;

@WebServlet("/exception")
public class ExceptionHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExceptionHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //String email = request.getParameter("email");
        //System.out.println("ExceptionHandler에서 찍음 :  " + email);

        //request처리 도중 발생한 예외들은 request에
        //javax.servlet.error.exception 이라는 속성명으로 담겨온다.
        //즉 getAttribute() 메서드를 사용해 꺼낼 수 있다.
        CustomException e = (CustomException)request.getAttribute("javax.servlet.error.exception");

        request.setAttribute("alertMsg", e.error.errMsg());
        request.setAttribute("url", e.error.url());
        request.getRequestDispatcher("/WEB-INF/view/common/result.jsp")
                .forward(request, response);
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
