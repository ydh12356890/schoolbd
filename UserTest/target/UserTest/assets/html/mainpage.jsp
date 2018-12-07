<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%--<body onload="showAtRight('rightmainpage.jsp')"></body>--%>
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
    <link href="../css/bootstrap-select.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" >--%>
    <link rel="icon" href="../icon/buptlogo.png">
    <title>校园信息化</title>
    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
</head>
<body>
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
                        <label for="modalInputUsername" class="col-sm-3 control-label">用户名</label>
                        <div class="input-group col-sm-8">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input type="text"  id="modalInputUsername" class="form-control" value="${sessionScope.get("user").userName}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modalOldUserpassword" class="col-sm-3 control-label">原密码</label>
                        <div class="input-group col-sm-8">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password"  id="modalOldUserpassword" class="form-control" placeholder="请输入原密码">
                            <span class="input-group-addon">
                                <span class="show_old_pass glyphicon glyphicon-eye-close"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modalNewUserpassword1" class="col-sm-3 control-label">新密码</label>
                        <div class="input-group col-sm-8">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password"  id="modalNewUserpassword1" class="form-control" placeholder="请输入新密码">
                            <span class="input-group-addon">
                                <span class="show_new_pass glyphicon glyphicon-eye-close"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modalNewUserpassword2" class="col-sm-3 control-label">确认新密码</label>
                        <div class="input-group col-sm-8">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password"  id="modalNewUserpassword2" class="form-control" placeholder="请确认新密码">
                            <span class="input-group-addon">
                                <span class="show_new_pass2 glyphicon glyphicon-eye-close"></span>
                            </span>
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
                <%--<li class="active"><a href="#" onclick="showAtRight('rightmainpage.jsp')">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 </a></li>
                <li class=""><a href="#"  onclick="showAtRight('rightpersonpage.jsp')">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 学生个人信息</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightgrouppage.html')">
                    <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>学生群体信息</a></li>--%>

                    <li class="active"><a href="#" onclick="showMainPage('rightmainpage.jsp');return false;">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 </a></li>
                    <li class=""><a href="#"  onclick="showPersonPage('rightpersonpage.jsp');return false;">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 学生个人信息</a></li>
                    <li class=""><a href="#" onclick="showGroupPage('rightgrouppage.jsp');return false;">
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

            </div>
            <div id="rightdiv" class="rightdiv">
                <%--<label class="sr-only" for="inputAutoxh">输入学号</label>
                <input class="form-control" type="text" id="inputAutoxh"  autocomplete="off">--%>
                <jsp:include page="rightmainpage.jsp" flush="true"/>
                <%-- <jsp:include page="${}" flush="true"/>--%>
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
        $('ul.nav-sidebar >li').click(function (e) {
            $('ul.nav-sidebar>li').removeClass('active');
            $(this).addClass('active');

        });
    });
    function loadView(name) {
        $("#rightdiv").empty();
        $("#rightdiv").load(name);
        
    }
    function showMainPage(name) {
        loadView(name);
    }
    function showPersonPage(name) {
        loadView(name);
    }
    function showGroupPage(name) {
        loadView(name);
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
    /*function showAtRight(url) {
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
    }*/
    var theme = {
        color: [
            '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
            '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653'
        ],

        title: {
            itemGap: 8,
            textStyle: {
                fontWeight: 'normal',
                color: '#000000'
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
                    color: '#000000'
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
                    color: '#000000'
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
                show: true
            },
            labelLine: {
                show: true
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
</script>
<script type="text/javascript">


    $(".show_old_pass").click(function () {
        var pass = document.getElementById("modalOldUserpassword");

        if (pass.type === "password"){
            pass.type = "text";
            $(".show_old_pass").removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
        }
        else {
            pass.type = "password";
            $(".show_old_pass").removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
        }
    })

</script>
<script type="text/javascript">


    $(".show_new_pass").click(function () {
        var pass = document.getElementById("modalNewUserpassword1");

        if (pass.type === "password"){
            pass.type = "text";
            $(".show_new_pass").removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
        }
        else {
            pass.type = "password";
            $(".show_new_pass").removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
        }
    })

</script>
<script type="text/javascript">


    $(".show_new_pass2").click(function () {
        var pass = document.getElementById("modalNewUserpassword2");

        if (pass.type === "password"){
            pass.type = "text";
            $(".show_new_pass2").removeClass("glyphicon-eye-close").addClass("glyphicon-eye-open");
        }
        else {
            pass.type = "password";
            $(".show_new_pass2").removeClass("glyphicon-eye-open").addClass("glyphicon-eye-close");
        }
    })

</script>
</body>
</html>
