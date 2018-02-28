<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta charset="utf-8">
<title>管理画面</title>
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
		}

	/* ========ID LAYOUT======== */
		#top {
		   width:600px;
		   margin:30px auto;
		   border:1px solid #333;
		   color: red;
		}

		#header {
		   width: 100%;
		   height: 80px;
		   background-color: black;
		}

		#main {
		   width: 100%;
		   height: 1500px;
		   text-align: center;
		}

		#footer {
			width: 100%;
			height: 80px;
			background-color: black;
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
			clear:both;
		}

		.button_wrapper{
			text-align:center;
		}

		.itemPhoto{
			height:200px;
			width:200px;
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
			<h2>管理者画面</h2>
		</div>

		<div>
			<div>
				<a href='<s:url action="GoInsertAction"/>'>新商品追加</a>
				<a href='<s:url action="GoItemUpdateAction"/>'>商品情報更新</a>
				<a href='<s:url action="GoItemDeleteAction"/>'>商品削除</a>
			</div>
			<s:form action="MasterAction">
				<div class="item_container">
<!-- 			「iterator」で繰り返し処理 -->
					<s:iterator value="buyItemDTOList">
						<section class="item">
						<h3><s:property value="itemName"/></h3>
						<img class="itemPhoto" src='<s:property value="itemPhoto"></s:property>'></img>
							<ul class="item_details">
								<li>
									<span>在庫</span>
									<s:property value="item_stock"/>
								</li>
								<li>
									<span>商品在庫追加</span>
										<select name="count">
											<option value="0" selected="selected">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
								</li>
							</ul>
						</section>
					</s:iterator>
<!-- 					「iterator」の繰り返し処理終了！ -->
					<div class="item_container2"></div>
				</div>
				<table>
						<tr>

							<td>
								<s:submit value="追加"/>
							</td>
						</tr>
				</table>
			</s:form>

			<div>
				<p><a href='<s:url action="GoHomeAction" />'>home</a></p>
			</div>
		</div>
	</div>

	<div id="footer">
		<div id="pr">
		</div>
	</div>
</body>
</html>