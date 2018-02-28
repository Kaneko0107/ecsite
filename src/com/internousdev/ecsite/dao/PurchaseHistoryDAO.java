package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.PurchaseHistoryDTO;
import com.internousdev.ecsite.util.DBConnector;

public class PurchaseHistoryDAO {
	public ArrayList<PurchaseHistoryDTO>getPurchaseHistory(String userId)throws SQLException{
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		ArrayList<PurchaseHistoryDTO>purchaseHistoryDTOList = new ArrayList<>();

		String sql = "SELECT*";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				PurchaseHistoryDTO dto = new PurchaseHistoryDTO();
				dto.setId(rs.getInt("id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString("product_name_kana"));
				dto.setPrice(rs.getInt("price"));
				dto.setCount(rs.getInt("product_count"));
				dto.setReleaseCompany(rs.getString("release_company"));
				dto.setReleaseDate(rs.getString("regist_date"));
				dto.setProductImage(rs.getString("image_file_name"));

				purchaseHistoryDTOList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		return purchaseHistoryDTOList;
	}
public void deletePart(int id){

}
	//値段の高い順に並べるメソッド
	public ArrayList<PurchaseHistoryDTO> sortPrice(String userId)throws SQLException{
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		ArrayList<PurchaseHistoryDTO>purchaseHistoryDTOList = new ArrayList<PurchaseHistoryDTO>();

		String sql = "SELECT*";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				PurchaseHistoryDTO dto = new PurchaseHistoryDTO();
				dto.setId(rs.getInt("id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductNameKana(rs.getString(("product_name_kane")));
				dto.setPrice(rs.getInt("price"));
				dto.setCount(rs.getInt("product_count"));
				dto.setReleaseCompany(rs.getString("release_date"));
				dto.setReleaseDate(rs.getString("regist_date"));
				dto.setProductImage(rs.getString("image_file_name"));

				purchaseHistoryDTOList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}return purchaseHistoryDTOList;
	}
	//全て削除する（メソッド）
	public int deleteHistory(String userId)throws SQLException{
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		String sql = "DELETE FROM purchase_history_info where user_id = ?";

		PreparedStatement ps;
		int result = 0;
		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			result = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		return result;
	}


}
