package board;
import java.sql.*;
import java.util.*;

import javafx.scene.layout.Border;
import mydb.poolfact.*;
//쿼리실행
public class BoardQuery {

	String board = "board2";
	String idxNum = "board2_idx_seq.nextval";
	
	ConnectionPool pool = null;
	
	public BoardQuery(){
		try{
			pool = ConnectionPool.getInstance();
		}catch(Exception e){
			System.out.println("디비연결실패");
		}
	}
	
	public void insertBoard(BoardBean boardBean) throws SQLException{
		Connection conn = pool.getConnection();
		Statement stat = conn.createStatement();

		String sql = "";
		String name = boardBean.getName();
		String email = boardBean.getEmail();
		String homepage = boardBean.getHomepage();
		String title = boardBean.getTitle();
		String content = boardBean.getContent();
		String pwd = boardBean.getPwd();
		
		try{

			sql = "insert into "+board+" values("+idxNum+",'"+name+"','"+email+"','"+homepage+"','"+title+"','"+content+"','"+pwd+"',sysdate,0)";
			sql = new String(sql.getBytes("8859_1"),"utf-8");			
			stat.executeUpdate(sql);

		}catch(Exception e){
			System.out.println("insert error");
		}finally{			
			stat.close();
			pool.releaseConnection(conn);
		}		
	}
	
	public int boardCount() throws SQLException{
		int cnt = 0;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			conn = pool.getConnection();
			stat = conn.createStatement();
			sql = "select count(*) from "+board+"";
			rs = stat.executeQuery(sql);
			rs.next();
			cnt = rs.getInt(1);
		}catch(Exception e){
			System.out.println("error");
		}finally{
			rs.close();
			stat.close();
			pool.releaseConnection(conn);
		}
		return cnt;
	}
	
	//메소드 오버로딩 search문
	public int boardCount(String find, String search) throws SQLException{
		int cnt = 0;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			conn = pool.getConnection();
			stat = conn.createStatement();
			sql = "select count(*) from "+board+" where "+find+" like "+"'%"+search+"%'";
			rs = stat.executeQuery(sql);
			rs.next();
			cnt = rs.getInt(1);
		}catch(Exception e){
			System.out.println("error");
		}finally{
			rs.close();
			stat.close();
			pool.releaseConnection(conn);
		}
		return cnt;
	}
	
	public Vector getBoardList(int offset, int limit) throws SQLException{
		Vector boardList = new Vector();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			conn = pool.getConnection();
			stat = conn.createStatement();
			sql = "select a.* "+
			" from ( "+
			" select ROWNUM as RNUM, b.* "+
			" from ("+
			" select * "+
			" from "+board+" "+
			" order by idx desc "+
			" ) b "+
			" ) a "+
			" where a.RNUM > "+offset+" and a.RNUM <= "+(offset+limit)+"";
			rs = stat.executeQuery(sql);
			
			while(rs.next()){
				BoardBean boardBean = new BoardBean();
				boardBean.setIdx(rs.getInt("idx"));
				boardBean.setHit(rs.getInt("hit"));
				boardBean.setName(rs.getString("name"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setHomepage(rs.getString("homepage"));
				boardBean.setTitle(rs.getString("title"));				
				boardBean.setWdate(rs.getString("wdate").substring(0,10));
				boardList.add(boardBean);
			}
			
		}catch(Exception e){
			System.out.println("getBoardList error");
		}finally{
			rs.close();
			stat.close();
			pool.releaseConnection(conn);
		}
		
		return boardList;
	}
	
	//메소드 오버로딩 search
	public Vector getBoardList(int offset, int limit, String find, String search) throws SQLException{
		Vector boardList = new Vector();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			conn = pool.getConnection();
			stat = conn.createStatement();
			sql = "select a.* "+
			" from ( "+
			" select ROWNUM as RNUM, b.* "+
			" from ("+
			" select * "+
			" from "+board+" "+
			" where "+find+" like "+"'%"+search+"%'"+
			" order by idx desc "+
			" ) b "+
			" ) a "+
			" where a.RNUM > "+offset+" and a.RNUM <= "+(offset+limit)+"";
			rs = stat.executeQuery(sql);
			
			while(rs.next()){
				BoardBean boardBean = new BoardBean();
				boardBean.setIdx(rs.getInt("idx"));
				boardBean.setHit(rs.getInt("hit"));
				boardBean.setName(rs.getString("name"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setHomepage(rs.getString("homepage"));
				boardBean.setTitle(rs.getString("title"));				
				boardBean.setWdate(rs.getString("wdate").substring(0,10));
				boardList.add(boardBean);
			}
			
		}catch(Exception e){
			System.out.println("getBoardList error");
		}finally{
			rs.close();
			stat.close();
			pool.releaseConnection(conn);
		}
		
		return boardList;
	}	
	public void boardHitUp(int idx) throws SQLException{
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		try{
			String sql = "update "+board+" set hit=hit+1 where idx="+idx+" ";
			stmt.executeUpdate(sql);
		}catch(Exception e){
			System.out.println("hit error");
		}finally{
			stmt.close();
			pool.releaseConnection(conn);
		}		
	}
	
	public BoardBean boardView(int idx) throws SQLException{
		BoardBean boardBean = null;
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		
		try{
		conn = pool.getConnection();
		stmt = conn.createStatement();		
		String sql = "select * from "+board+" where idx="+idx+" ";		
		rs =stmt.executeQuery(sql);
		boardBean = new BoardBean();
		
		if(rs.next()){
			boardBean.setIdx(rs.getInt("idx"));
			boardBean.setName(rs.getString("name"));
			boardBean.setHit(rs.getInt("hit"));
			boardBean.setEmail(rs.getString("email"));
			boardBean.setHomepage(rs.getString("homepage"));
			boardBean.setTitle(rs.getString("title"));
			String content = rs.getString("content");
			boardBean.setContent(content.replaceAll("\n", "<br />"));
			boardBean.setWdate(rs.getString("wdate"));
		}
		
		}catch(Exception e){
			System.out.println("view sql error");
		}finally{
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		
		return boardBean;
	}
	public boolean passwordCheck(int idx, String pwd) throws SQLException{
		boolean chk = false;
		ResultSet rs = null;
		Statement stmt = null;
		Connection conn = null;
		String pwd2="";
				
		try{
		conn = pool.getConnection();
		stmt = conn.createStatement();		
		String sql = "select pwd from "+board+" where idx="+idx+" ";		
		
		rs =stmt.executeQuery(sql);
		rs.next();
		
		pwd = pwd.trim();
		pwd2=rs.getString(1);
		
		pwd=pwd.trim();
		pwd2=pwd2.trim();
		
		if(pwd.equals(pwd2)){
			chk=true;
		}
			
		}catch(Exception e){
			System.out.println("password func error");
			
		}finally{
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return chk; 
	}
	
	public boolean boardUpdate(BoardBean boardBean) throws SQLException{
		boolean result = false;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "";
		int idx = boardBean.getIdx();
		
		String name = boardBean.getName();
		String email = boardBean.getEmail();
		String homepage = boardBean.getHomepage();
		String title = boardBean.getTitle();
		String content = boardBean.getContent();
		String pwd = boardBean.getPwd();
		
		try{

			if(passwordCheck(idx, pwd)){
				sql = "update "+board+" set name='"+name+"', email='"+email+"', homepage='"+homepage+"', title='"+title+"', content='"+content+"' where idx="+idx;
				sql = new String(sql.getBytes("8859_1"), "euc-kr");
				stmt.executeUpdate(sql);
				result = true;
			}else{
				result = false;
			}
			
		}catch(Exception e){
			System.out.println("update error");
			
		}finally{
			stmt.close();
			pool.releaseConnection(conn);
		}
		
		return result;
	}
	
	public boolean boardDelete(int idx, String pwd) throws SQLException{
		boolean result = false;
		
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql= "";
		try{
			if(passwordCheck(idx, pwd)){
				sql = "delete from "+board+" where idx="+idx;
				sql=new String(sql.getBytes("8859_1"),"euc-kr");
				stmt.executeUpdate(sql);
				result = true;
			}else{
				result = false;
			}
		}catch(Exception e){
			System.out.println("delete error");
		}finally{
			stmt.close();
			pool.releaseConnection(conn);
		}
		
		return result;
	}

	
}
