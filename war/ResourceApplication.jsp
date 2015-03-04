<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>


<html>
	<head>
		<title>Resources</title>
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<meta charset="utf-8">
	</head>
	<body>
	
		<div style="width: 100%;">
			<div class="line"></div>
			<div class="topLine">
				<div style="float: left;" class="headline">Resources</div>
				<div style="float: right;">
					<a
						href="<c:url value="${url}"/>"><c:out value="${urlLinktext}"/></a>
					<c:if test="${user != null}"><c:out value="${user.nickname}"/></c:if>
				</div>
			</div>
		</div>
	
		<div style="clear: both;" />
		You have a total number of <c:out value="${fn:length(resources)}" />
		Resources.
	
		<table>
			<tr>
				<th>Name</th>
				<th>State</th>
				<th>Reserved</th>
				
			</tr>
	
			<c:forEach items="${resources}" var="resource">
				<tr>
					<td><c:out value="${resource.name}" /></td>
					<td><c:out value="${resource.state}" /></td>
					<td><c:out value="${resource.reserved}" /></td>
					
			<%--		<td><a class="reserved"
						href="<c:url value="/done?id=${todo.id}" />">Done</a></td> --%>
				</tr>
			</c:forEach>
		</table>
	
	
		<hr />
	
		<div class="main">
	
			<div class="headline">New resource</div>
	
			<c:choose>
				<c:when test="${user != null}">
					<form action="/new" method="post" accept-charset="utf-8">
						<table>
							<tr>
								<td><label for="name">Name</label></td>
								<td><input type="text" name="name" id="name" size="65" /></td>
							</tr>
							<tr>
								<td valign="state"><label for="state">State</label></td>
								<td><textarea rows="4" cols="50" name="state"
										id="state"></textarea></td>
							</tr>
						
							<tr>
								<td colspan="2" align="right"><input type="submit"
									value="Create" /></td>
							</tr>
						</table>
					</form>
				</c:when>
				<c:otherwise>
	
	Please login with your Google account
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>
