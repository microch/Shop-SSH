<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>资料编辑</title>

    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


    <link href="/vendor/bootstrap/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">

    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <link href="/vendor/toastr/toastr.css" rel="stylesheet" type="text/css">
    <style>
        .form-control-user {
            padding: 0rem 1rem !important;
            height: 3rem !important;
        }
    </style>

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

        <li class="nav-item ">
            <a class="nav-link" href="/index">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>商城首页</span></a>
        </li>

        <hr class="sidebar-divider">


        <li class="nav-item">
            <a class="nav-link" href="/user/index">
                <i class="fas fa-fw fa-shopping-cart"></i>
                <span>购物车</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/user/orders">
                <i class="fas fa-fw fa-calendar-check"></i>
                <span>我的订单</span>
            </a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="/user/profile">
                <i class="fas fa-fw fa-newspaper"></i>
                <span>资料修改</span>
            </a>
        </li>


        <hr class="sidebar-divider d-none d-md-block">

        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>

    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">

            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <ul class="navbar-nav ml-auto">

                    <s:if test="#session.user.role==1">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link" href="/admin/users/list" role="button">
                                <i class="fas fa-cog fa-sm fa-fw mr-2 text-gray-400"></i>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 后台管理 </span>
                            </a>

                        </li>
                    </s:if>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.username}</span>
                            <img class="img-profile rounded-circle"
                                 src="http://q1.qlogo.cn/g?b=qq&nk=1464435902&s=100">
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
                        <h6 class="m-0 font-weight-bold text-primary">资料编辑</h6>
                    </div>
                    <div class="card-body">

                        <form id="updateForm" class="user">


                            <div class="form-group row">

                                <div class="col-sm">
                                    <input type="text" value="${user.username}"
                                           class="form-control form-control-user"
                                           id="username" name="user.username" placeholder="请输入用户名">
                                </div>
                                <div class="col-sm">
                                    <input type="text" value="${user.password}"
                                           class="form-control form-control-user"
                                           id="password" name="user.password" placeholder="请再次输入密码">
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-sm">
                                    <input type="text" class="form-control form-control-user"
                                           id="age" name="user.age" value="${user.age}" placeholder="请输入年龄">
                                </div>

                                <div class="col-sm">
                                    <select id="gender" name="user.gender"
                                            class="form-control form-control-user">
                                        <option value="1" ${user.gender==1?'selected':''}>男</option>
                                        <option value="0" ${user.gender==0?'selected':''}>女</option>
                                    </select>
                                </div>

                            </div>

                            <div class="form-group row">

                                <div class="col-sm">
                                    <input type="text" class="form-control form-control-user"
                                           id="phone" name="user.phone" value="${user.phone}" placeholder="请输入手机号码">
                                </div>
                                <div class="col-sm">

                                </div>
                            </div>

                            <a href="javascript:;" onclick="updateUser()" class="btn btn-primary btn-user btn-block">
                                更新
                            </a>
                        </form>


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

<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/vendor/toastr/toastr.min.js"></script>


<script src="/vendor/bootstrap/js/bootstrap-table.js"></script>
<script src="/vendor/bootstrap/js/bootstrap-table-zh-CN.js"></script>

<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/vendor/jquery-num/js/InputSpinner.js"></script>


<script src="/js/sb-admin-2.min.js"></script>

<script>

    function updateUser() {

        $.post("/user/update",
            $("#updateForm").serialize()
            , function (data) {
                if (data.success) {
                    toastr.success(data.msg)
                } else {
                    toastr.error(data.msg)
                }
            })

    }

</script>

</body>

</html>