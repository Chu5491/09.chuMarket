<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../javascript/common.js">

</script>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>��ǰ �����ȸ</title>
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	</head>
	<body bgcolor="#ffffff" text="#000000">
	<div style="width:98%; margin-left:10px;">
	<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">
		<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
			<tr>
				<td width="15" height="37">
					<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
				</td>
				<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">
								<c:if test="${! empty menu}">
									${menu =='search' ? '��ǰ �����ȸ' : '��ǰ ����'}
								</c:if>
							</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37">
					<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
				</td>
			</tr>
		</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td align="right">
					<select name="searchCondition" class="ct_input_g" style="width:80px">
						<option value="no" ${! empty search.searchCondition && search.searchCondition == 'no' ? 'selected' : ""}>��ǰ��ȣ</option>
						<option value="name" ${! empty search.searchCondition && search.searchCondition == 'name' ? 'selected' : ""}>��ǰ��</option>
						<option value="price" ${! empty search.searchCondition && search.searchCondition == 'price' ? 'selected' : ""}>��ǰ����</option>
					</select>
					<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" value="${search.searchKeyword}" />
				</td>
				<td align="right" width="70">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23">
							</td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
								<a href="javascript:fncGetList('1');">�˻�</a>
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td colspan="13" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
			</tr>
			<tr>
				<td class="ct_list_b" width="100">No</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">��ǰ��</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">����</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b">�����</td>	
				<td class="ct_line02"></td>
				<td class="ct_list_b">���θ�</td>	
				<td class="ct_line02"></td>
				<td class="ct_list_b">�������</td>	
			</tr>
			<tr>
				<td colspan="13" bgcolor="808285" height="1"></td>
			</tr>
			<c:forEach var="prod" items="${list}" >
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					<td></td>
					<td align="left">
						<c:if test="${prod.prodStock > 0}">
							<a href="/product/getProduct?prodNo=${prod.prodNo}&menu=${menu}">
								${prod.prodName}
							</a>
						</c:if>
						<c:if test="${prod.prodStock <= 0}">
							<c:if test="${menu == 'manage'}">
								<a href="/product/getProduct?prodNo=${prod.prodNo}&menu=${menu}">
									${prod.prodName}
								</a>
							</c:if>
							<c:if test="${menu != 'manage'}">
								${prod.prodName}
							</c:if>
						</c:if>
					</td>
					<td></td>
					<td align="left">${prod.price}</td>
					<td></td>
					<td align="left">${prod.regDate}</td>
					<td></td>
					<td align="left"><a href="/market/getMarket?marketNo=${prod.market.marketNo}&menu=${menu}">${prod.market.marketName}</a></td>
					<td></td>
					<td align="left">
						<c:if test="${prod.prodStock <= 0}">
							������
						</c:if>
						<c:if test="${prod.prodStock > 0}">
							<c:if test="${menu != 'manage'}">
								<c:if test="${prod.prodStock <= 5}">
									ǰ���ӹ� [ ${prod.prodStock} �� ���� ]
								</c:if>
								<c:if test="${prod.prodStock > 5}">
									�Ǹ���
								</c:if>
							</c:if>
							<c:if test="${menu == 'manage'}">
								��� : ${prod.prodStock} �� ����
							</c:if>
						</c:if>
					</td>	
				</tr>
				<tr>
					<td colspan="13"z bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
					${resultPage.paging}
		    	</td>
			</tr>
		</table>
	</form>
	</div>
	</body>
</html>
