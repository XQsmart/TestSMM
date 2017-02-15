<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
<title>用户列表</title>
    <link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css"/>
    <link  rel="stylesheet"href="<%=path %>/jquery-easyui/themes/icon.css"/>
    <link  rel="stylesheet"href="<%=path %>/css/main.css"/>
    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/jquery-1.7.2.min.js"></script>
    <script src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="<%=path %>/js/main.js"></script>
    <script src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

    <script>
        $(function () {
            setPagination("userList");
        });

        function showAddWin() {
            $("#addWin").window("open");
        }

        function addUser() {
            $.post("<%=path %>/user/add",
                $("#addForm").serialize(),
                function (data) {
                    if (data.result == "success") {
                        $("#addWin").window("close"); // 关闭指定的窗口
                        $("#userList").datagrid("reload"); // 重新加载指定数据网格数据
                        $.messager.alert("提示", data.message, "info");
                    } else if (data.result == "fail") {
                        $.messager.alert("提示", data.message, "info");
                    }
                }, "json");
        }

        function showEditWin() {
            var row = $('#userList').datagrid('getSelected');
            if (row) {
                $("#editId").val(row.id);
                $("#editName").textbox("setValue", row.name);
                $("#editEmail").textbox("setValue", row.email);
                $("#editWin").window("open");
            } else {
                $.messager.alert("提示", "请选择一个用户进行修改！", "info");
            }
        }

        function editUser() {
            $.post("<%=path %>/user/update",
                $("#editForm").serialize(),
                function (data) {
                    if (data.result == "success") {
                        $("#editWin").window("close"); // 关闭指定的窗口
                        $("#userList").datagrid("reload"); // 重新加载指定数据网格数据
                        $.messager.alert("提示", data.message, "info");
                    } else if (data.result == "fail") {
                        $.messager.alert("提示", data.message, "info");
                    }
                }, "json");
        }

        function deleteUser() {
            var row = $('#userList').datagrid('getSelected');
            if (row) {
                $.get("<%=path %>/user/delete?id=" + row.id,
                    function (data) {
                        if (data.result == "success") {
                            $("#editWin").window("close"); // 关闭指定的窗口
                            $("#userList").datagrid("reload"); // 重新加载指定数据网格数据
                            $.messager.alert("提示", data.message, "info");
                        } else if (data.result == "fail") {
                            $.messager.alert("提示", data.message, "info");
                        }
                    }, "json");
            } else {
                $.messager.alert("提示", "请选择一个要删除的用户！", "info");
            }
        }

        function queryByName(value){ // 根据学生姓名查询数据
            if (value != "") {
                $("#userList").datagrid({url:"<%=path %>/user/queryByPager?name=" + value});
            } else {
                $.messager.alert("提示", "请输入姓名", "info");
                $("#userList").datagrid({url:"<%=path %>/user/queryByPager"});
            }
        }
    </script>
</head>
<body>
<table id="userList" class="easyui-datagrid"
       data-options="toolbar:'#tb',
                singleSelect:true,
                collapsible:true,
                url:'<%=path %>/user/queryByPager',
                method:'get',
                rownumbers:true,
                autoRowHeight:true,
                pagination:true,
                pageSize:20" style="height:100%;">
    <thead>
    <tr>
        <th data-options="field:'id',checkbox:true">编号</th>
        <th data-options="field:'name',width:80">姓名</th>
        <th data-options="field:'email',width:80">邮箱</th>
        <th data-options="field:'pwd',width:80">密码</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <a href="javascript:;" onclick="showAddWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
        <a href="javascript:;" onclick="showEditWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
        <a href="javascript:;" onclick="deleteUser();" class="easyui-linkbutton" iconCls="icon-no">删除</a>
        <input id="ss" class="easyui-searchbox" style="width:150px" data-options="searcher:queryByName,prompt:'请输入用户姓名'"></input>
    </div>
</div>

<div id="addWin" class="easyui-window" title="添加用户" data-options="closed:true" style="width:300px;height:auto;">
    <form id="addForm">
        <table>
            <tr>
                <td width="100px;">用户名</td>
                <td><input class="easyui-textbox" name="name" data-options="required:true" ></input></td>
            </tr>

            <tr>
                <td width="100px;">邮箱</td>
                <td><input class="easyui-textbox" name="email" data-options="required:true" ></input></td>
            </tr>

            <tr>
                <td width="100px;">密码</td>
                <td><input class="easyui-passwordbox" name="pwd" data-options="required:true" ></input></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <a href="javascript:;" onclick="addUser();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="editWin" class="easyui-window" title="修改用户" data-options="closed:true" style="width:300px;height:auto;">
    <form id="editForm">
        <input type="hidden" id="editId" name="id" />
        <table>
            <tr>
                <td width="100px;">员工名</td>
                <td><input class="easyui-textbox" id="editName" name="name" data-options="required:true" ></input></td>
            </tr>

            <tr>
                <td width="100px;">邮箱</td>
                <td><input class="easyui-textbox" id="editEmail" name="email" data-options="required:true" ></input></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <a href="javascript:;" onclick="editUser();" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>