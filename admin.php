<?php
/*
Việt Hóa bởi Rio
'--------------------------------------------------------
*/
define('IS_ADMIN', TRUE); // Dấu hiệu quản trị viên
define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME)); // Tên file quản trị
define('FCPATH', str_replace("\\", "/", dirname(__FILE__).'/')); // Thư mục gốc của website
require('index.php'); // Nhập file chính
