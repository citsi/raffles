-- phpMyAdmin SQL Dump
-- version 4.3.13
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-07-02 10:31:09
-- 服务器版本： 5.5.33
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `raffles`
--

-- --------------------------------------------------------

--
-- 表的结构 `raffles_admin`
--

CREATE TABLE IF NOT EXISTS `raffles_admin` (
  `id` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `admin_name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `key` varchar(50) DEFAULT NULL,
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  `start_time` datetime DEFAULT NULL COMMENT '启用时间',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `last_ip` varchar(30) DEFAULT NULL COMMENT '最后登录IP',
  `last_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员用户表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_admin_role`
--

CREATE TABLE IF NOT EXISTS `raffles_admin_role` (
  `id` int(11) unsigned NOT NULL,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `rights` text COMMENT '权限',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台角色分组表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_article`
--

CREATE TABLE IF NOT EXISTS `raffles_article` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(250) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `category_id` int(11) unsigned NOT NULL COMMENT '分类ID',
  `time` datetime NOT NULL COMMENT '发布时间',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `visiblity` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0:不显示,1:显示',
  `top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_article_category`
--

CREATE TABLE IF NOT EXISTS `raffles_article_category` (
  `id` int(11) unsigned NOT NULL,
  `catename` varchar(50) NOT NULL COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父分类',
  `issys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统分类',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_attribute`
--

CREATE TABLE IF NOT EXISTS `raffles_attribute` (
  `id` int(11) unsigned NOT NULL COMMENT '属性ID',
  `model_id` int(11) unsigned DEFAULT NULL COMMENT '模型ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '输入控件的类型,1:单选,2:复选,3:下拉',
  `attr_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` text COMMENT '属性值(逗号分隔)',
  `search` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支持搜索0不支持1支持'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='属性表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_brand`
--

CREATE TABLE IF NOT EXISTS `raffles_brand` (
  `id` mediumint(11) NOT NULL COMMENT '索引ID',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `url` varchar(255) DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL COMMENT '类别名称',
  `logo` varchar(100) DEFAULT NULL COMMENT '图片',
  `sort` mediumint(8) unsigned DEFAULT '0' COMMENT '排序',
  `recommend` tinyint(2) DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `company_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `apply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用，系统后台默认为1',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_brand_channel`
--

CREATE TABLE IF NOT EXISTS `raffles_brand_channel` (
  `id` int(11) unsigned NOT NULL COMMENT 'ID',
  `brand_id` int(10) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `channel_id` int(11) NOT NULL DEFAULT '0' COMMENT '频道ID',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='频道推荐表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_category`
--

CREATE TABLE IF NOT EXISTS `raffles_category` (
  `id` int(11) unsigned NOT NULL COMMENT '分类ID',
  `catename` varchar(50) NOT NULL COMMENT '分类名称',
  `tags` varchar(255) DEFAULT NULL,
  `parent_id` int(11) unsigned NOT NULL COMMENT '父分类ID',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页是否显示 1显示 0 不显示',
  `model_id` int(11) unsigned NOT NULL COMMENT '默认模型ID',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO 关键词',
  `descript` varchar(255) DEFAULT NULL COMMENT 'SEO 描述',
  `title` varchar(255) DEFAULT NULL COMMENT 'SEO 标题 title',
  `status` tinyint(10) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_category_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_category_goods` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `category_id` int(11) unsigned NOT NULL COMMENT '商品分类ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品扩展分类表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_channel`
--

CREATE TABLE IF NOT EXISTS `raffles_channel` (
  `id` int(11) unsigned NOT NULL COMMENT '频道ID',
  `channelname` varchar(255) NOT NULL COMMENT '频道名称',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '频道状态',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='频道表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_channel_category`
--

CREATE TABLE IF NOT EXISTS `raffles_channel_category` (
  `id` int(11) unsigned NOT NULL COMMENT 'ID',
  `channel_id` int(10) NOT NULL DEFAULT '0' COMMENT '频道ID',
  `cate_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='频道分类关联表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_collection_doc`
--

CREATE TABLE IF NOT EXISTS `raffles_collection_doc` (
  `id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单号',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `time` datetime NOT NULL COMMENT '时间',
  `payment_id` int(11) NOT NULL COMMENT '支付方式ID',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态，0:准备，1:支付成功',
  `note` text COMMENT '收款备注',
  `if_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未删除 1:删除',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收款单';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_commend_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_commend_goods` (
  `id` int(11) unsigned NOT NULL,
  `commend_id` int(11) unsigned NOT NULL COMMENT '推荐类型ID 1:最新商品 2:特价商品 3:热卖排行 4:推荐商品',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐类商品';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_comment`
--

CREATE TABLE IF NOT EXISTS `raffles_comment` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `order_no` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `time` datetime NOT NULL COMMENT '购买时间',
  `contents` text COMMENT '评论内容',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `point` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论的分数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论状态：0：未评论 1:已评论',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品评论表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_complain`
--

CREATE TABLE IF NOT EXISTS `raffles_complain` (
  `id` int(11) NOT NULL COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_count` int(11) NOT NULL COMMENT '订单商品数量',
  `complain_goods_count` int(11) NOT NULL COMMENT '投诉商品数量',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) NOT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) NOT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) NOT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) NOT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) NOT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) NOT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) NOT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) NOT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) NOT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) NOT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) NOT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) NOT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) NOT NULL COMMENT '最终处理人id',
  `complain_type` tinyint(4) NOT NULL COMMENT '投诉类型(1-买家投诉/2-卖家投诉)',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投诉是否通过平台审批(1未通过/2通过)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_complain_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_complain_goods` (
  `id` int(11) NOT NULL COMMENT '投诉商品序列id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `spec_id` int(11) NOT NULL COMMENT '规格id',
  `spec_info` varchar(50) NOT NULL DEFAULT '' COMMENT '规格描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品图片',
  `evaluation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价类型: 1好评 2中评 3差评',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '评论',
  `complain_message` varchar(100) NOT NULL COMMENT '被投诉商品的问题描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_complain_subject`
--

CREATE TABLE IF NOT EXISTS `raffles_complain_subject` (
  `id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '投诉主题描述',
  `complain_subject_type` tinyint(4) NOT NULL COMMENT '投诉主题类型(1-买家/2-卖家)',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态(1-有效/2-失效)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉主题表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_complain_talk`
--

CREATE TABLE IF NOT EXISTS `raffles_complain_talk` (
  `id` int(11) NOT NULL COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉对话表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_coupon`
--

CREATE TABLE IF NOT EXISTS `raffles_coupon` (
  `id` int(11) NOT NULL COMMENT 'id',
  `coupon_title` varchar(255) NOT NULL COMMENT '优惠券名称',
  `coupon_type` enum('1','2') DEFAULT NULL,
  `coupon_pic` varchar(255) NOT NULL,
  `coupon_desc` varchar(255) NOT NULL COMMENT '优惠券描述',
  `coupon_start_date` int(10) NOT NULL COMMENT '优惠券开始日期',
  `coupon_end_date` int(10) NOT NULL COMMENT '优惠券截止日期',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `coupon_limit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额限制',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `coupon_state` enum('1','2') DEFAULT '1' COMMENT '上架与下架状态',
  `coupon_storage` int(11) NOT NULL DEFAULT '0' COMMENT '总共数量',
  `coupon_usage` int(11) NOT NULL DEFAULT '0' COMMENT '使用数量',
  `coupon_lock` enum('1','2') NOT NULL DEFAULT '1' COMMENT '是否锁定',
  `coupon_add_date` int(10) NOT NULL COMMENT '添加日期',
  `coupon_class_id` int(11) NOT NULL COMMENT '分类',
  `coupon_click` int(11) NOT NULL DEFAULT '1' COMMENT '点击次数',
  `coupon_print_style` varchar(255) NOT NULL DEFAULT '4STYLE' COMMENT '4STYLE STANDS FOR 4 COUPONS PER A4 PAGE, AND 8STYLE STANDS FOR 8 COUPONS PER A4 PAGE',
  `coupon_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不推荐 1推荐到首页',
  `coupon_allowstate` tinyint(1) unsigned DEFAULT '1' COMMENT '审核状态 0为待审核 1已通过 2未通过',
  `coupon_allowremark` varchar(255) DEFAULT NULL COMMENT '审核备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_coupon_class`
--

CREATE TABLE IF NOT EXISTS `raffles_coupon_class` (
  `id` int(11) NOT NULL COMMENT '优惠券分类id',
  `class_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父类id',
  `class_name` varchar(100) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `class_show` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券分类';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_credit_setting`
--

CREATE TABLE IF NOT EXISTS `raffles_credit_setting` (
  `id` int(11) NOT NULL COMMENT '鑷?姩缂栧彿',
  `name` varchar(50) NOT NULL COMMENT '鍔ㄤ綔',
  `alias` varchar(255) NOT NULL COMMENT '鍚嶇О',
  `info` text NOT NULL COMMENT '璇存槑',
  `score` int(11) DEFAULT NULL COMMENT '绉?垎鍊',
  `experience` int(11) DEFAULT NULL COMMENT '缁忛獙鍊',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_credit_user_log`
--

CREATE TABLE IF NOT EXISTS `raffles_credit_user_log` (
  `id` int(11) NOT NULL COMMENT '鑷?姩缂栧彿',
  `cuid` int(11) NOT NULL COMMENT '鐢ㄦ埛灞炴?鑳藉姏ID',
  `name` varchar(50) NOT NULL COMMENT '鍔ㄤ綔',
  `alias` varchar(255) NOT NULL COMMENT '鍚嶇О',
  `info` text NOT NULL COMMENT '璇存槑',
  `score` int(11) DEFAULT NULL COMMENT '绉?垎鍊',
  `experience` int(11) DEFAULT NULL COMMENT '缁忛獙鍊',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_delivery_doc`
--

CREATE TABLE IF NOT EXISTS `raffles_delivery_doc` (
  `id` int(11) unsigned NOT NULL COMMENT '发货单ID',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `admin_id` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `name` varchar(255) NOT NULL COMMENT '收货人',
  `postcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `telphone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `country` int(11) unsigned DEFAULT NULL COMMENT '国ID',
  `province` int(11) unsigned NOT NULL COMMENT '省ID',
  `city` int(11) unsigned NOT NULL COMMENT '市ID',
  `area` int(11) unsigned NOT NULL COMMENT '区ID',
  `address` varchar(250) NOT NULL COMMENT '收货地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `time` datetime NOT NULL COMMENT '创建时间',
  `freight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `delivery_code` varchar(255) NOT NULL COMMENT '物流单号',
  `delivery_type` varchar(255) NOT NULL COMMENT '物流方式',
  `note` text COMMENT '管理员添加的备注信息',
  `if_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货单';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_delivery_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_delivery_goods` (
  `id` int(11) unsigned NOT NULL,
  `delivery_id` int(11) unsigned NOT NULL COMMENT '发货单ID',
  `goods_id` int(11) unsigned DEFAULT NULL COMMENT '商品ID',
  `product_id` int(11) unsigned DEFAULT NULL COMMENT '货品id',
  `goods_nums` int(11) DEFAULT NULL COMMENT '货品数量',
  `time` datetime NOT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货清单';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_discussion`
--

CREATE TABLE IF NOT EXISTS `raffles_discussion` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `contents` text COMMENT '评论内容',
  `is_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态,0未审核 1已审核',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品讨论表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_email_registry`
--

CREATE TABLE IF NOT EXISTS `raffles_email_registry` (
  `id` int(11) unsigned NOT NULL,
  `email` varchar(80) NOT NULL COMMENT 'Email'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Email订阅表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_evaluate_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_evaluate_goods` (
  `id` int(11) NOT NULL COMMENT '评价ID',
  `geval_orderid` int(11) NOT NULL COMMENT '订单表自增ID',
  `geval_orderno` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `geval_ordergoodsid` int(11) NOT NULL COMMENT '订单商品表编号',
  `geval_goodsid` int(11) NOT NULL COMMENT '商品表编号',
  `geval_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `geval_specinfo` varchar(50) DEFAULT NULL COMMENT '规格描述',
  `geval_goodsprice` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `geval_scores` tinyint(1) NOT NULL COMMENT '1代表好评 0代表中评 -1代表差评',
  `geval_content` varchar(255) DEFAULT NULL COMMENT '信誉评价内容',
  `geval_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `geval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `geval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `geval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `geval_frommemberid` int(11) NOT NULL COMMENT '评价人编号',
  `geval_frommembername` varchar(100) NOT NULL COMMENT '评价人名称',
  `geval_tomemberid` int(11) NOT NULL COMMENT '接收人编号',
  `geval_tomembername` varchar(100) NOT NULL COMMENT '接收人用户名',
  `geval_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价信息的状态 0为正常 1为禁止显示',
  `geval_remark` varchar(255) DEFAULT NULL COMMENT '管理员对评价的处理备注',
  `geval_explain` varchar(255) DEFAULT NULL COMMENT '解释内容',
  `geval_bothstate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评价互评状态 1单方评价2双方互评',
  `geval_showtime` int(11) NOT NULL COMMENT '评价展示时间统计等都以该值为准',
  `geval_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评价类型 1买家评价 2卖家评价'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='信誉评价表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_evaluate_goodsstat`
--

CREATE TABLE IF NOT EXISTS `raffles_evaluate_goodsstat` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `gevalstat_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `gevalstat_type` tinyint(1) NOT NULL COMMENT '统计类型 1最近一周 2最近一月 3最近半年 4半年以前 5总记录',
  `gevalstat_level1num` int(11) NOT NULL DEFAULT '0' COMMENT '好评次数',
  `gevalstat_level2num` int(11) NOT NULL DEFAULT '0' COMMENT '中评次数',
  `gevalstat_level3num` int(11) NOT NULL DEFAULT '0' COMMENT '差评次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品评价统计表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_evaluate_store`
--

CREATE TABLE IF NOT EXISTS `raffles_evaluate_store` (
  `id` int(11) NOT NULL COMMENT '评价ID',
  `seval_orderid` int(11) NOT NULL COMMENT '订单ID',
  `seval_orderno` varchar(100) NOT NULL COMMENT '订单编号',
  `seval_type` tinyint(1) NOT NULL COMMENT '评价类型  1表示宝贝与描述相符度 2表示卖家服务态度 3表示卖家发货速度',
  `seval_scores` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价分数',
  `seval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `seval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `seval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `seval_memberid` int(11) NOT NULL COMMENT '买家编号',
  `seval_membername` varchar(100) NOT NULL COMMENT '买家名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺评分表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_evaluate_storestat`
--

CREATE TABLE IF NOT EXISTS `raffles_evaluate_storestat` (
  `id` int(11) NOT NULL COMMENT '统计ID',
  `evalstat_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `evalstat_type` tinyint(1) NOT NULL COMMENT '统计类型 1表示宝贝与描述相符度 2表示卖家服务态度 3表示卖家发货速度',
  `evalstat_average` float NOT NULL DEFAULT '0' COMMENT '平均分',
  `evalstat_timesnum` int(11) NOT NULL DEFAULT '0' COMMENT '评价次数',
  `evalstat_onenum` int(11) NOT NULL DEFAULT '0' COMMENT '一星次数',
  `evalstat_twonum` int(11) NOT NULL DEFAULT '0' COMMENT '二星次数',
  `evalstat_threenum` int(11) NOT NULL DEFAULT '0' COMMENT '三星次数',
  `evalstat_fournum` int(11) NOT NULL DEFAULT '0' COMMENT '四星次数',
  `evalstat_fivenum` int(11) NOT NULL DEFAULT '0' COMMENT '五星次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺评价统计表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_expresswaybill`
--

CREATE TABLE IF NOT EXISTS `raffles_expresswaybill` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(80) NOT NULL COMMENT '快递单模板名字',
  `config` text COMMENT '序列化的快递单结构数据',
  `background` varchar(255) DEFAULT NULL COMMENT '背景图片路径',
  `width` smallint(5) unsigned DEFAULT '900' COMMENT '背景图片路径',
  `height` smallint(5) unsigned DEFAULT '600' COMMENT '背景图片路径',
  `is_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1关闭,0正常'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递单模板';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_favorite`
--

CREATE TABLE IF NOT EXISTS `raffles_favorite` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `time` datetime NOT NULL COMMENT '收藏时间',
  `summary` varchar(255) DEFAULT NULL COMMENT '备注',
  `cat_id` int(11) unsigned NOT NULL COMMENT '商品分类'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_find_password`
--

CREATE TABLE IF NOT EXISTS `raffles_find_password` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `hash` char(32) NOT NULL COMMENT 'hash值',
  `addtime` int(11) NOT NULL COMMENT '申请找回的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='找回密码';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_freight_company`
--

CREATE TABLE IF NOT EXISTS `raffles_freight_company` (
  `id` int(11) unsigned NOT NULL,
  `freight_type` varchar(255) NOT NULL COMMENT '货运类型',
  `freight_name` varchar(255) NOT NULL COMMENT '货运公司名称',
  `url` varchar(255) NOT NULL COMMENT '网址',
  `sort` smallint(5) NOT NULL DEFAULT '99' COMMENT '排序',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未删除1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货运公司';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_goods` (
  `id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_no` varchar(20) NOT NULL COMMENT '商品的货号',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `model_id` int(11) unsigned NOT NULL COMMENT '模型ID',
  `sell_price` decimal(15,2) NOT NULL COMMENT '销售价格',
  `market_price` decimal(15,2) DEFAULT NULL COMMENT '市场价格',
  `cost_price` decimal(15,2) DEFAULT NULL COMMENT '成本价格',
  `up_time` datetime DEFAULT NULL COMMENT '上架时间',
  `down_time` datetime DEFAULT NULL COMMENT '下架时间',
  `add_time` datetime NOT NULL COMMENT '创建时间',
  `store_nums` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `img` varchar(255) DEFAULT NULL COMMENT '原图',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除 0未删除 1已删除 2下架',
  `content` text COMMENT '商品描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词',
  `description` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  `search_words` text COMMENT '产品搜索词库,逗号分隔',
  `weight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `unit` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `visit` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `favorite` int(11) NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `sort` smallint(5) NOT NULL DEFAULT '99' COMMENT '排序',
  `spec_array` text COMMENT '序列化存储规格,key值为规则ID，value为此商品具有的规格值',
  `exp` smallint(5) NOT NULL DEFAULT '0' COMMENT '经验值',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_goods_attribute`
--

CREATE TABLE IF NOT EXISTS `raffles_goods_attribute` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `attribute_id` int(11) unsigned DEFAULT NULL COMMENT '属性ID',
  `attribute_value` varchar(255) DEFAULT NULL COMMENT '属性值',
  `spec_id` int(11) unsigned DEFAULT NULL COMMENT '规格ID',
  `spec_value` varchar(255) DEFAULT NULL COMMENT '规格值',
  `model_id` int(11) unsigned DEFAULT NULL COMMENT '模型ID',
  `order` smallint(5) NOT NULL DEFAULT '99' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='属性值表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_goods_car`
--

CREATE TABLE IF NOT EXISTS `raffles_goods_car` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `content` text COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_goods_group`
--

CREATE TABLE IF NOT EXISTS `raffles_goods_group` (
  `id` int(10) unsigned NOT NULL COMMENT '团购ID',
  `group_name` varchar(255) NOT NULL COMMENT '活动名称',
  `template_id` int(10) unsigned NOT NULL COMMENT '团购活动编号',
  `template_name` varchar(50) NOT NULL COMMENT '团购活动名称',
  `group_help` varchar(255) DEFAULT NULL COMMENT '活动说明',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_price` varchar(255) NOT NULL COMMENT '规格价格',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `limit_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '限制类型 1.按照人数 2.按照件数',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `buyer_count` int(10) unsigned NOT NULL COMMENT '已购买人数',
  `def_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '已订购数',
  `min_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '最小团购数量',
  `sale_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '每人限购数量',
  `max_num` int(10) NOT NULL DEFAULT '0' COMMENT '最高件数',
  `group_intro` text COMMENT '本团介绍',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '团购状态 1.未发布 2.已取消 3.进行中 4.已完成 5.已结束',
  `recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发布 1.未发布 2.已发布',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `cancel_intro` varchar(255) DEFAULT NULL COMMENT '取消说明',
  `class_id` int(10) unsigned NOT NULL COMMENT '团购类别编号',
  `area_id` int(10) unsigned NOT NULL COMMENT '团购地区编号',
  `group_pic` varchar(100) NOT NULL COMMENT '团购图片',
  `rebate` decimal(10,2) NOT NULL COMMENT '折扣率',
  `remark` varchar(255) NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_goods_photo`
--

CREATE TABLE IF NOT EXISTS `raffles_goods_photo` (
  `id` char(32) NOT NULL COMMENT '图片的md5值',
  `img` varchar(255) DEFAULT NULL COMMENT '原始图片路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_goods_photo_relation`
--

CREATE TABLE IF NOT EXISTS `raffles_goods_photo_relation` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `photo_id` char(32) NOT NULL DEFAULT '' COMMENT '图片ID,图片的md5值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册商品关系表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_groupbuy_area`
--

CREATE TABLE IF NOT EXISTS `raffles_groupbuy_area` (
  `area_id` int(10) unsigned NOT NULL COMMENT '地区编号',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(10) unsigned NOT NULL COMMENT '父地区编号',
  `area_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL COMMENT '深度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购地区表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_groupbuy_class`
--

CREATE TABLE IF NOT EXISTS `raffles_groupbuy_class` (
  `id` int(10) unsigned NOT NULL COMMENT '类别编号',
  `class_name` varchar(20) NOT NULL COMMENT '类别名称',
  `class_parent_id` int(10) unsigned NOT NULL COMMENT '父类别编号',
  `sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `deep` tinyint(1) unsigned NOT NULL COMMENT '深度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购类别表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_groupbuy_price_range`
--

CREATE TABLE IF NOT EXISTS `raffles_groupbuy_price_range` (
  `id` int(10) unsigned NOT NULL COMMENT '价格区间编号',
  `range_name` varchar(20) NOT NULL COMMENT '区间名称',
  `range_start` int(10) unsigned NOT NULL COMMENT '区间下限',
  `range_end` int(10) unsigned NOT NULL COMMENT '区间上限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购价格区间表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_groupbuy_template`
--

CREATE TABLE IF NOT EXISTS `raffles_groupbuy_template` (
  `id` int(10) unsigned NOT NULL COMMENT '团购活动编号',
  `template_name` varchar(50) NOT NULL COMMENT '团购活动能够名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `join_end_time` int(10) unsigned NOT NULL COMMENT '活动报名截至时间',
  `state` tinyint(1) unsigned NOT NULL COMMENT '状态(1-可报名/2-已过期)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购活动表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_group_price`
--

CREATE TABLE IF NOT EXISTS `raffles_group_price` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '产品ID',
  `product_id` int(11) unsigned DEFAULT NULL COMMENT '货品ID',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组ID',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '价格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录某件商品对于某组会员的价格关系表，优先权大于组设定的折扣率。';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_guide`
--

CREATE TABLE IF NOT EXISTS `raffles_guide` (
  `order` smallint(5) unsigned NOT NULL COMMENT '排序',
  `name` varchar(255) NOT NULL COMMENT '导航名字',
  `link` varchar(255) NOT NULL COMMENT '链接地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页导航栏';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_help`
--

CREATE TABLE IF NOT EXISTS `raffles_help` (
  `id` int(11) unsigned NOT NULL,
  `cat_id` int(11) unsigned NOT NULL COMMENT '帮助分类，如果为0则代表着是下面的帮助单页',
  `sort` smallint(5) NOT NULL DEFAULT '99' COMMENT '顺序',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `dateline` int(11) NOT NULL COMMENT '发布时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帮助';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_help_category`
--

CREATE TABLE IF NOT EXISTS `raffles_help_category` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(10) NOT NULL COMMENT '标题',
  `sort` smallint(5) NOT NULL COMMENT '顺序',
  `position_left` tinyint(1) NOT NULL COMMENT '是否在帮助内容、列表页面的左侧显示',
  `position_foot` tinyint(1) NOT NULL COMMENT '是否在整站页面下方显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帮助分类';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_keyword`
--

CREATE TABLE IF NOT EXISTS `raffles_keyword` (
  `word` varchar(15) NOT NULL COMMENT '关键词',
  `goods_nums` int(11) NOT NULL DEFAULT '1' COMMENT '产品数量',
  `hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为热门',
  `order` smallint(5) NOT NULL DEFAULT '99' COMMENT '关键词排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关键词';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_log_error`
--

CREATE TABLE IF NOT EXISTS `raffles_log_error` (
  `id` int(11) unsigned NOT NULL,
  `file` varchar(200) NOT NULL COMMENT '文件',
  `line` smallint(5) unsigned NOT NULL COMMENT '出错文件行数',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `datetime` datetime NOT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='错误日志表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_log_operation`
--

CREATE TABLE IF NOT EXISTS `raffles_log_operation` (
  `id` int(11) unsigned NOT NULL,
  `author` varchar(80) DEFAULT NULL COMMENT '操作人员',
  `action` varchar(200) DEFAULT NULL COMMENT '动作',
  `content` text COMMENT '内容',
  `datetime` datetime NOT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志操作记录';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_log_sql`
--

CREATE TABLE IF NOT EXISTS `raffles_log_sql` (
  `id` int(11) unsigned NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '执行的SQL语句',
  `runtime` decimal(15,2) unsigned NOT NULL COMMENT '语句执行时间(秒)',
  `datetime` datetime NOT NULL COMMENT '发生的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SQL日志记录';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_merch_ship_info`
--

CREATE TABLE IF NOT EXISTS `raffles_merch_ship_info` (
  `id` int(11) unsigned NOT NULL,
  `ship_name` varchar(255) NOT NULL COMMENT '发货点名称',
  `ship_user_name` varchar(255) NOT NULL COMMENT '发货人姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0:女 1:男',
  `country` int(11) DEFAULT NULL COMMENT '国id',
  `province` int(11) NOT NULL COMMENT '省id',
  `city` int(11) NOT NULL COMMENT '市id',
  `area` int(11) NOT NULL COMMENT '地区id',
  `postcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) NOT NULL COMMENT '具体地址',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `telphone` varchar(20) DEFAULT NULL COMMENT '电话',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为默认地址，0则不是',
  `note` text COMMENT '备注',
  `addtime` datetime NOT NULL COMMENT '保存时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为删除，1为显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家发货点信息';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_message`
--

CREATE TABLE IF NOT EXISTS `raffles_message` (
  `id` int(11) NOT NULL COMMENT '短消息索引id',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) DEFAULT NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) DEFAULT NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为私信、1为系统消息、2为留言',
  `read_member_id` varchar(1000) DEFAULT NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) DEFAULT NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) DEFAULT NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) DEFAULT NULL COMMENT '接收人用户名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短消息';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_model`
--

CREATE TABLE IF NOT EXISTS `raffles_model` (
  `id` int(11) unsigned NOT NULL COMMENT '模型ID',
  `name` varchar(50) NOT NULL COMMENT '模型名称',
  `spec_ids` text COMMENT '规格ID逗号分隔'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_msg_template`
--

CREATE TABLE IF NOT EXISTS `raffles_msg_template` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '模板名称',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '模板内容',
  `variable` varchar(255) DEFAULT NULL COMMENT '模板中的变量标签'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息模板表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_notify_registry`
--

CREATE TABLE IF NOT EXISTS `raffles_notify_registry` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'emaill',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `register_time` datetime NOT NULL COMMENT '登记时间',
  `notify_time` datetime DEFAULT NULL COMMENT '通知时间',
  `notify_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未通知1已通知'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='到货通知表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_oauth`
--

CREATE TABLE IF NOT EXISTS `raffles_oauth` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(80) NOT NULL COMMENT '名称',
  `config` text COMMENT '配置信息',
  `file` varchar(80) NOT NULL COMMENT '接口文件名称',
  `description` varchar(80) DEFAULT NULL COMMENT '描述',
  `is_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭;0开启,1关闭',
  `logo` varchar(80) DEFAULT NULL COMMENT 'logo'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='认证方案';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_oauth_user`
--

CREATE TABLE IF NOT EXISTS `raffles_oauth_user` (
  `id` int(11) unsigned NOT NULL,
  `oauth_user_id` varchar(80) NOT NULL COMMENT '第三方平台的用户唯一标识',
  `oauth_id` smallint(5) unsigned NOT NULL COMMENT '第三方平台id',
  `user_id` int(11) unsigned NOT NULL COMMENT '系统内部的用户id',
  `datetime` datetime NOT NULL COMMENT '绑定时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='oauth开发平台绑定用户表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_online_recharge`
--

CREATE TABLE IF NOT EXISTS `raffles_online_recharge` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `recharge_no` varchar(20) NOT NULL COMMENT '充值单号',
  `account` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `time` datetime NOT NULL COMMENT '时间',
  `payment_name` varchar(80) NOT NULL COMMENT '充值方式名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值状态 0:未成功 1:充值成功'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线充值表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_order`
--

CREATE TABLE IF NOT EXISTS `raffles_order` (
  `id` int(11) unsigned NOT NULL,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `pay_type` int(11) NOT NULL COMMENT '支付方式ID,当为0时表示货到付款',
  `distribution` int(11) DEFAULT NULL COMMENT '配送ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '订单状态1:生成订单,2：确认订单,3取消订单,4作废订单,5完成订单',
  `pay_status` tinyint(1) DEFAULT '0' COMMENT '支付状态 0：未支付，1：已支付，2：退款',
  `distribution_status` tinyint(1) DEFAULT '0' COMMENT '配送状态0：未发送，1：已发送',
  `accept_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `postcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `telphone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `country` int(11) DEFAULT NULL COMMENT '国ID',
  `province` int(11) DEFAULT NULL COMMENT '省ID',
  `city` int(11) DEFAULT NULL COMMENT '市ID',
  `area` int(11) DEFAULT NULL COMMENT '区ID',
  `address` varchar(250) DEFAULT NULL COMMENT '收货地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `payable_amount` decimal(15,2) DEFAULT '0.00' COMMENT '应付商品总金额',
  `real_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '实付商品总金额',
  `payable_freight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '总运费金额',
  `real_freight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '实付运费',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `completion_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `invoice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发票：0不索要1索要',
  `postscript` varchar(255) DEFAULT NULL COMMENT '用户附言',
  `note` text COMMENT '管理员备注',
  `if_del` tinyint(1) DEFAULT '0' COMMENT '是否删除1为删除',
  `insured` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '保价',
  `if_insured` tinyint(1) DEFAULT '0' COMMENT '是否保价0:不保价，1保价',
  `pay_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '支付手续费',
  `invoice_title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `taxes` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '税金',
  `promotions` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '促销优惠金额',
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '订单折扣或涨价',
  `order_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `if_print` varchar(255) DEFAULT NULL COMMENT '已打印的类型,类型的代码以逗号进行分割; shop购物单,pick配货单,merge购物和配货,express快递单',
  `prop` varchar(255) DEFAULT NULL COMMENT '使用的道具id',
  `accept_time` varchar(80) DEFAULT NULL COMMENT '用户收货时间',
  `exp` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '增加的经验',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '增加的积分',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0普通订单,1团购订单,2限时抢购'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_order_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_order_goods` (
  `id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL COMMENT '订单ID',
  `goods_id` int(11) unsigned DEFAULT NULL COMMENT '商品ID',
  `img` varchar(255) NOT NULL COMMENT '商品图片',
  `product_id` int(11) DEFAULT NULL COMMENT '货品ID',
  `goods_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `real_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `goods_nums` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_weight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `goods_array` text COMMENT '商品和货品名称name和规格value串json数据格式'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_order_log`
--

CREATE TABLE IF NOT EXISTS `raffles_order_log` (
  `id` int(11) unsigned NOT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `user` varchar(20) DEFAULT NULL COMMENT '操作人：顾客或admin',
  `action` varchar(20) DEFAULT NULL COMMENT '动作',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `result` varchar(10) DEFAULT NULL COMMENT '操作的结果',
  `note` varchar(100) DEFAULT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单日志表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_order_prop_relation`
--

CREATE TABLE IF NOT EXISTS `raffles_order_prop_relation` (
  `id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned DEFAULT NULL COMMENT '订单ID',
  `prop_id` int(11) unsigned DEFAULT NULL COMMENT '道具ID',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '生成时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单与道具表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_payment`
--

CREATE TABLE IF NOT EXISTS `raffles_payment` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '支付名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:线上、2:线下',
  `class_name` varchar(50) NOT NULL COMMENT '支付类名称',
  `description` text COMMENT '描述',
  `logo` varchar(255) NOT NULL COMMENT '支付方式logo图片路径',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '安装状态 0启用 1禁用',
  `order` smallint(5) NOT NULL DEFAULT '99' COMMENT '排序',
  `note` text COMMENT '支付说明',
  `poundage` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `poundage_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '手续费方式 1百分比 2固定值',
  `partner_id` varchar(80) DEFAULT NULL COMMENT '支付方提供的合作者ID',
  `partner_key` varchar(80) DEFAULT NULL COMMENT '支付方提供的密钥'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付方式表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_points_cart`
--

CREATE TABLE IF NOT EXISTS `raffles_points_cart` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员编号',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品兑换购物车';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_points_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_points_goods` (
  `id` int(11) NOT NULL COMMENT '积分礼品索引id',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换所需积分',
  `pgoods_image` varchar(100) NOT NULL COMMENT '积分礼品默认封面图片',
  `pgoods_tag` varchar(100) NOT NULL COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品库存数',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0表示下架 1表示上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品推荐',
  `pgoods_add_time` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) DEFAULT NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) DEFAULT NULL COMMENT '积分礼品描述',
  `pgoods_body` text NOT NULL COMMENT '积分礼品详细内容',
  `pgoods_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分礼品状态，0开启，1禁售',
  `pgoods_close_reason` varchar(255) DEFAULT NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL DEFAULT '0' COMMENT '积分商品浏览次数',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制每会员兑换数量',
  `pgoods_limitnum` int(11) DEFAULT NULL COMMENT '每会员限制兑换数量',
  `pgoods_freightcharge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '运费承担方式 0表示卖家承担 1表示买家承担',
  `pgoods_freightprice` decimal(10,2) DEFAULT NULL COMMENT '运费价格',
  `pgoods_islimittime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制兑换时间 0为不限制 1为限制',
  `pgoods_starttime` int(11) DEFAULT NULL COMMENT '兑换开始时间',
  `pgoods_endtime` int(11) DEFAULT NULL COMMENT '兑换结束时间',
  `pgoods_sort` int(11) NOT NULL DEFAULT '0' COMMENT '礼品排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_points_log`
--

CREATE TABLE IF NOT EXISTS `raffles_points_log` (
  `id` int(11) NOT NULL COMMENT '积分日志编号',
  `pl_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pl_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数负数表示扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '操作阶段'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_points_order`
--

CREATE TABLE IF NOT EXISTS `raffles_points_order` (
  `id` int(11) NOT NULL COMMENT '兑换订单编号',
  `point_ordersn` varchar(100) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员id',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) NOT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单生成时间',
  `point_paymentid` int(11) NOT NULL COMMENT '支付方式id',
  `point_paymentname` varchar(50) NOT NULL COMMENT '支付方式名称',
  `point_paymentcode` varchar(50) NOT NULL COMMENT '支付方式名称代码',
  `point_paymentdirect` tinyint(1) DEFAULT '1' COMMENT '支付类型:1是即时到帐,2是但保交易',
  `point_outsn` varchar(100) NOT NULL COMMENT '订单编号，外部支付时使用，有些外部支付系统要求特定的订单编号',
  `point_paymenttime` int(11) DEFAULT NULL COMMENT '支付(付款)时间',
  `point_paymessage` varchar(300) DEFAULT NULL COMMENT '支付留言',
  `point_shippingtime` int(11) DEFAULT NULL COMMENT '配送时间',
  `point_shippingcode` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `point_shippingdesc` varchar(500) DEFAULT NULL COMMENT '发货描述',
  `point_outpaymentcode` varchar(255) DEFAULT NULL COMMENT '外部交易平台单独使用的标识字符串',
  `point_finnshedtime` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `point_allpoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换总积分',
  `point_orderamount` decimal(10,2) NOT NULL COMMENT '兑换订单总金额',
  `point_shippingcharge` tinyint(1) NOT NULL DEFAULT '0' COMMENT '运费承担方式 0表示卖家 1表示买家',
  `point_shippingfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `point_ordermessage` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `point_orderstate` int(11) NOT NULL DEFAULT '10' COMMENT '订单状态：10(默认):未付款;11已付款;20:确认付款;30:已发货;40:已收货;50已完成;2已取消'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_points_orderaddress`
--

CREATE TABLE IF NOT EXISTS `raffles_points_orderaddress` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `point_areaid` int(11) NOT NULL COMMENT '地区id',
  `point_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `point_address` varchar(200) NOT NULL COMMENT '详细地址',
  `point_zipcode` varchar(20) NOT NULL COMMENT '邮政编码',
  `point_telphone` varchar(20) NOT NULL COMMENT '电话号码',
  `point_mobphone` varchar(20) NOT NULL COMMENT '手机号码'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单地址表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_points_ordergoods`
--

CREATE TABLE IF NOT EXISTS `raffles_points_ordergoods` (
  `id` int(11) NOT NULL COMMENT '订单礼品表索引',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_goodsid` int(11) NOT NULL COMMENT '礼品id',
  `point_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `point_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `point_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `point_goodsimage` varchar(100) DEFAULT NULL COMMENT '礼品图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_point_log`
--

CREATE TABLE IF NOT EXISTS `raffles_point_log` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `datetime` datetime NOT NULL COMMENT '发生时间',
  `value` int(11) NOT NULL COMMENT '积分增减 增加正数 减少负数',
  `intro` varchar(50) NOT NULL COMMENT '积分改动说明'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分增减记录表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_predeposit_cash`
--

CREATE TABLE IF NOT EXISTS `raffles_predeposit_cash` (
  `id` int(11) NOT NULL COMMENT '自增编号',
  `pdcash_sn` varchar(100) NOT NULL COMMENT '记录唯一标示',
  `pdcash_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pdcash_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `pdcash_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdcash_payment` varchar(50) NOT NULL COMMENT '支付方式',
  `pdcash_paymentaccount` varchar(100) DEFAULT NULL COMMENT '支付账号',
  `pdcash_toname` varchar(100) DEFAULT NULL COMMENT '收款人姓名',
  `pdcash_tobank` varchar(100) DEFAULT NULL COMMENT '收款银行',
  `pdcash_memberremark` varchar(1000) DEFAULT NULL COMMENT '会员提现备注',
  `pdcash_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdcash_paystate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现支付状态 0为未支付 1为支付',
  `pdcash_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pdcash_adminname` varchar(100) DEFAULT NULL COMMENT '管理员姓名',
  `pdcash_adminremark` varchar(1000) DEFAULT NULL COMMENT '管理员备注',
  `pdcash_remark` varchar(1000) DEFAULT NULL COMMENT '管理员和会员都可查看的备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款提现记录表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_predeposit_log`
--

CREATE TABLE IF NOT EXISTS `raffles_predeposit_log` (
  `id` int(11) NOT NULL COMMENT '自增编号',
  `pdlog_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pdlog_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `pdlog_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pdlog_adminname` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `pdlog_stage` enum('system','recharge','cash','order','admin','income','') NOT NULL DEFAULT '' COMMENT '日志类型 枚举 system 系统自动 recharge 充值 cash 提现 order 订单 admin 管理员手动修改 income收入',
  `pdlog_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '日志类型 0表示可用金额 1表示冻结金额',
  `pdlog_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdlog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdlog_desc` varchar(1000) DEFAULT NULL COMMENT '描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款日志表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_predeposit_recharge`
--

CREATE TABLE IF NOT EXISTS `raffles_predeposit_recharge` (
  `id` int(11) NOT NULL COMMENT '自增编号',
  `pdr_sn` varchar(100) NOT NULL COMMENT '记录唯一标示',
  `pdr_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pdr_membername` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pdr_payment` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `pdr_onlinecode` varchar(100) DEFAULT NULL COMMENT '线上支付的交易流水号',
  `pdr_remittancename` varchar(100) DEFAULT NULL COMMENT '汇款人姓名',
  `pdr_remittancebank` varchar(100) DEFAULT NULL COMMENT '汇款银行',
  `pdr_remittancedate` int(11) DEFAULT NULL COMMENT '汇款日期',
  `pdr_memberremark` varchar(1000) DEFAULT NULL COMMENT '会员备注',
  `pdr_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdr_paystate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0表示未支付 1表示支付',
  `pdr_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pdr_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pdr_adminremark` varchar(1000) DEFAULT NULL COMMENT '管理员备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款充值信息表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_products`
--

CREATE TABLE IF NOT EXISTS `raffles_products` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '货品ID',
  `products_no` varchar(20) NOT NULL COMMENT '货品的货号(以商品的货号加横线加数字组成)',
  `spec_array` text COMMENT 'json规格数据',
  `store_nums` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `market_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `sell_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `cost_price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '成本价格',
  `weight` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '重量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_promotion`
--

CREATE TABLE IF NOT EXISTS `raffles_promotion` (
  `id` int(11) unsigned NOT NULL,
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `condition` int(11) NOT NULL COMMENT '生效条件 type=0时为消费额度 type=1时为goods_id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动类型 0:购物车促销规则 1:商品限时抢购',
  `award_value` varchar(255) DEFAULT NULL COMMENT '奖励值 type=0时奖励值 type=1时为抢购价格',
  `name` varchar(20) NOT NULL COMMENT '活动名称',
  `intro` text COMMENT '活动介绍',
  `award_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖励方式:0限时抢购 1减金额 2奖励折扣 3赠送积分 4赠送代金券 5赠送赠品 6免运费',
  `is_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭 0:否 1:是',
  `user_group` text COMMENT '允许参与活动的用户组,all表示所有用户组'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录促销活动的表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_prop`
--

CREATE TABLE IF NOT EXISTS `raffles_prop` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '道具名称',
  `card_name` varchar(32) DEFAULT NULL COMMENT '道具的卡号',
  `card_pwd` varchar(32) DEFAULT NULL COMMENT '道具的密码',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `value` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '面值',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '道具类型 0:代金券',
  `condition` varchar(255) DEFAULT NULL COMMENT '条件数据 type=0时,表示ticket的表id,模型id',
  `is_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭 0:正常,1:关闭,2:下订单未支付时临时锁定',
  `img` varchar(255) DEFAULT NULL COMMENT '道具图片',
  `is_userd` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被使用过 0:未使用,1:已使用',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被发送过 0:否 1:是'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='道具表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_bundling`
--

CREATE TABLE IF NOT EXISTS `raffles_p_bundling` (
  `id` int(11) NOT NULL COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `store_id` int(11) NOT NULL COMMENT '店铺名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bl_img_more` varchar(1000) NOT NULL COMMENT '商品多图',
  `bl_discount_price` decimal(10,2) NOT NULL COMMENT '组合价格',
  `bl_freight_choose` tinyint(1) NOT NULL COMMENT '运费承担方式',
  `bl_freight` decimal(10,2) NOT NULL COMMENT '运费',
  `bl_desc` text NOT NULL COMMENT '组合描述',
  `bl_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_bundling_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_p_bundling_goods` (
  `id` int(11) NOT NULL COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_bundling_quota`
--

CREATE TABLE IF NOT EXISTS `raffles_p_bundling_quota` (
  `id` int(11) NOT NULL COMMENT '套餐ID',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `bl_quota_month` tinyint(3) unsigned NOT NULL COMMENT '购买数量（单位月）',
  `bl_quota_starttime` varchar(10) NOT NULL COMMENT '套餐开始时间',
  `bl_quota_endtime` varchar(10) NOT NULL COMMENT '套餐结束时间',
  `bl_quota_state` tinyint(1) unsigned NOT NULL COMMENT '套餐状态：0关闭，1开启。默认为 1',
  `bl_pay_gold` int(10) unsigned NOT NULL COMMENT '花费金币数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售套餐表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_mansong`
--

CREATE TABLE IF NOT EXISTS `raffles_p_mansong` (
  `id` int(10) unsigned NOT NULL COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `state` tinyint(1) unsigned NOT NULL COMMENT '活动状态(1-未发布/2-正常/3-取消/4-失效/5-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送活动表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_mansong_apply`
--

CREATE TABLE IF NOT EXISTS `raffles_p_mansong_apply` (
  `apply_id` int(10) unsigned NOT NULL COMMENT '申请编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `apply_quantity` tinyint(1) unsigned NOT NULL COMMENT '申请数量',
  `apply_date` int(10) unsigned NOT NULL COMMENT '申请时间',
  `state` tinyint(1) unsigned NOT NULL COMMENT '状态(1-新申请/2-审核通过/3-已取消/4-审核失败)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送套餐申请表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_mansong_quota`
--

CREATE TABLE IF NOT EXISTS `raffles_p_mansong_quota` (
  `id` int(10) unsigned NOT NULL COMMENT '满就送套餐编号',
  `apply_id` int(10) unsigned NOT NULL COMMENT '申请编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `state` tinyint(1) unsigned NOT NULL COMMENT '配额状态(1-可用/2-取消/3-结束)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送套餐表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_mansong_rule`
--

CREATE TABLE IF NOT EXISTS `raffles_p_mansong_rule` (
  `id` int(10) unsigned NOT NULL COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `level` tinyint(1) unsigned NOT NULL COMMENT '规则级别(1/2/3)',
  `price` int(10) unsigned NOT NULL COMMENT '级别价格',
  `shipping_free` tinyint(1) unsigned NOT NULL COMMENT '免邮标志(0-不免邮/1-免邮费)',
  `discount` int(10) unsigned NOT NULL COMMENT '减现金优惠金额',
  `gift_name` varchar(50) NOT NULL COMMENT '礼品名称',
  `gift_link` varchar(100) NOT NULL COMMENT '礼品链接'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_xianshi`
--

CREATE TABLE IF NOT EXISTS `raffles_p_xianshi` (
  `id` int(10) unsigned NOT NULL COMMENT '限时编号',
  `goods_limit` int(10) unsigned NOT NULL COMMENT '商品限制',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣',
  `buy_limit` int(10) unsigned NOT NULL COMMENT '购买限制',
  `state` tinyint(1) unsigned NOT NULL COMMENT '活动状态(1-未发布/2-正常/3-取消/4-失效/5-结束)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣活动表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_xianshi_apply`
--

CREATE TABLE IF NOT EXISTS `raffles_p_xianshi_apply` (
  `id` int(10) unsigned NOT NULL COMMENT '申请编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `apply_quantity` tinyint(1) unsigned NOT NULL COMMENT '申请数量',
  `apply_date` int(10) unsigned NOT NULL COMMENT '申请时间',
  `state` tinyint(1) unsigned NOT NULL COMMENT '状态(1-新申请/2-审核通过/3-已取消/4-审核失败)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐申请表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_xianshi_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_p_xianshi_goods` (
  `id` int(10) unsigned NOT NULL COMMENT '限时折扣商品表',
  `xianshi_id` int(10) unsigned NOT NULL COMMENT '限时活动编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_store_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `discount` decimal(10,2) NOT NULL COMMENT '折扣',
  `buy_limit` int(10) unsigned NOT NULL COMMENT '购买限额',
  `xianshi_price` decimal(10,2) NOT NULL COMMENT '限时折扣价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `state` tinyint(1) unsigned NOT NULL COMMENT '状态(1-可用/2-取消)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_p_xianshi_quota`
--

CREATE TABLE IF NOT EXISTS `raffles_p_xianshi_quota` (
  `id` int(10) unsigned NOT NULL COMMENT '限时折扣套餐编号',
  `apply_id` int(10) unsigned NOT NULL COMMENT '申请编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  `times_limit` int(10) unsigned NOT NULL COMMENT '套餐时间限制',
  `published_times` int(10) unsigned NOT NULL COMMENT '已发布次数',
  `goods_limit` int(10) unsigned NOT NULL COMMENT '活动商品数限制',
  `state` tinyint(1) unsigned NOT NULL COMMENT '配额状态(1-可用/2-取消/3-结束)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_quick_naviga`
--

CREATE TABLE IF NOT EXISTS `raffles_quick_naviga` (
  `id` int(11) unsigned NOT NULL,
  `admin_id` int(11) unsigned NOT NULL COMMENT '管理员id',
  `naviga_name` varchar(255) NOT NULL COMMENT '导航名称',
  `url` varchar(255) NOT NULL COMMENT '导航链接',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除1为删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员快速导航';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_recommend`
--

CREATE TABLE IF NOT EXISTS `raffles_recommend` (
  `id` int(11) unsigned NOT NULL COMMENT '索引ID',
  `recommend_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `recommend_code` varchar(255) NOT NULL COMMENT '推荐标识码',
  `recommend_desc` varchar(255) NOT NULL COMMENT '推荐描述',
  `recommend_config` varchar(255) DEFAULT NULL COMMENT '配置信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐类型表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_recommend_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_recommend_goods` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推荐ID',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_rec_position`
--

CREATE TABLE IF NOT EXISTS `raffles_rec_position` (
  `id` mediumint(8) unsigned NOT NULL,
  `pic_type` enum('1','2','0') NOT NULL DEFAULT '1' COMMENT '0文字1本地图片2远程',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '序列化推荐位内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐位';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_refer`
--

CREATE TABLE IF NOT EXISTS `raffles_refer` (
  `id` int(11) unsigned NOT NULL,
  `question` text NOT NULL COMMENT '咨询内容',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '咨询人会员ID，非会员为空',
  `goods_id` int(11) unsigned DEFAULT NULL COMMENT '产品ID',
  `order_id` int(11) unsigned DEFAULT NULL COMMENT '订单ID',
  `answer` text COMMENT '回复内容',
  `admin_id` int(11) unsigned DEFAULT NULL COMMENT '管理员ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '0：待回复 1已回复 9关闭 ',
  `time` datetime DEFAULT NULL COMMENT '咨询时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `type` tinyint(1) DEFAULT '0' COMMENT '咨询的类别'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='咨询表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_refundment_doc`
--

CREATE TABLE IF NOT EXISTS `raffles_refundment_doc` (
  `id` int(11) unsigned NOT NULL,
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `admin_id` int(11) unsigned DEFAULT NULL COMMENT '管理员id',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款状态，0:申请退款 1:退款失败 2:退款成功',
  `content` text COMMENT '申请退款原因',
  `dispose_time` datetime DEFAULT NULL COMMENT '处理时间',
  `dispose_idea` text COMMENT '处理意见',
  `if_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未删除 1:删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退款单';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_refund_log`
--

CREATE TABLE IF NOT EXISTS `raffles_refund_log` (
  `id` int(10) unsigned NOT NULL COMMENT '退款记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `refund_sn` varchar(100) NOT NULL COMMENT '退款编号',
  `order_sn` varchar(100) NOT NULL COMMENT '订单编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `order_amount` decimal(10,2) NOT NULL COMMENT '订单金额',
  `order_refund` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_paymentname` varchar(50) NOT NULL COMMENT '支付方式名称',
  `refund_paymentcode` varchar(50) NOT NULL COMMENT '支付方式代码',
  `refund_message` varchar(300) DEFAULT NULL COMMENT '退款备注',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '退款原因',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员处理原因',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间',
  `confirm_time` int(10) unsigned DEFAULT '0' COMMENT '买家确认收款时间',
  `refund_type` tinyint(1) unsigned DEFAULT '2' COMMENT '类型:1为买家,2为卖家,默认为2',
  `refund_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为待处理,2为同意,3为拒绝,默认为2',
  `buyer_confirm` tinyint(1) unsigned DEFAULT '2' COMMENT '确认收款状态:1为待确认,2为已确认,默认为2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退款表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_relation`
--

CREATE TABLE IF NOT EXISTS `raffles_relation` (
  `id` int(11) unsigned NOT NULL,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `article_id` int(11) unsigned NOT NULL COMMENT '文章ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章商品关系表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_return`
--

CREATE TABLE IF NOT EXISTS `raffles_return` (
  `id` int(10) unsigned NOT NULL COMMENT '退货记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `return_sn` varchar(100) NOT NULL COMMENT '退货编号',
  `order_sn` varchar(100) NOT NULL COMMENT '订单编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `return_goodsnum` int(10) unsigned NOT NULL COMMENT '退货数量',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `return_message` varchar(300) DEFAULT NULL COMMENT '退货备注',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '退款原因',
  `return_type` tinyint(1) unsigned DEFAULT '2' COMMENT '类型:1为买家,2为卖家,默认为2',
  `return_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为待审核,2为同意,3为不同意,默认为2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退货表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_return_goods`
--

CREATE TABLE IF NOT EXISTS `raffles_return_goods` (
  `id` int(10) unsigned NOT NULL COMMENT '退货商品记录ID',
  `return_id` int(10) unsigned NOT NULL COMMENT '退货记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `spec_id` int(10) unsigned NOT NULL COMMENT '规格ID',
  `spec_info` varchar(50) DEFAULT NULL COMMENT '规格描述',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` int(10) unsigned NOT NULL COMMENT '商品数量',
  `goods_returnnum` int(10) unsigned NOT NULL COMMENT '退货数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='退货商品表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_right`
--

CREATE TABLE IF NOT EXISTS `raffles_right` (
  `id` int(10) NOT NULL,
  `name` varchar(80) NOT NULL COMMENT '权限名字',
  `right` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态 1删除,0正常'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限资源码';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_search`
--

CREATE TABLE IF NOT EXISTS `raffles_search` (
  `id` int(11) unsigned NOT NULL,
  `keyword` varchar(255) NOT NULL COMMENT '搜索关键字',
  `num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '搜索次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索关键字';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_spec`
--

CREATE TABLE IF NOT EXISTS `raffles_spec` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '规格名称',
  `value` text COMMENT '规格值',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示类型 1文字 2图片',
  `note` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='规格表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_spec_photo`
--

CREATE TABLE IF NOT EXISTS `raffles_spec_photo` (
  `id` int(11) unsigned NOT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `name` varchar(100) DEFAULT NULL COMMENT '图片名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='规格图片表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user`
--

CREATE TABLE IF NOT EXISTS `raffles_user` (
  `id` int(11) NOT NULL COMMENT '鑷?姩缂栧彿',
  `uname` varchar(255) DEFAULT NULL COMMENT '鐢ㄦ埛鍚',
  `password` varchar(255) DEFAULT NULL COMMENT '鐢ㄦ埛瀵嗙爜-md5鍔犲瘑',
  `login_salt` char(5) DEFAULT NULL COMMENT '10000 鍒?99999涔嬮棿鐨勯殢鏈烘暟锛屽姞瀵嗗瘑鐮佹椂浣跨敤',
  `email` varchar(255) DEFAULT NULL COMMENT '鐢ㄦ埛email',
  `phone` varchar(50) DEFAULT NULL COMMENT '鐢ㄦ埛鎵嬫満',
  `truename` varchar(50) DEFAULT NULL COMMENT '鐢ㄦ埛鐪熷疄濮撳悕',
  `usercode` varchar(50) DEFAULT NULL COMMENT '鐢ㄦ埛韬?唤璇佸彿鐮',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鎬у埆 1锛氱敺銆?锛氬コ',
  `faceurl` varchar(150) DEFAULT NULL COMMENT '鐢ㄦ埛澶村儚',
  `level` smallint(4) NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛绾у埆',
  `experience` int(10) NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛缁忛獙鏁伴噺',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛绉?垎鏁伴噺',
  `money` int(10) NOT NULL DEFAULT '0' COMMENT '鐢ㄦ埛閲戦挶鏁伴噺',
  `location` varchar(255) DEFAULT NULL COMMENT '鎵?湪鐪佸競鐨勫瓧绗︿覆',
  `is_audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁閫氳繃瀹℃牳锛?-鏈??杩囷紝1-宸查?杩',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁宸叉縺娲?1锛氭縺娲汇?0锛氭湭婵?椿',
  `is_init` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁鍒濆?鍖栫敤鎴疯祫鏂?1锛氬垵濮嬪寲銆?锛氭湭鍒濆?鍖',
  `ctime` int(11) DEFAULT NULL COMMENT '娉ㄥ唽鏃堕棿',
  `api_key` varchar(255) DEFAULT NULL COMMENT '鐢ㄦ埛鐨刟pi_key鐢ㄤ簬绉诲姩绔',
  `domain` char(80) NOT NULL COMMENT '淇濈暀瀛楁?锛岀敤浜庣敤鎴峰垎琛',
  `province` mediumint(6) NOT NULL DEFAULT '0' COMMENT '鐪両D銆佸叧鑱攂aba_area琛',
  `city` int(5) NOT NULL COMMENT '鍩庡競ID锛屽叧鑱攂aba_area琛',
  `area` int(5) NOT NULL COMMENT '鍦板尯ID锛屽叧鑱攂aba_area琛',
  `reg_ip` varchar(64) DEFAULT '127.0.0.1' COMMENT '娉ㄥ唽IP',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█',
  `timezone` varchar(10) DEFAULT 'PRC' COMMENT '鏃跺尯',
  `is_del` tinyint(2) NOT NULL COMMENT '鏄?惁绂佺敤锛?涓嶇?鐢?紝1锛氱?鐢',
  `first_letter` char(1) DEFAULT NULL COMMENT '鐢ㄦ埛鍚嶇О鐨勯?瀛楁瘝',
  `intro` varchar(255) DEFAULT NULL COMMENT '鐢ㄦ埛绠?粙',
  `last_login_time` int(11) DEFAULT '0' COMMENT '鐢ㄦ埛鏈?悗涓??鐧诲綍鏃堕棿',
  `invite_code` varchar(120) DEFAULT NULL COMMENT '閭??娉ㄥ唽鐮',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `country` int(4) NOT NULL COMMENT '国家ID，关联raffles_area表'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_blacklist`
--

CREATE TABLE IF NOT EXISTS `raffles_user_blacklist` (
  `uid` int(11) NOT NULL COMMENT '鐢ㄦ埛UID',
  `fid` int(11) NOT NULL COMMENT '琚?睆钄界殑鐢ㄦ埛UID',
  `ctime` int(11) NOT NULL COMMENT '鎿嶄綔鏃堕棿鎴',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_category`
--

CREATE TABLE IF NOT EXISTS `raffles_user_category` (
  `id` int(11) NOT NULL COMMENT '鐢ㄦ埛鍒嗙被ID - 涓婚敭',
  `title` varchar(255) NOT NULL COMMENT '鐢ㄦ埛鍒嗙被鍚嶇О',
  `pid` int(11) NOT NULL COMMENT '鐖剁骇ID',
  `sort` int(11) NOT NULL COMMENT '鎺掑簭鍊',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_category_link`
--

CREATE TABLE IF NOT EXISTS `raffles_user_category_link` (
  `id` int(11) NOT NULL COMMENT '鐢ㄦ埛鍒嗙被鍏宠仈琛↖D - 涓婚敭',
  `uid` int(11) NOT NULL COMMENT '鐢ㄦ埛ID',
  `user_category_id` int(11) NOT NULL COMMENT '鐢ㄦ埛鍒嗙被ID',
  `sort` int(11) NOT NULL COMMENT '鎺掑簭鍊',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_follow`
--

CREATE TABLE IF NOT EXISTS `raffles_user_follow` (
  `follow_id` int(11) NOT NULL COMMENT '涓婚敭ID',
  `uid` int(11) NOT NULL COMMENT '鍏虫敞鑰匢D',
  `fid` int(11) NOT NULL COMMENT '琚?叧娉ㄨ?ID',
  `remark` varchar(50) NOT NULL COMMENT '澶囨敞',
  `ctime` int(11) NOT NULL COMMENT '鍏虫敞鏃堕棿',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_follow_group`
--

CREATE TABLE IF NOT EXISTS `raffles_user_follow_group` (
  `id` int(11) NOT NULL COMMENT '鍏虫敞缁処D',
  `uid` int(11) NOT NULL COMMENT '鐢ㄦ埛UID',
  `title` varchar(255) NOT NULL COMMENT '缁勫悕绉',
  `ctime` int(11) DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_follow_group_link`
--

CREATE TABLE IF NOT EXISTS `raffles_user_follow_group_link` (
  `id` int(11) NOT NULL COMMENT '鍏虫敞缁勮仈琛↖D',
  `follow_group_id` int(11) NOT NULL COMMENT '鍏虫敞缁処D',
  `follow_id` int(11) NOT NULL COMMENT 'user_follow  琛ㄤ腑follow_id',
  `fid` int(11) NOT NULL COMMENT '琚?叧娉ㄤ汉ID',
  `uid` int(11) NOT NULL COMMENT '鍏虫敞浜篒D',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_group`
--

CREATE TABLE IF NOT EXISTS `raffles_user_group` (
  `id` int(11) NOT NULL COMMENT '涓婚敭ID',
  `user_group_name` varchar(255) NOT NULL COMMENT '鐢ㄦ埛缁勫悕绉',
  `ctime` int(11) DEFAULT NULL COMMENT '鍒涘缓鏃堕棿',
  `user_group_icon` varchar(120) NOT NULL COMMENT '鐢ㄦ埛缁勫浘鏍囧悕绉',
  `user_group_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '缁勭被鍨嬨?0锛氭櫘閫氱粍锛?:鐗规畩缁勶紝',
  `app_name` varchar(20) NOT NULL DEFAULT 'public' COMMENT '搴旂敤鍚嶇О',
  `is_authenticate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '鏄?惁涓鸿?璇佺粍',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_group_link`
--

CREATE TABLE IF NOT EXISTS `raffles_user_group_link` (
  `id` int(10) NOT NULL COMMENT '涓婚敭ID',
  `uid` int(10) NOT NULL COMMENT '鎴风敤UID',
  `user_group_id` int(10) NOT NULL COMMENT '鎴风敤缁処D',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_user_online`
--

CREATE TABLE IF NOT EXISTS `raffles_user_online` (
  `uid` int(11) NOT NULL COMMENT '鎴风敤UID',
  `ctime` int(11) NOT NULL COMMENT '鏈?悗涓??鎿嶄綔鍔ㄤ綔鏃堕棿鎴筹紝涓庡綋鍓嶆椂闂寸浉闅斾簲鍒嗛挓涔嬪唴涓哄湪绾',
  `lang` varchar(64) DEFAULT 'zh-cn' COMMENT '璇?█'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `raffles_voucher`
--

CREATE TABLE IF NOT EXISTS `raffles_voucher` (
  `id` int(11) NOT NULL COMMENT '代金券编号',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `voucher_t_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_start_date` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_end_date` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态(1-未用,2-已用,3-过期,4-收回)',
  `voucher_active_date` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) NOT NULL COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者id',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) DEFAULT NULL COMMENT '使用该代金券的订单编号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_voucher_apply`
--

CREATE TABLE IF NOT EXISTS `raffles_voucher_apply` (
  `id` int(11) NOT NULL COMMENT '申请编号',
  `apply_memberid` int(11) NOT NULL COMMENT '会员编号',
  `apply_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `apply_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `apply_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `apply_quantity` int(11) NOT NULL COMMENT '申请数量',
  `apply_datetime` int(11) NOT NULL COMMENT '申请时间',
  `apply_state` tinyint(1) NOT NULL COMMENT '状态(1-新申请/2-审核通过/3-已取消)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券套餐申请表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_voucher_price`
--

CREATE TABLE IF NOT EXISTS `raffles_voucher_price` (
  `id` int(11) NOT NULL COMMENT '代金券面值编号',
  `voucher_price_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面值',
  `voucher_defaultpoints` int(11) NOT NULL DEFAULT '0' COMMENT '代金劵默认的兑换所需积分可以为0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券面额表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_voucher_quota`
--

CREATE TABLE IF NOT EXISTS `raffles_voucher_quota` (
  `id` int(11) NOT NULL COMMENT '套餐编号',
  `quota_applyid` int(11) NOT NULL COMMENT '申请编号',
  `quota_memberid` int(11) NOT NULL COMMENT '会员编号',
  `quota_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `quota_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `quota_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `quota_starttime` int(11) NOT NULL COMMENT '开始时间',
  `quota_endtime` int(11) NOT NULL COMMENT '结束时间',
  `quota_timeslimit` int(11) NOT NULL DEFAULT '0' COMMENT '活动次数限制',
  `quota_publishedtimes` int(11) NOT NULL DEFAULT '0' COMMENT '活动已使用次数',
  `quota_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1-可用/2-取消/3-结束)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券套餐表';

-- --------------------------------------------------------

--
-- 表的结构 `raffles_voucher_template`
--

CREATE TABLE IF NOT EXISTS `raffles_voucher_template` (
  `id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `voucher_t_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `voucher_t_start_date` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `voucher_t_end_date` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `voucher_t_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `voucher_t_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_t_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺id',
  `voucher_t_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `voucher_t_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者id',
  `voucher_t_state` tinyint(4) NOT NULL COMMENT '代金券模版状态(1-有效,2-失效)',
  `voucher_t_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `voucher_t_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `voucher_t_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `voucher_t_add_date` int(11) NOT NULL COMMENT '模版的创建时间',
  `voucher_t_quotaid` int(11) NOT NULL COMMENT '套餐编号',
  `voucher_t_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `voucher_t_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `voucher_t_styleimg` varchar(200) DEFAULT NULL COMMENT '样式模版图片',
  `voucher_t_customimg` varchar(200) DEFAULT NULL COMMENT '自定义代金券模板图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券模版表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `raffles_admin`
--
ALTER TABLE `raffles_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_admin_role`
--
ALTER TABLE `raffles_admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_article`
--
ALTER TABLE `raffles_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_article_category`
--
ALTER TABLE `raffles_article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_attribute`
--
ALTER TABLE `raffles_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_brand`
--
ALTER TABLE `raffles_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_brand_channel`
--
ALTER TABLE `raffles_brand_channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_category`
--
ALTER TABLE `raffles_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_category_goods`
--
ALTER TABLE `raffles_category_goods`
  ADD PRIMARY KEY (`id`), ADD KEY `goods_id` (`goods_id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `raffles_channel`
--
ALTER TABLE `raffles_channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_channel_category`
--
ALTER TABLE `raffles_channel_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_collection_doc`
--
ALTER TABLE `raffles_collection_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_commend_goods`
--
ALTER TABLE `raffles_commend_goods`
  ADD PRIMARY KEY (`id`), ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `raffles_comment`
--
ALTER TABLE `raffles_comment`
  ADD PRIMARY KEY (`id`), ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `raffles_complain`
--
ALTER TABLE `raffles_complain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_complain_goods`
--
ALTER TABLE `raffles_complain_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_complain_subject`
--
ALTER TABLE `raffles_complain_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_complain_talk`
--
ALTER TABLE `raffles_complain_talk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_coupon`
--
ALTER TABLE `raffles_coupon`
  ADD PRIMARY KEY (`id`), ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `raffles_coupon_class`
--
ALTER TABLE `raffles_coupon_class`
  ADD PRIMARY KEY (`id`), ADD KEY `class_parent_id` (`class_parent_id`), ADD KEY `class_sort` (`class_sort`);

--
-- Indexes for table `raffles_credit_setting`
--
ALTER TABLE `raffles_credit_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_credit_user_log`
--
ALTER TABLE `raffles_credit_user_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_delivery_doc`
--
ALTER TABLE `raffles_delivery_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_delivery_goods`
--
ALTER TABLE `raffles_delivery_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_discussion`
--
ALTER TABLE `raffles_discussion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_email_registry`
--
ALTER TABLE `raffles_email_registry`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `raffles_evaluate_goods`
--
ALTER TABLE `raffles_evaluate_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_evaluate_goodsstat`
--
ALTER TABLE `raffles_evaluate_goodsstat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_evaluate_store`
--
ALTER TABLE `raffles_evaluate_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_evaluate_storestat`
--
ALTER TABLE `raffles_evaluate_storestat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_expresswaybill`
--
ALTER TABLE `raffles_expresswaybill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_favorite`
--
ALTER TABLE `raffles_favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_find_password`
--
ALTER TABLE `raffles_find_password`
  ADD PRIMARY KEY (`id`), ADD KEY `hash` (`hash`);

--
-- Indexes for table `raffles_freight_company`
--
ALTER TABLE `raffles_freight_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_goods`
--
ALTER TABLE `raffles_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_goods_attribute`
--
ALTER TABLE `raffles_goods_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_goods_car`
--
ALTER TABLE `raffles_goods_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_goods_group`
--
ALTER TABLE `raffles_goods_group`
  ADD PRIMARY KEY (`id`), ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `raffles_goods_photo`
--
ALTER TABLE `raffles_goods_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_goods_photo_relation`
--
ALTER TABLE `raffles_goods_photo_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_groupbuy_area`
--
ALTER TABLE `raffles_groupbuy_area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `raffles_groupbuy_class`
--
ALTER TABLE `raffles_groupbuy_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_groupbuy_price_range`
--
ALTER TABLE `raffles_groupbuy_price_range`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_groupbuy_template`
--
ALTER TABLE `raffles_groupbuy_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_group_price`
--
ALTER TABLE `raffles_group_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_guide`
--
ALTER TABLE `raffles_guide`
  ADD PRIMARY KEY (`order`);

--
-- Indexes for table `raffles_help`
--
ALTER TABLE `raffles_help`
  ADD PRIMARY KEY (`id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `sort` (`sort`);

--
-- Indexes for table `raffles_help_category`
--
ALTER TABLE `raffles_help_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_keyword`
--
ALTER TABLE `raffles_keyword`
  ADD PRIMARY KEY (`word`), ADD KEY `hot` (`hot`);

--
-- Indexes for table `raffles_log_error`
--
ALTER TABLE `raffles_log_error`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_log_operation`
--
ALTER TABLE `raffles_log_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_log_sql`
--
ALTER TABLE `raffles_log_sql`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_merch_ship_info`
--
ALTER TABLE `raffles_merch_ship_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_message`
--
ALTER TABLE `raffles_message`
  ADD PRIMARY KEY (`id`), ADD KEY `from_member_id` (`from_member_id`), ADD KEY `to_member_id` (`to_member_id`(333)), ADD KEY `message_ismore` (`message_ismore`);

--
-- Indexes for table `raffles_model`
--
ALTER TABLE `raffles_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_msg_template`
--
ALTER TABLE `raffles_msg_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_notify_registry`
--
ALTER TABLE `raffles_notify_registry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_oauth`
--
ALTER TABLE `raffles_oauth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_oauth_user`
--
ALTER TABLE `raffles_oauth_user`
  ADD PRIMARY KEY (`id`), ADD KEY `index1` (`oauth_user_id`,`oauth_id`);

--
-- Indexes for table `raffles_online_recharge`
--
ALTER TABLE `raffles_online_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_order`
--
ALTER TABLE `raffles_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_order_goods`
--
ALTER TABLE `raffles_order_goods`
  ADD PRIMARY KEY (`id`), ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `raffles_order_log`
--
ALTER TABLE `raffles_order_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_order_prop_relation`
--
ALTER TABLE `raffles_order_prop_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_payment`
--
ALTER TABLE `raffles_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_points_cart`
--
ALTER TABLE `raffles_points_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_points_goods`
--
ALTER TABLE `raffles_points_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_points_log`
--
ALTER TABLE `raffles_points_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_points_order`
--
ALTER TABLE `raffles_points_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_points_orderaddress`
--
ALTER TABLE `raffles_points_orderaddress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_points_ordergoods`
--
ALTER TABLE `raffles_points_ordergoods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_point_log`
--
ALTER TABLE `raffles_point_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_predeposit_cash`
--
ALTER TABLE `raffles_predeposit_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_predeposit_log`
--
ALTER TABLE `raffles_predeposit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_predeposit_recharge`
--
ALTER TABLE `raffles_predeposit_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_products`
--
ALTER TABLE `raffles_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_promotion`
--
ALTER TABLE `raffles_promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_prop`
--
ALTER TABLE `raffles_prop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_bundling`
--
ALTER TABLE `raffles_p_bundling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_bundling_goods`
--
ALTER TABLE `raffles_p_bundling_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_bundling_quota`
--
ALTER TABLE `raffles_p_bundling_quota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_mansong`
--
ALTER TABLE `raffles_p_mansong`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_mansong_apply`
--
ALTER TABLE `raffles_p_mansong_apply`
  ADD PRIMARY KEY (`apply_id`);

--
-- Indexes for table `raffles_p_mansong_quota`
--
ALTER TABLE `raffles_p_mansong_quota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_mansong_rule`
--
ALTER TABLE `raffles_p_mansong_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_xianshi`
--
ALTER TABLE `raffles_p_xianshi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_xianshi_apply`
--
ALTER TABLE `raffles_p_xianshi_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_xianshi_goods`
--
ALTER TABLE `raffles_p_xianshi_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_p_xianshi_quota`
--
ALTER TABLE `raffles_p_xianshi_quota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_quick_naviga`
--
ALTER TABLE `raffles_quick_naviga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_recommend`
--
ALTER TABLE `raffles_recommend`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `recommend_code` (`recommend_code`);

--
-- Indexes for table `raffles_recommend_goods`
--
ALTER TABLE `raffles_recommend_goods`
  ADD PRIMARY KEY (`id`,`goods_id`);

--
-- Indexes for table `raffles_rec_position`
--
ALTER TABLE `raffles_rec_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_refer`
--
ALTER TABLE `raffles_refer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_refundment_doc`
--
ALTER TABLE `raffles_refundment_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_refund_log`
--
ALTER TABLE `raffles_refund_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_relation`
--
ALTER TABLE `raffles_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_return`
--
ALTER TABLE `raffles_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_return_goods`
--
ALTER TABLE `raffles_return_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_right`
--
ALTER TABLE `raffles_right`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_search`
--
ALTER TABLE `raffles_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_spec`
--
ALTER TABLE `raffles_spec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_spec_photo`
--
ALTER TABLE `raffles_spec_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_user`
--
ALTER TABLE `raffles_user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nickname` (`nickname`), ADD UNIQUE KEY `email` (`email`), ADD KEY `uname` (`uname`);

--
-- Indexes for table `raffles_user_blacklist`
--
ALTER TABLE `raffles_user_blacklist`
  ADD UNIQUE KEY `uid` (`uid`,`fid`), ADD KEY `fid` (`fid`);

--
-- Indexes for table `raffles_user_category`
--
ALTER TABLE `raffles_user_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_user_category_link`
--
ALTER TABLE `raffles_user_category_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_user_follow`
--
ALTER TABLE `raffles_user_follow`
  ADD PRIMARY KEY (`follow_id`), ADD UNIQUE KEY `uid-fid` (`uid`,`fid`), ADD UNIQUE KEY `fid-uid` (`fid`,`uid`);

--
-- Indexes for table `raffles_user_follow_group`
--
ALTER TABLE `raffles_user_follow_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_user_follow_group_link`
--
ALTER TABLE `raffles_user_follow_group_link`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `follow_group_id` (`uid`,`fid`,`follow_group_id`);

--
-- Indexes for table `raffles_user_group`
--
ALTER TABLE `raffles_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_user_group_link`
--
ALTER TABLE `raffles_user_group_link`
  ADD PRIMARY KEY (`id`), ADD KEY `uid` (`uid`), ADD KEY `user_group_id` (`user_group_id`);

--
-- Indexes for table `raffles_user_online`
--
ALTER TABLE `raffles_user_online`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `raffles_voucher`
--
ALTER TABLE `raffles_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_voucher_apply`
--
ALTER TABLE `raffles_voucher_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_voucher_price`
--
ALTER TABLE `raffles_voucher_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_voucher_quota`
--
ALTER TABLE `raffles_voucher_quota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles_voucher_template`
--
ALTER TABLE `raffles_voucher_template`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `raffles_admin`
--
ALTER TABLE `raffles_admin`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- AUTO_INCREMENT for table `raffles_admin_role`
--
ALTER TABLE `raffles_admin_role`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_article`
--
ALTER TABLE `raffles_article`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_article_category`
--
ALTER TABLE `raffles_article_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_attribute`
--
ALTER TABLE `raffles_attribute`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID';
--
-- AUTO_INCREMENT for table `raffles_brand`
--
ALTER TABLE `raffles_brand`
  MODIFY `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID';
--
-- AUTO_INCREMENT for table `raffles_brand_channel`
--
ALTER TABLE `raffles_brand_channel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `raffles_category`
--
ALTER TABLE `raffles_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID';
--
-- AUTO_INCREMENT for table `raffles_category_goods`
--
ALTER TABLE `raffles_category_goods`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_channel`
--
ALTER TABLE `raffles_channel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID';
--
-- AUTO_INCREMENT for table `raffles_channel_category`
--
ALTER TABLE `raffles_channel_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `raffles_collection_doc`
--
ALTER TABLE `raffles_collection_doc`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_commend_goods`
--
ALTER TABLE `raffles_commend_goods`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_comment`
--
ALTER TABLE `raffles_comment`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_complain`
--
ALTER TABLE `raffles_complain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id';
--
-- AUTO_INCREMENT for table `raffles_complain_goods`
--
ALTER TABLE `raffles_complain_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉商品序列id';
--
-- AUTO_INCREMENT for table `raffles_complain_subject`
--
ALTER TABLE `raffles_complain_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id';
--
-- AUTO_INCREMENT for table `raffles_complain_talk`
--
ALTER TABLE `raffles_complain_talk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id';
--
-- AUTO_INCREMENT for table `raffles_coupon`
--
ALTER TABLE `raffles_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `raffles_coupon_class`
--
ALTER TABLE `raffles_coupon_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券分类id';
--
-- AUTO_INCREMENT for table `raffles_credit_setting`
--
ALTER TABLE `raffles_credit_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鑷?姩缂栧彿';
--
-- AUTO_INCREMENT for table `raffles_credit_user_log`
--
ALTER TABLE `raffles_credit_user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鑷?姩缂栧彿';
--
-- AUTO_INCREMENT for table `raffles_delivery_doc`
--
ALTER TABLE `raffles_delivery_doc`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货单ID';
--
-- AUTO_INCREMENT for table `raffles_delivery_goods`
--
ALTER TABLE `raffles_delivery_goods`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_discussion`
--
ALTER TABLE `raffles_discussion`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_email_registry`
--
ALTER TABLE `raffles_email_registry`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_evaluate_goods`
--
ALTER TABLE `raffles_evaluate_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID';
--
-- AUTO_INCREMENT for table `raffles_evaluate_goodsstat`
--
ALTER TABLE `raffles_evaluate_goodsstat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `raffles_evaluate_store`
--
ALTER TABLE `raffles_evaluate_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID';
--
-- AUTO_INCREMENT for table `raffles_evaluate_storestat`
--
ALTER TABLE `raffles_evaluate_storestat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计ID';
--
-- AUTO_INCREMENT for table `raffles_expresswaybill`
--
ALTER TABLE `raffles_expresswaybill`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_favorite`
--
ALTER TABLE `raffles_favorite`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_find_password`
--
ALTER TABLE `raffles_find_password`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_freight_company`
--
ALTER TABLE `raffles_freight_company`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_goods`
--
ALTER TABLE `raffles_goods`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID';
--
-- AUTO_INCREMENT for table `raffles_goods_attribute`
--
ALTER TABLE `raffles_goods_attribute`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_goods_car`
--
ALTER TABLE `raffles_goods_car`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_goods_group`
--
ALTER TABLE `raffles_goods_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID';
--
-- AUTO_INCREMENT for table `raffles_goods_photo_relation`
--
ALTER TABLE `raffles_goods_photo_relation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_groupbuy_area`
--
ALTER TABLE `raffles_groupbuy_area`
  MODIFY `area_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区编号';
--
-- AUTO_INCREMENT for table `raffles_groupbuy_class`
--
ALTER TABLE `raffles_groupbuy_class`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类别编号';
--
-- AUTO_INCREMENT for table `raffles_groupbuy_price_range`
--
ALTER TABLE `raffles_groupbuy_price_range`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '价格区间编号';
--
-- AUTO_INCREMENT for table `raffles_groupbuy_template`
--
ALTER TABLE `raffles_groupbuy_template`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购活动编号';
--
-- AUTO_INCREMENT for table `raffles_group_price`
--
ALTER TABLE `raffles_group_price`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_help`
--
ALTER TABLE `raffles_help`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_help_category`
--
ALTER TABLE `raffles_help_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_log_error`
--
ALTER TABLE `raffles_log_error`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_log_operation`
--
ALTER TABLE `raffles_log_operation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_log_sql`
--
ALTER TABLE `raffles_log_sql`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_merch_ship_info`
--
ALTER TABLE `raffles_merch_ship_info`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_message`
--
ALTER TABLE `raffles_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短消息索引id';
--
-- AUTO_INCREMENT for table `raffles_model`
--
ALTER TABLE `raffles_model`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID';
--
-- AUTO_INCREMENT for table `raffles_msg_template`
--
ALTER TABLE `raffles_msg_template`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_notify_registry`
--
ALTER TABLE `raffles_notify_registry`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_oauth`
--
ALTER TABLE `raffles_oauth`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_oauth_user`
--
ALTER TABLE `raffles_oauth_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_online_recharge`
--
ALTER TABLE `raffles_online_recharge`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_order`
--
ALTER TABLE `raffles_order`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_order_goods`
--
ALTER TABLE `raffles_order_goods`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_order_log`
--
ALTER TABLE `raffles_order_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_order_prop_relation`
--
ALTER TABLE `raffles_order_prop_relation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_payment`
--
ALTER TABLE `raffles_payment`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_points_cart`
--
ALTER TABLE `raffles_points_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `raffles_points_goods`
--
ALTER TABLE `raffles_points_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分礼品索引id';
--
-- AUTO_INCREMENT for table `raffles_points_log`
--
ALTER TABLE `raffles_points_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分日志编号';
--
-- AUTO_INCREMENT for table `raffles_points_order`
--
ALTER TABLE `raffles_points_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换订单编号';
--
-- AUTO_INCREMENT for table `raffles_points_orderaddress`
--
ALTER TABLE `raffles_points_orderaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- AUTO_INCREMENT for table `raffles_points_ordergoods`
--
ALTER TABLE `raffles_points_ordergoods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单礼品表索引';
--
-- AUTO_INCREMENT for table `raffles_point_log`
--
ALTER TABLE `raffles_point_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_predeposit_cash`
--
ALTER TABLE `raffles_predeposit_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号';
--
-- AUTO_INCREMENT for table `raffles_predeposit_log`
--
ALTER TABLE `raffles_predeposit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号';
--
-- AUTO_INCREMENT for table `raffles_predeposit_recharge`
--
ALTER TABLE `raffles_predeposit_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号';
--
-- AUTO_INCREMENT for table `raffles_products`
--
ALTER TABLE `raffles_products`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_promotion`
--
ALTER TABLE `raffles_promotion`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_prop`
--
ALTER TABLE `raffles_prop`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_p_bundling`
--
ALTER TABLE `raffles_p_bundling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID';
--
-- AUTO_INCREMENT for table `raffles_p_bundling_goods`
--
ALTER TABLE `raffles_p_bundling_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id';
--
-- AUTO_INCREMENT for table `raffles_p_bundling_quota`
--
ALTER TABLE `raffles_p_bundling_quota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID';
--
-- AUTO_INCREMENT for table `raffles_p_mansong`
--
ALTER TABLE `raffles_p_mansong`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号';
--
-- AUTO_INCREMENT for table `raffles_p_mansong_apply`
--
ALTER TABLE `raffles_p_mansong_apply`
  MODIFY `apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请编号';
--
-- AUTO_INCREMENT for table `raffles_p_mansong_quota`
--
ALTER TABLE `raffles_p_mansong_quota`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送套餐编号';
--
-- AUTO_INCREMENT for table `raffles_p_mansong_rule`
--
ALTER TABLE `raffles_p_mansong_rule`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号';
--
-- AUTO_INCREMENT for table `raffles_p_xianshi`
--
ALTER TABLE `raffles_p_xianshi`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时编号';
--
-- AUTO_INCREMENT for table `raffles_p_xianshi_apply`
--
ALTER TABLE `raffles_p_xianshi_apply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请编号';
--
-- AUTO_INCREMENT for table `raffles_p_xianshi_goods`
--
ALTER TABLE `raffles_p_xianshi_goods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表';
--
-- AUTO_INCREMENT for table `raffles_p_xianshi_quota`
--
ALTER TABLE `raffles_p_xianshi_quota`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐编号';
--
-- AUTO_INCREMENT for table `raffles_quick_naviga`
--
ALTER TABLE `raffles_quick_naviga`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_recommend`
--
ALTER TABLE `raffles_recommend`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID';
--
-- AUTO_INCREMENT for table `raffles_rec_position`
--
ALTER TABLE `raffles_rec_position`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_refer`
--
ALTER TABLE `raffles_refer`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_refundment_doc`
--
ALTER TABLE `raffles_refundment_doc`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_refund_log`
--
ALTER TABLE `raffles_refund_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款记录ID';
--
-- AUTO_INCREMENT for table `raffles_relation`
--
ALTER TABLE `raffles_relation`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_return`
--
ALTER TABLE `raffles_return`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退货记录ID';
--
-- AUTO_INCREMENT for table `raffles_return_goods`
--
ALTER TABLE `raffles_return_goods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退货商品记录ID';
--
-- AUTO_INCREMENT for table `raffles_right`
--
ALTER TABLE `raffles_right`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_search`
--
ALTER TABLE `raffles_search`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_spec`
--
ALTER TABLE `raffles_spec`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_spec_photo`
--
ALTER TABLE `raffles_spec_photo`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `raffles_user`
--
ALTER TABLE `raffles_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鑷?姩缂栧彿';
--
-- AUTO_INCREMENT for table `raffles_user_category`
--
ALTER TABLE `raffles_user_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鐢ㄦ埛鍒嗙被ID - 涓婚敭';
--
-- AUTO_INCREMENT for table `raffles_user_category_link`
--
ALTER TABLE `raffles_user_category_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鐢ㄦ埛鍒嗙被鍏宠仈琛↖D - 涓婚敭';
--
-- AUTO_INCREMENT for table `raffles_user_follow`
--
ALTER TABLE `raffles_user_follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID';
--
-- AUTO_INCREMENT for table `raffles_user_follow_group`
--
ALTER TABLE `raffles_user_follow_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鍏虫敞缁処D';
--
-- AUTO_INCREMENT for table `raffles_user_follow_group_link`
--
ALTER TABLE `raffles_user_follow_group_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '鍏虫敞缁勮仈琛↖D';
--
-- AUTO_INCREMENT for table `raffles_user_group`
--
ALTER TABLE `raffles_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID';
--
-- AUTO_INCREMENT for table `raffles_user_group_link`
--
ALTER TABLE `raffles_user_group_link`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID';
--
-- AUTO_INCREMENT for table `raffles_voucher`
--
ALTER TABLE `raffles_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券编号';
--
-- AUTO_INCREMENT for table `raffles_voucher_apply`
--
ALTER TABLE `raffles_voucher_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请编号';
--
-- AUTO_INCREMENT for table `raffles_voucher_price`
--
ALTER TABLE `raffles_voucher_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值编号';
--
-- AUTO_INCREMENT for table `raffles_voucher_quota`
--
ALTER TABLE `raffles_voucher_quota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐编号';
--
-- AUTO_INCREMENT for table `raffles_voucher_template`
--
ALTER TABLE `raffles_voucher_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券模版编号';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
