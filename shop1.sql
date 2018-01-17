/*
Navicat MySQL Data Transfer

Source Server         : Test1
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : shop1

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2018-01-17 12:51:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `s_admin`
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO s_admin VALUES ('a1', 'lisi', '111');
INSERT INTO s_admin VALUES ('a2', 'guanYu', '123');
INSERT INTO s_admin VALUES ('a3', 'zhangSanFei', '123');

-- ----------------------------
-- Table structure for `s_cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `s_cartitem`;
CREATE TABLE `s_cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_cartitem_t_user` (`uid`),
  KEY `FK_t_cartitem_t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_book` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `s_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_cartitem
-- ----------------------------
INSERT INTO s_cartitem VALUES ('16e', '1', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'A7B', '1');
INSERT INTO s_cartitem VALUES ('2c0', '1', '0EE8A0AE69154287A378FB110FF2C780', 'a44', '2');
INSERT INTO s_cartitem VALUES ('930', '1', '57B6FF1B89C843C38BA39C717FA557D6', '85e06', '5');

-- ----------------------------
-- Table structure for `s_category`
-- ----------------------------
DROP TABLE IF EXISTS `s_category`;
CREATE TABLE `s_category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`),
  KEY `FK_t_category_t_category` (`pid`),
  KEY `orderBy` (`orderBy`),
  CONSTRAINT `FK_t_category_t_category` FOREIGN KEY (`pid`) REFERENCES `s_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_category
-- ----------------------------
INSERT INTO s_category VALUES ('03R52JX1MGPP1N4S2638BKOP8XX7YQVK', '家纺', '6', null, '44');
INSERT INTO s_category VALUES ('1', '图书', null, '程序设计分类', '2');
INSERT INTO s_category VALUES ('1H9P9RLS0OP3ZL6S8DYKYZ72LXGRU4U6', '游戏设备', '2', null, '37');
INSERT INTO s_category VALUES ('2', '数码', null, '办公室用书', '1');
INSERT INTO s_category VALUES ('23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', '家具', '6', null, '43');
INSERT INTO s_category VALUES ('3', '服饰|装扮', null, '图形图像多媒体', '3');
INSERT INTO s_category VALUES ('3K71UB0F6NBU8T1ZFUSEKVRQ1PJHJQMW', '外设产品', '2', null, '36');
INSERT INTO s_category VALUES ('4', '食品', null, '操作系统/系统开发', '4');
INSERT INTO s_category VALUES ('458795C27E7346A8A5F1B942319297E0', '新鲜水果', '4', '系统开发分类', '29');
INSERT INTO s_category VALUES ('4D01FFF0CB94468EA907EF42780668AB', '电脑整机', '2', '购买指南 组装指南 维修分类', '18');
INSERT INTO s_category VALUES ('5', '医药', null, '数据库', '5');
INSERT INTO s_category VALUES ('56AD72718C524147A2485E5F4A95A062', '男装', '3', '3DS MAX分类', '21');
INSERT INTO s_category VALUES ('57DE3C2DDA784B81844029A28217698C', '女装', '3', 'Dreamweaver分类', '24');
INSERT INTO s_category VALUES ('5F79D0D246AD4216AC04E9C5FAB3199E', 'Java Javascript', '1', 'Java Javascript分类', '10');
INSERT INTO s_category VALUES ('6', '家居', null, '网络与数据通讯!', '6');
INSERT INTO s_category VALUES ('60VBAZ4M7SYZ6GA8Y10JNSN9H6BVC8K4', '休闲零食', '4', null, '41');
INSERT INTO s_category VALUES ('65640549B80E40B1981CDEC269BFFCAD', '童装', '3', 'Photoshop分类', '20');
INSERT INTO s_category VALUES ('65830AB237EF428BAE9B7ADC78A8D1F6', '海鲜水产', '4', 'Unix分类', '28');
INSERT INTO s_category VALUES ('65NNOQQL44TG0SH5ALG85JCV5NOV8O87', '办公设备', '2', null, '39');
INSERT INTO s_category VALUES ('757BDAB506A445EC8DEDA4CE04303B9F', '童鞋', '3', '网页设计分类', '22');
INSERT INTO s_category VALUES ('84ECE401C2904DBEA560D04A581A66D9', 'HTML XML', '1', 'HTML XML分类', '13');
INSERT INTO s_category VALUES ('89ND02BJGGLC57C0MS7VJPHR0C5IZ3CH', '中外名酒', '4', null, '40');
INSERT INTO s_category VALUES ('922E6E2DB04143D39C9DDB26365B3EE8', 'C C++ VC VC++', '1', 'C C++ VC VC++分类', '12');
INSERT INTO s_category VALUES ('96F209F79DB242E9B99CC1B98FAB01DB', '中西药品', '5', '数据库理论分类', '33');
INSERT INTO s_category VALUES ('A9CFBED0F77746C5BD751F2502FAB2CD', '生活用品', '6', '电子商务 电子政务分类', '35');
INSERT INTO s_category VALUES ('B596ECE0F9BF40288F40A66B35551806', '鞋', '3', 'Flush分类', '23');
INSERT INTO s_category VALUES ('B92ED191DBE647BE8F75721FB231E207', '电脑配件', '2', '因特网 电子邮件分类', '19');
INSERT INTO s_category VALUES ('C3F9FAAF4EA64857ACFAB0D9C8D0E446', 'PHP', '1', 'PHP分类', '14');
INSERT INTO s_category VALUES ('C8E274EE5C99499080A98E24F0BD2E03', '.NET', '1', '.NET分类', '15');
INSERT INTO s_category VALUES ('D45D96DA359A4FEAB3AB4DCF2157FC06', 'JSP', '1', 'JSP分类', '11');
INSERT INTO s_category VALUES ('DCAD0384A6444C048951C7B36C5D96EE', '配饰', '3', 'Flash分类', '25');
INSERT INTO s_category VALUES ('F4FBD087EB054CA1896093F172AC33D9', '滋补养生', '5', '数据仓库与数据挖掘分类', '30');
INSERT INTO s_category VALUES ('F5C091B3967442A2B35EFEFC4EF8746F', '蔬菜蛋类', '4', '微软Office分类之分类', '16');
INSERT INTO s_category VALUES ('FAB7B7F7084F4D57A0808ADC61117683', '精选肉类', '4', 'Windows分类', '26');
INSERT INTO s_category VALUES ('KZ0GZUYN4HWABUPV4FPKTLWXIDZLY49T', '网络产品', '2', null, '38');

-- ----------------------------
-- Table structure for `s_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `uid` varchar(50) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `loginemail` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO s_user VALUES ('1084', '12345', '123', '12345@qq.com', null);
INSERT INTO s_user VALUES ('30599', '111111111111111', '123', '222222222222222', null);
INSERT INTO s_user VALUES ('329c3', '555555', '555', '5555555555', '55555555555');
INSERT INTO s_user VALUES ('6e45', '123321', '213332', '849204030@qq.com', null);
INSERT INTO s_user VALUES ('85e06', 'linshifan1', '123456', '8494959@qq.com', '12332112221');
INSERT INTO s_user VALUES ('86121', '222222', '123', '11111111111111', null);
INSERT INTO s_user VALUES ('94099', '33333333', '123', '33333333333', '33333333334');
INSERT INTO s_user VALUES ('9d6f5', '99999999', '9999', '999999999', '99999999999');
INSERT INTO s_user VALUES ('a44', 'linshifan', '123456', null, null);
INSERT INTO s_user VALUES ('A7B', 'lisi', '111', null, null);
INSERT INTO s_user VALUES ('abe85', '4399', '123', '12321421521', null);
INSERT INTO s_user VALUES ('d1ad', '321', '2132', '321432142141', null);
INSERT INTO s_user VALUES ('d4655', '421421', '123', '14213421421421', '123');
INSERT INTO s_user VALUES ('d5e', 'lisu', '123', null, null);
INSERT INTO s_user VALUES ('ed7', 'wang', '123', null, null);
INSERT INTO s_user VALUES ('f112d', '321321', '321', '12321421521', null);

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `discount` decimal(3,1) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` varchar(300) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bid`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_book_s_category` (`cid`),
  CONSTRAINT `FK_t_book_t_category` FOREIGN KEY (`cid`) REFERENCES `s_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO t_book VALUES ('000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '福建', '79.80', '55.10', '6.9', '清华大学出版社', '2013-7-1', '一本基于JAVA Web开发的图书', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23268958-1_w.jpg', 'book_img/23268958-1_b.jpg', '16');
INSERT INTO t_book VALUES ('0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', '福建', '99.00', '68.30', '6.9', '人民邮电出版社', '2013-1-1', '是本不错的好书', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938396-1_w.jpg', 'book_img/22938396-1_b.jpg', '58');
INSERT INTO t_book VALUES ('0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '福建', '98.00', '67.60', '6.9', '机械工业出版社', '2008-6-1', '店家诚意推荐', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20285763-1_w.jpg', 'book_img/20285763-1_b.jpg', '12');
INSERT INTO t_book VALUES ('113D0D1BB9174DD19A7DE7E2B37F677F', 'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）', '福建', '118.00', '81.40', '6.9', '清华大学出版社', '2012-8-1', '非常值得购买哦', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22813026-1_w.jpg', 'book_img/22813026-1_b.jpg', '94');
INSERT INTO t_book VALUES ('1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '福建', '109.00', '75.20', '6.9', '人民邮电出版社', '2013-7-1', '适合入门级学习', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280479-1_w.jpg', 'book_img/23280479-1_b.jpg', '65');
INSERT INTO t_book VALUES ('13EBF9B1FDE346A683A1C45BD6773ECB', 'Java开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '云南', '99.00', '68.30', '6.9', '清华大学出版社', '0', '非常详细的实战案例', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110930-1_w_1.jpg', 'book_img/21110930-1_b.jpg', '83');
INSERT INTO t_book VALUES ('1A15DC5E8A014A58862ED741D579B530', 'Java深入解析——透析Java本质的36个话题', '云南', '49.00', '33.80', '6.9', '电子工业出版社', '2013-11-1', '非常透彻的好书', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23363997-1_w_1.jpg', 'book_img/23363997-1_b.jpg', '86');
INSERT INTO t_book VALUES ('210A3DCA429049C78B623C3986BEB136', 'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)(套装共2册)(超值附赠《码农》光盘1张)', '云南', '148.00', '88.80', '6.0', '人民邮电出版社', '2013-4-1', 'JS中的经典', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23224089-1_w.jpg', 'book_img/23224089-1_b.jpg', '93');
INSERT INTO t_book VALUES ('22234CECF15F4ECB813F0B433DDA5365', 'JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）', '云南', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '从入门到放弃', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862057-1_w.jpg', 'book_img/22862057-1_b.jpg', '20');
INSERT INTO t_book VALUES ('230A00EC22BF4A1DBA87C64800B54C8D', 'Struts2技术内幕：深入解析Struts架构设计与实现原理', '云南', '69.00', '47.60', '6.9', '机械工业出版社', '2012-1-1', '内幕，内幕，绝对的内幕', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22577578-1_w.jpg', 'book_img/22577578-1_b.jpg', '56');
INSERT INTO t_book VALUES ('260F8A3594F741C1B0EB69616F65045B', 'Tomcat与Java Web开发技术详解（第2版）(含光盘1张)', '上海', '79.50', '54.90', '6.9', '电子工业出版社', '2009-1-1', '汤姆猫，汤姆猫', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20420983-1_w.jpg', 'book_img/20420983-1_b.jpg', '74');
INSERT INTO t_book VALUES ('28A03D28BAD449659A77330BE35FCD65', 'JAVA核心技术卷II：高级特性（原书第8版）', '上海', '118.00', '81.40', '6.9', '机械工业出版社', '2008-12-1', '核心中的核心', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20446562-1_w.jpg', 'book_img/20446562-1_b.jpg', '18');
INSERT INTO t_book VALUES ('2EE1A20A6AF742E387E18619D7E3BB94', 'Java虚拟机并发编程(Java并发编程领域的里程碑之作，资深Java技术专家、并发编程专家、敏捷开发专家和Jolt大奖得主撰写，Amazon五星畅销书)', '上海', '59.00', '40.70', '6.9', '机械工业出版社', '2013-5-1', '虚拟机的结合与应用', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23239786-1_w.jpg', 'book_img/23239786-1_b.jpg', '54');
INSERT INTO t_book VALUES ('2W6UKGY0BB9B3Z1HL1TCRONF9Q2S2H3I', 'dell戴尔台式机电脑全套整机家用办公商用微型小主机原装全新品牌', '天津', '3699.00', '3299.00', '8.9', '戴尔苏购专卖店', '2012-4-1', 'Dell/戴尔 Vostro 3650-7100', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/8-w.jpg', 'book_img/8-b.jpg', '105');
INSERT INTO t_book VALUES ('33ACF97A9A374352AE9F5E89BB791262', '基于MVC的JavaScript Web富应用开发', '上海', '59.00', '40.70', '6.9', '电子工业出版社', '2012-5-1', 'MVC的干货', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22757564-1_w.jpg', 'book_img/22757564-1_b.jpg', '34');
INSERT INTO t_book VALUES ('37F75BEAE1FE46F2B14674923F1E7987', '数据结构与算法分析Java语言描述 第2版', '上海', '55.00', '38.00', '6.9', '机械工业出版社', '2009-1-1', '结构与算法，程序员必备', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20417467-1_w.jpg', 'book_img/20417467-1_b.jpg', '32');
INSERT INTO t_book VALUES ('39F1D0803E8F4592AE1245CACE683214', 'Java程序员修炼之道', '北京', '89.00', '61.40', '6.9', '人民邮电出版社', '2013-8-1', '从此走上修仙之路', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23301847-1_w_1.jpg', 'book_img/23301847-1_b.jpg', '36');
INSERT INTO t_book VALUES ('3AE5C8B976B6448A9D3A155C1BDE12BC', '深入理解Java虚拟机:JVM高级特性与最佳实践（超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备）', '北京', '69.00', '47.60', '6.9', '机械工业出版社', '0', '深入剖析', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21108671-1_w_1.jpg', 'book_img/21108671-1_b.jpg', '66');
INSERT INTO t_book VALUES ('3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '北京', '119.00', '82.10', '6.9', '机械工业出版社', '2014-1-1', '核心的基础知识', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23362142-1_w_1.jpg', 'book_img/23362142-1_b.jpg', '9');
INSERT INTO t_book VALUES ('3E1990E19989422E9DA735978CB1E4CE', 'Effective Java中文版(第2版)', '北京', '52.00', '35.90', '6.9', '机械工业出版社', '2009-1-1', '程序员必买', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20459091-1_w.jpg', 'book_img/20459091-1_b.jpg', '25');
INSERT INTO t_book VALUES ('3KAAW5OL42ROBQMK2F81URMFRIMB22M5', '联想台式机电脑整机全套扬天T4900D i3i5 i7税控电脑小主机M4900K', '福建', '2699.00', '2188.00', '8.1', '睿傲数码专营店', '2011-1-1', 'Lenovo/联想 T4900D I5-7400', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/7-w.jpg', 'book_img/7-b.jpg', '104');
INSERT INTO t_book VALUES ('400D94DE5A0742B3A618FC76DF107183', 'JavaScript宝典（第7版）（配光盘）', '北京', '128.00', '88.30', '6.9', '清华大学出版社', '2013-1-1', 'JS开发大宝典，走过路过别错过', 'B92ED191DBE647BE8F75721FB231E207', 'book_img/23169892-1_w.jpg', 'book_img/23169892-1_b.jpg', '88');
INSERT INTO t_book VALUES ('4491EA4832E04B8B94F334B71E871983', 'Java语言程序设计：进阶篇（原书第8版）', '北京', '79.00', '54.50', '6.9', '机械工业出版社', '2011-6-1', '渡劫，进阶', 'B92ED191DBE647BE8F75721FB231E207', 'book_img/21117631-1_w_1.jpg', 'book_img/21117631-1_b.jpg', '48');
INSERT INTO t_book VALUES ('48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '北京', '139.00', '95.30', '6.9', '机械工业出版社', '2012-4-1', 'JS开发必备', 'B92ED191DBE647BE8F75721FB231E207', 'book_img/22722790-1_w.jpg', 'book_img/22722790-1_b.jpg', '4');
INSERT INTO t_book VALUES ('49D98E7916B94232862F7DCD1B0BAB66', 'HTML5+JavaScript动画基础', '哈尔滨', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-6-1', 'H5与JS', 'B92ED191DBE647BE8F75721FB231E207', 'book_img/23266633-1_w.jpg', 'book_img/23266633-1_b.jpg', '51');
INSERT INTO t_book VALUES ('4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '哈尔滨', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', 'Spring实战案例剖析', 'B92ED191DBE647BE8F75721FB231E207', 'book_img/23254532-1_w.jpg', 'book_img/23254532-1_b.jpg', '11');
INSERT INTO t_book VALUES ('4BF6D97DD18A4B77B8DED9B057577F8F', 'Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）', '哈尔滨', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', 'JAVA Web从入门到跑路', '65NNOQQL44TG0SH5ALG85JCV5NOV8O87', 'book_img/22862056-1_w.jpg', 'book_img/22862056-1_b.jpg', '23');
INSERT INTO t_book VALUES ('4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '哈尔滨', '99.80', '68.90', '6.9', '清华大学出版社', '2010-1-1', '王者归来，大结局！', '65NNOQQL44TG0SH5ALG85JCV5NOV8O87', 'book_img/20756351-1_w_1.jpg', 'book_img/20756351-1_b_1.jpg', '17');
INSERT INTO t_book VALUES ('4D20D2450B084113A331D909FF4975EB', 'jQuery实战(第2版)(畅销书升级版，掌握Web开发利器必修宝典)', '哈尔滨', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-3-1', '实战！实战！', 'KZ0GZUYN4HWABUPV4FPKTLWXIDZLY49T', 'book_img/22638286-1_w.jpg', 'book_img/22638286-1_b.jpg', '79');
INSERT INTO t_book VALUES ('4E44405DAFB7413E8A13BBFFBEE73AC7', 'JavaScript经典实例', '安徽', '78.00', '53.80', '6.9', '中国电力出版社', '2012-3-1', 'JS经典开发案例大解析', 'KZ0GZUYN4HWABUPV4FPKTLWXIDZLY49T', 'book_img/22692811-1_w.jpg', 'book_img/22692811-1_b.jpg', '68');
INSERT INTO t_book VALUES ('504FB999B0444B339907090927FDBE8A', '深入浅出Ext JS(第3版)', '安徽', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-10-1', 'JS！JS！', '1H9P9RLS0OP3ZL6S8DYKYZ72LXGRU4U6', 'book_img/23351049-1_w_1.jpg', 'book_img/23351049-1_b.jpg', '71');
INSERT INTO t_book VALUES ('52077C8423B645A9BADA96A5E0B14422', 'Spring源码深度解析', '安徽', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-9-1', '深度解析', '1H9P9RLS0OP3ZL6S8DYKYZ72LXGRU4U6', 'book_img/23329703-1_w_1.jpg', 'book_img/23329703-1_b.jpg', '52');
INSERT INTO t_book VALUES ('52B0EDFF966E4A058BDA5B18EEC698C4', '亮剑Java Web项目开发案例导航(含DVD光盘1张)', '安徽', '69.00', '41.40', '6.0', '电子工业出版社', '2012-3-1', '亮剑开发', '3K71UB0F6NBU8T1ZFUSEKVRQ1PJHJQMW', 'book_img/22623766-1_w.jpg', 'book_img/22623766-1_b.jpg', '81');
INSERT INTO t_book VALUES ('5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '安徽', '90.00', '62.10', '6.9', '电子工业出版社', '2012-2-1', '企业开发', '3K71UB0F6NBU8T1ZFUSEKVRQ1PJHJQMW', 'book_img/22605701-1_w.jpg', 'book_img/22605701-1_b.jpg', '24');
INSERT INTO t_book VALUES ('56B1B7D8CD8740B098677C7216A673C4', '疯狂 Java 程序员的基本修养（《疯狂Java讲义》最佳拍档，扫清知识死角，夯实基本功）', '广州', '59.00', '40.70', '6.9', '电子工业出版社', '2013-1-1', '程序员修养', '3K71UB0F6NBU8T1ZFUSEKVRQ1PJHJQMW', 'book_img/23042420-1_w.jpg', 'book_img/23042420-1_b.jpg', '89');
INSERT INTO t_book VALUES ('57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', '广州', '79.00', '54.50', '6.9', '电子工业出版社', '2014-1-1', '了不起的程序员', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/23368351-1_w_2.jpg', 'book_img/23368351-1_b.jpg', '8');
INSERT INTO t_book VALUES ('5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '广州', '59.80', '50.00', '6.9', '清华大学出版社', '2012-9-1', '入门到跑路', '922E6E2DB04143D39C9DDB26365B3EE8', 'book_img/22862060-1_w.jpg', 'book_img/22862060-1_b.jpg', '1');
INSERT INTO t_book VALUES ('5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '广州', '99.00', '68.30', '6.9', '人民邮电出版社', '2012-3-1', '高级设计', '56AD72718C524147A2485E5F4A95A062', 'book_img/22628333-1_w.jpg', 'book_img/22628333-1_b.jpg', '5');
INSERT INTO t_book VALUES ('5EDB981339C342ED8DB17D5A198D50DC', 'Java程序性能优化', '广州', '59.00', '40.70', '6.9', '清华大学出版社', '2012-10-1', '性能优化详解', '56AD72718C524147A2485E5F4A95A062', 'book_img/22881618-1_w.jpg', 'book_img/22881618-1_b.jpg', '27');
INSERT INTO t_book VALUES ('5KI7UY3NLMB2TWNRSPBKN95EKI09Y80N', '联想台式机电脑全套天逸510S i3商务办公迷你小主机电脑整机G4560', '福建', '3099.00', '2699.00', '8.7', '联想火速专卖店', '2012-3-1', 'Lenovo/联想 天逸510S I3', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/6-w.jpg', 'book_img/6-b.jpg', '103');
INSERT INTO t_book VALUES ('5Q00CRCSV6K0CR3NTS9HJMLGYA6QFA4H', '新创云微型电脑迷你主机HTPC工控小主机准系统j1900四核双网双串', '哈尔滨', '2456.00', '799.00', '3.3', '新创云电脑旗舰店', '2013-2-1', '迷你电脑 j1900', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/13-w.jpg', 'book_img/13-b.jpg', '110');
INSERT INTO t_book VALUES ('6398A7BA400D40258796BCBB2B256068', 'JavaScript设计模式', '湖南', '49.00', '33.80', '6.9', '人民邮电出版社', '2013-6-1', '设计模式', 'DCAD0384A6444C048951C7B36C5D96EE', 'book_img/23266635-1_w.jpg', 'book_img/23266635-1_b.jpg', '40');
INSERT INTO t_book VALUES ('676B56A612AF4E968CF0F6FFE289269D', 'JavaScript和jQuery实战手册（原书第2版）', '湖南', '99.00', '68.30', '6.9', '机械工业出版社', '2013-3-11', '实战手册', 'DCAD0384A6444C048951C7B36C5D96EE', 'book_img/23201813-1_w.jpg', 'book_img/23201813-1_b.jpg', '42');
INSERT INTO t_book VALUES ('7917F5B19A0948FD9551932909328E4E', 'Java项目开发案例全程实录（第2版）（配光盘）（软件项目开发全程实录丛书）', '湖南', '69.80', '48.20', '6.9', '清华大学出版社', '2011-1-1', '开发实录', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/20991549-1_w_1.jpg', 'book_img/20991549-1_b.jpg', '64');
INSERT INTO t_book VALUES ('7C0C785FFBEC4DEC802FA36E8B0BC87E', '深入分析Java Web技术内幕', '湖南', '69.00', '47.60', '6.9', '电子工业出版社', '2012-9-1', '深入分析', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/22881803-1_w.jpg', 'book_img/22881803-1_b.jpg', '50');
INSERT INTO t_book VALUES ('7CD79C20258F477AB841518D9312E843', 'Java程序员面试宝典（第三版）', '湖南', '49.00', '33.80', '6.9', '电子工业出版社', '2013-9-1', '面试大宝典', '757BDAB506A445EC8DEDA4CE04303B9F', 'book_img/23348683-1_w_1.jpg', 'book_img/23348683-1_b.jpg', '44');
INSERT INTO t_book VALUES ('7D7FE81293124793BDB2C6FF1F1C943D', '21天学通Java(第6版)（中文版累计销量超30000册）', '江西', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '适合快速学习，入门', '757BDAB506A445EC8DEDA4CE04303B9F', 'book_img/23219731-1_w.jpg', 'book_img/23219731-1_b.jpg', '46');
INSERT INTO t_book VALUES ('7FD7F50B15F74248AA769798909F8653', 'Java网络编程（第3版）——O’Reilly Java系列', '江西', '85.00', '51.00', '6.0', '中国电力出版社', '2005-11-1', '网络编程必备', '57DE3C2DDA784B81844029A28217698C', 'book_img/9062293-1_w.jpg', 'book_img/9062293-1_b.jpg', '35');
INSERT INTO t_book VALUES ('7T3N35TWJWJG222YETD7BJJJQAAP8MRT', 'Asus/华硕K30BF台式电脑四核家用办公商用游戏主机机箱电脑台式机', '福建', '4199.00', '3499.00', '8.3', 'asus华硕官方旗舰店', '2013-4-1', 'Asus/华硕 K30BF', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/5-w.jpg', 'book_img/5-b.jpg', '102');
INSERT INTO t_book VALUES ('819FF56E4423462394E6F83882F78975', '学通Java Web的24堂课（配光盘）（软件开发羊皮卷）', '江西', '79.80', '55.10', '6.9', '清华大学出版社', '2011-6-1', '24堂课', '57DE3C2DDA784B81844029A28217698C', 'book_img/21118835-1_w_1.jpg', 'book_img/21118835-1_b.jpg', '91');
INSERT INTO t_book VALUES ('81FADA99309342F4978D5C680B0C6E8C', 'Java入门很简单（配光盘）（入门很简单丛书）（打开Java编程之门 Java技术网推荐）', '江西', '59.80', '41.30', '6.9', '清华大学出版社', '2012-8-1', '入门很简单，放弃也容易', 'B596ECE0F9BF40288F40A66B35551806', 'book_img/22839309-1_w.jpg', 'book_img/22839309-1_b.jpg', '85');
INSERT INTO t_book VALUES ('86ETLAPM9NGMPCMUT1L3EO9ZBIGRIADC', 'dell戴尔台式机电脑 成就3668 i5办公全套整机家用游戏品牌主机', '北京', '6399.00', '5249.00', '8.2', 'dell索隆专卖店', '2012-4-1', 'Dell/戴尔 Vostro3668', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/2-w.jpg', 'book_img/2-b.jpg', '99');
INSERT INTO t_book VALUES ('89A57D099EA14026A5C3D10CFC10C22C', 'Java 2实用教程（第4版）（21世纪高等学校计算机基础实用规划教材）', '四川', '39.50', '31.60', '8.0', '清华大学出版社', '2012-8-1', '使用教程', 'B596ECE0F9BF40288F40A66B35551806', 'book_img/22844118-1_w.jpg', 'book_img/22844118-1_b.jpg', '73');
INSERT INTO t_book VALUES ('8A5B4042D5B14D6B87A34DABF327387F', 'Java核心技术 卷II：高级特性(第9版·英文版)(上、下册)', '四川', '119.00', '82.10', '6.9', '人民邮电出版社', '2013-7-1', '核心技术剖析', 'B596ECE0F9BF40288F40A66B35551806', 'book_img/23280478-1_w.jpg', 'book_img/23280478-1_b.jpg', '57');
INSERT INTO t_book VALUES ('8DD0ADF2665B40899E09ED2983DC3F7B', 'jQuery权威指南（被公认的权威的、易学的jQuery实战教程，多次重印，热销中）', '四川', '59.00', '40.70', '6.9', '机械工业出版社', '2011-1-1', '权威指南', '458795C27E7346A8A5F1B942319297E0', 'book_img/21006995-1_w_1.jpg', 'book_img/21006995-1_b.jpg', '75');
INSERT INTO t_book VALUES ('8E16D59BA4C34374A68029AE877613C4', '轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)', '四川', '99.00', '68.30', '6.9', '电子工业出版社', '2012-4-1', '企业开发实例', '458795C27E7346A8A5F1B942319297E0', 'book_img/22685703-1_w.jpg', 'book_img/22685703-1_b.jpg', '6');
INSERT INTO t_book VALUES ('8F1520F2CED94C679433B9C109E791CB', 'Java从入门到精通（实例版）（附光盘1张）（连续8月Java类全国零售排行前2名，14小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '重庆', '69.80', '47.60', '6.9', '清华大学出版社', '2012-9-1', '入门到跑路', '458795C27E7346A8A5F1B942319297E0', 'book_img/22862061-1_w.jpg', 'book_img/22862061-1_b.jpg', '49');
INSERT INTO t_book VALUES ('90E423DBE56042838806673DB3E86BD3', '《Spring技术内幕（第2版）》（畅销书全新升级，Spring类图书销量桂冠，从宏观和微观两个角度解析Spring架构设计和实现原理）', '重庆', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '内幕，内幕', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/22606836-1_w.jpg', 'book_img/22606836-1_b.jpg', '45');
INSERT INTO t_book VALUES ('926B8F31C5D04F61A72F66679A0CCFFD', 'JavaScript编程精解（华章程序员书库）（JavaScript之父高度评价并强力推荐，系统学习JS首选！）', '重庆', '49.00', '33.80', '6.9', '械工业出版社', '2012-9-1', '精华讲解', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/22873894-1_w.jpg', 'book_img/22873894-1_b.jpg', '70');
INSERT INTO t_book VALUES ('94L4VIFKBDG72ZNUVFE1OI96O26Z2NJM', '联想台式机电脑家悦3055 A6/四核A10 独显家用办公游戏主机全套整', '陕西', '3299.00', '2999.00', '9.0', '伟信数码专营店', '2011-1-1', 'AMD四核A10-7800', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/3-w.jpg', 'book_img/3-b.jpg', '100');
INSERT INTO t_book VALUES ('95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', '重庆', '79.00', '47.40', '6.0', '中国电力出版社', '2007-2-1', 'JAVA干货', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/9265169-1_w.jpg', 'book_img/9265169-1_b.jpg', '13');
INSERT INTO t_book VALUES ('97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '重庆', '49.00', '32.90', '6.7', '人民邮电出版社', '2012-12-24', 'H+C+J', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/22928649-1_w.jpg', 'book_img/22928649-1_b.jpg', '3');
INSERT INTO t_book VALUES ('9923901FBF124623BC707920D8936BC8', 'JavaScript DOM编程艺术(第2版)', '江苏', '49.00', '33.80', '6.9', '人民邮电出版社', '2011-4-1', '编译艺术', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/21049601-1_w_1.jpg', 'book_img/21049601-1_b.jpg', '28');
INSERT INTO t_book VALUES ('99BF63AC12AD48FCB673F1820888964E', 'Java Web开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '江苏', '99.00', '67.40', '6.8', '清华大学出版社', '0', '开发实例', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/21110929-1_w_1.jpg', 'book_img/21110929-1_b.jpg', '78');
INSERT INTO t_book VALUES ('9D257176A6934CB79427CEC37E69249F', '疯狂Ajax讲义（第3版）--jQuery/Ext JS/Prototype/DWR企业应用前端开发实战(含CD光盘1张)（畅销书升级版，企业应用前端开发实战指南）', '江苏', '79.00', '54.50', '6.9', '电子工业出版社', '2013-2-1', '疯狂教学', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/23184673-1_w.jpg', 'book_img/23184673-1_b.jpg', '53');
INSERT INTO t_book VALUES ('9FBD51A7C02D4F5B9862CD2EBBF5CA04', 'Flash ActionScript 3.0全站互动设计', '江苏', '69.80', '48.20', '6.9', '人民邮电出版社', '2012-10-1', '干货干货', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/22886581-1_w.jpg', 'book_img/22886581-1_b.jpg', '96');
INSERT INTO t_book VALUES ('9FF423101836438F874035A48498CF45', 'Java编程思想（英文版·第4版）', '浙江', '79.00', '54.50', '6.9', '机械工业出版社', '2007-4-1', '编程思想，适合初学者', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/9288920-1_w.jpg', 'book_img/9288920-1_b.jpg', '31');
INSERT INTO t_book VALUES ('A3D464D1D1344ED5983920B472826730', 'Java Web开发详解：XML+DTD+XML Schema+XSLT+Servlet 3 0+JSP 2 2深入剖析与实例应用(含CD光盘1张)', '浙江', '119.00', '61.30', '5.2', '电子工业出版社', '2012-5-1', 'WEB开发详解', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/22788412-1_w.jpg', 'book_img/22788412-1_b.jpg', '60');
INSERT INTO t_book VALUES ('A46A0F48A4F649AE9008B38EA48FAEBA', 'Java编程全能词典(含DVD光盘2张)', '浙江', '98.00', '65.70', '6.7', '电子工业出版社', '2010-3-1', '全能词典', '65830AB237EF428BAE9B7ADC78A8D1F6', 'book_img/20813806-1_w_1.jpg', 'book_img/20813806-1_b.jpg', '90');
INSERT INTO t_book VALUES ('A5A6F27DCD174614850B26633A0B4605', 'JavaScript模式', '浙江', '38.00', '22.80', '6.0', '中国电力出版社', '2012-7-1', 'JS模式宝典', '65830AB237EF428BAE9B7ADC78A8D1F6', 'book_img/22819430-1_w.jpg', 'book_img/22819430-1_b.jpg', '61');
INSERT INTO t_book VALUES ('A7220EF174704012830E066FDFAAD4AD', 'Spring 3.0就这么简单（国内原创的Java敏捷开发图书，展现作者Spring原创开源项目ROP开发的全过程，所有项目工程均以Maven组织）', '河北', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-1-1', 'Spring3.0', '65830AB237EF428BAE9B7ADC78A8D1F6', 'book_img/22938474-1_w.jpg', 'book_img/22938474-1_b.jpg', '77');
INSERT INTO t_book VALUES ('A7EFD99367C9434682A790635D3C5FDF', 'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）', '河北', '98.00', '67.60', '6.9', '清华大学出版社', '2013-6-1', 'WEB技术大合集', '89ND02BJGGLC57C0MS7VJPHR0C5IZ3CH', 'book_img/23266270-1_w.jpg', 'book_img/23266270-1_b.jpg', '92');
INSERT INTO t_book VALUES ('A8EF76FD21A645109538614DEA85F3F7', 'Java语言程序设计：基础篇（原书第8版）', '河北', '75.00', '51.80', '6.9', '机械工业出版社', '2011-6-1', '程序设计基础', '89ND02BJGGLC57C0MS7VJPHR0C5IZ3CH', 'book_img/21122188-1_w_1.jpg', 'book_img/21122188-1_b.jpg', '30');
INSERT INTO t_book VALUES ('AD6EA79CCB8240AAAF5B292AD7E5DCAA', 'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）', '河北', '59.00', '40.70', '6.9', '机械工业出版社', '2012-8-1', '权威的指南哦', '89ND02BJGGLC57C0MS7VJPHR0C5IZ3CH', 'book_img/22847009-1_w.jpg', 'book_img/22847009-1_b.jpg', '38');
INSERT INTO t_book VALUES ('AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', '山东', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-4-1', 'JS基础', '60VBAZ4M7SYZ6GA8Y10JNSN9H6BVC8K4', 'book_img/22717349-1_w.jpg', 'book_img/22717349-1_b.jpg', '37');
INSERT INTO t_book VALUES ('AF28ED8F692C4288B32CF411CBDBFC23', '经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)', '山东', '79.00', '54.50', '6.9', '电子工业出版社', '2010-8-1', '企业开发', '60VBAZ4M7SYZ6GA8Y10JNSN9H6BVC8K4', 'book_img/20928547-1_w_1.jpg', 'book_img/20928547-1_b.jpg', '55');
INSERT INTO t_book VALUES ('B329A14DDEF8455F82B3FDF25821D2BB', '名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）', '山东', '69.80', '48.20', '6.9', '清华大学出版社', '2010-8-1', '11111111111111111111', '60VBAZ4M7SYZ6GA8Y10JNSN9H6BVC8K4', 'book_img/20915948-1_w_3.jpg', 'book_img/20915948-1_b.jpg', '22');
INSERT INTO t_book VALUES ('B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '山东', '49.00', '33.80', '6.9', '人民邮电出版社', '2012-7-1', '2222222222222222222', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/22786088-1_w.jpg', 'book_img/22786088-1_b.jpg', '10');
INSERT INTO t_book VALUES ('BD1CB005E4A04DCA881DA8689E21D4D0', 'jQuery UI开发指南', '山东', '39.00', '26.90', '6.9', '人民邮电出版社', '2012-12-1', '1111111111111111111111111111111111111111111', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/22910975-1_w.jpg', 'book_img/22910975-1_b.jpg', '63');
INSERT INTO t_book VALUES ('C23E6E8A6DB94E27B6E2ABD39DC21AF5', 'JavaScript:The Good Parts(影印版）', '山西', '28.00', '19.30', '6.9', '东南大学出版社', '2009-1-1', '2222222222222222222222222222222', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/20412979-1_w.jpg', 'book_img/20412979-1_b.jpg', '95');
INSERT INTO t_book VALUES ('C3CF52B3ED2D4187A16754551488D733', 'Java从入门到精通（附光盘）', '山西', '59.00', '35.40', '6.0', '人民邮电出版社', '2010-4-1', '333333333333333333333333333333333', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/20810282-1_w_1.jpg', 'book_img/20810282-1_b.jpg', '29');
INSERT INTO t_book VALUES ('C7VLXNJKGSAW83Q7VOUAQ52WDUES4V94', '酷睿i5四核GTX1060独显台式机组装电脑主机整机 绝地求生吃鸡游戏', '河北', '2499.00', '2399.00', '9.6', '酷耶旗舰店', '2013-4-1', 'cooyes/酷耶 CY09', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/12-w.jpg', 'book_img/12-b.jpg', '109');
INSERT INTO t_book VALUES ('C86D3F6FACB449BEBD940D9307ED4A47', '编写高质量代码：改善Java程序的151个建议(从语法、程序设计和架构、工具和框架、编码风格、编程思想5个方面探讨编写高质量Java代码的技巧、禁忌和最佳实践)', '山西', '59.00', '40.70', '6.9', '机械工业出版社', '2012-1-1', '44444444444444444444444', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/22579686-1_w.jpg', 'book_img/22579686-1_b.jpg', '84');
INSERT INTO t_book VALUES ('CB0AB3654945411EA69F368D0EA91A00', 'JavaScript语言精粹（修订版）', '山西', '49.00', '39.20', '8.0', '电子工业出版社', '2012-9-1', '555555555555555555555', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/22872884-1_w.jpg', 'book_img/22872884-1_b.jpg', '33');
INSERT INTO t_book VALUES ('CD913617EE964D0DBAF20C60076D32FB', '名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）', '辽宁', '79.80', '55.10', '6.9', '清华大学出版社', '2009-8-1', '6666666666666666666666666', '23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', 'book_img/20637368-1_w_2.jpg', 'book_img/20637368-1_b_2.jpg', '19');
INSERT INTO t_book VALUES ('CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '辽宁', '108.00', '74.50', '6.9', '机械工业出版社', '2007-6-1', '77777777777777777777777777777', '23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', 'book_img/9317290-1_w.jpg', 'book_img/9317290-1_b.jpg', '2');
INSERT INTO t_book VALUES ('CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '辽宁', '79.80', '55.10', '6.9', '清华大学出版社', '2013-6-1', '88888888888888888888888888888', '23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', 'book_img/23263012-1_w.jpg', 'book_img/23263012-1_b.jpg', '43');
INSERT INTO t_book VALUES ('D0DA36CEE42549FFB299B7C7129761D5', 'Java应用架构设计：模块化模式与OSGi(全球资深Java技术专家的力作，系统、全面地讲解如何将模块化设计思想引入开发中，涵盖18个有助于实现模块化软件架构的模式)', '辽宁', '69.00', '47.60', '6.9', '机械工业出版社', '2013-9-1', '99999999999999999999999999999', '23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', 'book_img/23339643-1_w.jpg', 'book_img/23339643-1_b.jpg', '26');
INSERT INTO t_book VALUES ('D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '天津', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '000000000000000000000000000', '23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', 'book_img/22606835-1_w.jpg', 'book_img/22606835-1_b.jpg', '15');
INSERT INTO t_book VALUES ('D2ABA8B06C524632846F27C34568F3CE', 'Java 经典实例', '天津', '98.00', '67.60', '6.9', '中国电力出版社', '2009-2-1', '111111111111111111111111111111', '23QIJA9BXV5MG8NA81X87RHE6BYG7RZR', 'book_img/20500255-1_w.jpg', 'book_img/20500255-1_b.jpg', '62');
INSERT INTO t_book VALUES ('D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '天津', '79.00', '54.50', '6.9', '机械工业出版社', '2013-6-1', '22222222222222222222222222222', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/23259731-1_w.jpg', 'book_img/23259731-1_b.jpg', '14');
INSERT INTO t_book VALUES ('DC36FD53A1514312A0A9ADD53A583886', 'JavaScript异步编程：设计快速响应的网络应用【掌握JavaScript异步编程必杀技，让代码更具响应度！ 】', '天津', '32.00', '22.10', '6.9', '人民邮电出版社', '2013-6-1', '33333333333333333333333333', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/23252196-1_w.jpg', 'book_img/23252196-1_b.jpg', '72');
INSERT INTO t_book VALUES ('DCB64DF0084E486EBF173F729A3A630A', 'Java设计模式(第2版)', '河北', '75.00', '51.80', '6.9', '电子工业出版社', '2012-9-1', '4444444444444444444444', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/22868759-1_w.jpg', 'book_img/22868759-1_b.jpg', '76');
INSERT INTO t_book VALUES ('DEE7BDC7E0E343149E3C3601D2658171', '疯狂HTML 5/CSS 3/JavaScript讲义(含CD光盘1张)', '河北', '69.00', '47.60', '6.9', '电子工业出版社', '2012-5-1', '55555555555555555555555555555', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/22783904-1_w.jpg', 'book_img/22783904-1_b.jpg', '21');
INSERT INTO t_book VALUES ('DF4E74EEE89B43229BB8212F0B858C38', '精通Hibernate：Java对象持久化技术详解（第2版）(含光盘1张)', '河北', '75.00', '51.80', '6.9', '电子工业出版社', '2010-2-1', '666666666666666666666666', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/20773347-1_w_1.jpg', 'book_img/20773347-1_b.jpg', '39');
INSERT INTO t_book VALUES ('E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', '河北', '109.00', '75.20', '6.9', '电子工业出版社', '2012-1-1', '777777777777777777777777777', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/22588603-1_w.jpg', 'book_img/22588603-1_b.jpg', '7');
INSERT INTO t_book VALUES ('EA695342393C4BE48B831FA5E6B0E5C4', '编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）', '河南', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '888888888888888888888888888888888', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/23200995-1_w.jpg', 'book_img/23200995-1_b.jpg', '59');
INSERT INTO t_book VALUES ('F0E34313BF304CCEBF198BD4E05307B8', 'jQuery Cookbook中文版（jQuery之父鼎力推荐，社区数十位专家倾情力作', '河南', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-5-1', '999999999999999999999999999999', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/23219358-1_w.jpg', 'book_img/23219358-1_b.jpg', '87');
INSERT INTO t_book VALUES ('F6162799E913423EA5CB57BEC65AB1E9', 'JUnit实战(第2版)', '河南', '79.00', '54.50', '6.9', '人民邮电出版社', '2012-4-1', '0000000000000000000000000000000', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/22633574-1_w.jpg', 'book_img/22633574-1_b.jpg', '80');
INSERT INTO t_book VALUES ('F693239BC3B3444C8538ABE7411BB38E', 'Java Web典型模块与项目实战大全（配光盘）', '河南', '99.50', '68.70', '6.9', '清华大学出版社', '2011-1-1', '22222222222222222222222222222', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/20988080-1_w_1.jpg', 'book_img/20988080-1_b.jpg', '41');
INSERT INTO t_book VALUES ('F78C94641DB4475BBA1E72A07DF9B3AE', 'JAVA面向对象编程', '河南', '65.80', '45.40', '6.9', '电子工业出版社', '2006-7-1', '55555555555555555555555555555555555555', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/9186890-1_w.jpg', 'book_img/9186890-1_b.jpg', '69');
INSERT INTO t_book VALUES ('FC232CD9B6E6411BBBB1A5B781D2C3C9', 'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）', '陕西', '88.00', '60.70', '6.9', '电子工业出版社', '2002-10-1', '777777777777777777777777777777', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/696673-1_w.jpg', 'book_img/696673-1_b.jpg', '67');
INSERT INTO t_book VALUES ('FEC3740CF30E442A94021911A25EF0D7', 'Spring攻略(第2版)(Spring攻略(第2版))', '陕西', '128.00', '88.30', '6.9', '人民邮电出版社', '2012-3-1', '888888888888888888888888888888888', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/22623020-1_w.jpg', 'book_img/22623020-1_b.jpg', '82');
INSERT INTO t_book VALUES ('FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '陕西', '79.00', '54.50', '6.9', '机械工业出版社', '2013-2-1', '44444444444444444444444444444444444444', '03R52JX1MGPP1N4S2638BKOP8XX7YQVK', 'book_img/23179003-1_w.jpg', 'book_img/23179003-1_b.jpg', '47');
INSERT INTO t_book VALUES ('JAQNAM6V9DMMW2STAC8JCPJ1ZVCZJLQ2', 'dell戴尔台式机 G4560/i3品牌主机游戏全套整机迷你商用办公电脑', '广东', '3999.00', '3249.00', '8.1', 'dell索隆专卖店', '2013-4-1', 'Dell/戴尔 V3650R-1308B', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/1-w.jpg', 'book_img/1-b.jpg', '98');
INSERT INTO t_book VALUES ('JJP3O9QZYOZEYT22DU5Q9F40JB6IB77E', '酷睿I5/1050Ti独显/128G固态家用办公吃鸡游戏电脑主机台式机全套', '河南', '1799.00', '1299.00', '7.2', '广州鑫石数码专营店', '2013-2-1', '星惠佳 i5 组装机', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/11-w.jpg', 'book_img/11-b.jpg', '108');
INSERT INTO t_book VALUES ('N8Q79SJJZO8PZ3NVTS65H24V3AJONI6X', '迷你主机酷睿i5客厅台式小主机HTPC家用办公电脑DIY整机', '山西', '1199.00', '899.00', '7.5', '中盾数码专营店', '2013-4-1', '天虹迷你电脑', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/9-w.jpg', 'book_img/9-b.jpg', '106');
INSERT INTO t_book VALUES ('P5JN3WIMSZ3CRY4WS2IEWZJQJGW3B7GD', '联想扬天T4900D i3i5 i7办公税控台式机电脑整机全套小主机T6900C', '河北', '2599.00', '2183.00', '8.3', '翔数数码专营店', '2012-4-1', 'Lenovo/联想 T4900C I3', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/4-w.jpg', 'book_img/4-b.jpg', '101');
INSERT INTO t_book VALUES ('T3WGYC0H0GHUZ4DI9SJ5DIIZ7JDM3XKT', '联想电脑台式机小主机扬天T4900Di3i5i7办公商用家用税控整机全套', '安徽', '4149.00', '3599.00', '8.6', '巨立数码专营店', '2012-3-1', 'Lenovo/联想 T4900C I5 4GB', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/14-w.jpg', 'book_img/14-b.jpg', '111');
INSERT INTO t_book VALUES ('VDS3HV6ERA5Z10FVGJA1Y3VB8FLXQHWX', 'topfeel极夜T65M迷你主机电脑台式全套整机微型办公商务家用HTPC', '辽宁', '2599.00', '2199.00', '8.5', 'topfeel旗舰店', '2011-1-1', 'topfeel T65M', '4D01FFF0CB94468EA907EF42780668AB', 'book_img/10-w.jpg', 'book_img/10-b.jpg', '107');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_t_order_t_user` (`uid`),
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `s_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO t_order VALUES ('0A1F4C5BDE754277B984D1E7E763051D', '2014-01-16 15:18:47', '41.30', '1', '福州市 鼓楼区 西街镇 福发大楼 二楼前台', 'A7B');
INSERT INTO t_order VALUES ('48fa700c-f358-46e5-bff6-0c229fc2', '2017-12-15 16:56:56', '67.60', '5', '福州市 鼓楼区 西街镇 福发大楼 二楼前台', 'a44');
INSERT INTO t_order VALUES ('8f08f912-0093-4c90-b394-702f1a7c', '2017-12-20 11:51:15', '117.60', '1', '北京市  天安门 城楼 9527号  韩少', '85e06');
INSERT INTO t_order VALUES ('f36860e6-33f8-4f4f-80b6-f8a84765', '2017-12-13 11:18:44', '82.10', '1', '福州市 鼓楼区 西街镇 福发大楼 二楼前台', 'A7B');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_t_orderitem_t_order` (`oid`),
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO t_orderitem VALUES ('041dee73-cef1-4d3a-980a-820eaa46', '1', '82.10', '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '82.10', 'book_img/23362142-1_b.jpg', 'f36860e6-33f8-4f4f-80b6-f8a84765');
INSERT INTO t_orderitem VALUES ('068b11b1-4881-4fbf-8905-1908c257', '1', '67.60', '0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '67.60', 'book_img/20285763-1_b.jpg', '8f08f912-0093-4c90-b394-702f1a7c');
INSERT INTO t_orderitem VALUES ('2ff46f92-4a2e-4b96-8ced-2938847d', '1', '50.00', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '50.00', 'book_img/22862060-1_b.jpg', '8f08f912-0093-4c90-b394-702f1a7c');
INSERT INTO t_orderitem VALUES ('94fd8337-1f1c-45b3-83dc-7c099c54', '1', '67.60', '0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '67.60', 'book_img/20285763-1_b.jpg', '48fa700c-f358-46e5-bff6-0c229fc2');
