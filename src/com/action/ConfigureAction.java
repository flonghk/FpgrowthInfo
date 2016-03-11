package com.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import com.dao.FpgrowthDao;
import com.model.FpgrowthModel;

import com.dao.ConfigureDao;
import com.model.ConfigureModel;

public class ConfigureAction  extends ActionSupport implements ServletRequestAware{

	HttpServletRequest request;
	//HttpServletResponse response;
	ActionContext ctx = ActionContext.getContext();  
    HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE); 
    
    ConfigureDao cGD = new ConfigureDao();
    
    public String execute() throws Exception {
		String page = request.getParameter("page");
	    String rows = request.getParameter("rows");

	    int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
        int number = Integer.parseInt((rows == null || rows == "0") ? "10":rows); 
	    
        Map<String, Object> result = new HashMap<String, Object>();

		try{

			List<ConfigureModel> list =  cGD.congfigureList(number,intPage);
			JsonConfig config = new JsonConfig(); 
			config.setIgnoreDefaultExcludes(false);  //设置默认忽略
			config.setExcludes(new String[]{"libs","multipartRequestHandler","servletWrapper"});
			JSONArray jsonArray1 = JSONArray.fromObject(list,config); 
			//JSONArray jsonArray1 = JSONArray.fromObject(list); 
			//System.out.println("jsonArray1" + jsonArray1);
			int total = cGD.configureCount();
			result.put("rows", jsonArray1);
			result.put("page", intPage);
			result.put("total", total);
			JSONArray jsonArray = JSONArray.fromObject(result);
			//System.out.println(jsonArray);
		    int start =jsonArray.toString().indexOf("[");
		    int end = jsonArray.toString().lastIndexOf("}");
		    //response.setContentType("text/html;charset=UTF-8");
			response.setContentType("application/html;charset=UTF-8");
		    response.setHeader("Cache-Control", "no-cache");
		    PrintWriter out = response.getWriter();
		    out.print(jsonArray.toString().substring(start+1, end+1));
		    //out.print(jsonArray.toString());
		    System.out.println(jsonArray.toString().substring(start+1, end+1));
		    out.flush();
		    out.close();

		}catch(Exception e){
			e.printStackTrace();
		}
     
		return null;
	}
    
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

}
