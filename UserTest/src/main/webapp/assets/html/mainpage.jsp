<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
    <link rel="icon" href="../icon/buptlogo.png">
    <title>校园信息化</title>
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
                    <a href="#" class = "project_a"><img src="../icon/buptlogo.png" width="32" height="32" style="background: white;border-radius: 50%"/> 智慧校园</a>
                </div>
                <div class="profile_pic">
                            <span class="glyphicon glyphicon-user"></span>
                            <span>welcome,${sessionScope.get("user").userName}</span>
                </div>
            </div>
            <ul class="nav nav-sidebar" >
                    <li class="active" id="mainpageli"><a href="#" onclick="showMainPage('rightmainpage.jsp');return false;">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 </a></li>
                    <li class="" id="personpageli"><a href="#"  onclick="showPersonPage('rightpersonpage.jsp');return false;">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 学生个人信息</a></li>
                    <li class="" id="grouppageli"><a href="#" onclick="showGroupPage('rightgrouppage.jsp');return false;">
                        <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>学生群体信息</a></li>
                    <li class="" id="apili"><a href="#" onclick="showApiPage('api.jsp');return false;">
                    <span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>调用接口</a></li>
            </ul>
        </div>
        <div class="col-md-10 col-md-offset-2 main" id="rightpage">
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <span class="glyphicon glyphicon-user"></span>${sessionScope.get("user").userName}
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a class="btn btn-default" href="#" data-toggle="modal" data-target="#myModal" role="button">修改密码</a></li>
                                    <li><a class="btn btn-default" href="#" role="button" id="logout">退出登录</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div id="rightdiv" class="rightdiv">
                <jsp:include page="rightmainpage.jsp" flush="true"/>
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
    function showGroupPage(name) {
        loadView(name);
    }
    function showPersonPage(name) {
        loadView(name);
    }
    function showApiPage(name) {
        loadView(name);
    }
    function GotoPersonPage(name,param) {
        console.log("进入mainpage.jsp的showPersonPage函数");
        loadView2(name,param);
    }
    function loadView2(name,param) {
        console.log("执行loadView2函数");
        $("#mainpageli").removeClass('active');
        $("#personpageli").addClass('active');
        $("#rightdiv").empty();
        $("#rightdiv").load(name,{"studentid":param});
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
                url:"/SmartCampus/user/modifyPassword",
                data:{"username":userName,"oldpassword":userOldpass,"newpassword":userNewPass1} ,
                dataType:"text",
                success:function (data) {
                    console.log(data);
                    if(data==="update success") {
                        document.getElementById("modalOldUserpassword").value="";
                        document.getElementById("modalNewUserpassword1").value="";
                        document.getElementById("modalNewUserpassword2").value="";
                        alert("密码修改成功");
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
    $("#logout").click( function() {
        console.log("注销");
        $.ajax({
            url:"/SmartCampus/user/logout",
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="success") {
                    window.location.href = "/SmartCampus/index.jsp";
                }
                else {
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
<script language="javascript">
    //防止页面后退
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
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
