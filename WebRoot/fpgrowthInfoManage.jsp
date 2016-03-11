<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fpgrowthInfoManage.jsp' starting page</title>
    
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

	   	function startFPgorwth(){
      		//$('#dlg').dialog('open').dialog('setTitle','开始');
      		//url = "spider.do?action=spiders";
      		//method = "post";
      		/*$.ajax({
  				type: 'POST',
  				url: 'spider.do?action=spiders'
  				//data: data,
  				//success: success,
  				//dataType: dataType
			});*/
			$.post('fpgrowth!startFPgrowth',{},function(result){
              if (result.success){
                $('#dg').datagrid('reload');	// reload the user data
              } else {
                $.messager.show({	// show error message
                  title: 'Error',
                  msg: result.msg
                });
              }
            },'json');
			//window.location.reload(true);
    }
    
    function openDetailDialog(){
	var selectedRows=$("#dg").datagrid('getSelections');
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","详细资料");
	$("#fpCount").val(row.fpCount);
	$("#fPName").val(row.fPName);
	$("#fpNameCount").val(row.fpNameCount);
	
	}
	function search(){
	$('#dg').datagrid('load',{
		s_fPName:$('#s_fPName').val(),
		s_fpCount:$('#s_fpCount').val(),
		s_fpCount1:$('#s_fpCount1').val(),
		s_fpNameCount:$('#s_fpNameCount').val(),
		s_fpNameCount1:$('#s_fpNameCount1').val(),

	});
	}
	</script>
  </head>
  
  <body>
    <table id="dg" title="信息" class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true" url="fpgrowth" fit="true" method= "get" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="fpCount" width="150"  align="center">组合出现次数</th>
				<th field="fPName" width="500"  align="center">组合信息</th>
				<th field="fpNameCount" width="100" align="center">产品个数</th>
				
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:startFPgorwth()" class="easyui-linkbutton" iconCls="icon-add" plain="true">开始生成关联规则</a>
			<a href="javascript:openDetailDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">查看组合信息</a>
			
		</div>
		<div>
		&nbsp;组合信息：&nbsp;<input type="text" name="s_fPName" id="s_fPName" size="15"/>
		
		&nbsp;出现次数：&nbsp;<input type="text" name="s_fpCount" id="s_fpCount" size="8"/>-<input type="text" name="s_fpCount1" id="s_fpCount1" size="8"/>
		&nbsp;产品个数：&nbsp;<input type="text" name="s_fpNameCount" id="s_fpNameCount" size="8"/>-<input type="text" name="s_fpNameCount1" id="s_fpNameCount1" size="8"/>
		<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 500px;height: 340px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>		
					<td>出现次数：</td>
					<td><input type ="text"  id="fpCount" name="fpgrowth.fpCount" style="width: 300px" /></td>
				</tr>
				<tr>
					<td>组合信息：</td>
					<td><input type ="text"  id="fPName" name="fpgrowth.fPName" style="width: 300px" /></td>
				</tr>
				<tr>
					<td>产品个数：</td>
					<td><input type ="text"  id="fpNameCount" name="fpgrowth.fpNameCount" style="width: 300px" /></td>
				</tr>
			</table>
		</form>
	</div>
  </body>
</html>
