<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>用户管理</title>
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="/vendor/bootstrap/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/vendor/toastr/toastr.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top">

<div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">曹灏<sup>016301700079</sup></div>
        </a>

        <hr class="sidebar-divider my-0">

        <li class="nav-item">
            <a class="nav-link" href="/">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>商城首页</span></a>
        </li>

        <hr class="sidebar-divider">

        <li class="nav-item active">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#userManager"
               aria-expanded="true" aria-controls="userManager">
                <i class="fas fa-fw fa-user"></i>
                <span>用户管理</span>
            </a>
            <div id="userManager" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">User</h6>
                    <a class="collapse-item active" href="/admin/users">用户列表</a>
                </div>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#goodsManager"
               aria-expanded="true" aria-controls="goodsManager">
                <i class="fas fa-fw fa-shopping-bag"></i>
                <span>商品管理</span>
            </a>
            <div id="goodsManager" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Goods</h6>
                    <a class="collapse-item" href="/admin/goods">商品列表</a>
                </div>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#catalogManager"
               aria-expanded="true" aria-controls="catalogManager">
                <i class="fas fa-fw fa-th"></i>
                <span>分类管理</span>
            </a>
            <div id="catalogManager" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Catalog</h6>
                    <a class="collapse-item" href="/admin/catalog">分类管理</a>
                </div>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#orderManager"
               aria-expanded="true" aria-controls="orderManager">
                <i class="fas fa-fw fa-money-check"></i>
                <span>订单管理</span>
            </a>
            <div id="orderManager" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Orders</h6>
                    <a class="collapse-item" href="/admin/orders">订单管理</a>
                </div>
            </div>
        </li>

        <hr class="sidebar-divider d-none d-md-block">

        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fas fa-bars"></i>
                </button>
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="搜索..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="搜索..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Cao Hao</span>
                            <img class="img-profile rounded-circle" src="http://q1.qlogo.cn/g?b=qq&nk=1464435902&s=100">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                注销
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <div class="container-fluid">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">用户管理
                            <a href="#" data-toggle="modal" data-target="#insertModal"
                               class="btn btn-primary btn-icon-split btn-sm float-right">
                                <span class="icon text-white-50"><i class="fas fa-plus"></i></span>
                                <span class="text">添加用户</span>
                            </a>
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="table" width="100%"
                                   data-toggle="table">
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>密码</th>
                                    <th>手机号</th>
                                    <th>性别</th>
                                    <th>年龄</th>
                                    <th>用户状态</th>
                                    <th>权限</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <s:iterator value="#users" var="user">

                                    <tr>
                                        <td><s:property value="#user.username"/></td>
                                        <td><s:property value="#user.password"/></td>
                                        <td><s:property value="#user.phone"/></td>
                                        <td>
                                            <s:if test="#user.gender==1">
                                                <span class="badge badge-info">男</span>
                                            </s:if>
                                            <s:else>
                                                <span class="badge badge-info">女</span>
                                            </s:else>
                                        </td>
                                        <td><s:property value="#user.age"/></td>
                                        <td>
                                            <s:if test="#user.status==0">
                                                <span class="badge badge-primary">正常</span>
                                            </s:if>
                                            <s:else>
                                                <span class="badge badge-danger">异常</span>
                                            </s:else>
                                        </td>
                                        <td>
                                            <s:if test="#user.role==0">
                                                <span class="badge badge-secondary">普通用户</span>
                                            </s:if>
                                            <s:else>
                                                <span class="badge badge-primary">超级管理员</span>
                                            </s:else>
                                        </td>
                                        <td>
                                            <button onclick="findUser('<s:property value="#user.id"/>')"
                                                    class="btn btn-primary btn-icon-split btn-sm">
                                                <span class="icon text-white-50"><i class="fas fa-edit"></i></span>
                                                <span class="text">编辑</span>
                                            </button>
                                            <button onclick="delUser('<s:property value="#user.id"/>')"
                                                    class="btn btn-danger btn-icon-split btn-sm">
                                                <span class="icon text-white-50"><i class="fas fa-eraser"></i></span>
                                                <span class="text">删除</span>
                                            </button>
                                        </td>
                                    </tr>

                                </s:iterator>

                                </tbody>
                            </table>
                        </div>

                        <nav>
                            <ul class="pagination">
                                <li class="page-item ${currentPage==1?'disabled':''}">
                                    <a class="page-link"
                                       href="/admin/users/list?page=${currentPage==1?1:currentPage-1}">
                                        <span>&laquo;</span>
                                    </a>
                                </li>

                                <s:iterator begin="1" end="#totalPage" var="st" status="status">

                                    <li class="page-item ${currentPage==st?'disabled':''}">
                                        <a class="page-link"
                                           href="/admin/users/list?page=<s:property value="#status.count"/>">
                                            <s:property value="#st"/>
                                        </a></li>

                                </s:iterator>

                                <li class="page-item ${currentPage==totalPage?'disabled':''}">
                                    <a class="page-link"
                                       href="/admin/users/list?page=${currentPage==totalPage?totalPage:currentPage+1}">
                                        <span>&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </div>

            </div>
        </div>
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2019</span>
                </div>
            </div>
        </footer>
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">提示</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">是否要注销账号</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                <a class="btn btn-primary" href="/logout">注销</a>
            </div>
        </div>
    </div>
</div>

<!-- insert Modal-->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="insertModalLabel">添加用户</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="insertForm">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="username">用户账号</label>
                            <input type="text" class="form-control" id="username" name="user.username"
                                   placeholder="请输入账号">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="password">用户密码</label>
                            <input type="text" class="form-control" id="password" name="user.password"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phone">手机号码</label>
                            <input type="text" class="form-control" id="phone" name="user.phone" placeholder="请输入手机号">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="age">年龄</label>
                            <input type="text" class="form-control" id="age" name="user.age" placeholder="请输入年龄">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="gender">性别</label>
                            <select id="gender" name="user.gender" class="form-control">
                                <option value="1" selected>男</option>
                                <option value="0">女</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="status">账号状态</label>
                            <select id="status" name="user.status" class="form-control">
                                <option value="0" selected>正常</option>
                                <option value="1">封禁</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="role">账号权限</label>
                            <select id="role" name="user.role" class="form-control">
                                <option value="0" selected>普通账号</option>
                                <option value="1">管理员</option>
                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                <a class="btn btn-primary" href="javascript:;" onclick="insertUser()">添加</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">添加用户</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="editForm">
                    <input type="text" hidden id="eid" name="user.id">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="eusername">用户账号</label>
                            <input type="text" class="form-control" id="eusername" name="user.username"
                                   placeholder="请输入账号">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="epassword">用户密码</label>
                            <input type="text" class="form-control" id="epassword" name="user.password"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="ephone">手机号码</label>
                            <input type="text" class="form-control" id="ephone" name="user.phone" placeholder="请输入手机号">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="eage">年龄</label>
                            <input type="text" class="form-control" id="eage" name="user.age" placeholder="请输入年龄">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="egender">性别</label>
                            <select id="egender" name="user.gender" class="form-control">
                                <option value="1" selected>男</option>
                                <option value="0">女</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="estatus">账号状态</label>
                            <select id="estatus" name="user.status" class="form-control">
                                <option value="0" selected>正常</option>
                                <option value="1">封禁</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="erole">账号权限</label>
                            <select id="erole" name="user.role" class="form-control">
                                <option value="0" selected>普通账号</option>
                                <option value="1">管理员</option>
                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                <a class="btn btn-primary" href="javascript:;" id="editUpdate">更新</a>
            </div>
        </div>
    </div>
</div>

<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/vendor/bootstrap/js/bootstrap-table.js"></script>
<script src="/vendor/bootstrap/js/bootstrap-table-zh-CN.js"></script>

<script src="/vendor/toastr/toastr.min.js"></script>
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<script src="/js/sb-admin-2.min.js"></script>

<script>
    function insertUser() {

        $.post("/admin/users/insert",
            $("#insertForm").serialize()
            , function (data) {
                if (data.success) {
                    toastr.success(data.msg)
                    $('#insertModal').modal('hide')
                    window.location.reload()
                } else {
                    toastr.error(data.msg)
                }
            })
    }

    function findUser(userid) {
        $.get("/admin/users/find", {
            userId: userid
        }, function (data) {
            if (data.success) {

                $('#editModal #eid').val(data.data.id)
                $('#editModal #eusername').val(data.data.username)
                $('#editModal #epassword').val(data.data.password)
                $('#editModal #ephone').val(data.data.phone)
                $('#editModal #eage').val(data.data.age)

                $('#editModal #egender').val(data.data.gender)
                $('#editModal #estatus').val(data.data.status)
                $('#editModal #erole').val(data.data.role)

                $('#editModal #editUpdate').unbind("click").bind("click", function () {
                    $.post("/admin/users/update",
                        $("#editForm").serialize()
                        , function (data) {
                            if (data.success) {
                                toastr.success(data.msg)
                                $('#editModal').modal('hide')
                                window.location.reload()
                            } else {
                                toastr.error(data.msg)
                            }
                        })
                });
                $('#editModal').modal('show')
            } else {
                toastr.error(data.msg)
            }
        })
    }

    function delUser(userid) {

        if (confirm("是否删除该用户？")) {
            $.post("/admin/users/delete",
                {
                    userId: userid
                }
                , function (data) {
                    if (data.success) {
                        toastr.success(data.msg)
                        window.location.reload()
                    } else {
                        toastr.error(data.msg)
                    }
                });
        }
    }
</script>

</body>

</html>
