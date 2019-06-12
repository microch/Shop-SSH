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

    <title>商城首页</title>

    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <link href="/vendor/toastr/toastr.css" rel="stylesheet" type="text/css">
    <style>

        .card-columns {
            column-count: 4;
        }

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

        <li class="nav-item ${catalogId==0 ? 'active' :''}">
            <a class="nav-link" href="/index">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>所有商品</span></a>
        </li>

        <hr class="sidebar-divider">

        <s:iterator value="#catalogs" var="ca">

            <li class="nav-item ${catalog.id==ca.id ? 'active' :''}">
                <a class="nav-link" href="/list?catalogId=${ca.id}">
                    <i class="fas fa-fw fa-circle"></i>
                    <span>
                        <s:property value="#ca.name"/>
                    </span>
                </a>
            </li>

        </s:iterator>


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

                <form action="/list" method="post" class=" form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">

                    <div class="input-group">
                        <input type="text" value="${minPrice}" name="minPrice" style="width: 100px;"
                               class="form-control bg-light border-0 small" placeholder="最低">
                        <span> - </span>
                        <input type="text" value="${maxPrice}" name="maxPrice" style="width: 100px;margin-right: 15px;"
                               class="form-control bg-light border-0 small" placeholder="最高">
                    </div>
                    <div class="input-group">
                        <input type="text" value="${searchValue}" name="searchValue"
                               class="form-control bg-light border-0 small" placeholder="商品名称...">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
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


                    <s:if test="#session.user==null">

                        <li class="nav-item dropdown no-arrow">

                            <a class="nav-link" href="javascript:;" role="button" data-toggle='modal'
                               data-target='#loginModal'>
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 登录 </span>
                            </a>

                        </li>

                        <li class="nav-item dropdown no-arrow">

                            <a class="nav-link" href="javascript:;" role="button" data-toggle='modal'
                               data-target='#resignModal'>
                                <i class="fas fa-user-plus fa-sm fa-fw mr-2 text-gray-400"></i>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 注册 </span>
                            </a>

                        </li>

                    </s:if>

                    <s:else>

                        <li class="nav-item dropdown no-arrow">

                            <a class="nav-link" href="/user/index" role="button">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 个人中心 </span>
                            </a>

                        </li>

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
                    </s:else>

                </ul>

            </nav>

            <div class="container-fluid">

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">${catalog.id==0?'所有商品':catalog.name}</h6>
                    </div>
                    <div class="card-body">

                        <div class="card-columns">

                            <s:iterator value="#goods" var="g">

                                <div class="card">
                                    <img class="card-img-top" src="${g.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            <s:property value="#g.name"/>
                                        </h5>
                                        <p class="card-text">
                                            <s:property value="#g.description"/>
                                        </p>
                                    </div>
                                    <div class="card-footer clearfix">
                                        <small class="text-muted float-left">
                                            <span class="badge badge-pill badge-primary">
                                                <s:property value="#g.price"/>
                                                 <i class="fas fa-yen-sign"></i>
                                            </span>
                                        </small>
                                        <small class="text-muted float-right">
                                            <a href="javascript:;" onclick="shop(<s:property value="#g.id"/>)">
                                                <span class="badge badge-pill badge-info">
                                               加入购物车
                                                </span>
                                            </a>
                                        </small>
                                    </div>
                                </div>

                            </s:iterator>

                        </div>

                    </div>
                </div>
            </div>


            <!-- login Modal-->
            <div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="loginModalLabel">用户登录</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form class="user">
                                <div class="form-group row">

                                    <div class="col-sm">
                                        <input type="text" class="form-control form-control-user"
                                               id="username" name="user.username" placeholder="请输入用户名">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm">
                                        <input type="password" class="form-control form-control-user"
                                               id="password" name="user.password" placeholder="请输入密码">
                                    </div>
                                </div>
                                <div class="form-group row">

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control form-control-user"
                                               id="code" name="code" placeholder="请输入验证码">
                                    </div>
                                    <div class="col-sm-4">
                                        <img id="codeImg" onclick="refreshCode()"
                                             style="width: 100px;height: 50px;border-radius: 10rem;"
                                             class="img-thumbnail">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">记住密码</label>
                                        </div>
                                    </div>
                                </div>
                                <a href="javascript:;" onclick="login()" class="btn btn-primary btn-user btn-block">
                                    登录
                                </a>

                            </form>

                            <hr>
                        </div>
                    </div>
                </div>
            </div>


            <!-- resign Modal-->
            <div class="modal fade" id="resignModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="resignModalLabel">注册账号</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form class="user">
                                <div class="form-group row">

                                    <div class="col-sm">
                                        <input type="text" class="form-control form-control-user"
                                               id="rusername" placeholder="请输入用户名">
                                    </div>
                                </div>
                                <div class="form-group row">

                                    <div class="col-sm">
                                        <input type="password" class="form-control form-control-user"
                                               id="rpassword" placeholder="请输入密码">
                                    </div>
                                    <div class="col-sm">
                                        <input type="password" class="form-control form-control-user"
                                               id="rrpassword" placeholder="请再次输入密码">
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm">
                                        <input type="password" class="form-control form-control-user"
                                               id="rage" placeholder="请输入年龄">
                                    </div>

                                    <div class="col-sm">
                                        <select id="rgender" class="form-control form-control-user">
                                            <option value="1" selected>男</option>
                                            <option value="0">女</option>
                                        </select>
                                    </div>

                                </div>

                                <div class="form-group row">

                                    <div class="col-sm">
                                        <input type="text" class="form-control form-control-user"
                                               id="rphone" placeholder="请输入手机号码">
                                    </div>

                                </div>


                                <div class="form-group row">

                                    <div class="col-sm">
                                        <input type="text" class="form-control form-control-user"
                                               id="rcode" name="code" placeholder="请输入验证码">
                                    </div>

                                    <div class="col-sm">
                                        <img id="rcodeImg" onclick="refreshResignCode()"
                                             style="width: 100px;height: 50px;border-radius: 10rem;"
                                             class="img-thumbnail">
                                    </div>
                                </div>


                                <a href="javascript:;" onclick="resign()" class="btn btn-primary btn-user btn-block">
                                    注册
                                </a>
                            </form>
                            <hr>

                        </div>
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

<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<script src="/js/sb-admin-2.min.js"></script>

<script>

    $('#loginModal').on('show.bs.modal', function (event) {
        refreshCode()
    })
    $('#resignModal').on('show.bs.modal', function (event) {
        refreshResignCode()
    })


    function login() {
        $.post("/user/login", {
            'user.username': $('#username').val(),
            'user.password': $('#password').val(),
            'code': $('#code').val(),
        }, function (data) {
            if (data.success) {
                $('#loginModal').modal('hide')
                toastr.success(data.msg)
                window.location.reload()
            } else {
                refreshCode()
                toastr.error(data.msg)
            }
        })
    }

    function resign() {
        $.post("/user/resign", {
            'user.username': $('#rusername').val(),
            'user.password': $('#rpassword').val(),
            'user.age': $('#rage').val(),
            'user.phone': $('#rphone').val(),
            'user.gender': $('#rgender').val(),
            'code': $('#rcode').val(),
        }, function (data) {
            if (data.success) {
                $('#resignModal').modal('hide')
                toastr.success(data.msg)
            } else {
                refreshResignCode()
                toastr.error(data.msg)
            }
        })
    }

    function refreshCode() {
        $('#codeImg').attr('src', '/captcha.jpg')
    }

    function refreshResignCode() {
        $('#rcodeImg').attr('src', '/captcha.jpg')
    }

    function shop(gid) {

        $.post("/user/shopCart", {
            gid: gid
        }, function (data) {
            if (data.success) {
                toastr.success(data.msg);
            } else {
                toastr.error("<a data-toggle='modal' data-target='#loginModal' > 点击登录</a>", "未登录");
            }
        })
    }

</script>

</body>

</html>