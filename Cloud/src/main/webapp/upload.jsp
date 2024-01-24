<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>File Upload to Cloud</title>
</head>
<body>

<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    // Check that we have a file upload request
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {
        // Create a factory for disk-based file items
        FileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // Parse the request to get file items.
            List<FileItem> fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator<FileItem> iter = fileItems.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (!item.isFormField()) {
                    // Process the file
                    String fileName = new File(item.getName()).getName();
                    // You can handle the file content here and upload it to the cloud system

                    // For demonstration purposes, we'll just print the file name
                    out.println("Uploaded File Name: " + fileName);
                }
            }

            out.println("File upload success!");

        } catch (FileUploadException e) {
            out.println("File upload failed due to: " + e.getMessage());
        }
    }
%>

<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
    <input type="file" name="file" /><br/><br/>
    <input type="submit" value="Upload File" />
</form>

</body>
</html>
