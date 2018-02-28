package com.internousdev.ecsite.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyItemDAO;
import com.internousdev.ecsite.dto.BuyItemDTO;
import com.opensymphony.xwork2.ActionSupport;

//2/13追記「キーボードから入力した文字列反映」
import java.io.*;

public class HomeAction extends ActionSupport implements SessionAware{

	public Map<String,Object>session;
	private BuyItemDAO buyItemDAO = new BuyItemDAO();
	private List<BuyItemDTO> buyItemDTOList;

	public String execute() {
		String result = "login";
		if(session.containsKey("id")){


			buyItemDTOList=buyItemDAO.getBuyItemInfo();
			session.put("buyItemDTOList",buyItemDTOList);

			result = SUCCESS;
		}

		if(session.containsKey("masterId")){
			buyItemDTOList = buyItemDAO.getBuyItemInfo();
			session.put("buyItemDTOList", buyItemDTOList);
			result = "master" ;
		}
		return result;
	}
	public List<BuyItemDTO>getBuyItemDTOList(){
		return buyItemDTOList;
	}
	public void setBuyItemDTOList(List<BuyItemDTO>buyItemDTOList){
		this.buyItemDTOList = buyItemDTOList;
	}

	//2/13追記「キーボード入力反映」を導入したい
	public static void main(String args[])throws IOException
	{
	System.out.println("名前を入力してください");
	BufferedReader br =
	new BufferedReader(new InputStreamReader(System.in));

//	2/13追記
	String str = br.readLine();
	System.out.println(str + "さん、ようこそECサイトへ！ゆっくりお買い物を楽しんでください♪");
	}




	@Override
	public void setSession(Map<String, Object>session){
		this.session = session;
	}

	public void setsession(Map<String, Object>session){
		this.session = session;
	}

	public Map<String,Object>getsession(){
		return this.session;
	}
}