/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_news
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_news` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_news`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentid` int(10) NOT NULL AUTO_INCREMENT COMMENT '新闻评论ID号',
  `newsid` int(11) NOT NULL COMMENT '关联news表',
  `commentdate` varchar(20) NOT NULL COMMENT '评论发布日期',
  `commentbody` varchar(20) NOT NULL COMMENT '评论主体',
  `userid` varchar(20) NOT NULL COMMENT '关联用户表id',
  `commentip` varchar(20) NOT NULL COMMENT '评论用户的ip地址',
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='评论表';

/*Data for the table `comment` */

/*Table structure for table `hyperlink` */

DROP TABLE IF EXISTS `hyperlink`;

CREATE TABLE `hyperlink` (
  `linkid` int(10) NOT NULL AUTO_INCREMENT COMMENT '外部超链接表id',
  `linkname` varchar(20) NOT NULL COMMENT '外部超链接名字',
  `linkaddress` varchar(200) NOT NULL COMMENT '外部超链接地址',
  PRIMARY KEY (`linkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='外部超链接表';

/*Data for the table `hyperlink` */

/*Table structure for table `id_card` */

DROP TABLE IF EXISTS `id_card`;

CREATE TABLE `id_card` (
  `userid` varchar(20) NOT NULL COMMENT '用户名账号',
  `password` varchar(20) NOT NULL COMMENT '密码',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户账号和密码';

/*Data for the table `id_card` */

insert  into `id_card`(`userid`,`password`) values ('aaa','aaa'),('admin','admin'),('ccc','ccc'),('ddd','ddd'),('qqq','qqq'),('sds','dcs'),('ssasa','qqqq'),('sswq','sswq');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menuid` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menuname` varchar(20) NOT NULL COMMENT '菜单名',
  `menuvalue` varchar(200) DEFAULT NULL COMMENT '菜单值:一般为一个路径地址',
  `menufatherid` int(10) DEFAULT NULL COMMENT '父菜单id',
  `menulevel` int(10) NOT NULL COMMENT '菜单等级:1为一级菜单;2为二级菜单:3为三级菜单',
  `menudesc` varchar(200) DEFAULT NULL COMMENT '菜单描叙',
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权力表';

/*Data for the table `menu` */

insert  into `menu`(`menuid`,`menuname`,`menuvalue`,`menufatherid`,`menulevel`,`menudesc`) values (-1,'无父菜单',NULL,NULL,-2,NULL),(1,'系统管理',NULL,-1,0,NULL),(2,'用户角色管理','manage_role.jsp',1,1,'给用户赋予角色'),(3,'角色权限管理','role_right_manage.jsp',1,1,'角色权限的分配'),(4,'菜单管理','menu_query_body.jsp',1,1,NULL),(5,'新闻系统管理',NULL,-1,0,NULL),(6,'编辑管理','manage_wr.jsp',5,1,NULL),(7,'论坛管理','forum.jsp',5,1,NULL),(8,'模块管理','test.jsp',5,1,NULL),(9,'新闻人管理',NULL,5,1,NULL),(33,'dadfafds','asdfasdfasd',5,1,'aa开讲啦卡缴费单fff');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编码表',
  `newstitle` varchar(20) NOT NULL COMMENT '新闻标题',
  `newsbody` text NOT NULL COMMENT '新闻主体',
  `newsdate` varchar(20) NOT NULL COMMENT '新闻提交时间',
  `userid` varchar(20) NOT NULL COMMENT '新闻作者',
  `newsimage` varchar(200) DEFAULT NULL COMMENT '新闻图片,存路径和图片名',
  `newsvideo` varchar(200) DEFAULT NULL COMMENT '视频新闻必须,存路径和视频',
  `typeid` int(5) NOT NULL COMMENT '关联新闻类型表',
  `ispublish` int(1) NOT NULL COMMENT '0-5的选择,0:新闻待审核状态,1:新闻审核通过状态,2:新闻复核状态,3:审核不通过',
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻表';

/*Data for the table `news` */

/*Table structure for table `news_type` */

DROP TABLE IF EXISTS `news_type`;

CREATE TABLE `news_type` (
  `typeid` int(5) NOT NULL COMMENT '新闻类型ID号',
  `typename` varchar(20) NOT NULL COMMENT '新闻类型名称',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻类型表';

/*Data for the table `news_type` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleid` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(20) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`roleid`,`rolename`) values (1,'超级管理员'),(2,'新闻系统管理员'),(3,'主编'),(4,'副主编'),(5,'编辑'),(6,'实习生'),(7,'普通用户'),(8,'t1'),(9,'t22'),(10,'t3'),(11,'t4'),(12,'t5'),(13,'t6'),(14,'t7'),(15,'t8'),(16,'t9'),(17,'t10');

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `menuid` int(10) NOT NULL COMMENT '关联菜单表id',
  `roleid` int(10) NOT NULL COMMENT '关联角色表id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='菜单与角色关联表';

/*Data for the table `role_menu` */

insert  into `role_menu`(`menuid`,`roleid`) values (1,1),(2,1),(3,1),(4,2),(5,2),(6,2);

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `roleid` int(10) NOT NULL COMMENT '关联角色表id',
  `userid` varchar(20) NOT NULL COMMENT '关联用户表id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色用户关联表';

/*Data for the table `role_user` */

insert  into `role_user`(`roleid`,`userid`) values (1,'admin'),(2,'admin'),(7,'aaa'),(7,'ccc'),(5,'ccc');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `userid` varchar(20) NOT NULL COMMENT '用户账号,关联id_card表',
  `username` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `usersex` varchar(5) DEFAULT NULL COMMENT '性别',
  `userage` int(3) DEFAULT NULL COMMENT '年龄',
  `useraddress` varchar(20) DEFAULT NULL COMMENT '住址',
  `useremail` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `userbirth` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `userphone` varchar(15) DEFAULT NULL COMMENT '用户手机号码',
  `usercountry` varchar(20) DEFAULT NULL COMMENT '用户国籍',
  `userremarks` varchar(500) DEFAULT NULL COMMENT '用户自己备注',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户个人信息表';

/*Data for the table `user_info` */

insert  into `user_info`(`userid`,`username`,`usersex`,`userage`,`useraddress`,`useremail`,`userbirth`,`userphone`,`usercountry`,`userremarks`) values ('aaa',NULL,NULL,NULL,NULL,'chen@qq.com',NULL,NULL,NULL,NULL),('admin',NULL,NULL,NULL,NULL,'Chenzhijun1995@gmail.com',NULL,NULL,NULL,NULL),('ccc',NULL,NULL,NULL,NULL,'aa@qq.com',NULL,NULL,NULL,NULL),('ddd',NULL,NULL,NULL,NULL,'Chenzhijun1995@gmail.com',NULL,NULL,NULL,NULL),('qqq',NULL,NULL,NULL,NULL,'Chenzhijun1995@gmail.com',NULL,NULL,NULL,NULL),('sds',NULL,NULL,NULL,NULL,'chen@123.com',NULL,NULL,NULL,NULL),('ssasa',NULL,NULL,NULL,NULL,'aa@qq.com',NULL,NULL,NULL,NULL),('sswq',NULL,NULL,NULL,NULL,'Chenzhijun1995@gmail.com',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
