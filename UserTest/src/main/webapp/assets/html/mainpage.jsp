<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="../icon/bd.jpg">

    <title>Project BD</title>

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">

</head>
<style>
    #personPicture{
        border-width: 1px;
        border-style: solid;
        border-color: #66512c;
        padding: 50px;
        width: 30%;
        height: 300px;
        vertical-align: middle;
        display: table-cell;
        text-align: center;
        float: left;

    }
    #personInfo{
        border-color: #c12e2a;
        border-style: solid;
        border-width: 1px;
        padding: 50px;
        width: 70%;
        height: 300px;
        float: left;

    }
    #historyScore{
        border-width: 1px;
        border-style: solid;
        border-color: #2b542c;
        width: 60%;
        height: 600px;
        float: left;
        clear: left;

    }
    #currentCourse{
        border-width: 1px;
        border-style: solid;
        padding: 10px;
        border-color: #2aabd2;
        width: 40%;
        height: 600px;

        float: left;

    }

    ul.nav-sidebar-list{
        list-style-type: none;


    }
    /*ul.nav-sidebar-list>li{
        margin-top: 3px;
        margin-bottom: 3px;

    }*/
    ul.nav-sidebar-list > li > a:link,a:visited{
        text-decoration: none;
        padding: 5px 140px 5px 10px;
        margin: 3px;
        text-align: center;
        display: inline-block;

    }
    ul.nav-sidebar-list > li > a:hover,a:active{
        background-color: #9acfea;
    }
    ul.nav-sidebar > li{
        border-bottom-style: solid;
        border-bottom-color: #9acfea;
        border-bottom-width: 0.5px;
        border-top-style: solid;
        border-top-color: #9acfea;
        border-top-width: 0.5px;

    }





</style>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
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
                <li><button class="btn-primary" type="button", id ='logout',onclick="Logout()">注销</button></li>

            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar" >
                <li class="clickable"><a href="#" onclick="showAtRight('rightmainpage.html')">首页 </a></li>
                <li class="clickable"><a href="#"  onclick="showAtRight('rightpersonpage.html')">个人信息</a></li>
                <li class="clickable"><a href="#" onclick="showAtRight('rightgrouppage.html')">群体-学院</a></li>
                <li class="clickable"><a href="#" onclick="showAtRight('rightclasspage.html')">群体-班级</a></li>
                   <%-- <ul class="nav-sidebar-list" >
                        <li class="group"><a href="#"  >学院</a></li>
                        <li class="group"><a href="#"  >班级</a></li>
                        <li class="group"><a href="#"  >其他</a></li>
                    </ul>
                </li>--%>
                <li class="clickable"><a href="#" onclick="showAtRight('rightaddpage.html')"> 扩展功能</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="rightpage">

            <div id="rightdiv">

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script  src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src = "../js/echarts.common.min.js"></script>
<script>
    $(document).ready(function(){
        $('ul.nav >li.clickable').click(function (e) {
            $('ul.nav>li.clickable').removeClass('active');
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
    function Logout() {
        
    }

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
</script>

</body>
</html>
