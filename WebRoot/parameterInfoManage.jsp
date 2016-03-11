<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'parameterInfoManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.1/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.1/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	</script>
  </head>
  
  <body>
        <table id="dg" title="信息" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true" url="configures" fit="true" method= "get" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="configureProduction" width="500"  align="center">配置信息</th>
				<th field="configureParameter" width="500"  align="center">配置参数</th>
				
		</thead>
	</table>
  </body>
</html>
