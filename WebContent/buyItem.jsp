<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<title>BuyItem画面</title>
	<style type="text/css">
	/* ========TAG LAYOUT======== */
		body {
		   margin:0;
		   padding:0;
		   line-height:1.6;
		   letter-spacing:1px;
		   font-family:Verdana, Helvetica, sans-serif;
		   font-size:12px;
		   color:#333;
		   background:#fff;
		}


		table {
			text-align:center;
			margin:0 auto;
			padding-top:100px;

		}

	/* ========ID LAYOUT======== */
		#top {
		   width:30%;
		   margin:30px auto;
		   border:1px solid #333;
		}

		#header {
		   width: 100%;
		   height: 80px;
		   background-color: #66CC99;
		}



		#main {
		   width: 100%;
		   height: 2300px;
		   text-align: center;
		}

		#footer {
			width: 100%;
			height: 80px;
			background-color: #663300;
			clear:both;
		}

		.item{
			width: 300px;
			float: left;
			margin: 15px;
			background-color:white;
		}

		.item_details li{
			list-style: none;
		}

		.item_container{
			background:lightgray;
		}

		.item_container2{
			clear: both;
		}

		.button_wrapper{
			text-align:center;
		}

		.itemPhoto{
			height:200px;
			width:200px;
		}

		#soldout{
			color:red;
			font-weight:bold;
		}



		.submit_btn{
			  border-radius : 20%;          /* 角丸       */
			  font-size     : 9pt;        /* 文字サイズ */
			  text-align    : center;      /* 文字位置   */
			  cursor        : pointer;     /* カーソル   */
			  padding       : 24px 16px;   /* 余白       */
			  background    : #66CC99;     /* 背景色     */
			  color         : #ffffff;     /* 文字色     */
			  line-height   : 1em;         /* 1行の高さ  */
			  transition    : .3s;         /* なめらか変化 */
			  border        : 0.1px solid #003300;    /* 枠の指定 */
			  margin-bottom : 20px;
			}


	</style>
</head>
<body>
	<div id="header">
	 	<div id="pr">
		</div>
	</div>
	<div id="main">
		<div id="top">
			<h1>商品一覧</h1>
		</div>

		<div>
		<s:form action="ItemSearchAction">
			<tr>
				<td>
					<s:textfield name="searchWord" value=""/>
				</td>
				<td>
					<s:submit value="検索"/>
				</td>
			</tr>
		</s:form>
		</div>
		
		<div>
		<s:form action="CartAction">
			<tr class="button_wrapper">
				<td>
					<s:submit value="カートに入れる" class="submit_btn"/>
				</td>
			</tr>
<!-- 		</s:form>   -->

		<s:if test="message != ''">
			<h3><s:property value="message" escape="false"/></h3>
		</s:if>


<!-- 		<s:form action="CartAction">   -->
			<div class="item_container">
<!-- 「iterator」で繰り返し処理 -->
				<s:iterator  value="buyItemDTOList">
					<section class="item">
					<h2><s:property value="itemName"/></h2>
					<img class="itemPhoto" src='<s:property value="itemPhoto"></s:property>'></img>
						<ul class="item_details">
							<li>
								<span>値段</span>
								<s:property value="itemPrice" /><span>円</span>
							</li>
							<li><span>在庫</span>
								<s:if test="item_stock>0">
									<s:property value="item_stock"/>
								</s:if><s:else>
									<span id="soldout">品切れ</span>
								</s:else>
							</li>

							<li><span>購入個数</span>
								<s:if test="item_stock>0">
									<select name="count">
										<option value="0" selected="selected">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
								</s:if>
								<s:else>
									<select name="count">
										<option value="0" selected="selected">0</option>
									</select>
								</s:else>
							</li>
						</ul>
					</section>
				</s:iterator>

<!-- 「iterator」の繰り返し処理終了！ -->
				<div class="item_container2"></div>
			</div>
			<table>
				<tr>
					<td>
						<span>支払い方法</span>
					</td>
					<td>
						<input type="radio" name="pay" value="1" checked="checked">現金払い
						<input type="radio" name="pay" value="2">クレジットカード
						<input type="radio" name="pay" value="3">仮想通貨
					</td>
				</tr>

<!-- 				<tr class="button_wrapper">
					<td >
						<s:submit value="カートに入れる" color="red"/>
					</td>
				</tr> -->
			</table>
		</s:form>

			<div>
				<p>前画面に戻る場合は<a href='<s:url action="GoHomeAction" />'>こちら</a></p>
				<p>マイぺージは<a href='<s:url action="MyPageAction" />'>こちら</a></p>
			</div>
		</div>
	</div>
	<div id="footer">
	 	<div id="pr">
		</div>
	</div>
</body>
</html>