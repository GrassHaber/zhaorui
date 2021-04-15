package rui.grad_tracking.jdbc;
import java.sql.*;
public class MySQLConnBean {
	private Statement stmt = null;
	private Connection conn = null;
	ResultSet rs = null;
	public MySQLConnBean(){}
	public Statement getStmt() {
		return stmt;
	}
	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	public Connection OpenConn()throws Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/grad_tracking";
			String user = "root";
			String password = "110974";
			conn = DriverManager.getConnection(url, user, password);
		}
		catch(SQLException e){
			System.err.println(e.getMessage());
		}
		return conn;
	}

	
	//πÿ±’∂‘œÛ
	public void close(Connection conn,Statement stmt,ResultSet rs){
	    if(rs!=null){
	    	try{
	    		rs.close();
	    		rs = null;
	    	}catch(SQLException e){
	    		e.printStackTrace();
	    	}
	    }
	    if(stmt!=null){
	    	try{
	    		stmt.close();
	    		stmt = null;
	    	}catch(SQLException e){
	    		e.printStackTrace();
	    	}
	    }
	    if(conn!=null){
	    	try{
	    		conn.close();
	    		conn = null;
	    	}catch(SQLException e){
	    		e.printStackTrace();
	    	}
	    }
	}
	
}
