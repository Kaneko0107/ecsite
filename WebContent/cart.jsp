<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<title>Cart画面</title>
<style type="text/css">

/* ========TAG LAYOUT======== */
	body{
	margin:0;
	padding:0;
	line-height:1.6;
	letter-spacing:1px;
	font-family:Verdana,Helvetica,sans-serif;
	font-size:12px;
	color:#333;
	background:#fff;
   }

   table{
   	text-align:center;
   	margin:0 auto;
   }

/* ========ID LAYOUT======== */
   #top{
   	width:40%;
   	margin:30px auto;
   	border:1px solid #333;
   }

   #header{
    width:100%;
    height: 80px;
    background-color: #66CC99;
    }

   #main{
    width: 100%;
    height: 800px;
    text-align: center;
   }

   #footer{
   	width: 100%;
   	height: 80px;
   	background-color:#663300;
   	clear:both;
   }
</style>
<script type="text/javascript">
	function submitAction(url){
		$('form').attr('action',url);
		$('form').submit();
	}
</script>
</head>
<body>
	<div id="header">
		<div id="pr">
		</div>
	</div>
	<div id="main">
		<div id="top">
			<h1>カートの中身です。<br>こちらの商品を購入しますか？</h1>
		</div>
		<div>
			<s:form>

			<s:iterator value="buyItemDTOList">
			<s:if test="count != 0">
				<tr>
					<td>商品名</td>
					<td><s:property value="itemName" /></td>
				</tr>
				<tr>
					<td>値段</td>
					<td><s:property value="total_price" /><span>円</span></td>
				</tr>

				<tr>
					<td>購入個数</td>
					<td><s:property value="count" /><span>個</span></td>
				</tr>
				<tr>
					<td>支払い方法</td>
					<td><s:property value="pay" /></td>
				</tr>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				</s:if>
			</s:iterator>
				<tr>
					<td>お届け先</td>
					<td><s:property value="session.userAddress"/></td>
				</tr>
				<s:if test="buyItemDTOList.size() >1">
				<tr>
					<td><h3>合計：</h3></td>
					<td>
						<h3><s:property value="session.totalPrice"/><span>円</span></h3>
					</td>
				</tr>
				</s:if>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<td><input type="button" value="キャンセル" onclick="submitAction('HomeAction')" /></td>
					<td><input type="button" value="購入する" onclick="submitAction('BuyItemConfirmAction')" /></td>
				</tr>
			</s:form>
		</div>
	</div>
</body>
</html>