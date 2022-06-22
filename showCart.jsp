<%--
カート状況確認jsp
作成日：2022年6月22日
作成者：伊藤瑠玖
--%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.*,java.util.*"%>

<%
	ArrayList<OrderList> order_list = (ArrayList<OrderList>) request
			.getAttribute("order_list");
%>

<html>
	<head>
		<title>カート内容</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	</head>
	<body>
		<!-- ブラウザ全体 -->
		<div id="wrap">

			<!--ヘッダー部分  -->
			<%@ include file="/common/header.jsp" %>


			<!-- 書籍一覧のコンテンツ部分 -->
			<div id="main" class="container">

				<table class="list-table">
					<tr>
						<th>UniformID</th>
						<th>商品名</th>
						<th>注文数</th>
						<th>小計</th>
						<th></th>
					</tr>
					<%
					int total = 0;
					int subtotal = 0;
					if(order_list!=null){
						for(int i=0; i<order_list.size(); i++){
					%>
							<tr>
								<td><a href="<%=request.getContextPath()%>/detail?UniformId=<%=order_list.get(i).getUniformId()%>&cmd=detail "><%=order_list.get(i).getUniformId() %></a></td>
								<td><%=order_list.get(i).getUniformName() %></td>
								<td><%=order_list.get(i).getQuantity() %></td>
								<td><%subtotal=(order_list.get(i).getPrice())*(order_list.get(i).getQuantity()); %>
								<%=subtotal%></td>
								<td><a href="<%=request.getContextPath()%>/showCart?delno=<%=i%>">削除</a></td>
							</tr>
					<%
						// 合計の計算
						total += subtotal;
						}
					}
					%>
				</table>

				<hr/>
				<table class="total-price-table" >
					<tr>
						<th>合計</th>
						<td><%=total%></td>
					</tr>
				</table>

				<form action="<%=request.getContextPath()%>/view/orderForm.jsp" class="buy-button">
					<input type="submit" value=" 購入 ">
				</form>

			</div>

			<!-- フッター部分 -->
			<%@ include file="/common/footer.jsp" %>
		</div>
	</body>
</html>