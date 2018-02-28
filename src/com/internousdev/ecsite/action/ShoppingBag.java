package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.List;

//商品を格納するリスト
public class ShoppingBag {
	private List<Item>itemList;

//コンストラクター
public ShoppingBag(){
	itemList = new ArrayList<Item>();
}

//商品格納リストに商品を追加する
//追加する商品
public void add(Item item){
	itemList.add(item);
}

//買い物かごの中身を表示する
public void show(){
	System.out.println("買い物かごリスト-------------");
	for(Item item : itemList){
		item.printDetail();
		System.out.println();
	}
	System.out.println("-----------------------------");
}

//買い物かごの中身の合計を計算して返却する
//合計金額
public int allSum(){
	int allsum = 0;
	for(Item item : itemList){
		allsum += item.getPrice();
	}
	return allsum;
  }
}
