package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.MyPageDAO;
import com.internousdev.ecsite.dto.BuyItemDTO;
import com.internousdev.ecsite.dto.MyPageDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {

	/**
	 * ログイン情報を格納
	 */
	public Map<String, Object> session;

	/**
	 * マイページ情報格納DTO
	 */
	public ArrayList<MyPageDTO> myPageList = new ArrayList<MyPageDTO>();

	/**
	 * 削除フラグ
	 */
	private String deleteFlg;

	private String message;

	private List<BuyItemDTO> buyItemDTOList = new ArrayList<BuyItemDTO>();

	private Collection<String> checkList;

	private String masterId;

	/**
	 * 商品履歴取得メソッド
	 *
	 * @author internous
	 */

	public String execute() throws SQLException {

		String user_master_id = session.get("login_user_id").toString();
		System.out.println("USERMASTERID : " + user_master_id);
		System.out.println("DELETEFLAG : " + deleteFlg);
		// buyItemDTOList=(List<BuyItemDTO>) session.get("list");
//		if (!session.containsKey("id")) {
//			return ERROR;
//		}


		// 商品履歴を削除しない場合
		if (deleteFlg == null) {

//			if (buyItemDTOList != null) {
			if (buyItemDTOList.size() > 0){
				for (int i = 0; i < buyItemDTOList.size(); i++) {

					user_master_id = session.get("login_user_id").toString();

					MyPageDAO myPageDAO = new MyPageDAO();

					myPageList = myPageDAO.getMyPageUserInfo(user_master_id);

				}

			} else {
				user_master_id = session.get("login_user_id").toString();
				MyPageDAO myPageDAO = new MyPageDAO();
				myPageList = myPageDAO.getMyPageUserInfo(user_master_id);
			}

			Iterator<MyPageDTO> iterator = myPageList.iterator();
			if (!(iterator.hasNext())) {
				myPageList = null;
			}
			// 商品履歴を削除する場合
		} else {

			System.out.println(checkList);

			int count = 0;
			for (String check : checkList) {

				System.out.println(check);

				user_master_id = session.get("login_user_id").toString();
				String item_transaction_id = check;

//				MyPageDAO dao = new MyPageDAO();
//				count += dao.buyItemHistoryListDelete(user_master_id, item_transaction_id);

				count+= delete(user_master_id, item_transaction_id);

			}
			System.out.println("削除された合計件数　:" + count);

			//削除後の項目を再度検索する

			user_master_id = session.get("login_user_id").toString();

			MyPageDAO myPageDAO = new MyPageDAO();

			myPageList = myPageDAO.getMyPageUserInfo(user_master_id);

		}

		String result = SUCCESS;
		return result;
	}

	/**
	 * 商品履歴削除
	 *
	 * @throws SQLException
	 */
	public int delete(String userMasterId, String itemTransactionId) throws SQLException {
		// List<BuyItemDTO> buyItemDTOList=(List<BuyItemDTO>)
		// session.get("list");

//		String user_master_id = session.get("login_user_id").toString();

		MyPageDAO myPageDAO = new MyPageDAO();
		int res = myPageDAO.buyItemHistoryListDelete(userMasterId, itemTransactionId);

		if (res > 0) {

			myPageList = null;
			setMessage("商品情報を正しく削除しました。");
		} else if (res == 0) {
			setMessage("商品情報の削除に失敗しました。");
		}
		return res;
	}

	public ArrayList<MyPageDTO> getMyPageList() {
		return myPageList;
	}

	public String getMasterId() {
		return masterId;
	}

	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

	public void setMyPageList(ArrayList<MyPageDTO> myPageList) {
		this.myPageList = myPageList;
	}

	public Collection<String> getCheckList() {
		return checkList;
	}

	public void setCheckList(Collection<String> checkList) {
		this.checkList = checkList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public String getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(String deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	public List<BuyItemDTO> getBuyItemDTOList() {
		return buyItemDTOList;
	}

	public void setBuyItemDTOList(List<BuyItemDTO> buyItemDTOList) {
		this.buyItemDTOList = buyItemDTOList;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
