<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <option value="22">自动化学院</option>
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
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script  src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src = "../js/echarts.common.min.js"></script>
<script src="../js/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-zh-CN.min.js"></script>
<script>
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
</script>
</body>
</html>
