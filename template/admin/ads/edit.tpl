<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm quảng cáo</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<?=Web_Base_Path?>admin/css/style.css">
    <script src="<?=Web_Base_Path?>jquery/jquery.min.js"></script>
    <!-- Cho phép IE8/9 hỗ trợ truy vấn phương tiện, từ đó tương thích với lưới -->
    <!--[if lt IE 9]>
    <script src="<?=Web_Base_Path?>jquery/jquery-1.9.1.min.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/html5.min.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/respond.min.js"></script>
    <![endif]-->
    <script src="<?=Web_Base_Path?>layui/layui.js"></script>
    <script src="<?=Web_Base_Path?>admin/js/common.js"></script>
</head>

<body class="bsbg">
<div class="layui-fluid">
    <form class="layui-form" action="<?= links('ads', 'save') ?>">
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Tiêu đề Quảng cáo</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$name?>" placeholder="Nhập tiêu đề quảng cáo">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Định danh duy nhất</label>
            <div class="layui-input-block">
                <input type="text" name="bs" required lay-verify="required" autocomplete="off" class="layui-input" value="<?=$bs?>" placeholder="Nhập định danh duy nhất của quảng cáo, chỉ có thể là chữ cái tiếng Anh, số, dấu gạch dưới">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">Nội dung Quảng cáo</label>
            <div class="layui-input-block">
                <textarea style="min-height:150px;" name="html" placeholder="Nội dung quảng cáo, hỗ trợ html" class="layui-textarea"><?=$html?></textarea>
            </div>
        </div>
        <div class="layui-form-item text-right">
            <input type="hidden" name="id" value="<?=$id?>">
            <button class="layui-btn" lay-filter="*" lay-submit>Lưu</button>
            <button type="reset" class="layui-btn layui-btn-primary">Đặt lại</button>
        </div>
    </form>
</div>
</body>
</html>