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
	<title>Home画面</title>
	<style type="text/css">
		body {
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

		/* ========TEMPLATE LAYOUT======== */
		#top {
		   width:50%;
		   margin: 10px auto;
		   font-size: 10px;
		   font-family:"Roman";

		}

		#header {
		   width: 100%;
		   height: 80px;
		   background-color:#66CC99 ;
		}

		#main {
		   width: 100%;
		   height: 600px;
		   text-align: center;
		   background-image: url(https://d1f5hsy4d47upe.cloudfront.net/d8/d88c9e6b728d8d84c41aa57269baf85d_t.jpeg);
		   background-position: left;
		   background-repeat: no-repeat;
		   background-size: contain;
		   background-color: #F8F8FF;
		}

		#footer {
			position: fixed;
			bottom: 0px;
			left: 0px;
			width: 100%;
			height: 80px;
			background-color: #663300;
			clear:both;
		}

 		#text-center {
 			display: inline-block;
 			text-align: center;
 			margin-top:0px;
		}

		.test{
			colore:red;
			background-color:red;
			font-size:300px;
		}

		.submit_btn{
			  display       : inline-block;
			  border-radius : 20%;          /* 角丸       */
			  font-size     : 13pt;        /* 文字サイズ */
			  text-align    : center;      /* 文字位置   */
			  cursor        : pointer;     /* カーソル   */
			  padding       : 24px 16px;   /* 余白       */
			  background    : #003300;     /* 背景色     */
			  color         : #ffffff;     /* 文字色     */
			  line-height   : 1em;         /* 1行の高さ  */
			  transition    : .3s;         /* なめらか変化 */
			  box-shadow    : 6px 6px 3px #666666;  /* 影の設定 */
			  border        : 2px solid #003300;    /* 枠の指定 */
			  margin-bottom : 30px;
			}

		img{
		      background-size: cover;
		    }

		ul li {
			display: block;
			cursor: pointer;
			padding: 16px 0;
			position: relative;
			list-style:none;
			float:left;
			width:14%;
			font-weight:bold;
			letter-spacing:normal;
		}

		.hdr_gnav {
		background:#f5f5f5;
		position: relative;
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
			<h1>ボタンを押してね</h1>
		</div>


		<div id="text-center">
			<s:form action="HomeAction" >
				<s:submit value="商品購入" class="submit_btn"/>
			</s:form>

<!-- 			2/13追記「カテゴリー一覧を追加したいな"" -->
			<s:form action="CategoryAction">
				<s:submit value="商品ランキング（工事中）" class="submit_btn"/>
			</s:form>




			<s:if test="#session.id != null">
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction" />'>こちら</a></p>
			</s:if>

			<s:if test='#session.user_name == "master"'>
				<a href='<s:url action="LogoutAction"/>'>ログアウト</a>
			</s:if>

	</div>
	<div id="footer">
	 	<div id="pr">
		</div>
	</div>
</body>
</html>