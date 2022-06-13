package com.study.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.study.utility.*;


@Repository
public class AddrDAO {
	
	public boolean delete(int addressnum) {
		boolean flag = false;
		Connection con =DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM address  ");
		sql.append(" WHERE addressnum= ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, addressnum);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public boolean update(AddrDTO dto) {
		boolean flag = false;
		Connection con =DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update address ");
		sql.append(" set name = ?, ");
		sql.append(" 	 handphone= ?,  ");
		sql.append("     address=	?  , ");
		sql.append("     zipcode = 	?, ");
		sql.append("     address2 = ? ");
		sql.append(" WHERE addressnum= ? ");
	
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHandphone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setInt(6, dto.getAddressnum());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag =true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public AddrDTO read(int addressnum) {
		AddrDTO dto =null;
		Connection con =DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT addressnum, name, handphone, address, zipcode ,address2 ");
		sql.append(" FROM address ");
		sql.append(" WHERE addressnum= ?");
		
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, addressnum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new AddrDTO();
				dto.setAddressnum(rs.getInt("addressnum"));
				dto.setName(rs.getString("name"));
				dto.setHandphone(rs.getString("handphone"));
				dto.setAddress(rs.getString("address"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress2(rs.getString("address2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
			
		}
		return dto;
	}
	

	public int total(Map map) {
		int total = 0;
		Connection con =DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col"); // 선택한다, 검색컬럼: 
		String word = (String)map.get("word"); //사용자가 직접 입력한 단어 : 
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from address ");
		
		if(word.trim().length() >0 && col.equals("name_content")) {
			sql.append(" where name like concat('%',?,'%') ");
			sql.append(" of content like concat('%',?,'%') ");
		}else if(word.trim().length() > 0) {
			sql.append(" where "+ col +" like concat('%',?,'%') ");
		}
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length() >0 && col.equals("name_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			}else if(word.trim().length() > 0) {
				pstmt.setString(1, word);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return total;
	}
	
	public List<AddrDTO> list(Map map){
		List<AddrDTO> list = new ArrayList<AddrDTO>();
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null; //결과값 저장해서 불러오기
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno =(int)map.get("sno"); //시작 페이지
		int eno = (int)map.get("eno"); //끝나는 페이지
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT addressnum, name, handphone, address  ");
		sql.append(" FROM address");
		
		// 검색했을 때 나오게 하는거 만들기
		if(word.trim().length() >0 && col.equals("name_content")) { 
			sql.append(" where title like concat('%',?,'%') "); //concat은 컬럼데이터 합치기
			sql.append(" of content like concat('%',?,'%') ");
		}else if(word.trim().length() > 0) {
			sql.append(" where "+ col +" like concat('%',?,'%') ");
		}
		sql.append(" order by addressnum desc ");
		sql.append(" limit ?, ? ");
		int i=0;
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length() >0 && col.equals("name_contetn")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			}else if(word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				AddrDTO dto = new AddrDTO();
				dto.setAddressnum(rs.getInt("addressnum"));
				dto.setName(rs.getString("name"));
				dto.setHandphone(rs.getString("handphone"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}

	public boolean create(AddrDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection(); // db연결 객체
		PreparedStatement pstmt = null; // 전송 객체
		
		StringBuffer sql = new StringBuffer(); // sql객체 생성후 db 있는거 받아오기
		sql.append(" INSERT INTO address(name, handphone, address, zipcode, address2)   ");
		sql.append(" VALUES(?, ?, ?, ?,? ) ");
		
		try {
			pstmt =con.prepareStatement(sql.toString()); //전송하기
			// pstmt로 해서 sql ? 받아와서 넣기
			pstmt.setString(1, dto.getName()); 
			pstmt.setString(2, dto.getHandphone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress2());
			
			int cnt = pstmt.executeUpdate(); //갱신된 레코드 수 받아옴 
			if(cnt>0)flag = true; // boolean타입으로 받아와서 갱신된 레코드 수가 0이상이면 true로 받아서 실행
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
}
