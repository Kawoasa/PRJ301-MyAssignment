<%-- 
    Document   : att
    Created on : Oct 16, 2022, 3:08:10 PM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>Document</title>
    </head>

    <body>
        <div class="container">
            <div class="col-md-12">
                <h2>Single activity Attendance</h2>
                Take attendance for Group: ${requestScope.ses.group.name} <br/>
                Attendance for <strong> ${requestScope.ses.group.subject.name}</strong> will leacturer <strong>SonNT5</strong> at slot 1 on ${requestScope.ses.date} - ${requestScope.ses.slot.description}, in room ${requestScope.ses.room.name} at FU-HL<br>
                Attended: <span style="color: red;"> ${requestScope.ses.attanded?"Yes":"No"} </span>
                <form action="takeatt" method="POST">
                    <input type="hidden" name="sesid" value="${param.id}"/>
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Code</th>
                                <th>Name</th>
                                <!--<th>Image</th>-->
                                <th>Present</th>
                                <th>Absent</th>
                                <th>Comment</th>
                                <th>Record time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.ses.atts}" var="a" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td><font color="#33CCFF">${a.student.id}</font>
                                        <input type="hidden" name="stdid" value="${a.student.id}"/>
                                    </td>
                                    <td><font color="blue">${a.student.name}</font></td>
                                    <td>
                            <center>
                                <input type="radio"
                                       <c:if test="${a.present}">
                                           checked="checked"
                                       </c:if>
                                       name="present${a.student.id}" value="present" />
                            </center>
                            </td>
                            <td>
                            <center>
                                <input type="radio"
                                       <c:if test="${!a.present}">
                                           checked="checked"
                                       </c:if>
                                       name="present${a.student.id}" value="absent" />
                            </center>
                            </td>
                            <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                            </tr>   
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <input type="submit" value="Submit" style="margin: 3% 0">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
