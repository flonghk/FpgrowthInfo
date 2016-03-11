<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sales.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript">  
    $(function(){  
        $("input[type=button]").bind("click",showChart);  
    });  
    var chart;  
    function showChart(){  
        $.ajax({  
            url:'/t/highcharts',  
            type:'post',  
            dataType:'json',  
            success:function(data){  
                var json = eval(data);  
                if(json!="" && json!=null){  
                    chart = new Highcharts.Chart({  
                        chart: {  
                            renderTo: 'container',  
                            type: 'line'  
                        },  
                        title: {  
                            text: 'Monthly Average Temperature'  
                        },  
                        subtitle: {  
                            text: ''  
                        },  
                        xAxis: {  
                            categories: json.categories  
                        },  
                        yAxis: {  
                            title: {  
                                text: 'Temperature (°C)'  
                            },  
                            min:0  
                        },  
                        plotOptions: {  
                            line: {  
                                dataLabels: {  
                                    enabled: true  
                                },  
                                enableMouseTracking: true  
                            }  
                        },  
                        tooltip: {  
                            formatter: function() {  
                                    return '<b>'+ this.series.name +'</b><br/>'+  
                                    this.x +': '+ this.y +' 元';  
                            }  
                        },  
                        series: json.series  
                    });  
                }  
            },  
            error:function(){  
                alert('error!');  
            }  
        });  
    }  
</script>  
  </head>
  
  <body>
    <div style="margin:auto;text-align:center;">  
	<div style="padding:10px;">
	<input type="button" value=" Test Highcharts "/>
	</div>  
	<div id="container" style="height:480px;width:980px;background-color:#efefef;"> </div>  
</div>  
  </body>
</html>
