<%@ tag import="org.springframework.util.StringUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="pagedListHolder" required="true" type="org.springframework.beans.support.PagedListHolder" %>
<%@ attribute name="pagedLink" required="true" type="java.lang.String" %>
<c:if test="${pagedListHolder.pageCount > 1}">
    <c:if test="${!pagedListHolder.lastPage}">
        <a class="pagination-but" href="<%= StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage()+1)) %>">MORE</a>
    </c:if>
    
    <c:if test="${pagedListHolder.lastPage}">
        <a class="pagination-but" href="<%= StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage()+1)) %>">MORE</a>
    </c:if>
</c:if>

