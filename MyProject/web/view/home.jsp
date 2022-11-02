

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/style.css">
        <title>Document</title>
    </head>
    <body>
        <div class="container">
            <div class="col-md-12">
                <center>
                    <h1><span>FPT University Academic Portal</span></h1>
                    <c:if test="${sessionScope.account ne null}">
                        <div>
                            <ol class="breadcrumb">
                                <li>
                                    <span>Hello ${sessionScope.account.displayname},  click 
                                        <a href="logout">here</a> 
                                        to logout.</span>
                                </li>
                            </ol>
                        </div>
                        <br>
                        <br>
                        <div class="box" style=" width: 100%">
                            <fieldset>
                                <legend>
                                    <span class="label  btn-warning">
                                        <b>Academic Information</b>
                                    </span>
                                </legend>
                                <div class="listBoxWrapper">

                                    <center>
                                        <h4>Information Access(Tra cứu thông tin)</h4>
                                        <a href="lecturer/timetable?lid=${sessionScope.account.username}">Timetable (Thời khoá biểu)</a>
                                    </center>
                                </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account eq null}">
                        <h2>you are not logged in yet!</h2> 
                    </c:if>
                </center>
            </div>
        </div>
    </body>
</html>
