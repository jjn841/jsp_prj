package day0516;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;

public class EmpDAO {
	private static EmpDAO dDAO;
	private EmpDAO() {
		
	}//DeptDAO
	
	public static EmpDAO getInstance() {
		if(dDAO==null) {
			dDAO=new EmpDAO();
		}//end if
		return dDAO;
		
	}//getInstance
	
	public List<EmpDTO> selectAllEmp(int deptno)throws SQLException{
		List<EmpDTO> list=new ArrayList<EmpDTO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
		//1.JNDI사용 객체 생성
		//2. DBCP에서 DataSource 얻기
		//3.Connection얻기
			con=dbCon.getDbConn();
		//4.쿼리문 생성객체 얻기
			String selectAllEmp=
			"select empno, ename, job, hiredate,sal from emp where deptno=?";
			pstmt=con.prepareStatement(selectAllEmp);
		//5.바인드변수에 값할당
			pstmt.setInt(1, deptno);
		//6.쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			
			EmpDTO emptDto=null;
			
			while( rs.next() ) {
				emptDto=new EmpDTO();
				emptDto.setEmpno(rs.getInt("empno"));
				emptDto.setEname(rs.getString("ename"));
				emptDto.setJob(rs.getString("job"));
				emptDto.setHiredate(rs.getDate("hiredate"));
				emptDto.setSal(rs.getInt("sal"));
				
				list.add(emptDto);
			}//end while
			
		}finally {
		//7.연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}//selectAllDept
	
}//class
