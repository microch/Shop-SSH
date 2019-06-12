<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>订单管理</title>

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

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#userManager"
               aria-expanded="true" aria-controls="userManager">
                <i class="fas fa-fw fa-user"></i>
                <span>用户管理</span>
            </a>
            <div id="userManager" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">User</h6>
                    <a class="collapse-item" href="/admin/users/list">用户列表</a>
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

        <li class="nav-item active">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#orderManager"
               aria-expanded="true" aria-controls="orderManager">
                <i class="fas fa-fw fa-money-check"></i>
                <span>订单管理</span>
            </a>
            <div id="orderManager" class="collapse show" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Orders</h6>
                    <a class="collapse-item active" href="/admin/orders">订单管理</a>
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
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">

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
                        <h6 class="m-0 font-weight-bold text-primary">订单管理
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="table" width="100%"
                                   data-toggle="table"
                                   data-pagination="true">
                                <thead>
                                <tr>
                                    <th data-field="ident">订单编号</th>
                                    <th data-field="user.username">订单账号</th>
                                    <th data-field="createDate">订单时间</th>
                                    <th data-field="address" data-formatter="priceFormatter">收获地址</th>
                                    <th data-field="status" data-formatter="statusFormatter">状态</th>
                                    <th data-formatter="operateFormatter">操作</th>
                                </tr>
                                </thead>
                            </table>
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

<div class="modal fade" id="infoModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoModalLabel">订单详情</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="table-responsive">
                    <table class="table table-bordered" id="infoTable" width="100%"
                           data-toggle="table"
                           data-pagination="true">
                        <thead>
                        <tr>
                            <th data-field="goods.name">商品名称</th>
                            <th data-field="goods.catalog.name">商品分类</th>
                            <th data-field="num">商品数量</th>
                        </tr>
                        </thead>
                    </table>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" id="sendGoods">发货</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.js"></script>

    <script src="/vendor/bootstrap/js/bootstrap-table.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap-table-zh-CN.js"></script>

    <script src="/vendor/toastr/toastr.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <script>

        $(function () {
            loadTableData()
        })

        function loadTableData() {
            $.get("/admin/orders/list"
                , function (data) {
                    if (data.success) {
                        $("#table").bootstrapTable("load", data.data)
                    } else {
                        toastr.error(data.msg)
                    }
                })
        }


        //     value：字段值。row：行记录数据。index：行索引。field：行字段。

        function operateFormatter(value, row, index, field) {
            return [
                '<button  data-toggle="modal" data-target="#infoModal" data-index="' + index + '"',
                'class="btn btn-info btn-icon-split btn-sm" style="margin-right:10px;">',
                '<span class="icon text-white-50"><i class="fas fa-edit"></i></span>',
                ' <span class="text">详情</span>',
                '',
                '<button onclick="delOrders(' + index + ')"',
                'class="btn btn-danger btn-icon-split btn-sm">',
                '<span class="icon text-white-50"><i class="fas fa-eraser"></i></span>',
                ' <span class="text">删除</span>'
            ].join('')

        }

        function ordersInfo(index) {

            console.log(row)
        }

        $('#infoModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var index = button.data('index')
            var modal = $(this)
            row = $("#table").bootstrapTable('getData')[index]
            modal.find('.modal-title').text('订单详情 - ' + row.ident)
            modal.find('.modal-body #infoTable').bootstrapTable("load", row.detailSet)
            $btn = modal.find('.modal-footer #sendGoods');
            $btn.unbind('click').bind('click', function () {
                $.post("/admin/orders/send", {
                    ordersId: row.id
                }, function (data) {
                    if (data.success) {
                        toastr.success(data.msg)
                        loadTableData()
                    } else {
                        toastr.error(data.msg)
                    }
                    modal.modal('hide');
                })
            });
        })


        function catalogFormatter(value, row, index, field) {
            row = $("#table").bootstrapTable('getData')[index]
            return '<span class="badge badge-primary">' + row.catalog.name + '</span>';
        }


        function priceFormatter(value, row, index, field) {
            return '<span class="badge badge-primary">' + value + '</span>';
        }


        function statusFormatter(value, row, index, field) {
            if (value == 0) {
                return '<span class="badge badge-warning">未发货</span>';
            } else if (value == 1) {
                return '<span class="badge badge-primary">已发货</span>';
            }
        }


        function delOrders(index) {
            row = $("#table").bootstrapTable('getData')[index]
            if (confirm("是否删除该订单？")) {
                $.post("/admin/orders/delete",
                    {
                        ordersId: row.id
                    }
                    , function (data) {
                        if (data.success) {
                            toastr.success(data.msg)
                            loadTableData()
                        } else {
                            toastr.error(data.msg)
                        }
                    });
            }
        }

    </script>

</body>

</html>
