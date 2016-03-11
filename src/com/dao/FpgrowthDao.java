package com.dao;

import com.tools.ConnDB;

import java.util.*;
import java.sql.*;

import com.model.FpgrowthModel;
import com.dao.ConfigureDao;
public class FpgrowthDao {
	private ConnDB conn;

	public FpgrowthDao() {
		conn = new ConnDB();
	}
	
	//read detail
	public LinkedList<LinkedList<String>> readOrderDetail() throws Exception {
		
		String sql = "EXEC FIND_ORDERDETAIL";
		ResultSet rs = conn.executeQuery(sql);		
		List<OrderDetail> orderlist = new ArrayList<OrderDetail>();
		try {
			while (rs.next()){
				orderlist.add(new OrderDetail(Integer.parseInt(rs.getString(1)),rs.getString(3)));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int intordercode = 0;
		String orderitemname = null;
		LinkedList<String> listName = new LinkedList<String>();
		for (int i = 0; i < orderlist.size(); i++){
			
			if (intordercode == 0) {
				intordercode = orderlist.get(i).getIntordercode();
				orderitemname = orderlist.get(i).getItemname();
			} else if (intordercode == orderlist.get(i).getIntordercode()) {
				orderitemname = orderitemname + "," + orderlist.get(i).getItemname();
			} else {
				//System.out.println(intordercode + "," + orderitemname);
				listName.add(orderitemname);
				intordercode = orderlist.get(i).getIntordercode();
				orderitemname = orderlist.get(i).getItemname();
			}
			//System.out.println(orderlist.get(i).getIntordercode());
			if (i == orderlist.size() - 1 ) {
				listName.add(orderitemname);
				//System.out.println(intordercode + "," + orderitemname);
			}
		}
		
		LinkedList<LinkedList<String>> records=new LinkedList<LinkedList<String>>();
		
        for (String str : listName) {  
            
            String[] str1=str.split(",");     
            LinkedList<String> litm=new LinkedList<String>();  
            for(int i=0;i<str1.length;i++){  
                litm.add(str1[i].trim());  
            }  
            records.add(litm);    
        }
        return records;
	}
	
@SuppressWarnings("null")
public List<List<String>> readOrderDetailnew() throws Exception {
		
		String sql = "EXEC FIND_ORDERDETAIL";
		ResultSet rs = conn.executeQuery(sql);		
		List<OrderDetail> orderlist = new ArrayList<OrderDetail>();
		try {
			while (rs.next()){
				orderlist.add(new OrderDetail(Integer.parseInt(rs.getString(1)),rs.getString(3)));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int intordercode = 0;
		String orderitemname = null;
		List<String> listName = new ArrayList<String>();
		for (int i = 0; i < orderlist.size(); i++){
			
			if (intordercode == 0) {
				intordercode = orderlist.get(i).getIntordercode();
				orderitemname = orderlist.get(i).getItemname();
			} else if (intordercode == orderlist.get(i).getIntordercode()) {
				orderitemname = orderitemname + "," + orderlist.get(i).getItemname();
			} else {
				//System.out.println(intordercode + "," + orderitemname);
				listName.add(orderitemname);
				intordercode = orderlist.get(i).getIntordercode();
				orderitemname = orderlist.get(i).getItemname();
			}
			//System.out.println(orderlist.get(i).getIntordercode());
			if (i == orderlist.size() - 1 ) {
				listName.add(orderitemname);
				//System.out.println(intordercode + "," + orderitemname);
			}
		}
		
		List<List<String>> records= new LinkedList<List<String>>();;
		
        for (String str : listName) {  
            
            String[] str1=str.split(",");     
            List<String> litm=new ArrayList<String>();  
            for (String w : str1)
            	litm.add(w);
            		
            records.add(litm);    
        }
        return records;
	}
	
	//insert the end result of FP to DB
	public int insertFpgrowtDetail(FpgrowthModel fpm) {
		int flag=0;
		String sql="";
		try {
			//sql = "INSERT INTO tb_song (id,songName,singer,specialname,fileSize,fileURL,format,upTime,songType) VALUES(null,'"+sf.getSongName()+"','"+sf.getSinger()+"','"+sf.getSpecialName()+"','"+sf.getFileSize()+"','"+sf.getFileURL()+"','"+sf.getFormat()+"',GETDATE(),"+sf.getSongTypeId()+")";
			//sql = "INSERT INTO tb_songFromSpider (songid,songname,songsinger,songtype,songhref) VALUES("+ sfof.getsongId()+",'"+sfof.getSongName()+"','"+sfof.getSongSinger()+"','"+sfof.getSongType()+"','"+sfof.getSongHref()+"')";
			sql = "INSERT INTO FPRESULT VALUES("+ fpm.getfpCount()+",'"+fpm.getfPName()+"',"+fpm.getfpNameCount()+")";

			System.out.println(sql);
			flag = conn.executeUpdate(sql);
		} catch (RuntimeException e) {
			e.printStackTrace();
			System.out.println("出错的SQL语句："+sql);
		}
		conn.close();		
		return flag;
	}
	
	//delete  FP of DB
	public void delFpgrowtDetail() {
		int flag=0;
		String sql="";
		try {
			//sql = "INSERT INTO tb_song (id,songName,singer,specialname,fileSize,fileURL,format,upTime,songType) VALUES(null,'"+sf.getSongName()+"','"+sf.getSinger()+"','"+sf.getSpecialName()+"','"+sf.getFileSize()+"','"+sf.getFileURL()+"','"+sf.getFormat()+"',GETDATE(),"+sf.getSongTypeId()+")";
			//sql = "INSERT INTO tb_songFromSpider (songid,songname,songsinger,songtype,songhref) VALUES("+ sfof.getsongId()+",'"+sfof.getSongName()+"','"+sfof.getSongSinger()+"','"+sfof.getSongType()+"','"+sfof.getSongHref()+"')";
			sql = "delete from FPRESULT";

			System.out.println(sql);
			conn.executeUpdate(sql);
		} catch (RuntimeException e) {
			e.printStackTrace();
			System.out.println("出错的SQL语句："+sql);
		}
		conn.close();		
	}
	
	public int fPCount(String s_fPName,String s_fpCount, String s_fpCount1, String s_fpNameCount,String s_fpNameCount1){
		ConfigureDao cfd = new ConfigureDao();
		int _fpCount = cfd.fPSupport();
		String sql = "select count(*) as total from FPRESULT where fpCount >= " + _fpCount;
		if (!"".equals(s_fPName)&&s_fPName!=null ){
			sql = sql + " AND FPNAME like '%" + s_fPName + "%'";
		}
		if (!"".equals(s_fpCount)&&s_fpCount!=null ){
			sql = sql + " AND fpCount >= " + s_fpCount ;
		}
		if (!"".equals(s_fpCount1)&&s_fpCount1!=null ){
			sql = sql + " AND fpCount <= " + s_fpCount1;
		}
		if (!"".equals(s_fpNameCount)&&s_fpNameCount!=null ){
			sql = sql + " AND fpNameCount >= " + s_fpNameCount;
		}
		if (!"".equals(s_fpNameCount1)&&s_fpNameCount1!=null ){
			sql = sql + " AND fpNameCount <= " + s_fpNameCount1;
		}
		int total = 0;
		ResultSet rs=conn.executeQuery(sql);
		try {
			if(rs.next()){
				total = rs.getInt("total");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return total;
	}
	
	public List<FpgrowthModel> fPList(int row, int page,String s_fPName,String s_fpCount, String s_fpCount1, String s_fpNameCount,String s_fpNameCount1) {
		List<FpgrowthModel> list = new ArrayList<FpgrowthModel>();
		//String sql = "SELECT TOP " + row + " * from ( select row_number() over(order by [songname]) as rownumber,* from [tb_songFromSpider]) A"
		//		+ " where rownumber >" + (page-1)*row;
		
		//String sql = "SELECT TOP " + row + " * from ( select * from [tb_songFromSpider] where NOT EXISTS (SELECT * FROM tb_song WHERE tb_songFromSpider.songname = songName)) A"
		//		+ " where songid >" + (page-1)*row;
		//String sql = "SELECT TOP " + row + " * from ( select * from [tb_songFromSpider] ) A"
		//		+ " where songid >" + (page-1)*row;		
		
		//String sql = "EXEC pro_page " + row + ',' + page;
		String sql = "SELECT TOP " + row +  " * from (select *,ROW_NUMBER() OVER (ORDER BY FPCOUNT) as rank from FPRESULT) as t  where t.rank between " + (page-1)*row + " and " + page*row;
		if (!"".equals(s_fPName)&&s_fPName!=null ){
			sql = sql + " AND FPNAME like '%" + s_fPName + "%'";
		}
		if (!"".equals(s_fpCount)&&s_fpCount!=null ){
			sql = sql + " AND fpCount >= " + s_fpCount ;
		}
		if (!"".equals(s_fpCount1)&&s_fpCount1!=null ){
			sql = sql + " AND fpCount <= " + s_fpCount1;
		}
		if (!"".equals(s_fpNameCount)&&s_fpNameCount!=null ){
			sql = sql + " AND fpNameCount >= " + s_fpNameCount;
		}
		if (!"".equals(s_fpNameCount1)&&s_fpNameCount1!=null ){
			sql = sql + " AND fpNameCount <= " + s_fpNameCount1;
		}
		System.out.println(sql);
		ResultSet rs = conn.executeQuery(sql);
		System.out.println(1);
		
		  try {
			while (rs.next()) {
				FpgrowthModel fpgm = new FpgrowthModel();
				//sFSF.setRownumber(Integer.parseInt(rs.getString(1)));

				fpgm.setfpCount(Integer.parseInt(rs.getString(1)));
				fpgm.setfPName(rs.getString(2));
				fpgm.setfpNameCount(Integer.parseInt(rs.getString(3)));
				list.add(fpgm);		 // 将类别信息保存到List集合中
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(1);
		conn.close();
		return list;
		
	}
}
 class OrderDetail{
	
	public int intordercode = 0;		
	public String itemname = "";		

	public OrderDetail(int intordercode, String itemname){
		this.intordercode = intordercode;
		this.itemname = itemname;
		
	}

	public int getIntordercode() {
		return intordercode;
	}

	public void setIntordercode(int intordercode) {
		this.intordercode = intordercode;
	}
	
	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	
}
