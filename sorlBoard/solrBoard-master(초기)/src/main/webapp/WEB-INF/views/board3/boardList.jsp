<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board3</title>
<script>
function fn_formSubmit(){
    document.form1.submit();    
}
</script>
</head>
<body>
    <a href="board3Form">글쓰기</a>
                    
    <table border="1" style="width:600px">
        <caption>게시판</caption>
        <colgroup>
            <col width='8%' />
            <col width='*%' />
            <col width='15%' />
            <col width='15%' />
        </colgroup>
        <thead>
            <tr>
                <th>번호</th> 
                <th>제목</th>
                <th>등록자</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="listview" items="${listview}" varStatus="status">    
                <c:url var="link" value="board3Read">
                    <c:param name="brdno" value="${listview.id}" /> 
                </c:url>        
                                                          
                <tr>
                    <td><c:out value="${pageVO.totRow-((pageVO.page-1)*pageVO.displayRowCount + status.index)}"/></td>
                    <td><a href="${link}"><c:out value="${listview.brdtitle[0]}"/></a></td>
                    <td><c:out value="${listview.brdwriter[0]}"/></td>
                    <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${listview.brddate[0]}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form id="form1" name="form1"  method="post">
        <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
        
        <div>
            <input type="checkbox" name="searchType" value="brdtitle" <c:if test="${fn:indexOf(searchVO.searchType, 'brdtitle')!=-1}">checked="checked"</c:if>/>
            <label class="chkselect" for="searchType1">제목</label>
            <input type="checkbox" name="searchType" value="brdmemo" <c:if test="${fn:indexOf(searchVO.searchType, 'brdmemo')!=-1}">checked="checked"</c:if>/>
            <label class="chkselect" for="searchType2">내용</label>
            <input type="text" name="searchKeyword" style="width:150px;" maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
            <input name="btn_search" value="검색" class="btn_sch" type="button" onclick="fn_formSubmit()" />
        </div>
    </form>            
</body>
</html>
