<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/4
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>rightpersonpage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/echarts.css">
    <%--<link href="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.min.css" rel="stylesheet">--%>
    <%--<link href="../css/bootstrap-select.min.css" rel="stylesheet">--%>

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
                    <div id="div-header1" class="tabborderc" style="padding: 3px;margin: 3px;">
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
                    <div id="historyScore1" class="tabborderc" style="padding: 3px; margin: 3px;">
                        <div style="margin: 5px">
                            <!--<button class=" btn btn-primary" id="historycourse2" type="button" onclick="checkUgHistoryScore()" disabled>
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询历史成绩
                            </button>-->
                            <!--<h4 class="sub-header">历史成绩</h4>-->
                        </div>
                        <div id="stuScore2" style="width: 800px;height: 600px;margin-left:auto;margin-right: auto">

                        </div>
                    </div>
                    <!--<div id="cardconsumption1" style="padding: 3px; margin: 3px;">
                        <div style="margin: 5px">
                            <button class=" btn btn-primary" id="cardcons2" type="button" onclick="checkCardConsumption2()" disabled>
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询一卡通消费信息
                            </button>
                        </div>
                        <div id="cardConsumptiondiv2" style="width: 100%;height: 500px;margin-left:auto;margin-right: auto ">

                        </div>
                    </div>-->

                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade group_panel" id="profile">
                <div class="notpass">
                    <div id="div-header2" class="tabborderc" style="padding: 3px;margin: 3px; ">
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
                    <div id="cardconsumption2" class="tabborderc" style="padding: 3px; margin: 3px;">
                        <div style="margin: 5px">
                            <!--<button class=" btn btn-primary" id="cardcons" type="button" onclick="checkPgCardConsumption()" disabled>
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询一卡通消费信息
                            </button>-->
                            <!--<h4 class="sub-header">一卡通消费</h4>-->
                        </div>
                        <div id="cardConsumptiondiv" style="width: 100%;height: 500px;margin-left:auto;margin-right: auto ">

                        </div>
                    </div>

                </div>
            </div>

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
   /*function checkauto() {
       var searchXh = $("#inputautonum");
       var source = new Array();
       var inputvalue = searchXh.val();
       console.log(inputvalue);
       searchXh.autocomplete({
           source:source,
           message:{
               noResults:'',
               results: function () {

               }
           }
       });
       searchXh.keyup(function () {
           $.ajax({
               type: "post",
               sync: true,
               url: "/getInputAutocomplete",
               contentType: "application/json;charset=utf-8",
               data: JSON.stringify({name: inputvalue}),
               dataType: "json", //返回数据形式为json
               success: function (data) {
                   console.log(data);
                   for (var i = 0; i < data.length; i++) {
                       source[i] = data[i].name;
                   }
               }
           });
       })

   }*/
   function checkUndergraduateInfo() {   //本科生基本信息

       var stuNum = $("#inputUgXh").val();
       var stuName = $("#inputUgName").val();

       $('#ugstutab').bootstrapTable('destroy');
       $('#ugstutab').bootstrapTable({
           method :"post",
           url : "/student/getstudentsByXhName",
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
           queryParams : function queryParams(params) {  //上传服务器的参数
               var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                   pageNumber : params.pageNumber, //每页显示数量
                   pageSize : params.pageSize,  //SQL语句起始索引
                   //page : (params.offset / params.limit)+1 , 当前页码
                   studentid : stuNum,
                   name : stuName
               };
               return temp;
           },
           columns :[
               { title : '序号',
               formatter : function (value,row,index) {
                   var  pageSize = $('#ugstutab').bootstrapTable('getOptions').pageSize;
                   var  pageNumber = $('#ugstutab').bootstrapTable('getOptions').pageNumber;
                   return pageSize*(pageNumber-1)+index+1;
               },
           },{
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
               }, {
                   title : '班级代码',
                   field : 'classid',
                   sortable : false
               },{
                    title : '操作',
                    field : 'operation',
                    align : 'center',
                    sortable : false,
                    formatter : function operation(value,row,index) {  //对资源进行操作
                        var html = "<button type='button' style='color: blue' class='btn btn-default' onclick='checkUgInfo(\""+row.studentid+"\")'>查看详情</button>"
                        return html;
                    }
           }]


       });



       /*if(stuNum==""){
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
                               magicType: {
                                   show: true,
                                   title: {
                                       line: 'Line',
                                   },
                                   type: ['line']
                               },
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
                                   /!*areaStyle: {
                                       type: 'default'
                                   }*!/
                               }
                           },
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
                                       /!*areaStyle: {
                                           type: 'default'
                                       }*!/
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
                   }
                   barChart.setOption(option);
               }

           });
       }*/

   }
   function checkUgInfo(value) {
       var studentid = value;
       console.log(studentid);
       var barChart = echarts.init(document.getElementById("stuScore2"),theme);
       var option = null;
       $.ajax({
           type: "post",
           sync: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
           url: "/getTwoScore",
           contentType:"application/json;charset=utf-8",
           data:JSON.stringify({xh:studentid}),
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

               option = {
                   title: {
                       text: '课程成绩分布',
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
                   toolbox: {
                   },
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
   }})
   }

   function checkPostgraduateInfo() {   //研究生基本信息
       var stuNum = $("#inputPgXh").val();
       var stuName = $("#inputPgName").val();
       $('#pgstutab').bootstrapTable('destroy');
       $('#pgstutab').bootstrapTable({
           method :"post",
           url : "/student/getPgstudentsByXhName",
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
           queryParams : function queryParams(params) {  //上传服务器的参数
               var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                   pageNumber : params.pageNumber, //每页显示数量
                   pageSize : params.pageSize,  //SQL语句起始索引
                   //page : (params.offset / params.limit)+1 , 当前页码
                   studentid : stuNum,
                   name : stuName
               };
               return temp;
           },
           columns :[
               { title : '序号',
                   formatter : function (value,row,index) {
                       var  pageSize = $('#pgstutab').bootstrapTable('getOptions').pageSize;
                       var  pageNumber = $('#pgstutab').bootstrapTable('getOptions').pageNumber;
                       return pageSize*(pageNumber-1)+index+1;
                   },
               },{
                   title : '学号',
                   field : 'xh',
                   sortable : false
               },{
                   title : '姓名',
                   field : 'xm',
                   sortable : false
               },{
                   title : '性别',
                   field : 'xbdm',
                   sortable : false,
                   formatter : function (value,row,index) {
                       return row.xbdm==1.0?"男":"女";
                   }
               },{
                   title : '出生日期',
                   field : 'csrq',
                   sortable : false,
                   formatter : function (value,row,index) {
                       return parseInt(row.csrq);
                   }
               },{
                   title : '毕业院校',
                   field : 'byyx',
                   sortable : false
               },
               {
                   title : '毕业专业代码',
                   field : 'byzydm',
                   sortable : false
               },
               {
                   title : '入学专业代码',
                   field : 'rxzydm',
                   sortable : false
               },{
                   title : '政治面貌代码',
                   field : 'zzmmdm',
                   sortable : false
               },{
                   title : '操作',
                   field : 'operation',
                   align : 'center',
                   sortable : false,
                   formatter : function operation(value,row,index) {  //对资源进行操作
                       var html = "<button type='button' style='color: blue' class='btn btn-default' onclick='checkPgInfo(\""+row.xh+"\")'>查看详情</button>"
                       return html;
                   }
               }]

       });


       /*//初始化echart
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
                           /!*x: 220,
                           y: 40,
                           data: ['Intent', 'Pre-order', 'Deal']*!/
                       },
                       toolbox: {
                           show: true,
                           feature: {
                               /!*magicType: {
                                   show: true,
                                   title: {
                                       line: 'Line',
                                       bar: 'Bar'
                                   },
                                   type: ['line', 'bar']
                               }*!/
                               /!*restore: {
                                   show: true,
                                   title: "Restore"
                               },
                               saveAsImage: {
                                   show: true,
                                   title: "Save Image"
                               }*!/
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
                                   /!*areaStyle: {
                                       type: 'default'
                                   }*!/
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
                               /!* itemStyle:{
                                    normal:{
                                        label:{
                                            show:true,
                                            formatter:function (param) {
                                                return param.name+":"+param.value;
                                            }
                                        }
                                    }
                                }*!/
                           }
                       }]
                   };
                   echartLine.setOption(option);
               }

           });
       }*/


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
           url: "/getCardConsumption",
           contentType: "application/json;charset=utf-8",
           data: JSON.stringify({xh: pgxh}),
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
                   legend: {},
                 toolbox: {},
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
                       markPoint:{
                           symbol:"pin",
                           data:[{type:'min',name:'最小值'}, {type:'max',name:'最大值'}],
                       }
                   }]
               };
               echartLine.setOption(option);
           }
       });
   }
</script>


</body>
</html>
