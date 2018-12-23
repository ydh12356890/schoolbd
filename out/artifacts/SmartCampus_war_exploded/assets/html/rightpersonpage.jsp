<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>rightpersonpage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/echarts.css">
</head>
<body>
<div>
    <div class="rightpersonpage">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">本科生</a></li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">研究生</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active group_panel" id="home">
                <div class="notpass">
                    <div id="div-header1" class="tabborderc" >
                        <div style="margin: 5px">
                            <form class="form-inline">
                                <div class="form-group">
                                    <label for="inputUgXh">学号</label>
                                    <input class="form-control" type="text" id="inputUgXh">
                                </div>
                                <div class="form-group">
                                    <label for="inputUgName">姓名</label>
                                    <input class="form-control" type="text" id="inputUgName">
                                </div>
                                <button class="btn btn-primary" id="checkdata2" type="button" onclick="checkUndergraduateInfo()">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
                            </form>
                        </div>
                        <table id="ugstutab" class="table table-hover table-bordered"></table>
                    </div>
                    <div id="historyScore1" class="tabborderc" >
                        <div style="margin: 5px">
                        </div>
                        <div id="stuScore2" style="width: 800px;height: 600px;margin-left:auto;margin-right: auto">
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade group_panel" id="profile">
                <div class="notpass">
                    <div id="div-header2" class="tabborderc">
                        <div style="margin: 5px">
                            <form class="form-inline">
                                <div class="form-group">
                                    <label for="inputPgXh">学号</label>
                                    <input class="form-control" type="text" id="inputPgXh">
                                </div>
                                <div class="form-group">
                                    <label for="inputPgName">姓名</label>
                                    <input class="form-control" type="text" id="inputPgName">
                                </div>
                                <button class="btn btn-primary" id="checkdata" type="button" onclick="checkPostgraduateInfo()">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
                            </form>
                        </div>
                        <table id="pgstutab" class="table table-hover table-bordered"></table>
                    </div>
                    <div id="cardconsumption2" class="tabborderc">
                        <div style="margin: 5px">
                        </div>
                        <div id="cardConsumptiondiv" style="width: 100%;height: 500px;margin-left:auto;margin-right: auto ">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    String studentid = request.getParameter("studentid");
%>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-zh-CN.min.js"></script>
<script>
   $(document).ready(function () {
       var studentid = "<%=studentid%>";
       console.log(studentid);
       var  inputvalue = document.getElementById("inputUgXh");
       inputvalue.value = studentid;
       console.log(inputvalue.value);
       if(inputvalue.value!=="null"){
           console.log("if执行");
           checkUndergraduateInfo();
       }
       else{
            document.getElementById("inputUgXh").value = "";
           console.log("else执行");
       }
   })
   function checkUndergraduateInfo() {   //本科生基本信息
       var stuNum = $("#inputUgXh").val();
       var stuName = $("#inputUgName").val();
       if(stuNum===""&&stuName===""){
            alert("学号和姓名不能全为空！");
       }else {
           $('#ugstutab').bootstrapTable('destroy');
           $('#ugstutab').bootstrapTable({
               method: "post",
               url: "/SmartCampus/student/getstudentsByXhName",
               contentType: "application/x-www-form-urlencoded",
               dataType: "json",
               striped: true, //是否显示行间隔色
               sortable: true,
               pageNumber: 1, //初始化加载第一页
               pagination: true, //是否分页
               sidePagination: "server", //server：服务前端分页 ； client：前端分页
               pageSize: 5,//单页记录数
               pageList: [6, 10, 20, 30], //可选择的单页记录数
               showColumns: true,
               showRefresh: true,  // 刷新按钮
               queryParamsType: '',
               queryParams: function queryParams(params) {  //上传服务器的参数
                   var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                       pageNumber: params.pageNumber, //每页显示数量
                       pageSize: params.pageSize,  //SQL语句起始索引
                       //page : (params.offset / params.limit)+1 , 当前页码
                       studentid: stuNum,
                       name: stuName
                   };
                   return temp;
               },
               columns: [
                   {
                       title: '序号',
                       formatter: function (value, row, index) {
                           var pageSize = $('#ugstutab').bootstrapTable('getOptions').pageSize;
                           var pageNumber = $('#ugstutab').bootstrapTable('getOptions').pageNumber;
                           return pageSize * (pageNumber - 1) + index + 1;
                       },
                   }, {
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
                           return row.gender == 1.0 ? "男" : "女";
                       }
                   }, {
                       title: '学院代码',
                       field: 'schoolid',
                       sortable: false
                   }, {
                       title: '学院名',
                       field: 'xymc',
                       sortable: false,
                       formatter: function (value, row, index) {
                           return row.school.xymc;
                       }
                   },
                   {
                       title: '专业代码',
                       field: 'majorid',
                       sortable: false
                   }, {
                       title: '班级代码',
                       field: 'classid',
                       sortable: false
                   }, {
                       title: '操作',
                       field: 'operation',
                       align: 'center',
                       sortable: false,
                       formatter: function operation(value, row, index) {  //对资源进行操作
                           var html = "<button type='button' style='color: blue;padding: 0' class='btn btn-default' onclick='checkUgInfo(\"" + row.studentid + "\")'>查看详情</button>"
                           return html;
                       }
                   }]
           });
       }
   }
   function checkUgInfo(value) {
       var studentid = value;
       console.log(studentid);
       var barChart = echarts.init(document.getElementById("stuScore2"),theme);
       var option = null;
       $.ajax({
           type: "post",
           sync: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
           url: "/SmartCampus/getTwoScore",
           contentType:"application/json;charset=utf-8",
           data:JSON.stringify({xh:studentid}),
           dataType: "json", //返回数据形式为json
           success: function (data) {
               if(data.length==0){
                   barChart.clear();
                   alert("无此同学的记录！");
               }else {
                   console.log(data)
                   var kcmc = [];
                   var zscj = [];
                   var yccj = [];
                   for (var i = 0; i < data.length; i++) {
                       kcmc.push(data[i].course['kcmc']);
                       zscj.push(data[i].zscj);
                       yccj.push(data[i].yccj);
                   }
                   option = {
                       title: {
                           text: '课程成绩分布(学号：' + data[0].xh + ')',
                           subtext: '',
                           x: 'left',
                           y: 'top'
                       },
                       tooltip: {
                           trigger: 'axis'
                       },
                       legend: {
                           data: ['真实成绩', '预测成绩']
                       },
                       toolbox: {},
                       calculable: true,
                       xAxis: {
                           name: '课程',
                           show: true,
                           data: kcmc,
                           //x轴项目名数值排列
                           type: 'category',
                           axisLabel: {
                               interval: 0,
                               rotate: 25
                           }
                       },
                       yAxis: {
                           name: '成绩',
                           type: 'value',
                           min: 0,
                           max: 100,
                           interval: 20
                       },
                       grid: {
                           show: true,
                           bottom: '30%'
                       },
                       series: [
                           {
                               name: '真实成绩',
                               type: 'line',
                               data: zscj,
                               markLine: {
                                   symbol: "arrow",
                                   data: [{type: 'average', name: '平均值'}]
                               },
                               markPoint: {
                                   symbol: "pin",
                                   data: [{type: 'min', name: '最小值'},
                                       {type: 'max', name: '最大值'}]
                               }
                           },
                           {
                               name: '预测成绩',
                               type: 'line',
                               data: yccj,
                               markLine: {
                                   symbol: "arrow",
                                   data: [
                                       {type: 'average', name: '平均值'}]
                               },
                               markPoint: {
                                   symbol: "pin",
                                   data: [
                                       {type: 'min', name: '最小值'},
                                       {type: 'max', name: '最大值'}
                                   ]
                               }
                           }]
                   };
                   barChart.setOption(option);
               }
           }})
   }
   function checkPostgraduateInfo() {   //研究生基本信息
       var stuNum = $("#inputPgXh").val();
       var stuName = $("#inputPgName").val();
       if(stuNum===""&&stuName===""){
           alert("学号和姓名不能全为空！");
       }else {
           $('#pgstutab').bootstrapTable('destroy');
           $('#pgstutab').bootstrapTable({
               method: "post",
               url: "/SmartCampus/student/getPgstudentsByXhName",
               contentType: "application/x-www-form-urlencoded",
               dataType: "json",
               striped: true, //是否显示行间隔色
               sortable: true,
               pageNumber: 1, //初始化加载第一页
               pagination: true, //是否分页
               sidePagination: "server", //server：服务前端分页 ； client：前端分页
               pageSize: 5,//单页记录数
               pageList: [6, 10, 20, 30], //可选择的单页记录数
               showColumns: true,
               showRefresh: true,  // 刷新按钮
               queryParamsType: '',
               queryParams: function queryParams(params) {  //上传服务器的参数
                   var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                       pageNumber: params.pageNumber, //每页显示数量
                       pageSize: params.pageSize,  //SQL语句起始索引
                       studentid: stuNum,
                       name: stuName
                   };
                   return temp;
               },
               columns: [
                   {
                       title: '序号',
                       formatter: function (value, row, index) {
                           var pageSize = $('#pgstutab').bootstrapTable('getOptions').pageSize;
                           var pageNumber = $('#pgstutab').bootstrapTable('getOptions').pageNumber;
                           return pageSize * (pageNumber - 1) + index + 1;
                       },
                   }, {
                       title: '学号',
                       field: 'xh',
                       sortable: false
                   }, {
                       title: '姓名',
                       field: 'xm',
                       sortable: false
                   }, {
                       title: '性别',
                       field: 'xbdm',
                       sortable: false,
                       formatter: function (value, row, index) {
                           return row.xbdm == 1.0 ? "男" : "女";
                       }
                   }, {
                       title: '出生日期',
                       field: 'csrq',
                       sortable: false,
                       formatter: function (value, row, index) {
                           return parseInt(row.csrq);
                       }
                   }, {
                       title: '毕业院校',
                       field: 'byyx',
                       sortable: false
                   },
                   {
                       title: '毕业专业代码',
                       field: 'byzydm',
                       sortable: false
                   },
                   {
                       title: '入学专业代码',
                       field: 'rxzydm',
                       sortable: false
                   }, {
                       title: '政治面貌代码',
                       field: 'zzmmdm',
                       sortable: false
                   }, {
                       title: '操作',
                       field: 'operation',
                       align: 'center',
                       sortable: false,
                       formatter: function operation(value, row, index) {  //对资源进行操作
                           var html = "<button type='button' style='color: blue;padding: 0' class='btn btn-default' onclick='checkPgInfo(\"" + row.xh + "\")'>查看详情</button>"
                           return html;
                       }
                   }]
           });
       }
   }
   function checkPgInfo(value) {
       var pgxh = value;
       console.log(pgxh);
       //初始化echart
       var echartLine = echarts.init(document.getElementById('cardConsumptiondiv'),theme);
       var option = null;
       //页面加载数据
       $.ajax({
           type: "post",
           sync: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
           url: "/SmartCampus/getCardConsumption",
           contentType: "application/json;charset=utf-8",
           data: JSON.stringify({xh: pgxh}),
           dataType: "json", //返回数据形式为json
           success: function (data) {
               if(data.length===0) {
                   echartLine.clear();
                   alert("无此同学的记录！");
               }else{
                   var week = [];
                   var expvalue = [];
                   for (var i = 0; i < data.length; i++) {
                       week.push(data[i].week);
                       expvalue.push(data[i].expval);
                   }
                   option = {
                       title: {
                           text: '一卡通消费信息(学号：' + data[0].xh + ')',
                           subtext: '全年53周(单位：元)'
                       },
                       tooltip: {
                           trigger: 'axis',
                           formatter: "{a}<br/> {b}周：{c}",
                       },
                       legend: {},
                       toolbox: {},
                       calculable: true,
                       xAxis: [{
                           type: 'category',
                           boundaryGap: false,
                           data: week
                       }],
                       yAxis: [{
                           type: 'value'
                       }],
                       series: [{
                           name: '周消费',
                           type: 'line',
                           data: expvalue,
                           markLine: {
                               symbol: "arrow",
                               data: [{type: 'average', name: '平均值'}],
                               itemStyle: {
                                   normal: {
                                       label: {
                                           show: true,
                                           formatter: function (param) {
                                               return param.name + ":" + param.value;
                                           }
                                       }
                                   }
                               }
                           },
                           markPoint: {
                               symbol: "pin",
                               data: [{type: 'min', name: '最小值'}, {type: 'max', name: '最大值'}],
                           }
                       }]
                   };
                   echartLine.setOption(option);
               }
           }
       });
   }
</script>
</body>
</html>
