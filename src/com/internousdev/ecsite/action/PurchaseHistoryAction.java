package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.PurchaseHistoryDAO;
import com.internousdev.ecsite.dto.PurchaseHistoryDTO;
import com.opensymphony.xwork2.ActionSupport;

//移動はマイページから？ホーム画面から？決済完了から？ボタンを押す？

public class PurchaseHistoryAction extends ActionSupport implements SessionAware {

	//セッション
	public Map<String,Object>session;

	//商品購入履歴取得DAO
	private PurchaseHistoryDAO purchaseHistoryDAO = new PurchaseHistoryDAO();

	//商品購入履歴格納DTO List
	public ArrayList<PurchaseHistoryDTO>historyList = new ArrayList<PurchaseHistoryDTO>();

	//削除フラグ
	private String deleteFlg;

	//削除メッセージ
	private String message;

	//個別削除id取得
	private int id;

	//checkBoxの値
	private List<String>chooseList;

	//ソート
	private int sort;

	//商品購入履歴取得メソッド
	public String execute()throws SQLException{
		//ログインしていなければログインに飛ばす
		if(session.containsKey("loginUserId")){
			return ERROR;
		}
		String result = SUCCESS;

		//sessionからuserId取得
		String userId = (String)session.get("loginUserId");

		if(deleteFlg == null){
			//購入履歴表示メソッド
			historyList = purchaseHistoryDAO.getPurchaseHistory(userId);
			System.out.println("List = "+ historyList);

			Iterator<PurchaseHistoryDTO>iterator = historyList.iterator();

			if(!(iterator.hasNext())){
				historyList = null;
			}
		}else if(deleteFlg.equals("1")){
			//全て削除するメソッドは[ deleteFlg = "1"]
			delete();
		}else if(deleteFlg.equals("2")){
			System.out.println("ID:"+id);
			deletePart(id);

			historyList = purchaseHistoryDAO.getPurchaseHistory(userId);

		}else if(deleteFlg.equals("3")){
	}

		//ソート機能
		if(sort == 1){
			System.out.println("注文日");
		}else if(sort == 2){
			System.out.println("値段");
			historyList = purchaseHistoryDAO.sortPrice(userId);
		}
		return result;
		}

	public void delete()throws SQLException{
		//sessionからデータを持ってくる
		String user_id = session.get("loginUserId").toString();

		int res = purchaseHistoryDAO.deleteHistory(user_id);
		System.out.println("削除しようとする件数：" + res);
		if(res > 0){
			System.out.println("削除した");
			historyList = null;
			setMessage("注文履歴をすべて削除しました");
		}else if(res == 0){
			System.out.println("削除失敗");
		}
	}
	//個別削除メソッド
	public void deletePart(int id)throws SQLException{
		//jspから持ってくる
		id = this.id;
		purchaseHistoryDAO.deletePart(id);
	}

	//情報取得（getとset）
	public String getDeleteFlg(){
		return deleteFlg;
	}
	public void setDeleteFlg(String deleteFlg){
		this.deleteFlg = deleteFlg;
	}

	//IDを持ってくる
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	//削除メッセージ
	public String getMesage(){
		return message;
	}
	public void setMessage(String message){
		this.message = message;
	}

	//session情報
	public Map<String,Object>getSession(){
		return session;
	}
	public void setSession(Map<String,Object>session){
		this.session = session;
	}
	//checkBoxの値
	public List<String>getChooseList(){
		return chooseList;
	}
	public void setChooseList(List<String>chooseList){
		this.chooseList = chooseList;
	}
	//ソート情報(getとset）
	public int getSort(){
		return sort;
	}
	public void setSort(int sort){
		this.sort = sort;
	}
}
