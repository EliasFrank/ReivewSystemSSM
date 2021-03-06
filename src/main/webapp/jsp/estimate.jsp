<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<c:if test="${user.userflag != 1}">
    <a href="/ReviewSystem/jsp/login.jsp">您的权限不够，请以专家账号登录</a>
</c:if>
<c:if test="${user.userflag == 1}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>评估页面</title>
    <link rel="icon" href="/ReviewSystem/img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/ReviewSystem/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <style>
		body{
			margin-top: 50px;
            margin-bottom: 50px;
            background-color: rgb(241, 239, 239);
			
		}
        .project-info{
            background-color: white;
        }
        .center-block {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .star{
            color: red;
        }
        td{
            width: 350px;
        }
        /* table{
            width: 250px;
        } */
        /* td
        {
            border: 1px solid transparent !important ;
        }
        tr{
            border: 1px solid transparent !important ;
        }
        tbody{
            border: 1px solid transparent !important ;
        } */
        #giant{
            height: 180px;
        }
	</style>
  </head>
  <body>

    <div class="container-fluid">
	    <div class="row">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="#" class="navbar-brand">@</a>
                    </div>
        
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav" id="mytab" role="tablist">
                            <li class="active" role="presentation"><a href="allItems.jsp">主页</a></li>
                            <li role="presentation"><a href="" ></a></li>
                            
                        </ul>
        
                    
        
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" placeholder="搜索" class="form-control">
                            </div>
                            <button class="btn btn-info" type="submit">搜索</button>
                        </form>
        
                        <ul class="nav navbar-nav navbar-right">
                            <li role="presentation" class="">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-comment"><span class="badge"></span></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="menuitem"><a href="#">我的私信</a></li>
                                    <li role="menuitem"><a href="#">系统通知</a></li>
                                </ul>
                            </li>
                            <li><a href="/ReviewSystem/LogoutServlet">退出</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">More<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="menuitem"><a href="#">python</a></li>

                                </ul>
                            </li>
                        </ul>
        
                    </div>
                </div>
                
            </nav>
            <div class="jumbotron" id="giant" style="background-color: rgb(111, 168, 243);">
                    <h2>
                        欢迎查看项目
                    </h2>
                    <p>
                        在下方你可以下载项目文案并为其各个方面进行打分。
                    </p>

            </div>

        </div>
	        <div class="col-md-1"></div>
            <div class="col-md-9 ">
                <div class="itemInfo project-info well well-lg">
                    <table class="table table-hover ">
                        <thead>
                        <tr>
                            <td><label>项目名称</label></td>
                            <td><label>项目简介</label></td>
                            <td><label>申报文件查看</label></td>
                        </tr>
                        </thead>
                        <tbody>
                        <input type="hidden" name = "itemId" value="${items.itemId}">
                        <tr>
                            <td><span>${items.itemName}</span></td>
                            <td><span>${intro}</span></td>
                            <td><span><a onclick="detail()" target="_blank">查看</a></span></td>
                         </tr>
                        </tbody>
                    </table>
                </div>
            <form action="/ReviewSystem/Estimate_submit_servlet" method="post">
                <div class="project-info well well-lg">
                    <table class="table table-hover text-nowrap" style="table-layout: fixed;">
                         <thead>
                             <tr>
                                 <td><label>评分标准</label></td>
                                 <td><label>满分</label></td>
                                 <td><label>分数</label></td>
                                 <td><label></label></td>
                             </tr>
                         </thead>
                         <tbody>
                             <c:forEach items="${parts}" var="part">
                                 <tr>
                                     <input type="hidden" name = "partFlag" value="${part.id}">
                                     <input type="hidden" name = "itemId" value="${items.itemId}">
                                     <td><span>${part.explain}</span></td>
                                     <td><span><input type="text" value="${part.grade}" name="hid" readonly="readonly"/></span></td>
                                     <td><input type="text" name="grade" value="" height="10"></td>
                                     <!-- <td><input type="text" name="partExplain" value="" height="10"></td> -->
                                 </tr>
                             </c:forEach>           
                         </tbody>
                         <tbody>
                            <tr>
                                <td><label>评分原因</label></td>
                                <td><textarea name="partExplain" id="" cols="67" rows="7" style="resize: none;"></textarea></td>
                                <td></td>
                            </tr>      
                         </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <input type="submit" class="btn btn-info" value="提交">
                    <a href="Select_all_work_servlet" class="btn btn-default">取消</a>
                </div>
            </form>
            <div class="col-md-2"></div>
    </div>
    </div>

    <script src="/ReviewSystem/js/jquery-3.4.1.min.js"></script>
    <script src="/ReviewSystem/js/bootstrap.min.js"></script>
    <script src="/ReviewSystem/js/estimate.js"></script>
    <script type="text/javascript" src="/ReviewSystem/pdfjs/build/pdf.js"></script>

    <!-- <script src="js/scripts.js"></script> -->
  </body>
</c:if>
<script>
    function detail() {
        window.open("/ReviewSystem/pdfjs/web/viewer.html?file=" + encodeURIComponent("/ReviewSystem/DownloadItemFileServlet?itemId=${items.itemId}"));
    }
</script>
</html>