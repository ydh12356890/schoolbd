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
    <div>
        <h4 style="float: left;width: 50%">历史记录：<span id="defaultschool">${sessionScope.get("lastschool").lastschool}</span></h4>
        <div style="float: right;width: 50%;text-align: center">
            <form class="form-inline">
                <div class="form-group" style="margin-right: 0">
                    <span>学院</span>
                    <select id="lastschool" class="selector" style="height: 32px">
                        <option value="0" selected>请选择---</option>
                        <option value="1">电子工程学院</option>
                        <option value="2">公共管理学院</option>
                        <%--<option value="3">光电信息学院</option>--%>
                        <option value="4">国际学院</option>
                        <option value="5">计算机学院</option>
                        <%--<option value="6">继续教育学院</option>--%>
                        <option value="7">经济管理学院</option>
                        <option value="8">理学院</option>
                        <option value="9">马克思主义学院</option>
                        <option value="10">民族教育学院</option>
                        <option value="11">人文学院</option>
                        <option value="12">软件学院</option>
                        <option value="13">数字媒体与设计艺术学院</option>
                       <%-- <option value="14">体育部</option>
                        <option value="15">网络技术研究院</option>
                        <option value="16">网络教育学院</option>--%>
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
    <div class="tabborderc" style="float: left;width: 70%;margin: 0px 10px 20px 0;height: auto">
        <div>
            <h4 id="failCourserate" style="float: left"></h4>
            <h4 style="float: left">开设课程不及格率</h4>
        </div>
        <div id="fourfaildiv" style="width: 100%;height: 450px;margin-left:auto;margin-right: auto ">
        </div>
    </div>
    <div class="tabborderc" style="float: right;width: 27%;margin: 0 10px 20px 0;height: auto">
        <div>
            <h4 id="mfratio" style="float: left"></h4>
            <h4 style="float: left">男女比例</h4>
        </div>
        <div id="schoolMFRatiodiv" style="width: 100%;height: 450px;margin-left:auto;margin-right: auto;">
        </div>
    </div>


    <div class="tabborderc" style="clear: both;margin:0 10px 20px 0;">
        <div style="float: left ;width: 40%">
           <h4 id="schoolh4" style="float: left"></h4>
           <h4 style="float: left">学生名单</h4>
        </div>
        <div style="padding: 5px;float: right;width: 60% ;text-align: center" >
            <form class="form-inline">
                <div class="form-group">
                    <label for="inputSchoolStuXh">学号</label>
                    <input class="form-control" type="text" id="inputSchoolStuXh">
                </div>
                <div class="form-group">
                    <label for="inputSchoolStuName">姓名</label>
                    <input class="form-control" type="text" id="inputSchoolStuName">
                </div>
                <button id="btn_search2" onclick="filterSchoolStudent()" type="button" class="btn btn-primary">
                    <span class="glyphicon glyphicon-filter" aria-hidden="true"></span> 筛选
                </button>
            </form>
        </div>
        <div style="clear: both">
            <table id="mytabschoolStu" class="table table-hover table-bordered"></table>
        </div>
    </div>

    <div class="tabborderc" style="clear: both;margin: 0 10px 20px 0">
        <div>
            <h4 id="schoolCourse" style="float: left"></h4>
            <h4 style="float: left">开设课程详情</h4>
        </div>
        <div>
            <table id="schoolallCourse" class="table table-hover table-bordered"></table>
        </div>
    </div>
    <div class="tabborderc" style="clear: both;margin: 0 10px 10px 0;">
        <div id="schoolPersonNumdiv" style="width: 100%;height: 500px;margin-left:auto;margin-right: auto ">
        </div>
    </div>


</div>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<%--<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script  src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src = "../js/echarts.common.min.js"></script>--%>
<script src="../js/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(document).ready(function(){
        <%--var school = '${sessionScope.get("lastschool").lastschool}';--%>
        var school = $("#defaultschool").html();
        console.log(school);
        /*$(".selector").find('option[text="软件学院"]').attr("selected",true);

        var defaultschool = $(".selector").find("option:selected").text();
        console.log(defaultschool);*/
        /*var optionff = null;
        var PieFFChart = echarts.init(document.getElementById("fourfaildiv"),theme);
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/getFourFail",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({xymc:school}),
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);
                console.log("返回的数据");
                var kcmc = [];
                var failstunum = [];
                for(var i=0;i<data.length;i++){
                    failstunum.push(data[i].failstu);
                }
                for(var i=0;i<data.length;i++){
                    kcmc.push(data[i].kcmc);
                }
                var rs = [];
                for(var i=0;i<data.length;i++){
                    rs.push({name : kcmc[i], value : failstunum[i]});
                }
                console.log(kcmc);
                console.log(failstunum);
                console.log(rs)
                optionff = {
                    title: {
                        text: '挂科课程及人数占比',
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
                        y :'bottom',
                        data: kcmc
                    },
                    toolbox: {
                        show: true,
                        feature: {

                        }
                    },
                    calculable: true,
                    series: [{
                        name: '挂科人数及占比',
                        type: 'pie',
                        radius: '50%',
                        center: ['50%', '45%'],
                        data: rs

                    }]
                };
                PieFFChart.setOption(optionff);
            }

        });*/

        document.getElementById("mfratio").innerHTML = school;
        var optionMF = null;
        var PieCollapseChartMF = echarts.init(document.getElementById("schoolMFRatiodiv"),theme);
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/getMFRatioSingleSchool",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({xymc:school}),
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
                optionMF = {
                    title: {
                        text: '',
                        subtext: ''
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x:'left',
                        y :'70%',
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
                        center: ['50%', '40%'],
                        data: rs

                    }]
                };
                PieCollapseChartMF.setOption(optionMF);
            }

        });

        var option = null;
        var PieCollapseChart = echarts.init(document.getElementById("schoolPersonNumdiv"),theme);
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
                    },
                    toolbox: {
                        show: true,
                        feature: {
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
                };
                PieCollapseChart.setOption(option);
            }

        });

        document.getElementById("schoolh4").innerHTML = school;
        $('#mytabschoolStu').bootstrapTable('destroy');
        $('#mytabschoolStu').bootstrapTable({
            method :"post",
            sync:true   ,
            url : "/student/getSchoolStudent",
            contentType : "application/x-www-form-urlencoded",
            dataType : "json",
            striped : true, //是否显示行间隔色
            //sortable : true,
            pageNumber : 1, //初始化加载第一页
            pagination : true , //是否分页
            //sortOrder : "desc",
            // cardView:true,
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
                    xymc : school
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
                },{
                    title : '操作',
                    field : 'operation',
                    align : 'center',
                    sortable : false,
                    formatter : function operation(value,row,index) {  //对资源进行操作
                        var html = "<button type='button' style='color: blue;padding: 0' class='btn btn-default' onclick='GoToRightPersonPage(\""+row.studentid+"\")'>查看详情</button>"
                        return html;
                    }
                }
            ],
            /* onExpandRow : function (index,row,$detail) {
                 InitSubTable(index,row,$detail);

             }*/
        });


        document.getElementById("schoolCourse").innerHTML = school;
        $('#schoolallCourse').bootstrapTable('destroy');
        $('#schoolallCourse').bootstrapTable({
            method :"post",
            sync:true   ,
            url : "/student/getSchoolAllCoursrByXymc",
            contentType : "application/x-www-form-urlencoded",
            dataType : "json",
            striped : true, //是否显示行间隔色
            //sortable : true,
            pageNumber : 1, //初始化加载第一页
            pagination : true , //是否分页
            //sortOrder : "desc",
            // cardView:true,
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
                    xymc : school
                    // Tel : $('#search_tel').val()
                };
                return temp;
            },
            columns :[
                { title : '序号',
                formatter : function (value,row,index) {
                    var  pageSize = $('#schoolallCourse').bootstrapTable('getOptions').pageSize;
                    var  pageNumber = $('#schoolallCourse').bootstrapTable('getOptions').pageNumber;
                    return pageSize*(pageNumber-1)+index+1;
                },
                sortable : false
            },{
                    title : '课程代码',
                    field : 'kcdm',
                    sortable : false
                },{
                    title : '课程名称',
                    field : 'kcmc',
                    sortable : false
                },{
                    title : '选课人数',
                    field : 'allnum',
                    sortable : false,

                },{
                    title : '通过人数',
                    field : 'passnum',
                    sortable : false,

                }, {
                    title : '不及格人数',
                    field : 'failnum',
                    sortable : false
                },
                {
                    title : '不及格率',
                    field : 'failrate',
                    sortable : false
                }
            ],

        });

        document.getElementById("failCourserate").innerHTML = school;
        var optionBar = null;
        var BarChart = echarts.init(document.getElementById("fourfaildiv"),theme);
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/student/getAllFailCoursrByXymc",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({xymc:school}),
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);
                console.log("返回的数据");
                var kcmc=[];
                var failrate=[];
                for(var i =0; i<data.length;i++){
                    kcmc.push(data[i].kcmc);
                }
                for(var i=0;i<data.length;i++){
                    failrate.push(data[i].failrate);
                }
                optionBar = {
                    title: {
                        text: '',
                        subtext: '',
                        x: 'left',
                        y: 'top'
                    },
                    tooltip: {
                        trigger: 'axis',

                    },
                    legend: {
                      /*  x:'center',
                        y :'bottom',
                        data: ['课程']*/
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
                    calculable: false,
                    xAxis:[{
                        name: '课程',
                        type:'category',
                        data:kcmc,
                        axisLabel: {
                            interval: 0,
                            rotate: 25
                        }
                    }],
                    yAxis:[{
                        name:'不及格率',
                        type:'value'
                    }],
                    grid: {
                        show: true,
                        bottom: '30%'

                    },
                    series: [{
                        name: '',
                        type: 'bar',
                        data: failrate,
                        /*markPoint:{
                            data:[{
                                type: 'max',
                                name :'最大值'
                            },{
                                type:'min',
                                name : '最小值'
                            }]
                        },*/
                        markLine:{
                            symbol:"arrow",
                            data:[{type:'average',name:'平均值'}],
                            lineStyle:{
                                normal:{
                                    color:'#0000e6'
                                }
                            },
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
                        itemStyle:{
                            normal:{
                                color:function (params) {
                                    var colorlist=['#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653',
                                        '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653',
                                        '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653',
                                        '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653'];
                                    return colorlist[params.dataIndex];
                                }

                            }
                        }
                    }]
                };
                BarChart.setOption(optionBar);
            }

        });




    })

    function GoToRightPersonPage(value) {
        var studentid = value;
        console.log(studentid);
        GotoPersonPage('rightpersonpage.jsp',studentid);
        
    }
    
    function checkMFRatioSingleSchool() {
        var selectSchoolalue = $("#lastschool option:selected").text();
        console.log("${sessionScope.get("lastschool").lastschool}");

        var username = "${sessionScope.get("user").userName}";
        console.log(username);

        document.getElementById("schoolh4").innerHTML = selectSchoolalue;
        /*var optionff = null;
        var PieFFChart = echarts.init(document.getElementById("fourfaildiv"),theme);
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/getFourFail",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({xymc:selectSchoolalue}),
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);
                console.log("返回的数据");
                var kcmc = [];
                var failstunum = [];
                for(var i=0;i<data.length;i++){
                    failstunum.push(data[i].failstu);
                }
                for(var i=0;i<data.length;i++){
                    kcmc.push(data[i].kcmc);
                }
                var rs = [];
                for(var i=0;i<data.length;i++){
                    rs.push({name : kcmc[i], value : failstunum[i]});
                }
                console.log(kcmc);
                console.log(failstunum);
                console.log(rs)
                optionff = {
                    title: {
                        text: '挂科课程及人数占比',
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
                        y :'bottom',
                        data: kcmc
                    },
                    toolbox: {
                        show: true,
                        feature: {

                        }
                    },
                    calculable: true,
                    series: [{
                        name: '挂科人数及占比',
                        type: 'pie',
                        radius: '50%',
                        center: ['50%', '50%'],
                        data: rs

                    }]
                };
                PieFFChart.setOption(optionff);
            }

        });*/

        document.getElementById("mfratio").innerHTML = selectSchoolalue;
        var optionMF = null;
        var PieCollapseChartMF = echarts.init(document.getElementById("schoolMFRatiodiv"),theme);
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
                optionMF = {
                    title: {
                        text: '',
                        subtext: ''
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x:'left',
                        y :'70%',
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
                        center: ['50%', '40%'],
                        data: rs

                    }]
                };
                PieCollapseChartMF.setOption(optionMF);
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
                },{
                    title : '操作',
                    field : 'operation',
                    align : 'center',
                    sortable : false,
                    formatter : function operation(value,row,index) {  //对资源进行操作
                        var html = "<button type='button' style='color: blue;padding: 0' class='btn btn-default' onclick='GoToRightPersonPage(\""+row.studentid+"\")'>查看详情</button>"
                        return html;
                    }
                }
            ],
            /* onExpandRow : function (index,row,$detail) {
                 InitSubTable(index,row,$detail);

             }*/
        });

        document.getElementById("schoolCourse").innerHTML = selectSchoolalue;
        $('#schoolallCourse').bootstrapTable('destroy');
        $('#schoolallCourse').bootstrapTable({
            method :"post",
            sync:true   ,
            url : "/student/getSchoolAllCoursrByXymc",
            contentType : "application/x-www-form-urlencoded",
            dataType : "json",
            striped : true, //是否显示行间隔色
            //sortable : true,
            pageNumber : 1, //初始化加载第一页
            pagination : true , //是否分页
            //sortOrder : "desc",
            // cardView:true,
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
                { title : '序号',
                    formatter : function (value,row,index) {
                        var  pageSize = $('#schoolallCourse').bootstrapTable('getOptions').pageSize;
                        var  pageNumber = $('#schoolallCourse').bootstrapTable('getOptions').pageNumber;
                        return pageSize*(pageNumber-1)+index+1;
                    },
                    sortable : false
                },{
                    title : '课程代码',
                    field : 'kcdm',
                    sortable : false
                },{
                    title : '课程名称',
                    field : 'kcmc',
                    sortable : false
                },{
                    title : '选课人数',
                    field : 'allnum',
                    sortable : false,

                },{
                    title : '通过人数',
                    field : 'passnum',
                    sortable : false,

                }, {
                    title : '不及格人数',
                    field : 'failnum',
                    sortable : false
                },
                {
                    title : '不及格率',
                    field : 'failrate',
                    sortable : false
                }
            ],

        });

        document.getElementById("failCourserate").innerHTML = selectSchoolalue;
        var optionBar = null;
        var BarChart = echarts.init(document.getElementById("fourfaildiv"),theme);
        $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/student/getAllFailCoursrByXymc",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({xymc:selectSchoolalue}),
            dataType: "json", //返回数据形式为json
            success: function (data) {
                console.log(data);
                console.log("返回的数据");
                var kcmc=[];
                var failrate=[];
                for(var i =0; i<data.length;i++){
                    kcmc.push(data[i].kcmc);
                }
                for(var i=0;i<data.length;i++){
                    failrate.push(data[i].failrate);
                }
                optionBar = {
                    title: {
                        text: '',
                        subtext: '',
                        x: 'left',
                        y: 'top'
                    },
                    tooltip: {
                        trigger: 'axis',

                    },
                    legend: {
                        /*  x:'center',
                          y :'bottom',
                          data: ['课程']*/
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
                    calculable: false,
                    xAxis:[{
                        name: '课程',
                        type:'category',
                        data:kcmc,
                        axisLabel: {
                            interval: 0,
                            rotate: 25
                        }
                    }],
                    yAxis:[{
                        name:'不及格率',
                        type:'value'
                    }],
                    grid: {
                        show: true,
                        bottom: '30%'

                    },
                    series: [{
                        name: '',
                        type: 'bar',
                        data: failrate,
                        /*markPoint:{
                            data:[{
                                type: 'max',
                                name :'最大值'
                            },{
                                type:'min',
                                name : '最小值'
                            }]
                        },*/
                        markLine:{
                            symbol:"arrow",
                            data:[{type:'average',name:'平均值'}],
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
                        itemStyle:{
                            normal:{
                                color:function (params) {
                                    var colorlist=['#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653',
                                        '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653',
                                        '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653',
                                        '#79e8D0','#ffb8b8','#3498DB','#ff4d4d','#26B99A', '#751aff',
                                        '#9B59B6','#4dffb8','#cc8800', '#8abb6f','#eacf02','#86e65a','#da7447','#826653'];
                                    return colorlist[params.dataIndex];
                                }

                            }
                        }
                    }]
                };
                BarChart.setOption(optionBar);
            }

        });



        $.ajax({
            type:"post",
            async:true,
            url:"/user/lastschool",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({lastschool:selectSchoolalue,userName:username}),
            dataType:"text",
            success:function (data) {
                console.log(data);
                if(data=="success") {
                    console.log("为用户更新lastschool成功！");

                } else{
                    console.log("为用户更新lastschool失败！");
                }

            }
        })




        console.log("table 已执行");
    }
    
    function filterSchoolStudent() {
        var xymc =  $("#schoolh4").html();
        var stuNum = $("#inputSchoolStuXh").val();
        var stuName = $("#inputSchoolStuName").val();
        console.log(xymc);
        console.log(stuNum);
        console.log(stuName);
        if(stuNum==""&&stuName==""){
            alert("学号和密码不能全为空！");
        }else {
            $('#mytabschoolStu').bootstrapTable('destroy');
            $('#mytabschoolStu').bootstrapTable({
                method: "post",
                url: "/student/getSchoolFilterStudent",
                contentType: "application/x-www-form-urlencoded",
                dataType: "json",
                striped: true, //是否显示行间隔色
                sortable: true,
                pageNumber: 1, //初始化加载第一页
                pagination: true, //是否分页
                sidePagination: "server", //server：服务前端分页 ； client：前端分页
                pageSize: 4,//单页记录数
                pageList: [5, 10, 20, 30], //可选择的单页记录数
                showColumns: true,
                showRefresh: true,  // 刷新按钮
                /* searchAlign : 'right',  //搜索框水平方向
                 buttonsAlign : 'right' ,  //按钮栏水平方向
                 search :true,    //搜索
                 searchOnEnterKey: false, //true:回车键触发搜索，否则，自动触发搜索
                 strictSearch:false,   // true:全匹配搜索， false：模糊搜索
                 searchText : '搜索',  //初始化搜索文字
                 searchTimeOut : 500,   //设置搜索超时时间
                 trimOnSearch : true,     //自动去掉搜索字符的前后空格*/
                queryParamsType: '',
                //height : 400,
                queryParams: function queryParams(params) {  //上传服务器的参数
                    var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                        pageNumber: params.pageNumber, //每页显示数量
                        pageSize: params.pageSize,  //SQL语句起始索引
                        //page : (params.offset / params.limit)+1 , 当前页码
                        xymc: xymc,
                        studentid: stuNum,
                        name: stuName

                        // Tel : $('#search_tel').val()

                    };
                    return temp;
                },
                columns: [
                    /*{ title : '序号',
                    formatter : function (value,row,index) {
                        var  pageSize = $('#mytab').bootstrapTable('getOptions').pageSize;
                        var  pageNumber = $('#mytab').bootstrapTable('getOptions').pageNumber;
                        return pageSize*(pageNumber-1)+index+1;
                    },
                    sortable : true
                },*/{
                        title: '学号',
                        field: 'studentid',
                        sortable: false
                    }, {
                        title: '姓名',
                        field: 'name',
                        sortable: false
                    }, {
                        title: '性别',
                        field: 'gender',
                        sortable: false,
                        formatter: function (value, row, index) {
                            return row.gender == 1.0 ? "男" : (row.gender == 2.0 ? "女" : "未知");
                        }
                    },
                    {
                        title: '专业代码',
                        field: 'majorid',
                        sortable: false
                    },
                    {
                        title: '班级代码',
                        field: 'classid',
                        sortable: false
                    },{
                        title : '操作',
                        field : 'operation',
                        align : 'center',
                        sortable : false,
                        formatter : function operation(value,row,index) {  //对资源进行操作
                            var html = "<button type='button' style='color: blue;padding: 0' class='btn btn-default' onclick='GoToRightPersonPage(\""+row.studentid+"\")'>查看详情</button>"
                            return html;
                        }
                    }],
            });
        }

        
    }
</script>
</body>
</html>
