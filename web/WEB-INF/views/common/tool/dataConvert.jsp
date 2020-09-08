<%@ page import="com.dxhualuo.json.tools.JavaScriptConverter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let jsp = {
        request: <%=JavaScriptConverter.convert(request)%>,
        session: <%=JavaScriptConverter.convert(session)%>,
        application: <%=JavaScriptConverter.convert(application)%>,
    }
</script>
