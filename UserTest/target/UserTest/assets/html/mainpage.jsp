<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" >--%>
    <link rel="icon" href="../icon/bd.jpg">

    <title>Project BD</title>

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">

</head>
<%--<style>
    #personPicture{
        background: #ffffff;
        border: 1px solid #E6E9ED;
        margin-bottom: 5px;
        width: 100%;
        height: auto;
        vertical-align: middle;
        display: table-cell;
        text-align: center;
        float: left;

    }
    #personInfo{
        border: 1px solid #E6E9ED;
        background: #ffffff;
        margin-bottom: 5px;
        /*padding: 50px;*/
        width: 100%;
        height: auto;
        float: left;

    }
    #historyScore{
        background: #ffffff;
        border: 1px solid #E6E9ED;
        margin-bottom: 5px;
        width: 100%;
        height: auto;
        float: left;
        clear: left;

    }
    #currentCourse{
        background: #ffffff;
        border: 1px solid #E6E9ED;
        margin-bottom: 5px;
        width: 100%;
        height: auto;
        float: left;

    }

</style>--%>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 sidebar">
            <div class="leftheader">
                <div class="project_title">
                    <a href="#" class = "project_a"><span class="glyphicon glyphicon-asterisk"></span> 智慧校园</a>
                </div>
                <div class="profile_pic">
                        <img src="../icon/bd.jpg" class="profile-img"><span>welcome,yangdh</span>
                </div>
            </div>
            <ul class="nav nav-sidebar" >
                <li class="active"><a href="#" onclick="showAtRight('rightmainpage.html')">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 </a></li>
                <li class=""><a href="#"  onclick="showAtRight('rightpersonpage.html')">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 个人信息</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightgrouppage.html')">
                    <span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 群体-学院</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightclasspage.html')">
                    <span class="glyphicon glyphicon-signal" aria-hidden="true"></span> 群体-班级</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightaddpage.html')">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 扩展功能</a></li>
            </ul>
        </div>
        <div class="col-md-10 col-md-offset-2 main" id="rightpage">
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="../icon/bd.jpg" alt="">杨登辉
                                    <span class="glyphicon glyphicon-chevron-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="javascript:;">个人信息修改</a></li>
                                    <li><a href="javascript:;">帮助</a></li>
                                    <li><a href="login.html"><span class="glyphicon glyphicon-log-out  pull-right"></span> 退出登录</a></li>
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


<%--<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                Project name</button>
            <a class="navbar-brand" style="color: white">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" style="color: white">${sessionScope.get("user").userName}</a></li>
                <li><button class="btn btn-primary" type="button", id ='logout'>
                    <span class="glyphicon glyphicon-off" aria-hidden="true"></span> 注销</button></li>
            </ul>
        </div>
    </div>
</nav>--%>

<%--<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar" >
                <li class="active"><a href="#" onclick="showAtRight('rightmainpage.html')">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 首页 </a></li>
                <li class=""><a href="#"  onclick="showAtRight('rightpersonpage.html')">
                   <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 个人信息</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightgrouppage.html')">
                   <span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 群体-学院</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightclasspage.html')">
                    <span class="glyphicon glyphicon-signal" aria-hidden="true"></span> 群体-班级</a></li>
                <li class=""><a href="#" onclick="showAtRight('rightaddpage.html')">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 扩展功能</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="rightpage" style="background: #f7f7f7">

            <div id="rightdiv">

            </div>
        </div>
    </div>
</div>--%>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script  src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src = "../js/echarts.common.min.js"></script>
<script>
    $(document).ready(function(){
        $('ul.nav >li').click(function (e) {
            $('ul.nav>li').removeClass('active');
            $(this).addClass('active');

        });
    });

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
    function check() {

        var stuNum = $("#inputStuNum").val();
        console.log(stuNum);
        $.ajax({
            type:"post",
            url:"/student/getstuinfo",
            dataType: "json",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({stuNumber:stuNum}),
            success:function(data){
                console.log(data);
                document.getElementById("numberId").innerText = data["stuNumber"];
                document.getElementById("nameId").innerText = data["stuName"];
                document.getElementById("ageId").innerText = data["stuAge"];
                document.getElementById("sexId").innerText = data["stuSex"];
                document.getElementById("nationId").innerText = data["stuNation"];
                document.getElementById("politicsId").innerText = data["stuPolitics"];
                document.getElementById("schoolId").innerText = data["stuSchool"];
                document.getElementById("majorId").innerText = data["stuMajor"];
            },
            error:function(){
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

        })

    }

    function checkHistoryScore() {
        var stuNum = $("#inputStuNum").val();
        console.log(stuNum);
        //初始化echart
        var barChart = echarts.init(document.getElementById("stuScore"));
        var option = null;
        //页面加载数据
        $(function () {
            $.ajax({
                type: "post",
                async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url: "/getScoreDis",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify({stuNumber:stuNum}),
                dataType: "json", //返回数据形式为json
                success: function (data) {
                    console.log(data);
                    option ={
                        title :{
                            text: '课程成绩区间分布',
                            x:'center',
                            y:'top'

                        },
                        tooltip: {},
                        legend: {
                            //data:['成绩分布图']  //标签内容
                            //注意例子格式为数组，后台传过来的需要对应格式处理数据
                            //data：["aa","bb"]
                        },
                        xAxis: {
                            name:'成绩',
                            show:true,
                            data: ['0-59','60-69','70-79','80-89','90-100'],
                            //x轴项目名数值排列
                            type:'category',
                        },
                        yAxis:{
                            name:'课程门数',
                            type: 'value',

                        },
                        series:[{
                            //name: '成绩分布图',//与标签内容相同
                            type:'bar',
                            itemStyle:{
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
                            barWidth:50,
                            data: [data["zeroFiftynine"],data["sixtySixtynine"],data["seventySeventynine"],data["eightyEightynine"],data["ninetyHundred"]]
                        }]
                    };
                    barChart.setOption(option);
                }

            });

        });



        /* //显示一段动画
         pieChart.showLoading();
         //数据加载完之前先显示一段简单的loading动画

         //异步请求数据
         $.ajax({
             type: "post",
             async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
             url: "/getPie", //
             contentType:"application/json;charset=utf-8",
             data:JSON.stringify({stuNumber:stuNum}),
             dataType: "json", //返回数据形式为json
             success: function (result) {
                 console.log(result);

                 pieChart.hideLoading(); //隐藏加载动画
                 pieChart.setOption({ //加载数据图表
                     title: {
                         text: '学生成绩',
                         subtext: '成绩比',
                         x: 'center'

                     },
                     tooltip: {
                         trigger: 'item',
                         formatter: "{a} <br/>{b} : {c} ({d}%)"

                     },
                     legend: {
                         orient: 'vertical',
                         x: 'left',
                         data: []

                     },
                     toolbox: {
                         show: true,
                         feature: {
                             mark: {show: true},
                             dataView: {show: true, readOnly: false},
                             magicType: {
                                 show: true,
                                 type: ['pie', 'funnel'],
                                 option: {
                                     funnel: {
                                         x: '25%',
                                         width: '50%',
                                         funnelAlign: 'left',
                                         max: 1548
                                     }
                                 }
                             },
                             restore: {show: true},
                             saveAsImage: {show: true}
                         }
                     },
                     calculable: true,
                     series: [
                         {
                             // 根据名字对应到相应的系列
                             name: '成绩',
                             type: 'pie',
                             radius: '55%',
                             center: ['50%', '60%'],
                             data: JSON.stringify(result)
                         }]
                 });

             }

         })*/
    }
    $("#logout").click( function() {
        console.log("注销");
        $.ajax({
            url:"/user/logout",
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data=="success") {
                    window.location.href = "/index.jsp";
                }
                else {
                    //alert("用户名或密码错误！");
                }
            }
        })
        
    });

    /* function turnpage(url) {
         var url0 = document.URL;
         console.log(url0);

         var num = url0.indexOf('?');
          console.log(num);

         var oldurl;

         if(num==-1){
             oldurl = url0;
         }
         else {
             oldurl = url0.slice(0,num);
         }
         var newurl = oldurl+'?'+url;

         console.log(newurl);

         history.pushState(null,null,newurl);
         var ajaxurl = newurl + '.html';

         $.ajax({
             type:"get",
             url:ajaxurl,
             success: function (html) {
                 $('.rightdiv').html(html);

             }
         });



     }*/


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
    function ScorePredict() {
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
    function checkLineGraph() {
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
                        /*areaStyle: {
                            type: 'default'
                        }*/
                    }
                },
                data: [10, 12, 21, 54, 260, 830, 710]},
                {
                    name: 'Pre-order',
                type: 'line',
                smooth: true,
                itemStyle: {
                    normal: {
                       /* areaStyle: {
                            type: 'default'
                        }*/
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
                        /*areaStyle: {
                            type: 'default'
                        }*/
                    }
                },
                data: [1320, 1132, 601, 234, 120, 90, 20]
            }]
        });


    }
</script>

</body>
</html>
