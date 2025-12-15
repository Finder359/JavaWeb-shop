<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page import="com.jspsmart.upload.Files" %>
<%@ page import="com.jspsmart.upload.SmartUploadException" %>
<%--
  Created by IntelliJ IDEA.
  User: xh
  Date: 2025/12/15
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    SmartUpload smartUpload=new SmartUpload();
    smartUpload.initialize(pageContext);
    smartUpload.setAllowedFilesList("jpg,jpeg");
    try {
        smartUpload.upload();
    } catch (SmartUploadException e) {
        throw new RuntimeException(e);
    }
    Files files=smartUpload.getFiles();
    int count=files.getCount();
    for(int i=0;i<count;i++){
        File file= files.getFile(i);
        if (!file.isMissing()){
            out.println(file.getFileName());
            out.println(file.getSize());
            try {
                file.saveAs("D:\\java-dev\\IdeaProjects\\test\\Temporary image\\"+file.getFileName(),SmartUpload.SAVE_PHYSICAL);
            } catch (SmartUploadException e) {
                throw new RuntimeException(e);
            }
        }
    }
%>

</body>
</html>
