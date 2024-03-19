<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function history()
	{
		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}
</script>

<html>
	<head>
	<title>Model2 MVC Shop</title>
	<link href="/css/left.css" rel="stylesheet" type="text/css">
	</head>
	
	<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >
		<table width="159" border="0" cellspacing="0" cellpadding="0">
		
			<!--menu 01 line-->
			<tr>
				<td valign="top"> 
					<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
						<tr>
						<!--menu 01 line-->
						<c:if test="${!empty user}">
							<tr>
								<td class="Depth03">
									<a href="/user/getUser?userId=${user.userId}" target="rightFrame">개인정보조회</a>
								</td>
							</tr>
						</c:if>
						<c:if test="${user.role == 'admin'}">
							<tr>
								<td class="Depth03" >
									<a href="/user/listUser" target="rightFrame">회원정보조회</a>
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<!--menu 02 line-->
			<c:if test="${user.role == 'admin'|| user.role == 'bsns'}">
				<tr>
					<td valign="top"> 
						<table  border="0" cellspacing="0" cellpadding="0" width="159">
							<tr>
								<td class="Depth03">
									<a href="../product/addProductView.jsp;" target="rightFrame">판매상품등록</a>
								</td>
							</tr>
							<c:if test="${user.role == 'admin'}">
								<td class="Depth03">
									<a href="/product/listProduct?menu=manage" target="rightFrame">판매상품관리</a>
								</td>
							</c:if>
							<c:if test="${user.role == 'bsns'}">
								<td class="Depth03">
									<a href="/product/listProduct?menu=bsns" target="rightFrame">판매상품관리</a>
								</td>
							</c:if>
							</tr>
							<tr>
								<td class="DepthEnd">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:if>
		
			<!--menu 03 line-->
			<tr>
				<td valign="top">
					<table  border="0" cellspacing="0" cellpadding="0" width="159">
						<tr>
							<td class="Depth03">
								<a href="/product/listProduct?menu=search" target="rightFrame">상 품 검 색</a>
							</td>
						</tr>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'user'}">
								<tr>
									<td class="Depth03">
										<a href="/purchase/listPurchase" target="rightFrame">구매이력조회</a>
									</td>
								</tr>
							</c:if>
							<tr>
								<td class="Depth03">
									<a href="/user/getUser?userId=${user.userId}" target="rightFrame">개인정보조회</a>
								</td>
							</tr>
						</c:if>
						<tr>
						<td class="DepthEnd">&nbsp;</td>
						</tr>
						<tr>
							<td class="Depth03">
								<a href="javascript:history()">최근 본 상품</a>
							</td>
						</tr>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'user'}">
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="Depth03">
										<a href="/market/addMarket" target="rightFrame">입점 문의</a>
									</td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'admin'}">
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="Depth03">
										<a href="/market/listMarket" target="rightFrame">입점 신청 조회</a>
									</td>
								</tr>
							</c:if>
						</c:if>
					</table>
				</td>
			</tr>
		
		</table>
	</body>
</html>