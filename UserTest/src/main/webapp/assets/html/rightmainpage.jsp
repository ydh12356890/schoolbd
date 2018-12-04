<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>rightmainpage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/echarts.css">
    <link rel="icon" href="../icon/buptlogo.png">
    <link rel="stylesheet" href="../css/carousel.css">
</head>
<body>
<div>
    <div style="padding: 5px;text-align: left">
        <h4>上次登录：${sessionScope.get("lastschool").lastschool}</h4>
    </div>
    <div class="tabborderc" style="float: left;width: 60%;margin: 0px 10px 20px 10px;padding: 5px;height: auto">
        <div style="padding: 3px">
            <h4 style="float: left;width: 50%">学生名单</h4>
            <div style="float: right;width: 50%;text-align: center">
                <form class="form-inline">
                    <div class="form-group" style="margin-right: 0">
                        <%--<label class="sr-only" for="inputSchool">输入学院</label>
                        <input class="form-control" type="text" id="inputSchool" placeholder="学院...">--%>
                        <select id="lastschool" style="height: 32px">
                            <option value="1">电子工程学院</option>
                            <option value="2">公共管理学院</option>
                            <option value="3">光电信息学院</option>
                            <option value="4">国际学院</option>
                            <option value="5">计算机学院</option>
                            <option value="6">继续教育学院</option>
                            <option value="7">经济管理学院</option>
                            <option value="8">理学院</option>
                            <option value="9">马克思主义学院</option>
                            <option value="10">民族教育学院</option>
                            <option value="11">人文学院</option>
                            <option value="12">软件学院</option>
                            <option value="13">数字媒体与设计艺术学院</option>
                            <option value="14">体育部</option>
                            <option value="15">网络技术研究院</option>
                            <option value="16">网络教育学院</option>
                            <option value="17">网络空间安全学院</option>
                            <option value="18">现代邮政学院</option>
                            <option value="19">信息光子学与光通信研究院</option>
                            <option value="20">信息与通信工程学院</option>
                            <option value="21">叶培大创新创业学院</option>
                            <option value="22">自动化学院</option>
                            <option value="23">（无锡）感知技术与产业研究院</option>
                        </select>
                        <button class="btn btn-primary" id="checkdata" type="button"
                                onclick="checkMFRatioSingleSchool()">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <table id="mytabschoolStu" class="table table-hover table-bordered"></table>

    </div>
    <div class="tabborderc" style="float: right;width: 36%;padding: 3px;margin: 0 10px 20px 10px">
        <div id="schoolMFRatiodiv" style="width: 350px;height: 350px;margin-left:auto;margin-right: auto;">

        </div>
    </div>
    <div class="tabborderc" style="clear: both;padding: 5px;margin: 10px;">
        <%--<div>
            <button class="btn btn-primary" id="checkSchoolPersonNumBtn" type="button" onclick="checkSchoolPersonNum()">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询所有学院的人数
            </button>
        </div>--%>
        <%--<h5>各学院人数占比</h5>--%>
        <div id="schoolPersonNumdiv" style="width: 900px;height: 600px;margin-left:auto;margin-right: auto ">

        </div>
    </div>

</div>
</body>
</html>
