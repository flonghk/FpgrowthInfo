<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>FP-growth</title>
    
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
	$(function(){
		// 数据
		var treeData=[{
			text:"关联规则信息查询分析系统",
			iconCls:"icon-menu",
			children:[{
				text:"关联信息管理",
				iconCls:"icon-user",
				attributes:{
					url:"fpgrowthInfoManage.jsp"
				}
			},{
				text:"配置信息管理",
				iconCls:"icon-manage",
				attributes:{
					url:"parameterInfoManage.jsp"
				}
			}]
		}];
		
		// 实例化树菜单
		$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url,node.iconCls);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url,iconCls){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content,
					iconCls:iconCls,
				});
			}
		}
	});
	

</script>
  </head>
  
<body class="easyui-layout">
	<div region="north" style="height: 85px;background-color: #E0EDFF">
		<div style="margin:0px;text-align:center"><font color="black" size="10">关联规则信息查询分析系统</font></div>
		
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页"  data-options="iconCls:'icon-welcome'">
				<div align="center" style="padding-top: 100px;"><font color="black" size="10">欢迎使用</font></div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 150px;" title="导航菜单" split="true">
		<ul id="tree"></ul>
	</div>
	<div region="south" style="height: 25px;" align="center">版权所有 <a>hk</a></div>
</body>
</html>
