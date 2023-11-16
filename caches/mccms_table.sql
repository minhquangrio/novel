DROP TABLE IF EXISTS `{prefix}admin`;
CREATE TABLE `{prefix}admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '' COMMENT 'Tài khoản đăng nhập',
  `pass` varchar(64) DEFAULT '',
  `nichen` varchar(64) DEFAULT '' COMMENT 'Biệt danh',
  `sid` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái, 0 bình thường, 1 bị cấm',
  `qx` varchar(255) DEFAULT '',
  `logip` varchar(20) DEFAULT '',
  `logtime` int(11) DEFAULT '0',
  `lognum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Quản trị viên';

DROP TABLE IF EXISTS `{prefix}admin_log`;
CREATE TABLE `{prefix}admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `logip` varchar(20) DEFAULT '' COMMENT 'IP đăng nhập',
  `logtime` int(11) DEFAULT '0' COMMENT 'Thời gian đăng nhập',
  `browser` varchar(255) DEFAULT '' COMMENT 'Trình duyệt',
  `machine` varchar(20) DEFAULT '' COMMENT 'PC hoặc WAP',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Nhật ký đăng nhập';

DROP TABLE IF EXISTS `{prefix}ads`;
CREATE TABLE `{prefix}ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '' COMMENT 'Tên quảng cáo',
  `bs` varchar(64) DEFAULT '' COMMENT 'Định danh duy nhất',
  `html` text COMMENT 'Nội dung HTML',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Danh sách quảng cáo';

DROP TABLE IF EXISTS `{prefix}buy`;
CREATE TABLE `{prefix}buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT '' COMMENT 'Giới thiệu tiêu đề',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `cid` int(11) DEFAULT '0' COMMENT 'ID chương',
  `uid` int(11) DEFAULT '0' COMMENT 'ID thành viên sử dụng',
  `cion` int(11) DEFAULT '0' COMMENT 'Số điểm tiêu',
  `ip` varchar(20) DEFAULT '' COMMENT 'IP',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian tiêu',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Lịch sử tiêu dùng';

DROP TABLE IF EXISTS `{prefix}card`;
CREATE TABLE `{prefix}card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) DEFAULT '' COMMENT 'Mã thẻ',
  `sid` tinyint(1) DEFAULT '0' COMMENT '0 thẻ điểm, 1 thẻ VIP',
  `day` int(11) DEFAULT '0' COMMENT 'Số ngày VIP',
  `cion` int(11) DEFAULT '0' COMMENT 'Số điểm',
  `uid` int(11) DEFAULT '0' COMMENT 'ID thành viên sử dụng',
  `usetime` int(11) DEFAULT '0' COMMENT 'Thời gian sử dụng',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh sách mã thẻ';

DROP TABLE IF EXISTS `{prefix}class`;
CREATE TABLE `{prefix}class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT 'Tên',
  `yname` varchar(255) DEFAULT '' COMMENT 'Tên tiếng Anh',
  `fid` int(11) DEFAULT '0' COMMENT 'ID cha',
  `xid` int(11) DEFAULT '0' COMMENT 'ID sắp xếp',
  `tpl` varchar(64) DEFAULT 'lists.html' COMMENT 'Mẫu',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh mục truyện tranh';

DROP TABLE IF EXISTS `{prefix}comic`;
CREATE TABLE `{prefix}comic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT 'Tiêu đề',
  `yname` varchar(128) DEFAULT '' COMMENT 'Biệt danh tiếng Anh',
  `pic` varchar(255) DEFAULT '' COMMENT 'Bìa dọc',
  `picx` varchar(255) DEFAULT '' COMMENT 'Bìa ngang',
  `cid` int(11) DEFAULT '0' COMMENT 'ID danh mục',
  `tid` tinyint(1) DEFAULT '0' COMMENT '1 giới thiệu, 0 chưa giới thiệu',
  `serialize` varchar(20) DEFAULT '' COMMENT 'Trạng thái',
  `author` varchar(64) DEFAULT '' COMMENT 'Tác giả truyện tranh',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `notice` varchar(255) DEFAULT '' COMMENT 'Thông báo',
  `pic_author` varchar(128) DEFAULT '' COMMENT 'Tác giả hình ảnh',
  `txt_author` varchar(128) DEFAULT '' COMMENT 'Tác giả văn bản',
  `text` varchar(64) DEFAULT '' COMMENT 'Mô tả ngắn gọn',
  `content` varchar(500) DEFAULT '' COMMENT 'Giới thiệu',
  `hits` int(11) DEFAULT '0' COMMENT 'Tổng số lượt xem',
  `yhits` int(11) DEFAULT '0' COMMENT 'Số lượt xem trong tháng',
  `zhits` int(11) DEFAULT '0' COMMENT 'Số lượt xem trong tuần',
  `rhits` int(11) DEFAULT '0' COMMENT 'Số lượt xem trong ngày',
  `shits` int(11) DEFAULT '0' COMMENT 'Số người yêu thích',
  `pay` tinyint(1) DEFAULT '0' COMMENT 'Có phải trả phí hay không? 1 vàng, 2 VIP',
  `cion` int(11) DEFAULT '0' COMMENT 'Tổng số tiền thưởng',
  `ticket` int(11) DEFAULT '0' COMMENT 'Tổng số phiếu tháng',
  `sid` tinyint(1) DEFAULT '0' COMMENT '0 bình thường, 1 khóa',
  `nums` int(11) DEFAULT '0' COMMENT 'Tổng số chương',
  `score` decimal(2,1) DEFAULT '9.8' COMMENT 'Tổng điểm',
  `did` int(11) DEFAULT '0' COMMENT 'ID nguồn thu thập',
    `ly` varchar(64) DEFAULT '' COMMENT 'Nguồn thu thập định danh',
  `yid` tinyint(1) DEFAULT '0' COMMENT '0 bình thường, 1 chờ xác nhận',
  `msg` varchar(128) DEFAULT '' COMMENT 'Lý do chưa xác nhận',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian nhập kho',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `serialize` (`serialize`) USING BTREE,
  KEY `hits` (`hits`) USING BTREE,
  KEY `yhits` (`yhits`) USING BTREE,
  KEY `zhits` (`zhits`) USING BTREE,
  KEY `rhits` (`rhits`) USING BTREE,
  KEY `shits` (`shits`) USING BTREE,
  KEY `cion` (`cion`) USING BTREE,
  KEY `yid` (`yid`) USING BTREE,
  KEY `addtime` (`addtime`) USING BTREE,
  KEY `pay` (`pay`) USING BTREE,
  KEY `ticket` (`ticket`) USING BTREE,
  KEY `score` (`score`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh sách truyện tranh';

DROP TABLE IF EXISTS `{prefix}comic_buy`;
CREATE TABLE `{prefix}comic_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `cid` int(11) DEFAULT '0' COMMENT 'ID chương',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `auto` tinyint(1) DEFAULT '0' COMMENT '1 bật tự động mua',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_mid_cid` (`uid`,`mid`,`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Lịch sử mua truyện tranh';

DROP TABLE IF EXISTS `{prefix}comic_chapter`;
CREATE TABLE `{prefix}comic_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `xid` int(11) DEFAULT '0' COMMENT 'ID sắp xếp',
  `name` varchar(128) DEFAULT '' COMMENT 'Tiêu đề',
  `jxurl` varchar(255) DEFAULT '' COMMENT 'Địa chỉ phân giải',
  `vip` tinyint(1) DEFAULT '0' COMMENT 'Đọc VIP, 0 không, 1 có',
  `cion` int(11) DEFAULT '0' COMMENT 'Số điểm cần chương',
  `pnum` int(11) DEFAULT '0' COMMENT 'Số lượng hình ảnh',
  `yid` tinyint(1) DEFAULT '0' COMMENT '0 đã xác nhận, 1 chờ xác nhận, 2 không thông qua',
  `msg` varchar(128) DEFAULT '' COMMENT 'Lý do không thông qua',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian nhập kho',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mid_xid` (`mid`,`xid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Chương truyện tranh';

DROP TABLE IF EXISTS `{prefix}comic_pic`;
CREATE TABLE `{prefix}comic_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0' COMMENT 'ID chương',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `img` varchar(255) DEFAULT '' COMMENT 'Địa chỉ URL hình ảnh',
  `width` int(11) DEFAULT '0' COMMENT 'Chiều rộng hình ảnh',
  `height` int(11) DEFAULT '0' COMMENT 'Chiều cao hình ảnh',
  `xid` int(11) DEFAULT '0' COMMENT 'ID sắp xếp',
  `md5` varchar(40) DEFAULT '' COMMENT 'MD5 của địa chỉ nguồn',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `xid` (`xid`) USING BTREE,
  KEY `md5` (`md5`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Hình ảnh chương truyện tranh';

DROP TABLE IF EXISTS `{prefix}comic_score`;
CREATE TABLE `{prefix}comic_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `pf` tinyint(2) DEFAULT '0' COMMENT 'Điểm đánh giá, từ 1-10',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_mid` (`uid`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Đánh giá truyện tranh';

DROP TABLE IF EXISTS `{prefix}comic_type`;
CREATE TABLE `{prefix}comic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT '0' COMMENT 'ID loại',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tid_mid` (`tid`,`mid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Liên kết loại';

DROP TABLE IF EXISTS `{prefix}comment`;
CREATE TABLE `{prefix}comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `text` varchar(500) DEFAULT '' COMMENT 'Nội dung bình luận',
  `reply_num` int(11) DEFAULT '0' COMMENT 'Tổng số phản hồi',
  `machine` varchar(64) DEFAULT '' COMMENT 'Từ PC, wap, app',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `zan` int(11) DEFAULT '0' COMMENT 'Số lần được đánh giá',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian bình luận',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú bình luận';

DROP TABLE IF EXISTS `{prefix}comment_reply`;
CREATE TABLE `{prefix}comment_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0' COMMENT 'ID bình luận',
  `fid` int(11) DEFAULT '0' COMMENT 'ID cấp trên',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `text` varchar(500) DEFAULT '' COMMENT 'Nội dung bình luận',
  `machine` varchar(64) DEFAULT '' COMMENT 'Từ PC, wap, app',
  `ip` varchar(30) DEFAULT '' COMMENT 'ip',
  `zan` int(11) DEFAULT '0' COMMENT 'Số lần được đánh giá',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian bình luận',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `fid` (`fid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Phản hồi bình luận';

DROP TABLE IF EXISTS `{prefix}comment_zan`;
CREATE TABLE `{prefix}comment_zan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0' COMMENT 'ID bình luận',
  `fid` tinyint(1) DEFAULT '0' COMMENT '0 bình luận, 1 phản hồi',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_cid_fid` (`cid`,`fid`,`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú đánh giá bình luận';

DROP TABLE IF EXISTS `{prefix}drawing`;
CREATE TABLE `{prefix}drawing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dd` varchar(64) DEFAULT '' COMMENT 'Số đơn rút tiền',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người nhận',
  `rmb` decimal(8,2) DEFAULT '0.00' COMMENT 'Số tiền',
  `pid` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái, 0 đang xem xét, 1 thành công, 2 thất bại',
  `msg` varchar(255) DEFAULT '' COMMENT 'Thông tin thất bại',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian nhận tiền',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú rút tiền';

DROP TABLE IF EXISTS `{prefix}fav`;
CREATE TABLE `{prefix}fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian yêu thích',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_mid` (`uid`,`mid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú yêu thích';

DROP TABLE IF EXISTS `{prefix}gift`;
CREATE TABLE `{prefix}gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '' COMMENT 'Tên quà tặng',
  `pic` varchar(255) DEFAULT '' COMMENT 'Ảnh quà tặng',
  `cion` int(11) DEFAULT '0' COMMENT 'Giá quà tặng',
  `text` varchar(255) DEFAULT '' COMMENT 'Giới thiệu quà tặng',
  `xid` int(11) DEFAULT '0' COMMENT 'ID sắp xếp',
  `yid` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái 0 bình thường, 1 ẩn',
  PRIMARY KEY (`id`),
  KEY `xid` (`xid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh sách quà tặng';
DROP TABLE IF EXISTS `{prefix}gift_reward`;
CREATE TABLE `{prefix}gift_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT '0' COMMENT 'ID quà tặng',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `num` int(11) DEFAULT '0' COMMENT 'Số lượng thưởng',
  `cion` int(11) DEFAULT '0' COMMENT 'Tổng số tiền',
  `text` varchar(255) DEFAULT '' COMMENT 'Lời chúc thưởng',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian thưởng',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú quà tặng';
DROP TABLE IF EXISTS `{prefix}income`;
CREATE TABLE `{prefix}income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT '' COMMENT 'Giới thiệu thu nhập',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `cion` int(11) DEFAULT '0' COMMENT 'Số tiền chia sẻ',
  `zcion` int(11) DEFAULT '0' COMMENT 'Tổng số tiền',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian thu nhập',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú thu nhập';
DROP TABLE IF EXISTS `{prefix}links`;
CREATE TABLE `{prefix}links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT 'Tiêu đề',
  `url` varchar(255) DEFAULT '' COMMENT 'Địa chỉ liên kết',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Liên kết hữu ích';
DROP TABLE IF EXISTS `{prefix}message`;
CREATE TABLE `{prefix}message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `name` varchar(64) DEFAULT '' COMMENT 'Tiêu đề',
  `text` varchar(255) DEFAULT '' COMMENT 'Nội dung',
  `did` tinyint(1) DEFAULT '0' COMMENT '0 chưa đọc, 1 đã đọc',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Thông báo người dùng';
DROP TABLE IF EXISTS `{prefix}order`;
CREATE TABLE `{prefix}order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `dd` varchar(64) DEFAULT '' COMMENT 'Mã đơn hàng',
  `rmb` decimal(6,2) DEFAULT '0.00' COMMENT 'Số tiền',
  `pid` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái',
  `text` varchar(255) DEFAULT '' COMMENT 'Ghi chú',
  `zd` varchar(255) DEFAULT '' COMMENT 'Dự kiến tăng số lượng và số lượng',
  `type` varchar(20) DEFAULT '' COMMENT 'Phương thức thanh toán',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian đơn hàng',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú đơn hàng';
DROP TABLE IF EXISTS `{prefix}read`;
CREATE TABLE `{prefix}read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `cid` int(11) DEFAULT '0' COMMENT 'ID chương',
  `pid` int(11) DEFAULT '0' COMMENT 'ID hình ảnh',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_mid` (`uid`,`mid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú đọc';
DROP TABLE IF EXISTS `{prefix}telcode`;
CREATE TABLE `{prefix}telcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) DEFAULT '' COMMENT 'Số điện thoại di động',
  `code` varchar(10) DEFAULT '' COMMENT 'Mã xác nhận',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian gửi',
  PRIMARY KEY (`id`),
  KEY `tel` (`tel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Mã xác nhận điện thoại di động';
DROP TABLE IF EXISTS `{prefix}ticket`;
CREATE TABLE `{prefix}ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT 'ID truyện tranh',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `num` int(11) DEFAULT '0' COMMENT 'Số lượng thưởng',
  `text` varchar(255) DEFAULT '' COMMENT 'Lời chú thưởng',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian thưởng',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú thưởng tháng';
DROP TABLE IF EXISTS `{prefix}type`;
CREATE TABLE `{prefix}type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '' COMMENT 'Tên',
  `fid` int(11) DEFAULT '0' COMMENT 'ID phía trên',
  `zd` varchar(64) DEFAULT '' COMMENT 'Trường',
  `xid` int(11) DEFAULT '0' COMMENT 'ID sắp xếp',
  `cid` tinyint(1) DEFAULT '0' COMMENT '0 nhiều lựa chọn, 1 chọn một',
  PRIMARY KEY (`id`),
  KEY `zd_name` (`name`,`zd`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh sách thể loại truyện tranh';
DROP TABLE IF EXISTS `{prefix}user`;
CREATE TABLE `{prefix}user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signing` tinyint(1) DEFAULT '0' COMMENT 'Có ký kết hay không, 0 chưa, 1 đã',
  `name` varchar(64) DEFAULT '' COMMENT 'Tên người dùng',
  `pass` varchar(64) DEFAULT '' COMMENT 'Mật khẩu',
  `nichen` varchar(64) DEFAULT '' COMMENT 'Biệt danh',
  `tel` varchar(15) DEFAULT '' COMMENT 'Điện thoại di động',
  `pic` varchar(255) DEFAULT '' COMMENT 'Địa chỉ hình đại diện',
  `qq` varchar(20) DEFAULT '' COMMENT 'QQ',
  `email` varchar(128) DEFAULT '' COMMENT 'Email',
  `city` varchar(128) DEFAULT '' COMMENT 'Khu vực',
  `sex` varchar(5) DEFAULT 'Giữ bí mật' COMMENT 'Giới tính',
  `text` varchar(255) DEFAULT '' COMMENT 'Giới thiệu',
  `vip` tinyint(1) DEFAULT '0' COMMENT 'Có VIP hay không',
  `rmb` decimal(6,2) DEFAULT '0.00' COMMENT 'Số tiền',
  `cion` int(11) DEFAULT '0' COMMENT 'Vàng',
  `ticket` int(11) DEFAULT '0' COMMENT 'Thẻ tháng',
  `viptime` int(11) DEFAULT '0' COMMENT 'Thời gian đến hạn VIP',
  `sid` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái, 1 khóa, 0 bình thường',
  `cid` tinyint(1) DEFAULT '0' COMMENT 'Trạng thái xác nhận',
  `realname` varchar(128) DEFAULT '' COMMENT 'Tên thật',
  `idcard` varchar(64) DEFAULT '' COMMENT 'Số chứng minh nhân dân',
  `bank` varchar(128) DEFAULT '' COMMENT 'Ngân hàng nhận tiền',
  `card` varchar(128) DEFAULT '' COMMENT 'Số tài khoản nhận tiền',
  `bankcity` varchar(255) DEFAULT '' COMMENT 'Địa chỉ mở tài khoản',
  `pass_err` int(10) DEFAULT '0' COMMENT 'Số lần nhập sai mật khẩu',
  `rz_type` tinyint(1) DEFAULT '1' COMMENT 'Phương thức xác nhận, 1 cá nhân, 2 doanh nghiệp',
  `rz_msg` varchar(128) DEFAULT '' COMMENT 'Lý do xác nhận thất bại',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian đăng ký',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh sách người dùng';
DROP TABLE IF EXISTS `{prefix}user_oauth`;
CREATE TABLE `{prefix}user_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `oid` varchar(128) DEFAULT '' COMMENT 'ID nền tảng thứ ba',
  `type` varchar(20) DEFAULT '' COMMENT 'Loại',
  `nichen` varchar(64) DEFAULT '' COMMENT 'Biệt danh',
  `pic` varchar(255) DEFAULT '' COMMENT 'Địa chỉ hình đại diện',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `oid_type` (`oid`,`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Đăng nhập bằng cách sử dụng nền tảng thứ ba';
DROP TABLE IF EXISTS `{prefix}book_class`;
CREATE TABLE `{prefix}book_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT 'Tên',
  `yname` varchar(255) DEFAULT '' COMMENT 'Tên tiếng Anh',
  `fid` int(11) DEFAULT '0' COMMENT 'ID phía trên',
  `xid` int(11) DEFAULT '0' COMMENT 'ID sắp xếp',
  `tpl` varchar(64) DEFAULT 'lists.html' COMMENT 'Mẫu',
  PRIMARY KEY (`id`)

) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh mục tiểu thuyết';
DROP TABLE IF EXISTS `{prefix}book`;
CREATE TABLE `{prefix}book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '' COMMENT 'Tiêu đề',
  `yname` varchar(128) DEFAULT '' COMMENT 'Bí danh tiếng Anh',
  `pic` varchar(255) DEFAULT '' COMMENT 'Ảnh bìa dọc',
  `picx` varchar(255) DEFAULT '' COMMENT 'Ảnh bìa ngang',
  `cid` int(11) DEFAULT '0' COMMENT 'ID danh mục',
  `tid` tinyint(1) DEFAULT '0' COMMENT '1 Đề xuất, 0 Không đề xuất',
  `serialize` varchar(20) DEFAULT '' COMMENT 'Trạng thái',
  `author` varchar(64) DEFAULT '' COMMENT 'Tác giả tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `notice` varchar(255) DEFAULT '' COMMENT 'Thông báo',
  `tags` varchar(128) DEFAULT '' COMMENT 'Thẻ Tags',
  `text` varchar(64) DEFAULT '' COMMENT 'Một câu giới thiệu',
  `content` varchar(500) DEFAULT '' COMMENT 'Giới thiệu',
  `text_num` int(11) DEFAULT '0' COMMENT 'Tổng số từ',
  `hits` int(11) DEFAULT '0' COMMENT 'Tổng lượt xem',
  `yhits` int(11) DEFAULT '0' COMMENT 'Lượt xem hàng tháng',
  `zhits` int(11) DEFAULT '0' COMMENT 'Lượt xem hàng tuần',
  `rhits` int(11) DEFAULT '0' COMMENT 'Lượt xem hàng ngày',
  `shits` int(11) DEFAULT '0' COMMENT 'Lượt yêu thích',
  `pay` tinyint(1) DEFAULT '0' COMMENT 'Có phí hay không, 1 vàng, 2 VIP',
  `cion` int(11) DEFAULT '0' COMMENT 'Tổng số tiền thưởng',
  `ticket` int(11) DEFAULT '0' COMMENT 'Tổng số phiếu tháng',
  `sid` tinyint(1) DEFAULT '0' COMMENT '0 Bình thường, 1 Bị khóa',
  `nums` int(11) DEFAULT '0' COMMENT 'Tổng số chương',
  `score` decimal(2,1) DEFAULT '9.8' COMMENT 'Tổng điểm',
  `did` int(11) DEFAULT '0' COMMENT 'ID nguồn thu thập',
  `ly` varchar(64) DEFAULT '' COMMENT 'Định danh nguồn thu thập',
  `yid` tinyint(1) DEFAULT '0' COMMENT '0 Bình thường, 1 Đang chờ xác nhận',
  `msg` varchar(128) DEFAULT '' COMMENT 'Lý do chưa xác nhận',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian thêm vào kho',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `serialize` (`serialize`) USING BTREE,
  KEY `hits` (`hits`) USING BTREE,
  KEY `yhits` (`yhits`) USING BTREE,
  KEY `zhits` (`zhits`) USING BTREE,
  KEY `rhits` (`rhits`) USING BTREE,
  KEY `shits` (`shits`) USING BTREE,
  KEY `cion` (`cion`) USING BTREE,
  KEY `yid` (`yid`) USING BTREE,
  KEY `text_num` (`text_num`) USING BTREE,
  KEY `addtime` (`addtime`) USING BTREE,
  KEY `pay` (`pay`) USING BTREE,
  KEY `ticket` (`ticket`) USING BTREE,
  KEY `score` (`score`) USING BTREE,
  KEY `tags` (`tags`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Danh sách tiểu thuyết';
DROP TABLE IF EXISTS `{prefix}book_buy`;
CREATE TABLE `{prefix}book_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `cid` int(11) DEFAULT '0' COMMENT 'ID chương',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `auto` tinyint(1) DEFAULT '0' COMMENT '1 Bật tự động mua',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_bid_cid` (`uid`,`bid`,`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ghi chú mua tiểu thuyết';
DROP TABLE IF EXISTS `{prefix}book_fav`;
CREATE TABLE `{prefix}book_fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian yêu thích',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_bid` (`uid`,`bid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú yêu thích tiểu thuyết';
DROP TABLE IF EXISTS `{prefix}book_read`;
CREATE TABLE `{prefix}book_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `cid` int(11) DEFAULT '0' COMMENT 'ID chương',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_bid` (`uid`,`bid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Ghi chú đọc tiểu thuyết';
DROP TABLE IF EXISTS `{prefix}book_score`;
CREATE TABLE `{prefix}book_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT '0' COMMENT 'ID tiểu thuyết',
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `pf` tinyint(2) DEFAULT '0' COMMENT 'Điểm đánh giá, 1-10',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_bid` (`uid`,`bid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Điểm đánh giá tiểu thuyết';
DROP TABLE IF EXISTS `{prefix}task`;
CREATE TABLE `{prefix}task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yid` int(11) DEFAULT '0' COMMENT 'Đóng hay mở: 0 Mở, 1 Đóng',
  `name` varchar(64) DEFAULT '' COMMENT 'Tiêu đề nhiệm vụ',
  `text` varchar(64) DEFAULT '' COMMENT 'Nội dung nhiệm vụ',
  `cion` int(11) DEFAULT '0' COMMENT 'Phần thưởng vàng',
  `vip` int(11) DEFAULT '0' COMMENT 'Phần thưởng số ngày VIP',
  `daynum` int(11) DEFAULT '0' COMMENT 'Số lượng giới hạn thưởng hàng ngày, 0 không giới hạn',
  PRIMARY KEY (`id`),
  KEY `yid` (`yid`) USING BTREE

) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Nhiệm vụ hàng ngày của ứng dụng';
DROP TABLE IF EXISTS `{prefix}task_list`;
CREATE TABLE `{prefix}task_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `tid` int(11) DEFAULT '0' COMMENT 'ID nhiệm vụ',
  `vip` int(11) DEFAULT '0' COMMENT 'Số ngày VIP thưởng',
  `cion` int(11) DEFAULT '0' COMMENT 'Số vàng nhận được',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  KEY `addtime` (`addtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Bảng ghi nhiệm vụ ứng dụng';
DROP TABLE IF EXISTS `{prefix}user_invite`;
CREATE TABLE `{prefix}user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `inviteid` int(11) DEFAULT '0' COMMENT 'ID người mời',
  `deviceid` varchar(128) DEFAULT '' COMMENT 'ID thiết bị',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian mời',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `inviteid` (`inviteid`) USING BTREE,
  KEY `deviceid` (`deviceid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Bảng ghi mời';
DROP TABLE IF EXISTS `{prefix}user_app`;
CREATE TABLE `{prefix}user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'ID người dùng',
  `facility` varchar(20) DEFAULT '' COMMENT 'Nguồn',
  `deviceid` varchar(128) DEFAULT '' COMMENT 'ID thiết bị',
  `addtime` int(11) DEFAULT '0' COMMENT 'Thời gian cài đặt',
  `uptime` int(11) DEFAULT '0' COMMENT 'Thời gian hoạt động',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  UNIQUE KEY `facility_deviceid` (`facility`,`deviceid`),
  KEY `addtime` (`addtime`) USING BTREE,
  KEY `uptime` (`uptime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Bảng thiết bị ứng dụng';
DROP TABLE IF EXISTS `{prefix}user_app_nums`;
CREATE TABLE `{prefix}user_app_nums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `android_nums` int(11) DEFAULT '0' COMMENT 'Số lượng người dùng Android hàng ngày',
  `android_add` int(11) DEFAULT '0' COMMENT 'Số lượng người dùng Android mới hàng ngày',
  `ios_nums` int(11) DEFAULT '0' COMMENT 'Số lượng người dùng iOS hàng ngày',
  `ios_add` int(11) DEFAULT '0' COMMENT 'Số lượng người dùng iOS mới hàng ngày',
  `date` int(11) DEFAULT '0' COMMENT 'Ngày',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Bảng thống kê ứng dụng';
