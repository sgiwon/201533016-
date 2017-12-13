package mydb.poolfact;

import java.sql.*;

public class ConnectionFactory {
	
	//각각 디비서버에 접속 하는 팩토리
	//디비연동
	//public static final int ODBC = 1; 
	public static final int ORACLE = 2;
	
	
	private String url = "localhost";
	private String port = "1521";
	private String dbname = "orcl";
	private String dbuser = "system";
	private String pswd = "1234";
	private String unicode = "ture";
	private String encode = "euc-kr";
	
	public ConnectionFactory(){};
	
	public Connection getConnection(int dbms) throws SQLException{
		Connection conn = null;
		
		/*if(dbms == ConnectionFactory.ODBC){
			try{
				Class.forName("sun.jdbc.odbc.jdbcOdbcDriver");
				conn = DriverManager.getConnection("jdbc:odbc:dbdsn",dbuser,pswd);
			}catch(ClassNotFoundException cnfe){
				System.out.println("cnfe : "+ cnfe);
			}
		}else */if(dbms == ConnectionFactory.ORACLE){
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@"+url+":"+port+":"+dbname,dbuser,pswd);
			}catch(ClassNotFoundException cnfe){
				System.out.println("cnfe : "+ cnfe);
			}
		}
		
		return conn;
		
	}

}
