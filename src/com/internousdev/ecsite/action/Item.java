package com.internousdev.ecsite.action;

public class Item{
	private String name;
	private int price;

//コンストラクター（初期化処理）
public Item(String name,int price){
	this.name = name;
	this.price = price;
}

//商品名を返す
public String getName(){
	return name;
}

//価格を返す
public int getPrice(){
	return price;
}

//商品名と価格を表示する
public void printDetail(){
	System.out.print("商品名:" + getName() + "\t価格：\\" + getPrice());
}
}
