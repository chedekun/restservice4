<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Demo</title>
    <link href="http://localhost:8080/springCxfREST/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://localhost:8080/springCxfREST/css/colorbox.css" rel="stylesheet" type="text/css" />
</head>
<body>
<br>
<br>
<div class="container">
    <form role="form" id="form_name">
        <div class="form-group">
            <label for="input_name">根据名称检索</label>
            <input type="text" class="form-control" id="input_name" placeholder="名称" name="name"/>
        </div>
        <button id="submit_name" type="button" class="btn btn-default">检索</button>
    </form>
    <form role="form" id="form_create">
        <div class="form-group">
            <label for="input_create_name">名称</label>
            <input type="text" class="form-control" id="input_create_name" placeholder="名称" name="name"/>
        </div>
        <div class="form-group">
            <label for="input_create_price">价格</label>
            <input type="text" class="form-control" id="input_create_price" placeholder="价格" name="price"/>
        </div>
        <button id="submit_create" type="button" class="btn btn-default">添加</button>
    </form>
    <div class="panel panel-default">
        <button id="all" type="button" class="btn btn-default">RetrieveAll</button>
        <button id="byID" type="button" class="btn btn-default">RetrieveByID</button>
        <button id="name" type="button" class="btn btn-default">RetrieveByName</button>
    </div>
    <div class="page-header">
        <h1>Product</h1>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Product List</div>
        <div class="panel-body">
            <div id="product"></div>
        </div>
    </div>
</div>
<script src="http://localhost:8080/springCxfREST/script/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="http://localhost:8080/restservice4/script/bootstrap.min.js"></script>
<script type="text/javascript" src="http://localhost:8080/restservice4/script/handlebars-v4.0.8.js"></script>

<script type="text/x-handlebars-template" id="product_table_template">
    {{#if data}}
    <table class="table table-hover" id="product_table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        {{#data}}
        <tr data-id="{{id}}" data-name="{{name}}">
            <td>{{id}}</td>
            <td>{{name}}</td>
            <td>{{price}}</td>
        </tr>
        {{/data}}
        </tbody>
    </table>
    {{else}}
    <div class="alert alert-warning">Can not find any data!</div>
    {{/if}}
</script>

<script>
    $(function() {
        //检索所有
        $("#all").click(function(){
            $("#product").html("");
            $.ajax({
                type: 'get',
                url: 'http://localhost:8080/restservice4/ws/rest/products',
                dataType: 'json',
                success: function(data) {
                    var template = $("#product_table_template").html();
                    var render = Handlebars.compile(template);
                    var html = render({
                        data: data
                    });
                    $('#product').html(html);
                }
            });
        });

        //根据ID检索
        $("#byID").click(function(){
            $("#product").html("");
            $.ajax({
                type: 'get',
                url: 'http://localhost:8080/restservice4/ws/rest/product/1',
                dataType: 'json',
                success: function(data) {
                    var template = $("#product_table_template").html();
                    var render = Handlebars.compile(template);
                    var html = render({
                        data: data
                    });
                    $('#product').html(html);
                }
            });
        });

        //根据名称检索
        $("#name").click(function(){
            $("#product").html("");
            $.ajax({
                type: 'get',
                url: 'http://localhost:8080/restservice4/ws/rest/products/name?name=ipad mini',
                dataType: 'json',
                success: function(data) {
                    var template = $("#product_table_template").html();
                    var render = Handlebars.compile(template);
                    var html = render({
                        data: data
                    });
                    $('#product').html(html);
                }
            });
        });

        //提交表单，根据名称检索
        $("#submit_name").click(function(){
            $("#product").html("");
            $.ajax({
                type: 'post',
                url: 'http://localhost:8080/restservice4/ws/rest/products/form/name?'+$("#form_name").serialize(),
                dataType: 'json',
                success: function(data) {
                    var template = $("#product_table_template").html();
                    var render = Handlebars.compile(template);
                    var html = render({
                        data: data
                    });
                    $('#product').html(html);
                }
            });
        });

        /* 提交表单，添加数据 */
        $("#submit_create").click(function(){
            $("#product").html("");
            $.ajax({
                type: 'post',
                url: 'http://localhost:8080/restservice4/ws/rest/product/create?'+$("#form_create").serialize(),
                dataType: 'json',
                success: function(data) {
                    var template = $("#product_table_template").html();
                    var render = Handlebars.compile(template);
                    var html = render({
                        data: data
                    });
                    $('#product').html(html);
                }
            });
        });

    });

    function goColorBox(){
        $("#goOne").colorbox({ opacity:0.65,width: 500, height:500, close: "关闭", overlayClose: true});
    }
</script>
</body>
</html>