<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/4
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>rightgrouppage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    <link rel="stylesheet" href="../css/jquery-ui.min.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <!--<link rel="stylesheet" href="../css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="../css/custom.min.css">-->
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link href="../css/dashboard.css" rel="stylesheet">
</head>
<body>
<div class="schooldiv">
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">不及格成绩</a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">优秀成绩</a></li>
        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">消费离群</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active group_panel" id="home">
            <div class="notpass tabbordercgroup">
                <div>
                    <span>预测 <select id="selectschool">
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
                        <%--<option value="14">体育部</option>--%>
                        <%--<option value="15">网络技术研究院</option>--%>
                        <%--<option value="16">网络教育学院</option>--%>
                        <option value="17">网络空间安全学院</option>
                        <option value="18">现代邮政学院</option>
                        <option value="19">信息光子学与光通信研究院</option>
                        <option value="20">信息与通信工程学院</option>
                        <%--<option value="21">叶培大创新创业学院</option>--%>
                        <option value="22">自动化学院</option>
                        <%--<option value="23">（无锡）感知技术与产业研究院</option>--%>
                    </select> 成绩可能不及格的学生</span>
                    <button type="button"  class="btn btn-primary" onclick="checkNotPass()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
                </div>
                <div style="padding: 5px">
                    <%--<div id="toolbar-btn" class="btn-group" style="padding-bottom:10px;float: left">
                        <button id="btn_add" onclick="createFunction()" type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新建
                        </button>
                        <button id="btn_save" onclick="saveFunction()" type="button" class="btn btn-success ">
                            <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> 保存
                        </button>
                        <button id="btn_delete" onclick="deleteFunction()" type="button" class="btn btn-danger ">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                        </button>
                    </div>--%>
                        <div style="float: left;width: 40%">
                            <h4 id="notpassschool"></h4>
                        </div>
                    <form class="form-inline" style="float: right;width: 60%;margin-bottom: 0">
                        <div class="form-group">
                            <label for="inputUgXh">学号</label>
                            <input class="form-control" type="text" id="inputUgXh">
                        </div>
                        <div class="form-group">
                            <label for="inputUgName">姓名</label>
                            <input class="form-control" type="text" id="inputUgName">
                        </div>
                        <button id="btn_search" onclick="filterStudent()" type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-filter" aria-hidden="true"></span> 筛选
                        </button>
                    </form>
                </div>
                <table id="mytab" class="table table-hover table-bordered"></table>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane fade group_panel" id="profile">
            <div class="notpass tabbordercgroup">

                <div>
                    <span>预测 <select id="selectschool2">
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
                        <%--<option value="14">体育部</option>--%>
                        <%--<option value="15">网络技术研究院</option>--%>
                        <%--<option value="16">网络教育学院</option>--%>
                        <option value="17">网络空间安全学院</option>
                        <option value="18">现代邮政学院</option>
                        <option value="19">信息光子学与光通信研究院</option>
                        <option value="20">信息与通信工程学院</option>
                        <%--<option value="21">叶培大创新创业学院</option>--%>
                        <option value="22">自动化学院</option>
                        <%--<option value="23">（无锡）感知技术与产业研究院</option>--%>
                    </select> 成绩可能优秀的学生</span>
                    <button type="button"  class="btn btn-primary" onclick="checkGood()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
                </div>
                <div style="padding: 5px">
                    <%--<div id="toolbar-btn" class="btn-group" style="padding-bottom:10px;float: left">
                        <button id="btn_add" onclick="createFunction()" type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新建
                        </button>
                        <button id="btn_save" onclick="saveFunction()" type="button" class="btn btn-success ">
                            <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> 保存
                        </button>
                        <button id="btn_delete" onclick="deleteFunction()" type="button" class="btn btn-danger ">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                        </button>
                    </div>--%>
                    <div style="float: left;width: 40%">
                        <h4 id="goodschool"></h4>
                    </div>
                    <form class="form-inline" style="float: right;width: 60%;margin-bottom: 0">
                        <div class="form-group">
                            <label for="inputUgXhGood">学号</label>
                            <input class="form-control" type="text" id="inputUgXhGood">
                        </div>
                        <div class="form-group">
                            <label for="inputUgNameGood">姓名</label>
                            <input class="form-control" type="text" id="inputUgNameGood">
                        </div>
                        <button id="btn_search2" onclick="filterGoodStudent()" type="button" class="btn btn-primary">
                            <span class="glyphicon glyphicon-filter" aria-hidden="true"></span> 筛选
                        </button>
                    </form>
                </div>


                <table id="mytabgood" class="table table-hover table-bordered"></table>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane fade group_panel" id="messages">
            <div class="notpass tabbordercgroup">
                <h4>特定年份学生的消费离群值</h4>
                <div>
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="inputXh">学号</label>
                            <input type="text" class="form-control" id="inputXh" placeholder="2011010016">
                        </div>
                        <div class="form-group">
                            <label for="inputName">姓名</label>
                            <input class="form-control" type="text" id="inputName">
                        </div>
                        <div class="form-group" style="margin-left: 10px; ">
                            <label for="inputYear">年份</label>
                            <!--<input type="text" class="form-control" id="inputYear" placeholder="请输入年度...">-->
                            <select id="inputYear" style="margin: 0 5px">
                                <option value="0" selected>请选择---</option>
                                <option value="1">2016</option>
                                <option value="2">2017</option>
                                <option value="3">2018</option>
                            </select>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="checkConsumptionOutlier()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> 查询</button>
                    </form>
                </div>
                <table id="pgstuccotab" class="table table-hover table-bordered"></table>
            </div>
            <div class="tabbordercgroup" style="padding: 3px; margin: 3px">
                <div id="yearConsumptiondiv" style="width: 100%;height: 500px;margin:15px auto">
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
    function checkGood() {
        console.log("群体学院界面查询优秀按钮");
        document.getElementById("inputUgXhGood").value="";
        document.getElementById("inputUgNameGood").value="";
        var selectValue = $("#selectschool2 option:selected").text();
        $('#goodschool').html(selectValue);
        console.log(selectValue);
        if(selectValue==="请选择---"){
            alert("请选择需要查询的学院！")
        }else {

            $('#mytabgood').bootstrapTable('destroy');

            $('#mytabgood').bootstrapTable({
                method: "post",
                url: "/student/getGoodStudentScore",
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
                queryParamsType:'',
                detailView: true,
                //height : 400,
                queryParams: function queryParams(params) {  //上传服务器的参数
                    var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                        pageNumber: params.pageNumber, //每页显示数量
                        pageSize: params.pageSize,  //SQL语句起始索引
                        //page : (params.offset / params.limit)+1 , 当前页码
                        xymc: selectValue

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
                    },
                    {
                        title: '班级代码',
                        field: 'classid',
                        sortable: false
                    }],
                onExpandRow: function (index, row, $detail) {
                    InitGoodSubTable(index, row, $detail);

                }
            });
            console.log("goodtable 已执行");
        }
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
        document.getElementById("inputUgXh").value="";
        document.getElementById("inputUgName").value="";
        var selectValue = $("#selectschool option:selected").text();
        $('#notpassschool').html(selectValue);
        console.log(selectValue);
        if(selectValue==="请选择---"){
            alert("请选择需要查询的学院！")
        }else{
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
                /* searchAlign : 'right',  //搜索框水平方向
                 buttonsAlign : 'right' ,  //按钮栏水平方向
                 search :true,    //搜索
                 searchOnEnterKey: false, //true:回车键触发搜索，否则，自动触发搜索
                 strictSearch:false,   // true:全匹配搜索， false：模糊搜索
                 searchText : '搜索',  //初始化搜索文字
                 searchTimeOut : 500,   //设置搜索超时时间
                 trimOnSearch : true,     //自动去掉搜索字符的前后空格*/
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
        }

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
    
    function filterStudent() {
        var selectValue = $('#notpassschool').html();
        console.log(selectValue);
        var stuNum = $("#inputUgXh").val();
        var stuName = $("#inputUgName").val();
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            method :"post",
            url : "/student/getStuFilterByXhName",
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
            /* searchAlign : 'right',  //搜索框水平方向
             buttonsAlign : 'right' ,  //按钮栏水平方向
             search :true,    //搜索
             searchOnEnterKey: false, //true:回车键触发搜索，否则，自动触发搜索
             strictSearch:false,   // true:全匹配搜索， false：模糊搜索
             searchText : '搜索',  //初始化搜索文字
             searchTimeOut : 500,   //设置搜索超时时间
             trimOnSearch : true,     //自动去掉搜索字符的前后空格*/
            queryParamsType:'',
            detailView : true,
            //height : 400,
            queryParams : function queryParams(params) {  //上传服务器的参数
                var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                    pageNumber : params.pageNumber, //每页显示数量
                    pageSize : params.pageSize,  //SQL语句起始索引
                    //page : (params.offset / params.limit)+1 , 当前页码
                    xymc : selectValue,
                    studentid:stuNum,
                    name:stuName

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


        
    }
    
    function filterGoodStudent() {
        var selectValue = $('#goodschool').html();
        console.log(selectValue);
        var stuNum = $("#inputUgXhGood").val();
        var stuName = $("#inputUgNameGood").val();
        $('#mytabgood').bootstrapTable('destroy');
        $('#mytabgood').bootstrapTable({
            method :"post",
            url : "/student/getStuFilterByXhNameGood",
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
            /* searchAlign : 'right',  //搜索框水平方向
             buttonsAlign : 'right' ,  //按钮栏水平方向
             search :true,    //搜索
             searchOnEnterKey: false, //true:回车键触发搜索，否则，自动触发搜索
             strictSearch:false,   // true:全匹配搜索， false：模糊搜索
             searchText : '搜索',  //初始化搜索文字
             searchTimeOut : 500,   //设置搜索超时时间
             trimOnSearch : true,     //自动去掉搜索字符的前后空格*/
            queryParamsType:'',
            detailView : true,
            //height : 400,
            queryParams : function queryParams(params) {  //上传服务器的参数
                var temp = {   //如果是在服务器端实现的分页，limit、offset这两个参数是必须的
                    pageNumber : params.pageNumber, //每页显示数量
                    pageSize : params.pageSize,  //SQL语句起始索引
                    //page : (params.offset / params.limit)+1 , 当前页码
                    xymc : selectValue,
                    studentid:stuNum,
                    name:stuName

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
                InitGoodSubTable(index,row,$detail);

            }
        });



    }
    
    function checkConsumptionOutlier() {
        var pgxh = $("#inputXh").val();
        var pgname = $("#inputName").val();
        var year = $("#inputYear option:selected").text();
        if(pgxh===""&&pgname===""){
            alert("学号、姓名不能全为空！");
        }else if(year==="请选择---"){
            alert("请选择年份！");

        }else
            {
            console.log(pgxh);
            console.log(pgname);
            console.log(year);

            $('#pgstuccotab').bootstrapTable('destroy');
            $('#pgstuccotab').bootstrapTable({
                method :"post",
                url : "/student/getPgCCOByXhNameYear",
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
                        xh : pgxh,
                        name : pgname,
                        year : year
                    };
                    return temp;
                },
                columns :[
                    { title : '序号',
                        formatter : function (value,row,index) {
                            var  pageSize = $('#pgstuccotab').bootstrapTable('getOptions').pageSize;
                            var  pageNumber = $('#pgstuccotab').bootstrapTable('getOptions').pageNumber;
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
                    },
                    {
                        title : '本科毕业院校',
                        field : 'byyx',
                        sortable : false
                    }, {
                        title : '入学专业代码',
                        field : 'rxzydm',
                        sortable : false
                    },{
                        title : '操作',
                        field : 'operation',
                        align : 'center',
                        sortable : false,
                        formatter : function operation(value,row,index) {  //对资源进行操作
                            var html = "<button type='button' style='color: blue;padding: 0' class='btn btn-default' onclick='checkPgCCOInfo(\""+row.xh+"\")'>查看详情</button>"
                            return html;
                        }
                    }]


            });



        }


    }


   function checkPgCCOInfo(value) {
       var year = $("#inputYear option:selected").text();
        var pgxh = value;
       //初始化echart
       var echartLine = echarts.init(document.getElementById('yearConsumptiondiv'), theme);
       //页面加载数据
       $.ajax({
           type: "post",
           async: true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
           url: "/getYearConsumptionOutlier",
           contentType: "application/json;charset=utf-8",
           data: JSON.stringify({xh: pgxh,year:year}),
           dataType: "json", //返回数据形式为json
           success: function (data) {
               console.log(data);
               var iswave = data["iswave"]===1?"波动型":"平稳型";
               var consumetype = data["consumetype"]===2?"高消费":(data["consumetype"]===1?"中等消费":"低消费");
               var isoutlier = data["isoutlier"]===1?"易离群":"不易离群";
               console.log(iswave);
               console.log(consumetype);
               console.log(isoutlier);
               echartLine.setOption({
                   title: {
                       text: "消费信息离群值(学号："+data["xh"]+")",
                       textStyle: {
                           color: '#79e8D0',
                           fontStyle: 'normal',//主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
                           fontWeight: "lighter",//可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
                           fontFamily: "san-serif",//主题文字字体，默认微软雅黑
                           fontSize: 18, //主题文字字体大小，默认为18px
                       },
                      // textAlign: 'left',//标题文本水平对齐方式，建议不要设置，就让他默认，想居中显示的话，建议往下看
                       //textBaseline: "top",//默认就好,垂直对齐方式,不要设置
                       subtext:iswave+" "+consumetype+" "+isoutlier,
                       subtextStyle: {//副标题内容的样式
                           color: '#ffb8b8',//
                           fontStyle: 'normal',//主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
                           fontWeight: "lighter",//可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
                           fontFamily: "san-serif",//主题文字字体，默认微软雅黑
                           fontSize: 16,//主题文字字体大小，默认为12px
                       },
                       left:'right',
                       padding:5,//各个方向的内边距，默认是5，可以自行设置
                       //itemGap:10,//主标题和副标题之间的距离，可自行设置
                   },
                   tooltip: {
                       trigger: 'axis',
                       //triggerOn:"mousemove",
                       //confine:true ,
                       //position:'inside',
                       formatter: "{a}<br/> {b}周：{c}",
                   },
                   legend: {
                       /*x: 220,
                       y: 40,
                       data: ['Intent', 'Pre-order', 'Deal']*/
                       show:false
                   },
                   toolbox: {
                       show: true,
                       feature: {

                       }
                   },
                   calculable: true,
                   xAxis: [{
                       name:'周次',
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
                       name:'离群值',
                       type: 'value',
                       min:-1.0,
                       max :1.0,
                       interval:0.2,
                      /* left:0,
                       nameRotate:0.1,
                       nameLocation:'middle'*/
                       /*splitArea:{
                           show:true,
                           areaStyle:{
                               color:['#ffc09f','#ffffff']
                           }
                       }*/
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

</script>
</body>
</html>
