package com.dao;

import com.model.ConfigureModel;
import com.tools.ConnDB;

import java.util.*;
import java.sql.*;

public class ConfigureDao {
	private ConnDB conn;

	public ConfigureDao() {
		conn = new ConnDB();
	}
	
	public List<ConfigureModel> congfigureList(int row, int page) {
		List<ConfigureModel> list = new ArrayList<ConfigureModel>();

		
		//String sql = "EXEC pro_page " + row + ',' + page;
		String sql = "SELECT TOP " + row +  " * from (select *,ROW_NUMBER() OVER (ORDER BY CONFIGUREPRODUCTION) as rank from CONFIGURE) as t  where t.rank between " + (page-1)*row + " and " + page*row;

		System.out.println(sql);
		ResultSet rs = conn.executeQuery(sql);
		System.out.println(1);
		
		  try {
			while (rs.next()) {
				ConfigureModel cm = new ConfigureModel();
				//sFSF.setRownumber(Integer.parseInt(rs.getString(1)));

			    cm.setconfigureProduction(rs.getString(1));
			    cm.setconfigureParameter(rs.getString(2));
				
				list.add(cm);		 // 将类别信息保存到List集合中
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(1);
		conn.close();
		return list;
		
	}
	
	public int fPSupport(){
		String sql = "select CONFIGUREPARAMETER as support from CONFIGURE WHERE CONFIGUREPRODUCTION = '最小支持度'";

		int support = 0;
		ResultSet rs=conn.executeQuery(sql);
		try {
			if(rs.next()){
				support = Integer.parseInt(rs.getString(1));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return support;
	}
	
	public int configureCount(){
		String sql = "select count(*) as total from CONFIGURE";

		int total = 0;
		ResultSet rs=conn.executeQuery(sql);
		try {
			if(rs.next()){
				total = Integer.parseInt(rs.getString(1));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return total;
	}
}

