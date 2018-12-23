<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <link rel="stylesheet"  href="../css/test.css">
</head>
<body>
<div>
    <h4 style="float: left;padding: 10px;text-align: center;margin-top: 20px;margin-bottom: 10px">本页面对项目API功能进行展示，输入框中输入可生成对应URL，通过GET/POST方法可获取JSON格式数据</h4>
    <div class="tabborderc" style="float: left;background: #f7f7f7;width: 70%;margin: 0px 10px 20px 0;height: 490px">
        <div>
             <h4>输入学号及课程代号以获取预测成绩</h4>
            <form class="form-inline" id="get_predict_cj_form" onsubmit="return false" action="##" method="post">
                <div class="form-group">
                    <label for="studentid_predict_cj">学号</label>
                    <input type="text" class="form-control" style="padding: 5px;width: 150px" name="studentid_predict_cj" id='studentid_predict_cj' value = "2015211973"/>
                </div>
                <div class="form-group">
                    <label for="courseid_predict_cj">课程号</label>
                    <input type="text" class="form-control" style="padding: 5px;width: 150px" name="courseid_predict_cj" id='courseid_predict_cj' value = "3152100441"/>
                </div>
                <button class="btn btn-primary" id="post1" type="button" onclick="send_predict_cj()">
                    <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 发送POST请求
                </button>
                <button class="btn btn-primary" id="get1" type="button" onclick="convert_to_get(0)">
                    <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 点击生成GET请求
                </button>
            </form>
        </div>
        <h4 style="height: 30px"></h4>
        <div>
            <h4>输入学号及日期（精确到周）以获取离群值</h4>
            <form class="form-inline" id="get_anormal_form" onsubmit="return false" action="##" method="post">
                <div class="form-group">
                    <label for="studentid_get_anormal">学号</label>
                    <input type="text" class="form-control" name="studentid_get_anormal" style="padding: 5px;width: 150px" id='studentid_get_anormal' value = "2015211973"/>
                </div>
                <div class="form-group">
                    <label for="date_get_anormal">日期</label>
                    <input type="date" name="date_get_anormal" class="form-control" id='date_get_anormal' style="padding: 5px;width: 150px" value = "2016-03-10"/>
                </div>
                <button class="btn btn-primary" id="post2" type="button" onclick="post_anormal()">
                    <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 发送POST请求
                </button>
                <button class="btn btn-primary" id="get2" type="button" onclick="convert_to_get(1)">
                    <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 点击生成GET请求
                </button>
            </form>
        </div>


    </div>
    <div class="tabborderc" style="float: right; background: #f7f7f7;width: 27%;margin: 0 10px 20px 0;height: auto">
        <div>
            <h4 style="float: left">GET请求范例</h4>
            <button style="float: right" class="btn btn-primary" id="send_predict_cj_get_btn" type="button" onclick="send_predict_cj_get()">
                <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 点击发送GET请求
            </button>
        </div>
        <div>
            <textarea id='text_area_predict_cj' rows="10" style="width: 100%;"> </textarea>
        </div>
        <div>
            <h4>返回值</h4>
            <textarea id = "result_predict_cj"style="width: 100%;" rows="10"></textarea>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<%--<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script  src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src = "../js/echarts.common.min.js"></script>
<script src="../js/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-zh-CN.min.js"></script>--%>
<script>
    url_base = "http://10.110.144.245:5000/";
    function send_predict_cj() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url_base+"getpredictscore" ,//url
            data: $('#get_predict_cj_form').serialize(),
            success: function (result) {
                console.log(result.resultCode);//打印服务端返回的数据(调试用)
                // if (result.resultCode == 200) {
                // alert("SUCCESS");
               // document.getElementById('p_predict_cj').value=result;
                //yccj  = result[0]['yccj'];
                result_string = JSON.stringify(result[0]);
                console.log(result);
                document.getElementById("result_predict_cj").value=result_string;
                // };
            },
            error : function() {
                alert("异常！");
            }
        });
    }
    function convert_to_get(flag){
        if (flag == 0){
            studentid_predict_cj = document.getElementById("studentid_predict_cj").value;
            courseid_predict_cj = document.getElementById("courseid_predict_cj").value;
            url = url_base+"getpredictscore?studentid_predict_cj=" + studentid_predict_cj+"&courseid_predict_cj="+courseid_predict_cj;
        }else if (flag == 1){
            studentid_get_anormal = document.getElementById("studentid_get_anormal").value;
            date_get_anormal = document.getElementById("date_get_anormal").value;
            url = url_base+"getanormal?studentid_get_anormal=" + studentid_get_anormal+"&date_get_anormal="+date_get_anormal;
        }
        document.getElementById('text_area_predict_cj').value = url;

    }
    function send_predict_cj_get(){
        url = document.getElementById('text_area_predict_cj').value;
        if (url==""){
            alert("请生成GET请求");
        }else{
            $.ajax({
                url: url,
                type: 'GET',
                success: function(res) {
                    console.log(res);
                    // alert(res);
                    result_string = JSON.stringify(res[0]);
                    document.getElementById("result_predict_cj").value=result_string;
                }
            });
        }

    }

    function post_anormal() {
        date_get_anormal = document.getElementById('date_get_anormal').value;
        studentid_get_anormal = document.getElementById('studentid_get_anormal').value;
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url_base+"getanormal" ,//url
            data: {'studentid_get_anormal':studentid_get_anormal,'date_get_anormal':date_get_anormal},
            success: function (result) {
                // console.log(result);//打印服务端返回的数据(调试用)
                // if (result.resultCode == 200) {
                // alert("SUCCESS");
                // document.getElementById('result_predict_cj').value=result
                // yccj  = result[0]['yccj']
                result_string = JSON.stringify(result[0]);
                console.log(result);
                document.getElementById("result_predict_cj").value=result_string;
                // };
            },
            error : function() {
                alert("异常！");
            }
        });
    }
</script>

</body>
</html>
