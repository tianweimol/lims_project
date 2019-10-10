--
-- Current Database: `lims_project`
--

-- DROP DATABASE IF EXISTS `lims_project`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lims_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `lims_project`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) BINARY NOT NULL DEFAULT '' COMMENT '姓名',
  `salutation` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '称呼',
  `mobile` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '手机',
  `tel` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '电话',
  `fax` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '传真',
  `email` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `role_id` TINYINT NOT NULL DEFAULT 0 COMMENT '角色',
  `lab_id` INT NOT NULL DEFAULT 0 COMMENT '实验室ID',
  `dep_id` INT NOT NULL DEFAULT 0 COMMENT '部门ID',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE (`name`, `lab_id`, `dep_id`),
  KEY (`lab_id`, `dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户全局注册表';


DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type_auth` TINYINT NOT NULL DEFAULT 0 COMMENT '认证类型（1:账号,2:邮箱,3:手机,4:QQ,5:微信,6:微博）',
  `auth_key` VARCHAR(60) BINARY NOT NULL DEFAULT '' COMMENT '授权账号（账号;邮箱;手机;第三方登陆，这里是openid）',
  `auth_secret` VARCHAR(60) BINARY NOT NULL DEFAULT '' COMMENT '密码凭证（密码;token）',
  `status_verify` TINYINT NOT NULL DEFAULT 0 COMMENT '认证状态（0:未认证,1:已认证）',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `verify_time` TIMESTAMP NULL COMMENT '认证时间',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`user_id`),
  UNIQUE (`type_auth`, `auth_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户认证表';


DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE `laboratory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '名称',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实验室表';


DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '名称',
  `lab_id` INT NOT NULL DEFAULT 0 COMMENT '实验室ID',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门表';


DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '名称',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='等级表';


DROP TABLE IF EXISTS `holiday`;
CREATE TABLE `holiday` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '名称',
  `date` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='节假日表';


DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '单位名称',
  `address` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '单位地址',
  `site` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '单位官网',
  `tel` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '单位电话',
  `fax` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '单位传真',
  `email` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '单位邮箱',
  `type` TINYINT NOT NULL DEFAULT 0 COMMENT '单位类型（1:工商局,2:客户）',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '单位备注',
  `status_locked` TINYINT NOT NULL DEFAULT 0 COMMENT '锁定状态（0:未锁定,1:已锁定）',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `locked_time` TIMESTAMP NULL COMMENT '锁定时间',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单位表';


DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cid` INT NOT NULL DEFAULT 0 COMMENT '单位ID',
  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `salutation` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '称呼',
  `mobile` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '手机',
  `email` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_default` TINYINT NOT NULL DEFAULT 0 COMMENT '默认状态（0:未默认,1:已默认）',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='联系人表';


DROP TABLE IF EXISTS `applicant`;
CREATE TABLE `applicant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '委托编号',
  `receiver_uid` INT NOT NULL DEFAULT 0 COMMENT '受理人ID',
  `applicant_cid` INT NOT NULL DEFAULT 0 COMMENT '委托单位ID',
  `applicant_uid` INT NOT NULL DEFAULT 0 COMMENT '委托用户ID',
  `detection_cid` INT NOT NULL DEFAULT 0 COMMENT '受检单位ID',
  `type_detection` TINYINT NOT NULL DEFAULT 0 COMMENT '检测类型（1:抽检,2:自测）',
  `type_test` TINYINT NOT NULL DEFAULT 0 COMMENT '测试类型（1:产品标准,2:方法测试）',
  `grade_id` TINYINT NOT NULL DEFAULT 0 COMMENT '样品等级（1:A级,2:B级,3:C级,4:D级）',
  `summary` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '样品数量',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '样品描述',
  `style` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '款号',
  `sku` VARCHAR(100) NOT NULL DEFAULT '' COMMENT 'SKU',
  `brand` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '商标',
  `period` INT NOT NULL DEFAULT 0 COMMENT '检测周期（工作日）',
  `req_date` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '要求完成日期',
  `arr_date` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '样品到达日期',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`receiver_uid`),
  KEY (`applicant_cid`),
  KEY (`applicant_uid`),
  KEY (`detection_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='委托申请表';


DROP TABLE IF EXISTS `specimen`;
CREATE TABLE `specimen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '样品编号',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '样品名称',
  `applicant_id` INT NOT NULL DEFAULT 0 COMMENT '申请ID',
  `grade_id` TINYINT NOT NULL DEFAULT 0 COMMENT '样品等级（1:A级,2:B级,3:C级,4:D级）',
  `style` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '款号',
  `sku` VARCHAR(100) NOT NULL DEFAULT '' COMMENT 'SKU',
  `brand` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '商标',
  `period` INT NOT NULL DEFAULT 0 COMMENT '检测周期（工作日）',
  `req_date` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '要求完成日期',
  `arr_date` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '样品到达日期',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
#   `status_moving` TINYINT NOT NULL DEFAULT 0 COMMENT '流转状态（1:新建,2:完成）',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='样品表';


DROP TABLE IF EXISTS `specimen_item`;
CREATE TABLE `specimen_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '子样编号',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '子样名称',
  `specimen_id` INT NOT NULL DEFAULT 0 COMMENT '样品ID',
  `applicant_id` INT NOT NULL DEFAULT 0 COMMENT '申请ID',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_allocate` TINYINT NOT NULL DEFAULT 0 COMMENT '分配状态（0:未分配,1:已分配）',
  `allocate_time` TIMESTAMP NULL COMMENT '分配时间',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`specimen_id`),
  KEY (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子样表';


DROP TABLE IF EXISTS `detection`;
CREATE TABLE `detection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '检测编号',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '检测名称',
  `specimen_item_id` INT NOT NULL DEFAULT 0 COMMENT '子样ID',
  `standard_id` INT NOT NULL DEFAULT 0 COMMENT '标准ID',
  `manner_id` INT NOT NULL DEFAULT 0 COMMENT '方法ID',
  `applicant_id` INT NOT NULL DEFAULT 0 COMMENT '申请ID（冗余）',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`specimen_item_id`),
  KEY (`manner_id`),
  KEY (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检测表';


DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '标准编号',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '标准名称',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标准表';


DROP TABLE IF EXISTS `manner`;
CREATE TABLE `manner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '方法编号',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '方法名称',
  `condition` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '条件',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='方法表';


DROP TABLE IF EXISTS `map_standard_manner`;
CREATE TABLE `map_standard_manner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `standard_id` INT NOT NULL DEFAULT 0 COMMENT '标准ID',
  `manner_id` INT NOT NULL DEFAULT 0 COMMENT '方法ID',
  `name` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '方法名称',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`standard_id`),
  KEY (`manner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标准方法对应表';


DROP TABLE IF EXISTS `analyze`;
CREATE TABLE `analyze` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `manner_id` INT NOT NULL DEFAULT 0 COMMENT '方法ID',
  `property` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '属性',
  `sort_code` TINYINT NOT NULL DEFAULT 0 COMMENT '排序编码',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`manner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分析表';


DROP TABLE IF EXISTS `log_operation`;
CREATE TABLE `log_operation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `source_id` INT NOT NULL DEFAULT 0 COMMENT '来源ID',
  `source_type` INT NOT NULL DEFAULT 0 COMMENT '来源类型（1:受理,2:样品,3:测试,4:报告）',
  `note` VARCHAR(256) NOT NULL DEFAULT '' COMMENT '备注',
  `status_delete` TINYINT NOT NULL DEFAULT 0 COMMENT '删除状态（0:未删除,1:已删除）',
  `delete_time` TIMESTAMP NULL COMMENT '删除时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY (`source_id`, `source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';
