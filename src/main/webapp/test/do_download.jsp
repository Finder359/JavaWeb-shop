<%@ page import="com.jspsmart.upload.SmartUpload" %><%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/19
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SmartUpload su=new SmartUpload();
    su.initialize(pageContext);
    su.setContentDisposition(null);
    su.downloadFile("D:\\java-dev\\IdeaProjects\\test\\Temporary image\\20230426033857264.jpg");
%>

