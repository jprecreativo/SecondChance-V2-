<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div id="tableAJAX">
    <c:choose>
        <c:when test="${!empty requestScope.items}">
            <table border='1'>
                <tr>
                    <th>CATEGORY</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>ZC</th>
                    <th>DETAILS</th>
                </tr>
                <c:forEach var="item" items="${requestScope.items}">
                    <tr>
                        <td>${item.category}</td>
                        <td>${item.name}</td>
                        <td>${item.price}</td>
                        <c:choose>
                            <c:when test="${empty item.ZC or item.ZC eq '0'}">
                                <td>No specified.</td>
                            </c:when>    
                            <c:otherwise>
                                <td>${item.ZC}</td>
                            </c:otherwise>
                        </c:choose>
                        <td><a href="/SecondChance/Details?id=${item.name}">View details</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <p>There are no items.</p>
        </c:otherwise>
    </c:choose>
</div>
