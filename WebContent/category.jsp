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
	<title>カテゴリー画面</title>
	<style type="text/css">
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

		/* ========TEMPLATE LAYOUT======== */
		#top {
		   width:20%;
		   margin:100px auto;
		   border:1px solid #333;

		}

		#header {
		   width: 100%;
		   height: 80px;
		   background-color:#66CC99 ;
		}

		#main {
		   width: 100%;
		   height: 500px;
		   text-align: center;
		}

		#footer {
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
		     width: 200px;
			 height: 200px;
		    }

		.clearfix li{
			list-style: none;
			width: 200px;
			padding: 10px;
			margin: 20px;
			background-color:#FFCCCC;
			}

		.bbb:before {
			content: "test";
/* 			box-sizing: inherit; */
/* 			border-style: solid; */
/* 			border-width:0; */
/* 			text-decoration: inherit; */
/* 			vertical-align: inherit; */
/* 			box-sizing: inherit; */
			background-image:url="https://images-na.ssl-images-amazon.com/images/I/71uQ10kmhEL._SL1000_.jpg";
		}


	</style>
</head>
<body>
	<div id="header">
	 	<div id="pr">
		</div>
	</div>

	<div class="main">
		<div class = "1-content">
		 <div class="category-index">
		  <div class="visible-sp">
		   <section class="search-category">
		    <div class="gray clearfix"><h2>カテゴリー一覧</h2></div>
		 <nav>
		  <ul class="clearfix">
<!-- 		  2/15追記 カテゴリー -->
<!-- 「レディース」 -->
		   <li class="accordion-parent">
		     <h3 class="accordion-toggle category-thum1">
		       <div class="bbb">レディース</div>
		     <i class="icon-plus accordion-icon"></i>
		     </h3>
		   </li>
<!-- 「メンズ」 -->
		   <li class="acccordion-parent">
		     <h3 class="accordion-toggle category-thumb2">
		     	<div class="list">メンズ</div>
		     	<i class="icon-plus accordion-icon"></i>
		     </h3>
		   </li>
<!-- 「ベビー・キッズ」 -->
			<li class="accordion-parent">
			 <h3 class="accordion-toggle category-thumb3">
			 	<div>ベビー・キッズ</div>
			 	<i class="icon-plus accordion-icon"></i>
			 </h3>
			 </li>
<!-- 「インテリア・住まい・小物」 -->
			 <li class="accordion-parent">
			  <h3 class="accordion-toggle category-thumb4">
			  	 <div>インテリア・住まい・小物</div>
			  	 <i class="icon-plus accordion-icon"></i>
			  </h3>
		 </ul>
		  </div>
		  </div>
		  </div>
		  </nav>
		  </section>
	</div>
		<div id="top">
		<h1>アイテムいろいろ</h1>

<img src="http://illustrain.com/img/work/2016/illustrain02-shopping07.png">

			<s:if test="#session.id != null">
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction" />'>こちら</a></p>
			</s:if>

			<s:if test='#session.user_name == "master"'>
				<a href='<s:url action="LogoutAction"/>'>ログアウト</a>
			</s:if>

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