<%@ page language="java" import="java.util.*,com.bookonline.JavaBean.*" contentType="text/html;charset=gb2312" %>

<script language="JavaScript" src="js/publicFun.js"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示所查询的火车票信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body background="images/003.jpg">
<table width="80%" border="0" align="center">
  <tr>
    <td align="center" bordercolor="#FFFFFF"> 
      <div align="center"><strong><font size="5">火车票信息管理</font></strong></div></td>
  </tr>
</table>


<form  name="frmDataList" action="#" method="post">
<table width="80%" border="1" align="center">
  <tr> 
    <td width="5%"><div align="center"></div></td>
    <td width="10%"><div align="center"><strong>车次</strong></div></td>
    <td width="10%"><div align="center"><strong>起点</strong></div></td>
    <td width="10%"><div align="center"><strong>终点</strong></div></td>
	<td width="10%"><div align="center"><strong>时间</strong></div></td>
	<td width="10%"><div align="center"><strong>票价</strong></div></td>
	<td width="15%"><div align="center"><strong>剩余票数</strong></div></td>
  </tr>
  <%Object obj = request.getAttribute("ticketList");
    if (obj !=null) {
    List list = (List)obj; 
    Iterator itm = list.iterator();
    TicketBean ticket = null; 
    while(list!=null && itm.hasNext()) {
    ticket = (TicketBean)itm.next(); 
  %>
  <tr> 
    <td width="5%"><input type="radio" name="recordID" value="<%=ticket.getCheci() %>"></td>
    <td width="10%"><div align="center"><%=ticket.getCheci() %></div></td>
    <td width="10%"><div align="center"><%=ticket.getQidian() %></div></td>
    <td width="10%"><div align="center"><%=ticket.getZhongdian() %></div></td>
	<td width="10%"><div align="center"><%=ticket.getShijian() %></div></td>	
	<td width="10%"><div align="center"><%=ticket.getPiaojia() %></div></td>
	<td width="15%"><div align="center"><%=ticket.getShengyu() %></div></td>
  </tr>
 <% }} %>
</table>

<table width="15%" border="1" align="center">
  <tr>
    <td align="right">
	    <input name="bookPiao" type="button" id="bookPiao" value="订票" onClick="doCheck('book')">
	    &nbsp; 
	    <input type="button" name="Submit6" value="返回" onClick="doCheck('back')">
    </td>
  </tr>
</table>
</form>
</body>
</html>
<script  language="javascript">
   function doCheck(cmd){
      var  frm = frmDataList;      
       
      if (cmd == "back"){         
        frm.action="main.jsp";
        frm.submit();
        return;
      }
      //---以下操作（编辑，删除，查看）需要选择用户，才能进行操作。以下调用js函数来判断，单选按钮的名字必须定义为recordID
      var sel = getSelectedItem(frm);
      if (sel==null){
            alert("请选择您要订的票!");
            return;
      }      
      if (cmd == "book"){         
        frm.action="BookServlet?checi="+sel;
        frm.submit();
      }
   }
   
</script>