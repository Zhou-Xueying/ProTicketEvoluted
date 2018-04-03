<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2018/3/28
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">登录</h4>
            </div>
            <div class="modal-body">
                <form:form class="form-horizontal" method="POST" action="login.form">
                    <div class="form-group">
                        <label for="email" class="col-md-4 control-label">邮箱</label>
                        <div class="col-md-6">
                            <input id="loginEmail" type="email" class="form-control" name="email" value="" required autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-4 control-label">密码</label>
                        <div class="col-md-6">
                            <input id="loginPass" type="password" class="form-control" name="password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-ld btn-primary btn-block">登录</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#signinModal">新用户？点我注册</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="signinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">注册</h4>
            </div>
            <div class="modal-body">
                <form:form class="form-horizontal" method="POST" action="register.form?action=register" role="form">
                    <div class="form-group">
                        <label for="name" class="col-md-4 control-label">用户名</label>
                        <div class="col-md-6">
                            <input id="name" type="text" class="form-control" name="userName" value="" required autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-md-4 control-label">邮箱</label>
                        <div class="col-md-6">
                            <input id="email" type="email" class="form-control" name="email" value="" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-4 control-label">密码</label>
                        <div class="col-md-6">
                            <input id="password" type="password" class="form-control" name="password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password-confirm" class="col-md-4 control-label">确认密码</label>
                        <div class="col-md-6">
                            <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-ld btn-primary btn-block">注册</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">已有账号？点我登录</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="venueModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">入驻场馆登录</h4>
            </div>
            <div class="modal-body">
                <form:form class="form-horizontal" method="POST" action="venueLogin.form">
                    <div class="form-group">
                        <label for="email" class="col-md-4 control-label">账号</label>
                        <div class="col-md-6">
                            <input id="venueId" type="text" class="form-control" name="venueId" value="" required autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-4 control-label">密码</label>
                        <div class="col-md-6">
                            <input id="venuePass" type="password" class="form-control" name="venuePass" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-ld btn-primary btn-block">登录</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="window.location.href='http://localhost:8090/toVenueRegister.form'">新的合作伙伴请注册</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="managerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">管理员登录</h4>
            </div>
            <div class="modal-body">
                <form:form class="form-horizontal" method="POST" action="managerLogin.form">
                    <div class="form-group">
                        <label for="email" class="col-md-4 control-label">账号</label>
                        <div class="col-md-6">
                            <input id="managerId" type="text" class="form-control" name="managerId" value="" required autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-4 control-label">密码</label>
                        <div class="col-md-6">
                            <input id="managerPass" type="password" class="form-control" name="managerPass" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-ld btn-primary btn-block">登录</button>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

