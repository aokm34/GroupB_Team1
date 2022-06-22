<%@page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<meta charset="UTF=8">
		<link rel="stylesheet" href="stylesheet.css">
		<title>注文フォーム</title>
	</head>
	<body>
		<div class="container">

		<!-- ヘッダー -->
		<%@include file="/common/header.jsp" %>

	<!-- 注文フォーム -->
	<form action="<%=request.getContextPath()%>/orderConfirm" method="POST">

		<table class="input-table" align="center">
		<div id="main" class="form" align="center">
		<h1>注文フォーム</h1>


		配送先の情報を入力してください
		</div>
		<tr>
			<th>名前</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>住所</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>メールアドレス</th>
			<td><input type="text" name="e-mail"></td>
		</tr>

		<tr>
			<th>備考</th>
				<td><textarea name="bikou" rows="3" cols="45"></textarea></td>
		</tr>
		</table>

		 <div align="center">
			<input type="submit" value="登録">
		</div>
	</form>

		<!-- フッター -->
		<%@include file="/common/footer.jsp" %>
	</div>
	</body>
</html>
