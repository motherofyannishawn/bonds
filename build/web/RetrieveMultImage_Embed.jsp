<%-- 
    Document   : RetrieveMultImage_Embed
    Created on : Feb 26, 2015, 10:25:40 AM
    Author     : Tasha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>




    <body>

                
        <%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
        
        
<%@page import="java.sql.Types.* "%>


<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.Connection"%>

<%@page import="java.sql.DriverManager"%>

<%@page import="java.io.IOException"%>


<%@page import="java.io.PrintWriter"%>

<%@page import="java.sql.Connection"%>

<%@page import="java.sql.ResultSet"%>


<%@page import="java.sql.Statement"%>


<%@page import="java.util.logging.Level"%>


<%@page import="javax.servlet.ServletException"%>

<%@page import="javax.servlet.http.HttpServlet"%>

<%@page import="javax.servlet.http.HttpServletRequest"%>

<%@page import="javax.servlet.http.HttpServletResponse"%>

<%@page import="org.jboss.logging.Logger"%>

                
                        <%
            
            //Retrieve multiple Images
                            //problem is that code only prints first image (outer code) and then stops. 
                            //see retrievemultimage_embed2 for revised code creating another try to manage output of both images.
                                        //Retrieve Mult Images
            //65  --> pearls inner code
           //45 -->umbrella outer code always

            try
            {
                    Class.forName("com.mysql.jdbc.Driver");
                    {
  
                        try
                        {
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/image?allowMultiQueries=true", "tasha", "tashaPassword");

                                
                                                             try {

 
            String sql = "select ProfileImage from image.Trashawn where ID=45";
            PreparedStatement statement = c.prepareStatement(sql);

 
            ResultSet result = statement.executeQuery();
            
            
                            int i = 1;
    while(result.next()) {
        Blob len1 = result.getBlob("ProfileImage");
        int len = (int)len1.length();
        byte[] b = new byte[len];
        InputStream readImg = result.getBinaryStream(1);
        int index = readImg.read(b, 0, len);
        System.out.println("index" +index);
        statement.close();
        response.reset();
        response.setContentType("image/jpg");
        response.getOutputStream().write(b,0,len);
        response.getOutputStream().flush();
    }
    
                                                                 try {

                             Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/image?allowMultiQueries=true", "tasha", "tashaPassword");
            String sql2 = "select ProfileImage from image.Trashawn where ID =65";
            PreparedStatement statement2 = c2.prepareStatement(sql);

 
            ResultSet result2 = statement2.executeQuery();
            
            
                            int i2 = 1;
    while(result2.next()) {
        Blob len4 = result2.getBlob("ProfileImage");
        int len3 = (int)len4.length();
        byte[] b2 = new byte[len3];
        InputStream readImg2 = result2.getBinaryStream(1);
        int index2 = readImg2.read(b2, 0, len3);
        System.out.println("index2" +index2);
        statement2.close();
        response.reset();
        response.setContentType("image/jpg");
        response.getOutputStream().write(b2,0,len3);
        response.getOutputStream().flush();
    }
}
                                                                 
 catch (Exception inner)
{
    out.println("Second query...inner query... not working");
}
    
}
                                
                                
                                     
                             catch(Exception ex) {
    out.println(ex);
} finally {

    c.close();

}
                        }
                        catch (Exception e)
                        {
                            out.println("Connection String Error");
                        }
                    }
                    }
                    catch (Exception e)
                            {
                            out.println("Driver Error");
                            }
                            
            %>
            
    </body>
</html>
