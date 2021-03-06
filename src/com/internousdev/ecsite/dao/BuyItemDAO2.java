package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.ecsite.dto.BuyItemDTO;
import com.internousdev.ecsite.util.DBConnector;

public class BuyItemDAO2 {

	private DBConnector dbConnector = new DBConnector();

	private Connection connection = dbConnector.getConnection();

	private List<BuyItemDTO>buyItemDTOList = new ArrayList<BuyItemDTO>();

	public List<BuyItemDTO>getBuyItemInfo(){

		String sql = "SELECT id, item_name, item_price, item_stock,item_photo FROM item_info_transaction";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()){
				BuyItemDTO dto=new BuyItemDTO();
				dto.setId(resultSet.getInt("id"));
				dto.setItemName(resultSet.getString("item_name"));
				dto.setItemPrice(resultSet.getString("item_price"));
				dto.setItem_stock(resultSet.getInt("item_stock"));
				dto.setItemPhoto(resultSet.getString("item_photo"));
				buyItemDTOList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return buyItemDTOList;
	}
	public List<BuyItemDTO>getBuyItemDTO(){
		return buyItemDTOList;
	}

}
