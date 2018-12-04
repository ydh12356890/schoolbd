<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<body onload="showAtRight('rightmainpage.jsp')"></body>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link rel="stylesheet" href="../css/jquery-ui.min.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" >--%>
    <link rel="icon" href="../icon/buptlogo.png">
    <title>校园信息化</title>
    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 sidebar">
            <div class="leftheader">
                <div class="project_title">
                    <a href="#" class = "project_a"><span class="glyphicon glyphicon-asterisk"></span> 智慧校园</a>
                </div>
                <div class="profile_pic">
                        <%--<img src="../icon/bupt.png" rel="icon" class="image-circle profile-img">--%>
                            <span class="glyphicon glyphicon-user"></span>
                            <span>welcome,${sessionScope.get("user").userName}</span>
                </div>
            </div>
            <ul class="nav nav-sidebar" >
                <li class="active"><a href="#" onclick="showAtRight('rightmainpage.jsp')">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 </a></li>
                <li class=""><a href="#"  onclick="showAtRight('rightpersonpage.html')">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 学生个人信息</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightgrouppage.html')">
                    <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>学生群体信息</a></li>
                <%--<li class=""><a href="#" onclick="showAtRight('rightaddpage.html')">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 扩展功能</a></li>--%>
            </ul>
        </div>
        <div class="col-md-10 col-md-offset-2 main" id="rightpage">
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <%--<img src="../icon/bupt.png" rel="icon" alt="">${sessionScope.get("user").userName}--%>
                                    <span class="glyphicon glyphicon-user"></span>${sessionScope.get("user").userName}
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <%--<li><a href="javascript:;">修改密码</a></li>--%>
                                    <li><a class="btn btn-default" href="#" data-toggle="modal" data-target="#myModal" role="button">修改密码</a></li>
                                    <li><a class="btn btn-default" href="#" role="button" id="logout">退出登录</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div id="rightdiv" class="rightdiv"></div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" id="closebtn" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="modalInputUsername" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text"  id="modalInputUsername" class="form-control" value="${sessionScope.get("user").userName}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modalOldUserpassword" class="col-sm-2 control-label">原密码</label>
                        <div class="col-sm-10">
                            <input type="password"  id="modalOldUserpassword" class="form-control" placeholder="请输入原密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modalNewUserpassword1" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <input type="password"  id="modalNewUserpassword1" class="form-control" placeholder="请输入新密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modalNewUserpassword2" class="col-sm-2 control-label">确认新密码</label>
                        <div class="col-sm-10">
                            <input type="password"  id="modalNewUserpassword2" class="form-control" placeholder="请确认新密码">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearForm()">取消</button>
                <button type="button" class="btn btn-primary" onclick="submitNewPassword()">保存</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script  src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src = "../js/echarts.common.min.js"></script>
<script src="../js/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(document).ready(function(){
        $('ul.nav >li').click(function (e) {
            $('ul.nav>li').removeClass('active');
            $(this).addClass('active');

        });
    });

    function checkGood() {
            console.log("群体学院界面查询优秀按钮");
            var selectValue = $("#selectschool2 option:selected").text();
            console.log(selectValue);


            $('#mytabgood').bootstrapTable('destroy');

            $('#mytabgood').bootstrapTable({
                method :"post",
                url : "/student/getGoodStudentScore",
                contentType : "application/x-www-form-urlencoded",
                dataType : "json",
                striped : true, //是否显示行间隔色
                sortable : true,
                pageNumber : 1, //初始化加载第一页
                pagination : true , //是否分页
                sidePagination : "server", //server：服务前端分页 ； client：前端分页
                pageSize : 5,//单页记录数
                pageList : [6,10,20,30], //可选择的单页记录数
                showColumns:true  ,
                showRefresh : true,  // 刷新按钮
                queryParamsType:'',
                detailView : true,
                //height : 400,
                queryParams : function queryParams(params) {  //上传服务器的参数
                    var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                        pageNumber : params.pageNumber, //每页显示数量
                        pageSize : params.pageSize,  //SQL语句起始索引
                        //page : (params.offset / params.limit)+1 , 当前页码
                        xymc : selectValue

                        // Tel : $('#search_tel').val()

                    };
                    return temp;
                },
                columns :[
                    /*{ title : '序号',
                    formatter : function (value,row,index) {
                        var  pageSize = $('#mytab').bootstrapTable('getOptions').pageSize;
                        var  pageNumber = $('#mytab').bootstrapTable('getOptions').pageNumber;
                        return pageSize*(pageNumber-1)+index+1;
                    },
                    sortable : true
                },*/{
                        title : '学号',
                        field : 'studentid',
                        sortable : false
                    },{
                        title : '姓名',
                        field : 'name',
                        sortable : false
                    },{
                        title : '性别',
                        field : 'gender',
                        sortable : false,
                        formatter : function (value,row,index) {
                            return row.gender==1.0?"男":"女";
                        }
                    },{
                        title : '学院代码',
                        field : 'schoolid',
                        sortable : false
                    },{
                        title : '学院名',
                        field : 'xymc',
                        sortable : false,
                        formatter : function (value,row,index) {
                            return row.school.xymc;
                        }
                    },
                    {
                        title : '专业代码',
                        field : 'majorid',
                        sortable : false
                    },
                    {
                        title : '班级代码',
                        field : 'classid',
                        sortable : false
                    }],
                onExpandRow : function (index,row,$detail) {
                    InitGoodSubTable(index,row,$detail);

                }
            });
            console.log("goodtable 已执行");
        }
    function InitGoodSubTable(index,row,$detail) {
            console.log(row);
            console.log(index);
            console.log($detail);
            var parentid = row.studentid;
            console.log(parentid);
            var cur_table = $detail.html('<table class="table table-hover table-bordered"></table>').find('table');
            $(cur_table).bootstrapTable({
                method :"post",
                url : "/student/getGoodCourseScore",
                contentType : "application/x-www-form-urlencoded",
                dataType : "json",
                striped : true, //是否显示行间隔色
                sortable : true,
                pageNumber : 1, //初始化加载第一页
                pagination : true , //是否分页
                sidePagination : "server", //server：服务前端分页 ； client：前端分页
                pageSize : 4,//单页记录数
                pageList : [5,10,20,30], //可选择的单页记录数
                queryParamsType:'',
                //height : 400,
                queryParams : function queryParams(params) {  //上传服务器的参数
                    var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                        pageNumber : params.pageNumber, //每页显示数量
                        pageSize : params.pageSize,  //SQL语句起始索引
                        //page : (params.offset / params.limit)+1 , 当前页码
                        studentid : parentid

                        // Tel : $('#search_tel').val()

                    };
                    return temp;
                },
                columns:[{
                    title : '课程代码',
                    field : 'kcdm',
                    sortable : false

                },
                    {
                        title : '课程名',
                        field : 'kcmc',
                        sortable : false,
                        formatter : function (value,row,index) {
                            return row.course.kcmc;
                        }

                    },{
                        title : '真实成绩',
                        field : 'zscj',
                        sortable : false

                    },{
                        title : '预测成绩',
                        field : 'yccj',
                        sortable : false

                    }]
            })


        }
    function checkNotPass() {
            console.log("群体学院界面查询不及格按钮");
            var selectValue = $("#selectschool option:selected").text();
            console.log(selectValue);


             $('#mytab').bootstrapTable('destroy');

            $('#mytab').bootstrapTable({
                method :"post",
                url : "/student/getStudentScore",
                contentType : "application/x-www-form-urlencoded",
                dataType : "json",
                striped : true, //是否显示行间隔色
                sortable : true,
                pageNumber : 1, //初始化加载第一页
                pagination : true , //是否分页
                sidePagination : "server", //server：服务前端分页 ； client：前端分页
                pageSize : 4,//单页记录数
                pageList : [5,10,20,30], //可选择的单页记录数
                showColumns:true  ,
                showRefresh : true,  // 刷新按钮
                queryParamsType:'',
                detailView : true,
                //height : 400,
                queryParams : function queryParams(params) {  //上传服务器的参数
                    var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                        pageNumber : params.pageNumber, //每页显示数量
                        pageSize : params.pageSize,  //SQL语句起始索引
                        //page : (params.offset / params.limit)+1 , 当前页码
                        xymc : selectValue

                        // Tel : $('#search_tel').val()

                    };
                    return temp;
                },
                columns :[
                    /*{ title : '序号',
                    formatter : function (value,row,index) {
                        var  pageSize = $('#mytab').bootstrapTable('getOptions').pageSize;
                        var  pageNumber = $('#mytab').bootstrapTable('getOptions').pageNumber;
                        return pageSize*(pageNumber-1)+index+1;
                    },
                    sortable : true
                },*/{
                    title : '学号',
                    field : 'studentid',
                    sortable : false
                },{
                    title : '姓名',
                    field : 'name',
                    sortable : false
                },{
                        title : '性别',
                        field : 'gender',
                        sortable : false,
                        formatter : function (value,row,index) {
                            return row.gender==1.0?"男":"女";
                        }
                    },{
                    title : '学院代码',
                    field : 'schoolid',
                    sortable : false
                },{
                    title : '学院名',
                    field : 'xymc',
                    sortable : false,
                    formatter : function (value,row,index) {
                        return row.school.xymc;
                    }
                },
                    {
                        title : '专业代码',
                        field : 'majorid',
                        sortable : false
                    },
                    {
                        title : '班级代码',
                        field : 'classid',
                        sortable : false
                    }

                /*,{
            title : '操作',
            field : 'id',
            sortable : false,
            formatter : operation //对资源进行操作
        }*/],
                onExpandRow : function (index,row,$detail) {
                    InitSubTable(index,row,$detail);
                    
                }
            });
            console.log("table 已执行");
            //value代表该列的值，row代表当前对象
            /* function formatSex(value,row,index) {
                 return value==1?"男":"女";
                 //return row.sex == 1?"男":"女";
             }
             //删除编辑操作
             function operation(value,row,index) {
                 var htm = "<button>删除</button><button>修改</button>"
                 return htm;
             }*/
            //查询按钮事件
        }
    function InitSubTable(index,row,$detail) {
            console.log(row);
            console.log(index);
            console.log($detail);
            var parentid = row.studentid;
            console.log(parentid);
            var cur_table = $detail.html('<table class="table table-hover table-bordered"></table>').find('table');
            $(cur_table).bootstrapTable({
                method :"post",
                url : "/student/getCourseScore",
                contentType : "application/x-www-form-urlencoded",
                dataType : "json",
                striped : true, //是否显示行间隔色
                sortable : true,
                pageNumber : 1, //初始化加载第一页
                pagination : true , //是否分页
                sidePagination : "server", //server：服务前端分页 ； client：前端分页
                pageSize : 4,//单页记录数
                pageList : [5,10,20,30], //可选择的单页记录数
                queryParamsType:'',
                //height : 400,
                queryParams : function queryParams(params) {  //上传服务器的参数
                    var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                        pageNumber : params.pageNumber, //每页显示数量
                        pageSize : params.pageSize,  //SQL语句起始索引
                        //page : (params.offset / params.limit)+1 , 当前页码
                        studentid : parentid

                        // Tel : $('#search_tel').val()

                    };
                    return temp;
                },
                columns:[{
                        title : '课程代码',
                        field : 'kcdm',
                        sortable : false

                    },
                    {
                        title : '课程名',
                        field : 'kcmc',
                        sortable : false,
                        formatter : function (value,row,index) {
                            return row.course.kcmc;
                        }

                    },{
                        title : '真实成绩',
                        field : 'zscj',
                        sortable : false

                    },{
                        title : '预测成绩',
                        field : 'yccj',
                        sortable : false

                }]
            })

            
        }
    function clearForm() {
        document.getElementById("modalOldUserpassword").value=null;
        document.getElementById("modalNewUserpassword1").value=null;
        document.getElementById("modalNewUserpassword2").value=null;
    }
    $("#closebtn").click(function () {
        document.getElementById("modalOldUserpassword").value=null;
        document.getElementById("modalNewUserpassword1").value=null;
        document.getElementById("modalNewUserpassword2").value=null;
    });
    function submitNewPassword() {
        var userName = document.getElementById("modalInputUsername").value;
        var userOldpass = document.getElementById("modalOldUserpassword").value;
        var userNewPass1 = document.getElementById("modalNewUserpassword1").value;
        var userNewPass2 = document.getElementById("modalNewUserpassword2").value;
        console.log(userName,userOldpass,userNewPass1,userNewPass2);
        if(userOldpass==""){
            alert("原密码不能为空");
        }else if(userNewPass1==""){
            alert("新密码不能为空");
        }else if(userNewPass2==""){
            alert("确认密码不能为空");
        }
        else if(userNewPass1!=userNewPass2){
            alert("两次输入的新密码不一致");
        } else{
            $.ajax({
                type:"post",
                url:"/user/modifyPassword",
                data:{"username":userName,"oldpassword":userOldpass,"newpassword":userNewPass1} ,
                dataType:"text",
                success:function (data) {
                    console.log(data);
                    if(data==="update success") {
                        document.getElementById("modalOldUserpassword").value="";
                        document.getElementById("modalNewUserpassword1").value="";
                        document.getElementById("modalNewUserpassword2").value="";
                        alert("密码修改成功");
                        //window.location.href = "./assets/html/mainpage.jsp";
                    } else if(data==="update fail") {
                        alert("密码修改失败");
                    }
                    else if(data==="oldpass error"){
                        alert("原密码错误");
                    }
                }
            })
        }
        
    }
    function showAtRight(url) {
        var xmlHttp;
        if(window.XMLHttpRequest){
            //code for IE7+,firefox,chrome,opera,safari
            xmlHttp = new XMLHttpRequest();   //创建XMLHttpRequest对象
        }
        else {
            //code for IE5 IE6
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlHttp.onreadystatechange = function () {
            //onreadystatechange  当readystate变化时调用后面的方法

            if(xmlHttp.readyState == 4){
                //xmlHttp.readyState == 4  finished downloading response
                if(xmlHttp.status == 200){
                    //服务器反馈正常
                    document.getElementById("rightdiv").innerHTML = xmlHttp.responseText;//重置div中的内容
                }
                else if(xmlHttp.status ==404){
                    alert("出错了，404 Not Found");
                    return;
                }
                else if(xmlHttp.status==403){
                    alert("出错了，403 Forbidden");
                    return;
                }
                else {
                    alert("出错了");
                    return;
                }
            }

        }
        //把请求发送到服务器上的指定文件（URL指定的文件）进行处理
        xmlHttp.open("GET",url,true);
        xmlHttp.send();



    }
    var theme = {
        color: [
            '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
            '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
        ],

        title: {
            itemGap: 8,
            textStyle: {
                fontWeight: 'normal',
                color: '#408829'
            }
        },

        dataRange: {
            color: ['#1f610a', '#97b58d']
        },

        toolbox: {
            color: ['#408829', '#408829', '#408829', '#408829']
        },

        tooltip: {
            backgroundColor: 'rgba(0,0,0,0.5)',
            axisPointer: {
                type: 'line',
                lineStyle: {
                    color: '#408829',
                    type: 'dashed'
                },
                crossStyle: {
                    color: '#408829'
                },
                shadowStyle: {
                    color: 'rgba(200,200,200,0.3)'
                }
            }
        },

        dataZoom: {
            dataBackgroundColor: '#eee',
            fillerColor: 'rgba(64,136,41,0.2)',
            handleColor: '#408829'
        },
        grid: {
            borderWidth: 0
        },

        categoryAxis: {
            axisLine: {
                lineStyle: {
                    color: '#408829'
                }
            },
            splitLine: {
                lineStyle: {
                    color: ['#eee']
                }
            }
        },

        valueAxis: {
            axisLine: {
                lineStyle: {
                    color: '#408829'
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
                }
            },
            splitLine: {
                lineStyle: {
                    color: ['#eee']
                }
            }
        },
        timeline: {
            lineStyle: {
                color: '#408829'
            },
            controlStyle: {
                normal: {
                    color: '#408829'
                },
                emphasis: {
                    color: '#408829'
                }
            }
        },

        k: {
            itemStyle: {
                normal: {
                    color: '#68a54a',
                    color0: '#a9cba2',
                    lineStyle: {
                        width: 1,
                        color: '#408829',
                        color0: '#86b379'
                    }
                }
            }
        },
        map: {
            itemStyle: {
                normal: {
                    areaStyle: {
                        color: '#ddd'
                    },
                    label: {
                        textStyle: {
                            color: '#c12e34'
                        }
                    }
                },
                emphasis: {
                    areaStyle: {
                        color: '#99d2dd'
                    },
                    label: {
                        textStyle: {
                            color: '#c12e34'
                        }
                    }
                }
            }
        },
        force: {
            itemStyle: {
                normal: {
                    linkStyle: {
                        strokeColor: '#408829'
                    }
                }
            }
        },
        chord: {
            padding: 4,
            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 1,
                        color: 'rgba(128, 128, 128, 0.5)'
                    },
                    chordStyle: {
                        lineStyle: {
                            width: 1,
                            color: 'rgba(128, 128, 128, 0.5)'
                        }
                    }
                },
                emphasis: {
                    lineStyle: {
                        width: 1,
                        color: 'rgba(128, 128, 128, 0.5)'
                    },
                    chordStyle: {
                        lineStyle: {
                            width: 1,
                            color: 'rgba(128, 128, 128, 0.5)'
                        }
                    }
                }
            }
        },
        gauge: {
            startAngle: 225,
            endAngle: -45,
            axisLine: {
                show: true,
                lineStyle: {
                    color: [
                        [0.2, '#86b379'],
                        [0.8, '#68a54a'],
                        [1, '#408829']
                    ],
                    width: 8
                }
            },
            axisTick: {
                splitNumber: 10,
                length: 12,
                lineStyle: {
                    color: 'auto'
                }
            },
            axisLabel: {
                textStyle: {
                    color: 'auto'
                }
            },
            splitLine: {
                length: 18,
                lineStyle: {
                    color: 'auto'
                }
            },
            pointer: {
                length: '90%',
                color: 'auto'
            },
            title: {
                textStyle: {
                    color: '#333'
                }
            },
            detail: {
                textStyle: {
                    color: 'auto'
                }
            }
        },
        textStyle: {
            fontFamily: 'Arial, Verdana, sans-serif'
        }
    };
    function checkBarGraph() {
        console.log("click触发");
        var echartBar = echarts.init(document.getElementById('bargraphdiv'),theme);
        echartBar.setOption({
            title: {
                text: 'Graph title',
                subtext: 'Graph Sub-text'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['sales', 'purchases']
            },
            toolbox: {
                show: false
            },
            calculable: false,
            xAxis: [{
                type: 'category',
                data: ['1?', '2?', '3?', '4?', '5?', '6?', '7?', '8?', '9?', '10?', '11?', '12?']
            }],
            yAxis: [{
                type: 'value'
            }],
            series: [{
                name: 'sales',
                type: 'bar',
                data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                markPoint: {
                    data: [{
                        type: 'max',
                        name: '???'
                    }, {
                        type: 'min',
                        name: '???'
                    }]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '???'
                    }]
                }
            }, {
                name: 'purchases',
                type: 'bar',
                data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                markPoint: {
                    data: [{
                        name: 'sales',
                        value: 182.2,
                        xAxis: 7,
                        yAxis: 183,
                    }, {
                        name: 'purchases',
                        value: 2.3,
                        xAxis: 11,
                        yAxis: 3
                    }]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '???'
                    }]
                }
            }]
        });


    }
    var dataStyle = {
        normal: {
            label: {
                show: false
            },
            labelLine: {
                show: false
            }
        }
    };
    var placeHolderStyle = {
        normal: {
            color: 'rgba(0,0,0,0)',
            label: {
                show: false
            },
            labelLine: {
                show: false
            }
        },
        emphasis: {
            color: 'rgba(0,0,0,0)'
        }
    };
    function checkMiniPie() {
        console.log("mini pie click");

        var echartMiniPie = echarts.init(document.getElementById('minipiediv'), theme);
        echartMiniPie.setOption({
            title: {
                text: 'Chart #2',
                subtext: 'From ExcelHome',
                sublink: 'http://e.weibo.com/1341556070/AhQXtjbqh',
                x: 'center',
                y: 'center',
                itemGap: 20,
                textStyle: {
                    color: 'rgba(30,144,255,0.8)',
                    fontFamily: '微软雅黑',
                    fontSize: 35,
                    fontWeight: 'bolder'
                }
            },
            tooltip: {
                show: true,
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 170,
                y: 45,
                itemGap: 12,
                data: ['68%Something #1', '29%Something #2', '3%Something #3'],
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: true,
                        title: "Text View",
                        lang: [
                            "Text View",
                            "Close",
                            "Refresh",
                        ],
                        readOnly: false
                    },
                    restore: {
                        show: true,
                        title: "Restore"
                    },
                    saveAsImage: {
                        show: true,
                        title: "Save Image"
                    }
                }
            },
            series: [{
                name: '1',
                type: 'pie',
                clockWise: false,
                radius: [105, 130],
                itemStyle: dataStyle,
                data: [{
                    value: 68,
                    name: '68%Something #1'
                }, {
                    value: 32,
                    name: 'invisible',
                    itemStyle: placeHolderStyle
                }]
            }, {
                name: '2',
                type: 'pie',
                clockWise: false,
                radius: [80, 105],
                itemStyle: dataStyle,
                data: [{
                    value: 29,
                    name: '29%Something #2'
                }, {
                    value: 71,
                    name: 'invisible',
                    itemStyle: placeHolderStyle
                }]
            }, {
                name: '3',
                type: 'pie',
                clockWise: false,
                radius: [25, 80],
                itemStyle: dataStyle,
                data: [{
                    value: 3,
                    name: '3%Something #3'
                }, {
                    value: 97,
                    name: 'invisible',
                    itemStyle: placeHolderStyle
                }]
            }]
        });



    }
    function checkPostgraduateInfo() {   //研究生基本信息
        var stuNum = $("#inputStuNum").val();
        //初始化echart
        var echartLine = echarts.init(document.getElementById('cardConsumptiondiv'),theme);
        var option = null;
        if(stuNum==""){
            alert("学号不能为空，请重新输入");
        }else {
            console.log(stuNum);
            $.ajax({
                type: "post",
                url: "/student/getstuinfo",
                dataType: "json",
                sync :true,
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify({xh: stuNum}),
                success: function (data) {
                    console.log(data);
                    document.getElementById("numberId").innerText = data["xh"];
                    document.getElementById("nameId").innerText = data["xm"];
                    document.getElementById("sexId").innerText = data["xbdm"]==1?"男":"女";
                    document.getElementById("ageId").innerText = parseInt(data["csrq"]);
                    document.getElementById("nationId").innerText = data["byyx"];
                    document.getElementById("politicsId").innerText = data["byzydm"];
                    document.getElementById("schoolId").innerText = data["rxzydm"];
                    document.getElementById("majorId").innerText = data["zzmmdm"];
                },
                error: function () {
                    document.getElementById("numberId").innerText = null;
                    document.getElementById("nameId").innerText = null;
                    document.getElementById("ageId").innerText = null;
                    document.getElementById("sexId").innerText = null;
                    document.getElementById("nationId").innerText = null;
                    document.getElementById("politicsId").innerText = null;
                    document.getElementById("schoolId").innerText = null;
                    document.getElementById("majorId").innerText = null;
                    document.getElementById("stuScore").innerText = null;
                    alert("该学号不存在，请重新输入！");
                }

            });

            //页面加载数据
            $.ajax({
                type: "post",
                sync: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url: "/getCardConsumption",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify({xh: stuNum}),
                dataType: "json", //返回数据形式为json
                success: function (data) {
                    console.log(data);
                       option = {
                           title: {
                               text: '一卡通消费信息(单位：元)',
                               subtext: '全年52周'
                           },
                           tooltip: {
                               trigger: 'axis'
                           },
                           legend: {
                               /*x: 220,
                               y: 40,
                               data: ['Intent', 'Pre-order', 'Deal']*/
                           },
                           toolbox: {
                               show: true,
                               feature: {
                                   /*magicType: {
                                       show: true,
                                       title: {
                                           line: 'Line',
                                           bar: 'Bar'
                                       },
                                       type: ['line', 'bar']
                                   }*/
                                   /*restore: {
                                       show: true,
                                       title: "Restore"
                                   },
                                   saveAsImage: {
                                       show: true,
                                       title: "Save Image"
                                   }*/
                               }
                           },
                           calculable: true,
                           xAxis: [{
                               type: 'category',
                               boundaryGap: false,
                               data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13',
                                   '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34',
                                   '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52']
                           }],
                           yAxis: [{
                               type: 'value'
                           }],
                           series: [{
                               name: '周消费',
                               type: 'line',
                               itemStyle: {
                                   normal: {
                                       /*areaStyle: {
                                           type: 'default'
                                       }*/
                                   }
                               },
                               data: [data["week1"] / 100, data["week2"] / 100, data["week3"] / 100, data["week4"] / 100, data["week5"] / 100, data["week6"] / 100,
                                   data["week7"] / 100, data["week8"] / 100, data["week9"] / 100, data["week10"] / 100, data["week11"] / 100, data["week12"] / 100,
                                   data["week13"] / 100, data["week14"] / 100, data["week15"] / 100, data["week16"] / 100, data["week17"] / 100, data["week18"] / 100,
                                   data["week19"] / 100, data["week20"] / 100, data["week21"] / 100, data["week22"] / 100, data["week23"] / 100, data["week24"] / 100,
                                   data["week25"] / 100, data["week26"] / 100, data["week27"] / 100, data["week28"] / 100, data["week29"] / 100, data["week30"] / 100,
                                   data["week31"] / 100, data["week32"] / 100, data["week33"] / 100, data["week34"] / 100, data["week35"] / 100, data["week36"] / 100,
                                   data["week37"] / 100, data["week38"] / 100, data["week39"] / 100, data["week40"] / 100, data["week41"] / 100, data["week42"] / 100,
                                   data["week43"] / 100, data["week44"] / 100, data["week45"] / 100, data["week46"] / 100, data["week47"] / 100, data["week48"] / 100,
                                   data["week49"] / 100, data["week50"] / 100, data["week51"] / 100, data["week52"] / 100],
                               markLine:{
                                   symbol:"arrow",
                                   data:[
                                       {type:'average',name:'平均值'}
                                   ],
                                   itemStyle:{
                                       normal:{
                                           label:{
                                               show:true,
                                               formatter:function (param) {
                                                   return param.name+":"+param.value;
                                               }
                                           }
                                       }
                                   }
                               },
                               markPoint:{
                                   symbol:"pin",
                                   // symbolSize:30
                                   data:[
                                       {type:'min',name:'最小值'},
                                       {type:'max',name:'最大值'}
                                   ],
                                  /* itemStyle:{
                                       normal:{
                                           label:{
                                               show:true,
                                               formatter:function (param) {
                                                   return param.name+":"+param.value;
                                               }
                                           }
                                       }
                                   }*/
                               }
                           }]
                       };
                    echartLine.setOption(option);
                }

            });
        }


    }
    function checkUndergraduateInfo() {   //本科生基本信息
            var stuNum = $("#inputStuNum2").val();
            var barChart = echarts.init(document.getElementById("stuScore2"),theme);
            var option = null;
            if(stuNum==""){
                alert("学号不能为空，请重新输入");
            }else {
                console.log(stuNum);
                $.ajax({
                    type: "post",
                    url: "/student/getUndergraduateInfo",
                    dataType: "json",
                    sync : true,
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({studentid: stuNum}),
                    success: function (data) {
                        console.log(data);
                        document.getElementById("numberId2").innerText = data["studentid"];
                        document.getElementById("nameId2").innerText = data["name"];
                        document.getElementById("sexId2").innerText = data["school"].xymc;
                        document.getElementById("ageId2").innerText = data["majorid"];
                        document.getElementById("nationId2").innerText = data["gender"]==1.0?"男":"女";
                        document.getElementById("politicsId2").innerText = data["classid"];
                    },
                    error: function () {
                        document.getElementById("numberId2").innerText = null;
                        document.getElementById("nameId2").innerText = null;
                        document.getElementById("ageId2").innerText = null;
                        document.getElementById("sexId2").innerText = null;
                        document.getElementById("nationId2").innerText = null;
                        document.getElementById("politicsId2").innerText = null;
                        alert("该学号不存在，请重新输入！");
                    }

                });
                $.ajax({
                    type: "post",
                    sync: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                    url: "/getTwoScore",
                    contentType:"application/json;charset=utf-8",
                    data:JSON.stringify({xh:stuNum}),
                    dataType: "json", //返回数据形式为json
                    success: function (data) {
                        console.log(data);
                        var kcmc=[];
                        var zscj=[];
                        var yccj=[];
                        for(var i =0; i<data.length;i++){
                            kcmc.push(data[i].course['kcmc']);
                        }
                        for(var i=0;i<data.length;i++){
                            zscj.push(data[i].zscj);
                        }
                        for(var i=0;i<data.length;i++){
                            yccj.push(data[i].yccj);
                        }

                        option ={
                            title :{
                                text: '课程成绩分布',
                                subtext: '',
                                x:'left',
                                y:'top'

                            },
                            tooltip: {
                                trigger:'axis'
                            },
                            legend: {
                                data:['真实成绩','预测成绩']
                            },
                            toolbox: {
                                show: true,
                                feature: {
                                    /*magicType: {
                                        show: true,
                                        title: {
                                            line: 'Line',
                                        },
                                        type: ['line']
                                    },*/
                                }
                            },
                            calculable: true,
                            xAxis: {
                                name:'课程',
                                show:true,
                                data: kcmc,
                                //x轴项目名数值排列
                                type:'category',
                                axisLabel:{
                                    interval:0,
                                    rotate:25
                                }

                            },
                            yAxis:{
                                name:'成绩',
                                type: 'value',
                                min:0,
                                max:100,
                                interval:20

                            },
                            grid:{
                                show:true,
                                bottom:'30%'

                            },
                            series:[{
                                //name: '成绩分布图',//与标签内容相同
                                name : '真实成绩',
                                type:'line',
                                // smooth : true,
                                itemStyle: {
                                    normal: {
                                        /*areaStyle: {
                                            type: 'default'
                                        }*/
                                    }
                                },
                                /* itemStyle:{
                                     normal:{
                                         color: function (params) {
                                             var colorList = ['#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                                 '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                                 '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'];
                                             return colorList[params.dataIndex];

                                         },
                                         //以下为是否显示，显示位置和格式的设置
                                         label:{
                                             show:true,
                                             position:'top',
                                             //formatter:'{b}\n{c}'
                                         }
                                     }
                                 },
                                 barWidth:50,*/
                                data: zscj,
                                markLine:{
                                    symbol:"arrow",
                                    data:[
                                        {type:'average',name:'平均值'}
                                    ]
                                },
                                markPoint:{
                                    symbol:"pin",
                                    // symbolSize:30
                                    data:[
                                        {type:'min',name:'最小值'},
                                        {type:'max',name:'最大值'}
                                    ]
                                }
                            },
                                {
                                    //name: '成绩分布图',//与标签内容相同
                                    name : '预测成绩',
                                    type:'line',
                                    // smooth : true,
                                    itemStyle: {
                                        normal: {
                                            /*areaStyle: {
                                                type: 'default'
                                            }*/
                                        }
                                    },
                                    data:yccj,
                                    markLine:{
                                        symbol:"arrow",
                                        data:[
                                            {type:'average',name:'平均值'}
                                        ]
                                    },
                                    markPoint:{
                                        symbol:"pin",
                                        // symbolSize:30
                                        data:[
                                            {type:'min',name:'最小值'},
                                            {type:'max',name:'最大值'}
                                        ]
                                    }
                                }]
                        };
                        barChart.setOption(option);
                    }

                });
            }


        }
    $("#logout").click( function() {
        console.log("注销");
        $.ajax({
            url:"/user/logout",
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="success") {
                    window.location.href = "mainpage.jsp";
                }
                else {
                    //alert("用户名或密码错误！");
                }
            }
        })
        
    });
    /*function check() {
        $.ajax({
            type : "GET",
            url : "/user/getalluser",
            dataType : "json",
            success:function(data){
                var obj = eval(data);
                var tbody = $('<tbody></tbody>');
                $(obj).each(function (index) {
                    var val = obj[index];
                    var tr = $('<tr></tr>');
                    tr.append('<td>'+ val.userId + '</td>' + '<td>'+val.userName + '</td>' + '<td>' + val.userPassword + '</td>');
                    tbody.append(tr);
                });
                $('#tableuserlist tbody').replaceWith(tbody);
            }

        });

    }*/
    /*function ScorePredict() {
        var stuNum = $("#inputStuNum").val();
        $.ajax({
            type : "post",
            url : "/getScorePredict",
            dataType: "json",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({stuNumber:stuNum}),
            success:function(data){
                var obj = eval(data);
                var tbody = $('<tbody></tbody>');
                $(obj).each(function (index) {
                    var val = obj[index];
                    var tr = $('<tr></tr>');
                    tr.append('<td>'+ val.courseId + '</td>' + '<td>'+val.courseName + '</td>' + '<td>' + val.scorePredict + '</td>');
                    tbody.append(tr);
                });
                $('#tableScorePredictlist tbody').replaceWith(tbody);
            }

        });


    }*/

    /*function checkLineGraph() {
        var echartLine = echarts.init(document.getElementById('linegraphdiv'), theme);

        echartLine.setOption({
            title: {
                text: 'Line Graph',
                subtext: 'Subtitle'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                x: 220,
                y: 40,
                data: ['Intent', 'Pre-order', 'Deal']
            },
            toolbox: {
                show: true,
                feature: {
                    magicType: {
                        show: true,
                        title: {
                            line: 'Line',
                            bar: 'Bar',
                            stack: 'Stack',
                            tiled: 'Tiled'
                        },
                        type: ['line', 'bar', 'stack', 'tiled']
                    },
                    restore: {
                        show: true,
                        title: "Restore"
                    },
                    saveAsImage: {
                        show: true,
                        title: "Save Image"
                    }
                }
            },
            calculable: true,
            xAxis: [{
                type: 'category',
                boundaryGap: false,
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
            }],
            yAxis: [{
                type: 'value'
            }],
            series: [{
                name: 'Deal',
                type: 'line',
                smooth: true,
                itemStyle: {
                    normal: {
                        /!*areaStyle: {
                            type: 'default'
                        }*!/
                    }
                },
                data: [10, 12, 21, 54, 260, 830, 710]},
                {
                    name: 'Pre-order',
                type: 'line',
                smooth: true,
                itemStyle: {
                    normal: {
                       /!* areaStyle: {
                            type: 'default'
                        }*!/
                    }
                },
                data: [30, 182, 434, 791, 390, 30, 10]
            },
                {
                name: 'Intent',
                type: 'line',
                smooth: true,
                itemStyle: {
                    normal: {
                        /!*areaStyle: {
                            type: 'default'
                        }*!/
                    }
                },
                data: [1320, 1132, 601, 234, 120, 90, 20]
            }]
        });


    }*/


    function checkMFRatioSingleSchool() {
        var selectSchoolalue = $("#lastschool option:selected").text();
        var PieCollapseChartMF = echarts.init(document.getElementById("schoolMFRatiodiv"),theme);
        console.log("${sessionScope.get("lastschool").lastschool}");
        var PieCollapseChart = echarts.init(document.getElementById("schoolPersonNumdiv"),theme);
        var option = null;
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/getMFRatioSingleSchool",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({xymc:selectSchoolalue}),
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);
                console.log("返回的数据");
                var gender=[];
                var number=[];
                for(var i =0; i<data.length;i++){
                    gender.push(data[i].gender==1.0?"男":(data[i].gender==2.0?"女":"未知"));
                }
                for(var i=0;i<data.length;i++){
                    number.push(data[i].mfnumber);
                }
                var rs = [];
                for(var i=0;i<data.length;i++){
                    rs.push({name : gender[i], value : number[i]});
                }
                console.log(gender);
                console.log(number);
                console.log(rs)
                option = {
                    title: {
                        text: '男女比例',
                        subtext: '',
                        x: 'left',
                        y: 'top'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x:'left',
                        y :'bottom',
                        orient:'vertical',
                        data: gender
                        // data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            /*magicType: {
                                show: true,
                                title: {
                                    line: 'Line',
                                },
                                type: ['line']
                            },*/
                        }
                    },
                    calculable: true,
                    series: [{
                        name: '性别比例',
                        type: 'pie',
                        radius: '50%',
                        center: ['50%', '50%'],
                        data: rs

                    }]
                };
                PieCollapseChartMF.setOption(option);
            }

        });

        $('#mytabschoolStu').bootstrapTable('destroy');

        $('#mytabschoolStu').bootstrapTable({
            method :"post",
            url : "/student/getSchoolStudent",
            contentType : "application/x-www-form-urlencoded",
            dataType : "json",
            striped : true, //是否显示行间隔色
            sortable : true,
            pageNumber : 1, //初始化加载第一页
            pagination : true , //是否分页
            sidePagination : "server", //server：服务前端分页 ； client：前端分页
            pageSize : 4,//单页记录数
            pageList : [5,10,20,30], //可选择的单页记录数
            showColumns:true  ,
            showRefresh : true,  // 刷新按钮
            queryParamsType:'',
            // detailView : true,
            //height : 400,
            queryParams : function queryParams(params) {  //上传服务器的参数
                var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                    pageNumber : params.pageNumber, //每页显示数量
                    pageSize : params.pageSize,  //SQL语句起始索引
                    //page : (params.offset / params.limit)+1 , 当前页码
                    xymc : selectSchoolalue

                    // Tel : $('#search_tel').val()

                };
                return temp;
            },
            columns :[
                /*{ title : '序号',
                formatter : function (value,row,index) {
                    var  pageSize = $('#mytab').bootstrapTable('getOptions').pageSize;
                    var  pageNumber = $('#mytab').bootstrapTable('getOptions').pageNumber;
                    return pageSize*(pageNumber-1)+index+1;
                },
                sortable : true
            },*/{
                    title : '学号',
                    field : 'studentid',
                    sortable : false
                },{
                    title : '姓名',
                    field : 'name',
                    sortable : false
                },{
                    title : '性别',
                    field : 'gender',
                    sortable : false,
                    formatter : function (value,row,index) {
                        return row.gender==1.0?"男":(row.gender==2.0?"女":"未知");
                    }
                },
                {
                    title : '专业代码',
                    field : 'majorid',
                    sortable : false
                },
                {
                    title : '班级代码',
                    field : 'classid',
                    sortable : false
                }
            ],
            /* onExpandRow : function (index,row,$detail) {
                 InitSubTable(index,row,$detail);

             }*/
        });


        $.ajax({
            type: "get",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/getSchoolPersonNum",
            contentType:"application/json;charset=utf-8",
            data:'',
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);
                console.log("返回的数据");
                var xymc=[];
                var number=[];
                for(var i =0; i<data.length;i++){
                    xymc.push(data[i].xymc);
                }
                for(var i=0;i<data.length;i++){
                    number.push(data[i].number);
                }
                var rs = [];
                for(var i=0;i<data.length;i++){
                    rs.push({name : xymc[i], value : number[i]});
                }
                console.log(xymc);
                console.log(number);
                console.log(rs)
                option = {
                    title: {
                        text: '各学院人数占比',
                        subtext: '',
                        x: 'left',
                        y: 'top'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x:'center',
                        y:'bottom',
                        data: xymc
                        // data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            /*magicType: {
                                show: true,
                                title: {
                                    line: 'Line',
                                },
                                type: ['line']
                            },*/
                        }
                    },
                    calculable: true,
                    series: [{
                        name: '人数占比',
                        type: 'pie',
                        /*radius: '50%',
                        center: ['50%', '50%'],*/
                        radius: [70, 180],
                        center: ['50%', '50%'],
                        roseType: 'area',
                        x: '50%',
                        max: 20000,
                        sort: 'ascending',
                        data: rs

                    }]
                    /*series: [{
                        name: 'Area Mode',
                        type: 'pie',
                        radius: [25, 90],
                        center: ['50%', 170],
                        roseType: 'area',
                        x: '50%',
                        max: 40,
                        sort: 'ascending',
                        data: [{
                            value: 10,
                            name: 'rose1'
                        }, {
                            value: 5,
                            name: 'rose2'
                        }, {
                            value: 15,
                            name: 'rose3'
                        }, {
                            value: 25,
                            name: 'rose4'
                        }, {
                            value: 20,
                            name: 'rose5'
                        }, {
                            value: 35,
                            name: 'rose6'
                        }]
                    }]*/
                };
                PieCollapseChart.setOption(option);
            }

        });

        console.log("table 已执行");
    }



    function checkConsumptionOutlier() {
        var xh = $("#inputXh").val();
        var year = $("#inputYear option:selected").text();
        if(xh==""){
            alert("学号不能为空！");
        }else{
        console.log(xh);
        console.log(year);
        //初始化echart
        var echartLine = echarts.init(document.getElementById('yearConsumptiondiv'), theme);
        //页面加载数据
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/getYearConsumptionOutlier",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({xh: xh,year:year}),
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);

                echartLine.setOption({
                    title: {
                        text: '消费信息离群值',
                        subtext: '全年53周'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        /*x: 220,
                        y: 40,
                        data: ['Intent', 'Pre-order', 'Deal']*/
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            /*magicType: {
                                show: true,
                                title: {
                                    line: 'Line'
                                },
                                type: ['line']
                            }*/
                        }
                    },
                    calculable: true,
                    xAxis: [{
                        type: 'category',
                        axisLine :{
                            onZero:false,
                        },
                        boundaryGap: false,
                        data: ['1', '2', '3', '4', '5', '6','7','8','9','10','11','12','13',
                            '14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34',
                            '35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53']
                    }],
                    yAxis: [{
                        type: 'value',
                        min:-1.0,
                        max :1.0,
                        interval:0.2
                    }],
                    series: [{
                        name: '消费离群值',
                        type: 'line',
                        //smooth: true,
                        itemStyle: {
                            normal: {
                                /*areaStyle: {
                                    type: 'default'
                                }*/
                            }
                        },
                        data: [data["week1"], data["week2"], data["week3"], data["week4"], data["week5"], data["week6"],
                            data["week7"], data["week8"], data["week9"], data["week10"], data["week11"], data["week12"],
                            data["week13"], data["week14"], data["week15"], data["week16"], data["week17"], data["week18"],
                            data["week19"], data["week20"], data["week21"], data["week22"], data["week23"], data["week24"],
                            data["week25"], data["week26"], data["week27"], data["week28"], data["week29"], data["week30"],
                            data["week31"], data["week32"], data["week33"], data["week34"], data["week35"], data["week36"],
                            data["week37"], data["week38"], data["week39"], data["week40"], data["week41"], data["week42"],
                            data["week43"], data["week44"], data["week45"], data["week46"], data["week47"], data["week48"],
                            data["week49"], data["week50"], data["week51"], data["week52"],data["week53"]],
                        markLine:{
                            symbol:"arrow",
                            data:[
                                {type:'average',name:'平均值'}
                            ]
                        },
                        markPoint:{
                            symbol:"pin",
                            // symbolSize:30
                            data:[
                                {type:'min',name:'最小值'},
                                {type:'max',name:'最大值'}
                            ]
                        }
                    }]
                });
            }

        });
            }

        
    }
</script>
</body>
</html>
