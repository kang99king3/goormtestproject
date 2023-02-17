package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import datasource.DataBase;
import dto.HkDto;

public class HkDao extends DataBase{
	
	//싱글턴 패턴: 객체를 한번만 생성해서 사용한다.
	private static HkDao hkdao;
	private HkDao() {} //new를 쓰지 못하게 생성자를 private으로 접근 제한
	public static HkDao getHkDao() {
		if(hkdao==null) { //null일 경우만 new로 생성한다.
			hkdao=new HkDao();
		}
		return hkdao;
	}

//	public HkDao() {
//		
//	}
	
	//1.글목록 조회: select문 - 결과는 여러행 반환 --> list를 반환
	public List<HkDto> getBoardList(){
		List<HkDto> list=new ArrayList<HkDto>();
		
		Connection conn=null;
		PreparedStatement psmt=null;
		ResultSet rs=null;
		
		String sql=" SELECT SEQ, ID, TITLE, CONTENT, REGDATE "
				+ " FROM hkboard "
				+ " ORDER BY REGDATE DESC ";

		try {
			conn=getConnection();
			System.out.println("2단계:DB연결성공!");
			psmt=conn.prepareStatement(sql);
			System.out.println("3단계:쿼리준비성공!");
			rs=psmt.executeQuery();//select문 실행할때 사용
			System.out.println("4단계:쿼리실행성공!");
			while(rs.next()) { //rs[row,row,row,row...]
				HkDto dto=new HkDto();//필통
				//DB에서 검색된 결과를 java환경에 맞게 형변환하여 DTO에 저장한다.
				dto.setSeq(rs.getInt(1)); // row[seq,id,title,content,regdate]
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				list.add(dto);
				System.out.println(dto);
			}
			System.out.println("5단계:DB결과 받기 성공!!");
			
		} catch (SQLException e) {
			System.out.println("JDBC실패:getBoardList():"+getClass());
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}
		
		return list;
	}
	
	//2.글추가하기: 페이지에서 입력된 값을 받아서 DB에 추가한다.
	//           insert문 실행: 반환값???결과값 없다.-->대신 추가된 행의 개수를 반환한다
	//           파라미터 정의: 
	public boolean insertBoard(HkDto dto) { // hkDto--> id,title,content 담을 수 있다.
		int count=0;//insert문에 의해 추가되는 행의 개수를 저장할 변수
		Connection conn=null;
//		Statement stmt=null;// ?를 사용할수 없음 
		PreparedStatement psmt=null;
//		ResultSet rs=null; (X)결과가 없으니깐 
		
		String sql=" INSERT INTO hkboard "
				+ " VALUES(null,? ,? ,? ,SYSDATE()) ";
		
		try {
			conn=getConnection();
			System.out.println("2단계:DB연결성공");
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			System.out.println("3단계:쿼리준비성공");
			//insert,update,delete문에서든 executeUpdate()사용-->왜냐면 테이블을 수정하는거니깐
			//                                      반환값은 -->수정된 row의 개수를 반환
			//select문은 executeQuery()--> 결과가 있어서
			count=psmt.executeUpdate();
			System.out.println("4단계:쿼리실행성공");
		} catch (SQLException e) {
			System.out.println("JDBC실패:insertBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;//삼항연산자 활용
	}
	//3.글상세조회: select문, 파라미터 받기??? -->Dbeaver에서 쿼리 작성해보면 알아요
	//    반환타입: 글하나의 대한 정보 조회--> 1row를 반환 --> 1row를 저장하는 객체 DTO
	public HkDto getBoard(int seq) {
		HkDto dto=new HkDto();
		
		Connection conn=null;//연결객체 저장할 변수
		PreparedStatement psmt=null;//쿼리를 준비할 변수
		ResultSet rs=null;//DB의결과를 저장할 변수
		
		String sql=" SELECT SEQ,ID,TITLE,CONTENT,REGDATE "
				 + " FROM hkboard WHERE seq=? ";
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs=psmt.executeQuery();
			while(rs.next()) {
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
			}
			//while문이 종료된후 이렇게 됨--> HkDto[seq,id,title,content,regdate]
		} catch (SQLException e) {
			System.out.println("JDBC실패:getBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(rs, psmt, conn);
		}
		
		return dto;
	}
	
	//4.글수정하기: update문, 파라미터 받기???
	// 수정할 컬럼: 제목, 내용, 작성일 
	// 파라미터받을 목록: seq,제목, 내용
	public boolean updateBoard(HkDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement psmt=null;
		
		String sql=" UPDATE hkboard "
				 + " SET TITLE=?,CONTENT=?,REGDATE=SYSDATE() "
				 + " WHERE SEQ=? ";
		
		try {
			conn=getConnection();//2단계
			psmt=conn.prepareStatement(sql);//3단계
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getSeq());//3단계 완료
			count=psmt.executeUpdate();//4단계:쿼리 실행 및 테이블의 수정된 행의 개수를 반환
			//5단계는 생략--> 쿼리실행 결과가 없기 때문에
		} catch (SQLException e) {
			System.out.println("JDBC실패:updateBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		return count>0?true:false;
	}

	//5.글삭제하기: delete문, 파라미터 받기??? 
	public boolean delBoard(int seq) {
		int count=0;
		
		Connection conn=null;
		PreparedStatement psmt=null;
		
		String sql=" DELETE FROM hkboard WHERE SEQ=? ";
		
		try {
			conn=getConnection();//2단계:DB연결
			psmt=conn.prepareStatement(sql);//3단계:쿼리준비
			psmt.setInt(1, seq);
			count=psmt.executeUpdate();//4단계:쿼리실행
			//5단계:쿼리결과받기--> 생략
		} catch (SQLException e) {
			System.out.println("JDBC실패:delBoard():"+getClass());
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		
		return count>0?true:false;
	}
	
	//글 여러개 삭제하기: delete문 , 파라미터 받기 seq 여러개--> 배열
	//트랜젝션처리: 모두 성공하면 성공!! 하나라도 실패면 실패!! 처리하자
	//          setAutoCommit(), commit(), rollback() 활용
	//트랜젝션 처리 유형: 
	//       1. 요청 한번에  update문, insert문  실행 -> 작업의 수가 정해진 경우
	//       2. 요청 한번에  delete문 실행 -> 몇번 작업할지 정해지지 않은 경우
	//          --> 파라미터 값을 확인해서 몇번 delete문을 실행할지 결정
	//  --> batch개념: 동일한 여러 작업을 한번에 실행하는 개념
	//      a+b , a-b (X)      a+b  a+b  a+b (O)  --> 1+3 , 3+5, 2+10..
	//  delete from hkboard where seq=1
	//  delete from hkboard where seq=5
	//  delete from hkboard where seq=6
	public boolean mulDel(String[] seqs) {
		boolean isS=true; //쿼리작업의 성공여부
		int [] count=null;//실행결과를 저장할 배열
		
		Connection conn=null;
		PreparedStatement psmt=null;
		
		String sql=" DELETE FROM hkboard WHERE SEQ=? ";
		
		try {
			conn=getConnection();
			conn.setAutoCommit(false);//수동커밋설정
			psmt=conn.prepareStatement(sql);
			for (int i = 0; i < seqs.length; i++) {
				psmt.setString(1, seqs[i]);//쿼리 하나 완성
				psmt.addBatch();//완성된 쿼리를 준비시킴
				//DELETE FROM HKBOARD WHERE SEQ=1
				//DELETE FROM HKBOARD WHERE SEQ=5 이런식으로 준비시킴
			}
			//int타입의 배열반환: 모두 성공하면 [1,1,1..] 1를 반환
			count=psmt.executeBatch();// 준비된 쿼리들을 한번에 쭈욱~ 실행시킴
			conn.commit();//commit은 DB에 반영하는 명령어
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();//실패하면 모두 되돌린다
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				//트랜젝션처리 완료 후 autocommit으로 설정
				conn.setAutoCommit(true);
				close(null, psmt, conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//화면처리를 위해서 성공여부를 확인
			for (int i = 0; i < count.length; i++) {
                System.out.println("성공여부:"+count[i]);
				if(count[i]!=1) {
					isS=false;
					break;
				}
			}
		}
		
		return isS;
	}
}