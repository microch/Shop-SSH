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

    <title>个人中心</title>

    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <link href="/vendor/toastr/toastr.css" rel="stylesheet" type="text/css">
    <style>

        .card-columns {
            column-count: 2;
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


        <li class="nav-item active">
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

        <li class="nav-item">
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
                        <h6 class="m-0 font-weight-bold text-primary">购物车</h6>
                    </div>
                    <div class="card-body">

                        <div class="card-columns">

                            <s:iterator value="#session.carts" var="cart">

                                <div class="col-xl-12">
                                    <div class="card border-left-primary py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col">
                                                    <div class="h5 font-weight-bold text-primary mb-1">
                                                        <s:property value="#cart.goods.name"/>
                                                        <span class="float-right">￥ <s:property
                                                                value="#cart.goods.price"/></span>
                                                    </div>
                                                    <div class="h7 mb-0 text-gray-800">
                                                        <s:property value="#cart.goods.description"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row" style="margin-top: 15px;">
                                                <div class="col-3">
                                                    <input type="number"
                                                           class="goodsCart"
                                                           data-gid="${cart.goods.id}"
                                                           data-price="${cart.goods.price}"
                                                           value="${cart.num}" min="0"
                                                           max="100" step="1"/>
                                                </div>
                                                <div class="col">
                                                    <small class="text-muted">
                                                        <a href="javascript:;" onclick="delCart(${cart.goods.id})">
                                                            <span class="badge badge-pill badge-danger">移出购物车</span>
                                                        </a>
                                                    </small>
                                                </div>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </s:iterator>

                        </div>

                    </div>
                    <div class="card-footer text-muted">
                        <div class="float-left">
                            <span class="m-0 h6 font-weight-bold text-primary">总金额 ￥ </span>
                            <span id="allPrice" class="h6 mb-0 font-weight-bold text-gray-800">0</span>
                        </div>
                        <a href="javascript:;" data-toggle="modal" data-target="#addressModal"
                           class="btn btn-primary btn-icon-split btn-sm float-right">
                        <span class="icon text-white-50">
                          <i class="fas fa-shopping-cart"></i>
                        </span>
                            <span class="text">下单</span>
                        </a>

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

<div class="modal fade" id="addressModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addressModalLabel">确认下单</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>

            <div class="form-group" style="margin-top: 15px;">
                <div class="col">
                    <input type="text" class="form-control form-control-user"
                           id="address" name="address" placeholder="请输入收货地址">
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                <button class="btn btn-primary" type="button" data-dismiss="modal" onclick="submitOrder()">确定</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="msgModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="msgModalLabel">提示</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">订单提交成功，将尽快为您安排发货</div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/vendor/toastr/toastr.min.js"></script>

<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/vendor/jquery-num/js/InputSpinner.js"></script>


<script src="/js/sb-admin-2.min.js"></script>

<script>
    $("input[type='number']").InputSpinner({
        decrementButton: "<strong>-</strong>", // button text
        incrementButton: "<strong>+</strong>", // ..
        groupClass: "input-group-sm", // 输入组的css类 (sizing with input-group-sm or input-group-lg)
        buttonsClass: "btn-outline-secondary",
        buttonsWidth: "2.5em",
        textAlign: "center",
        autoDelay: 500, // 在自动值更改之前保持ms
        autoInterval: 100, // 自动价值变化的速度
        boostThreshold: 15, // 这些步骤后提升
        boostMultiplier: 4,
        locale: null // 数字渲染的语言环境;如果为null，则使用浏览器语言
    });

    $(function () {
        calcPrice()
        $("input[type='number']").bind('input propertychange', function () {
            calcPrice()
        })
        $('#msgModal').on('hidden.bs.modal', function (e) {
            window.location.href = "/user/orders"
        })
    })

    function submitOrder() {

        carts = {}

        $(".goodsCart").each(function (index, element) {
            gid = $(element).data('gid')
            num = $(this).val()
            // cart = {
            //     'num': num,
            //     'goods.id': gid
            // }
            // carts.push(cart)
            carts['carts[' + index + '].num'] = num
            carts['carts[' + index + '].goods.id'] = gid
        })

        carts['orders.address']=$('#address').val()

        $.post("/user/submitCart",
            carts
            ,
            function (data) {
                if (data.success) {
                    // toastr.success(data.msg)
                    $('#msgModal').modal('show')
                } else {
                    toastr.error(data.msg)
                }
            })
    }

    function calcPrice() {
        var needPrice = 0
        $(".goodsCart").each(function (index, element) {
            gid = $(element).data('gid')
            price = $(element).data('price')
            num = $(this).val()
            needPrice += Number(price) * Number(num)
        })
        $('#allPrice').text(needPrice)
    }

    function delCart(id) {

        if (confirm("是否从购物车移出商品")) {
            $.post("user/delCart", {
                gid: id
            }, function (data) {
                if (data.success) {
                    toastr.success(data.msg);
                    window.location.reload()
                } else {
                    toastr.error(data.msg);
                }
            });
        }

    }
</script>

</body>

</html>