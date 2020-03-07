<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>SSM-CRUD</title>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!--员工修改的模态框-->
<!-- Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="employeeName_add_input" class="col-sm-4 control-label">EmployeeName</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="employeeName_update_static">email@example.com</p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-4 control-label">email</label>
                        <div class="col-sm-8">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@cg.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">gender</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">departmentName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="employee_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!--添加员工的模态框-->
<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="employeeName_add_input" class="col-sm-4 control-label">EmployeeName</label>
                        <div class="col-sm-8">
                            <input type="text" name="EmpName" class="form-control" id="employeeName_add_input"
                                   placeholder="EmployeeName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-4 control-label">email</label>
                        <div class="col-sm-8">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@cg.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">gender</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">departmentName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="employee_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>EmployeeName</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>DepartmentName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!-- 分页信息 -->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    var totalRecord,currenPage;
    $(function () {
        to_page(1);
    })

    function to_page(page) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "page=" + page,
            type: "GET",
            success: function (result) {
                //1、解析并显示员工数据
                build_employee_table(result.data.pageInfo.list);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    //页面加载完后，发送ajax请求，获取页面数据
    $(function () {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "page=1",
            type: "GET",
            success: function (result) {
                //1.解析并显示员工数据
                build_employee_table(result.data.pageInfo.list);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_page_nav(result);
            }
        });
    });

    //解析显示员工数据
    function build_employee_table(result) {
        $('#emps_table tbody').empty();
        $.each(result, function (index, item) {
            let checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            let empIdTd = $('<td></td>').append(item.empId);
            let empNameTd = $('<td></td>').append(item.empName);
            let genderTd = $('<td></td>').append(item.gender == 'M' ? "男" : "女");
            let emailTd = $('<td></td>').append(item.email);
            let deptNameTd = $('<td></td>').append(item.department.deptName);
            let editBtn = $('<button></button>').addClass("btn btn-info btn-sm edit_btn")
                .append($('<span></span>').addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义属性来表示当前员工id
            editBtn.attr("data_edit_id", item.empId);
            let delBtn = $('<button></button>').addClass("btn btn-danger btn-sm delete_btn")
                .append($('<span></span>').addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义属性来表示当前员工id
            delBtn.attr("data_delete_id", item.empId);
            let btnTd = $('<td></td>').append(editBtn)
                .append(delBtn);
            $('<tr></tr>').append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo('#emps_table tbody');
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前【" + result.data.pageInfo.pageNum + "】页," +
            "总【" + result.data.pageInfo.pages + "】共页，总共【" + result.data.pageInfo.total + "】条记录")
        totalRecord = result.data.pageInfo.total;
        currenPage = result.data.pageInfo.pageNum;
    }

    //解析显示分页条数据
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if (result.data.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.data.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.data.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.data.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.data.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.data.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.data.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    //清空表单样式及内容
    function rest_from(ele) {
        //表单重置
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮事件
    $("#emp_add_modal_btn").click(function () {
        //清空表单数据（表单重置）
        rest_from("#empAddModal form")
        //发送ajax请求获取部门信息
        getDepartments("#empAddModal select");

        //弹出模态框
        $('#empAddModal').modal({
            backdrop: 'static'
        });
    });

    //查询所以部门信息
    function getDepartments(ele) {
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/getDepartments",
            type:"GET",
            success: function (result) {
                $.each(result.data.departments, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        })
    }

    //校验表单数据
    function validate_add_form() {
        //拿到数据   员工姓名
        let empName = $("#employeeName_add_input").val();
        //检验数据
        let regEmpName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regEmpName.test(empName)) {
            show_validate_message("#employeeName_add_input", "error", "用户名必须是2-5位中文或者6-16位英文和数字的组合");
            return false;
        } else {
            show_validate_message("#employeeName_add_input", "success", "");
        }

        //邮箱
        let email = $("#email_add_input").val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_message("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_message("#email_add_input", "success", "");
        }
        return true;
    }

    //显示校验状态信息
    function show_validate_message(ele, status, message) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error")
        $(ele).next("span").text("");

        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(message);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(message);
        }
    }

    //校验用户名是否可用
    $("#employeeName_add_input").change(function () {
        let empName = this.value;
        //通过发送ajax后端校验
        $.ajax({
            url: "${APP_PATH}/checkUser",
            type:"GET",
            data: "empName="+empName,
            success: function (result) {
                if (result.code!=1) {
                    //用户名可用
                    show_validate_message("#employeeName_add_input", "success", result.data.check_message);
                    $("#employee_save_btn").attr("data-ajax","success");
                } else {
                    //用户名不可用
                    show_validate_message("#employeeName_add_input", "error", result.data.check_message);
                    $("#employee_save_btn").attr("data-ajax","error");
                }
            }
        })
    });

    //员工保存按钮事件
    $("#employee_save_btn").click(function () {
        //将模态框中填写的数据提交到服务器保存
        //进行校验
        if (!validate_add_form()) {
            return false;
        }
        //判断用户名校验是否成功
        if ($(this).attr("data-ajax")=="error") {
            return false;
        }
        //发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/employee",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success: function (result) {
                //判断是否保存成功
                if (result.code!=1) {
                    //成功
                    //保存成功
                    //1.关闭模态框
                    $('#empAddModal').modal('hide');
                    //2.到最后一页显示所保存的数据
                    to_page(totalRecord);
                } else {
                    //失败
                    //显示失败信息
                    if (undefined != result.data.errors.email) {
                        show_validate_message("#email_add_input", "error", result.data.errors.email);
                    } else if (undefined != result.data.errors.empName) {
                        show_validate_message("#employeeName_add_input", "error", result.data.errors.empName);
                    }
                }
            }
        });
    });


    //编辑按钮的点击事件
    $(document).on("click",".edit_btn", function () {
        //查询部门列表
        getDepartments("#empUpdateModal select");
        //查询员工信息
        getEmployee($(this).attr("data_edit_id"));
        //把员工id传递给模态框的更新按钮
        $("#employee_update_btn").attr("data_edit_id",$(this).attr("data_edit_id"));
        //弹出模态框
        $('#empUpdateModal').modal({
            backdrop: 'static'
        });
    });

    //获取员工信息
    function getEmployee(id) {
        $.ajax({
            url:"${APP_PATH}/employee/" + id,
            type:"GET",
            success: function (result) {
                let employee = result.data.employee;
                $("#employeeName_update_static").text(employee.empName);
                $("#email_update_input").val(employee.email);
                $("#empUpdateModal input[name=gender]").val([employee.gender]);
                $("#empUpdateModal select").val([employee.dId]);
            }
        })
    }

    //更新员工信息
    $("#employee_update_btn").click(function () {
        //验证邮箱是否正确
        let email = $("#email_update_input").val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_message("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_message("#email_update_input", "success", "");
        }
        //获取员工id
        let id = $(this).attr("data_edit_id");
        //发送ajax请求。保存更新后的员工信息
        $.ajax({
            url: "${APP_PATH}/employee/" + id,
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                //关闭模态框
                $("#empUpdateModal").modal("hide");
                //回到页面
                to_page(currenPage);
            }
        })
    });

    //单个删除按钮的点击事件
    $(document).on("click",".delete_btn", function () {
        //弹出是否确认删除
        let empName =  $(this).parents("tr").find("td:eq(2)").text();
        //获取被删除员工id
        let empId = $(this).attr("data_delete_id");
        if (confirm("确认删除【" + empName + "】吗？")) {
            //确认，发送ajax请求
            $.ajax({
                url:"${APP_PATH}/employee/" + empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.message);
                    //回到本页
                    to_page(currenPage);
                }
            })
        }
    });

    //全选/全不选
    $("#check_all").click(function () {
        //attr一般用来获取自定义属性
        //prop一般用来获取原生dom属性
        $(".check_item").prop("checked", $(this).prop("checked"));
    })

    //所有check_item被选中后，全选按钮也自动选上
    $(document).on("click",".check_item", function () {
       //判断当前选择元素是否选满
        let falg = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", falg);
    });

    //全部删除按钮点击事件
    $("#emp_delete_all_btn").click(function () {
        let empNames = "";
        let del_id = "";
        $.each($(".check_item:checked"), function () {
            //empName字符串
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //员工id字符串
            del_id += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除最后一个逗号
        empNames = empNames.substring(0, empNames.length-1);
        //去除最后一个-
        del_id = del_id.substring(0, del_id.length-1);
        if (confirm("确认删除【"+ empNames +"】吗？")) {
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/employee/" + del_id,
                type: "DELETE",
                success:function (result) {
                    alert(result.message);
                    //回到当前页面
                    to_page(currenPage);
                }
            })
        }
    });

</script>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</body>
</html>
