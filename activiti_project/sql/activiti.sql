/*
SQLyog Ultimate v8.32 
MySQL - 5.7.20 : Database - activitiproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`activitiproject` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `activitiproject`;

/*Table structure for table `a_employee` */

DROP TABLE IF EXISTS `a_employee`;

CREATE TABLE `a_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `a_employee` */

insert  into `a_employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`) values (1,'Áéã‰∏≠ÂÜõ','$2a$04$hyFuUQPnhLBBi8jezBHnke060LbqL.Hkk8iPzSTMi8RLHLsQF4Rka','wangzhongjun@163.com','boss',NULL),(2,'ÂÜØÂ∞èÂàöÁªèÁ∫™‰∫∫','$2a$04$6JAIqLUwRDD3ZE5Xf9jMDu98jE11GE1WiWApqEy64X0bJmAm4LYYm','fengxiaogangManager@163.com','manager',1),(3,'ËåÉÂÜ∞ÂÜ∞ÁªèÁ∫™‰∫∫','$2a$04$uvhK0Su35cEJzosKCZt14u8g5WKKwMwLJOUImRIZTX4TGbFfZTlUK','fanbingbingManager@163.com','manager',1),(4,'ÂÜØÂ∞èÂàö','$2a$04$wg99g2L/PmWXkvWaV1BWT.ZZjKX3TLhO1UDrIGJNsAjxE5ZvKUQN2','fengxiaogang@163.com','user',2),(5,'ËåÉÂÜ∞ÂÜ∞','$2a$04$BQz2a2IMqVbxUnJ5KbbpBeiceoUyibM81zDONmasRs07J5qlAmNgm','fanbingbing@163.com','user',3),(6,'test','$2a$04$zr/kqC0y/1VyvaTk0wbeT.iNzQ21iEaGp0bKswHwF5VgqKpTtT.DO','124@123','user',4);

/*Table structure for table `a_leavebill` */

DROP TABLE IF EXISTS `a_leavebill`;

CREATE TABLE `a_leavebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `days` int(11) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `leaveDate` timestamp NULL DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `a_leavebill` */

insert  into `a_leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (1,21,'Âú®ÂÆ∂Áù°Ëßâ‰∫Ü','ÊúÄËøëÂ§™ËæõËã¶‰∫ÜÔºåÂ•ΩÂ•Ω‰ºëÊÅØ','2018-08-15 12:12:12',2,6),(2,4,'ÂõûÂÆ∂Áù°Ëßâ','È°∫‰æøÂêÉÈ•≠ÔºÅÔºÅ','2018-08-16 22:33:05',1,6);

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'leaveBill2.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"LeaveBill\" name=\"LeaveBillProcess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"Êèê‰∫§Áî≥ËØ∑\" activiti:assignee=\"${inputUser}\" activiti:formKey=\"/audit\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"ÁªèÁ∫™‰∫∫ÂÆ°Êâπ\" activiti:formKey=\"/audit\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yue.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <userTask id=\"usertask3\" name=\"ËÄÅÊÄªÂÆ°Êâπ\" activiti:formKey=\"/audit\">\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yue.utils.ManagerTaskHandler\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" name=\"ÊâπÂáÜ\" sourceRef=\"usertask2\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'ÊâπÂáÜ\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow4\" name=\"ÊâπÂáÜ\" sourceRef=\"usertask3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'ÊâπÂáÜ\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"È©≥Âõû\" sourceRef=\"usertask2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'È©≥Âõû\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"È©≥Âõû\" sourceRef=\"usertask3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'È©≥Âõû\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_LeaveBill\">\n    <bpmndi:BPMNPlane bpmnElement=\"LeaveBill\" id=\"BPMNPlane_LeaveBill\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"290.0\" y=\"60.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"255.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"255.0\" y=\"230.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"255.0\" y=\"327.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"290.0\" y=\"420.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"307.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"140.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"307.0\" y=\"195.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"230.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"307.0\" y=\"285.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"327.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"307.0\" y=\"382.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"307.0\" y=\"420.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"360.0\" y=\"257.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.0\" y=\"257.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"360.0\" y=\"167.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"255.0\" y=\"354.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"355.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"265.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"255.0\" y=\"167.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3',1,'leaveBill2.png','1','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0˛\0\0Ã\0\0\0\"];’\0\0-\0IDATxúÌ›}l[W˝«Òhk©W1-àAÊ¡≥4õ‘˛E›\"\Z#≥ƒ¥ö˝Q,Ml≠&FÖ§†-à≠DFÑ∆‘¡V,PMi-ÌÅ∞∂#î∂}H”v›º>¨ﬁ˙0ØOsi“ﬁ&Nr~7ˆzÁ⁄âk\'˜‹„„Û~È´»çØØÔıÒ˝ûOØ“$\0\0\0å—§z\0\0\0ºCÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ D\0\0`¢\0\00—\0\0ÑË\0\0BÙ\0\0!˙\0\0\0É}Ä∫`YV2ôÏËËàD\"°´¬·∞˝õD\"ëÕfUo \04¢†òùxÏà„Û˘Ï–cùÓÓ\rõ∑ºR®^|ÈëGçF£ÕÕÕ.å«„™7\0¥GÙîÖBv‚±#ŒHn¥rm€æc˘ÚÔÉ¡ﬁﬁ^’\0\Z#˙\0jtvv⁄9fÛñWÆzäk˜û˛Eã≠X±¬≤,’{\0\0Z\"˙\0^≥SK4\ZmooØ)Ù◊ûz*\ne2’ª\0˙!˙\0û≤sœ¬Öâƒ¥sèÛ˙óΩût:≠zá\0@3D¿S—htÊπ«yÒÀN?ºÚ\05!˙\0ﬁÈÏÏú…Î\\Â’›Ω!â®ﬁ-\0–	—»¿¿@0t1˜ÍÅ\\ªv≠Íù\0m}\0èÿπg˜û~◊£œÒ\'oªÕœÀ^\0P%¢‡Öd2âD\\œ=Öz¯·vuu©ﬁE\0–—B(™ı+|j:Ò”““¢z@D@∫l6€‹‹,)˜j¡Ç}}}™w\04@Ù§ã«„±XLjÙy|Õöˆˆv’;\n\0\Z ˙\0“≠X±bÌ⁄µR£œÊ-ØÑB!’;\n\0\Z ˙\0“Ö√·j˛@ÈLÍ»—£∑›ÊWΩ£\0†¢ ù§èµ◊≈¡!üœßzG@D@∫ñññ„\'NJç>v55q8¿ı—+ÈÅ¿k}\0†–+È§~©ÔıÄö}\0Èb±ÿ≥Î÷Iç>€∂ÔX∞`ÅÍ\0\r}\0È∫∫∫~¯áR£è≠ñ/ˇûÍ\0\r}\0È“È¥ﬂÔó\Z}⁄⁄⁄zzzTÔ(\0hÄËxAÍ;ù/577Û«€†\ZD¿R_Û˙ÌOÿ+WΩã\0†¢‡À≤¸~øåo˜π88t€m˛L&£z@D¿#âD‚ﬁeÀ8Â\0j}\0Ô|˚Óªªª7∏ò{^;x∞µµı‚‡êÍ=\0m}\0Ôd≥Ÿ∏ı~Á3gœŸπÁ»—£™w\0tBÙ<ïJ•ÏÙcÁïôÁûoﬂ}˜/æ§zá\0@3D¿k≠≠≠€∂Ôò…Î\\v~\"˜\0¿4}\0≤ŸÏ¢Eãy‰—3gœ’z.˝ˆâ\'\nØö©ﬁ	\0–—P√≤,;˙‹qG¿é2v†©&˜<ªnùΩ¸√ˇ–L™7\0tEÙT d2´V≠jnn˛ˆ›w€…f˜û˛í∏cˇf˝˙ˇªwŸ2{ôÂÀøóNßUo2\0ËçË®gYV2ôå≈b≠≠≠M◊≤cÁûD\"ëÕfUo&\04¢PèÏ§z\0†1}Äz‘‘ƒ±	\0R–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†}\0@⁄+Pèà>\0 	Ì®GD\0êÑˆ\n‘#¢\0HB{Í—\0$°ΩıàË\0í–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†}\0@⁄+Pèà>\0 	Ì®GD\0êÑˆ\n‘#¢\0HB{Í—\0$°ΩıàË\0í–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†}\0@⁄+Pèà>\0 	Ì®GD\0êÑˆ\n‘#¢\0HB{Í—\0$°ΩıàË\0í–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†}\0@⁄+Pèà>\0 	Ì®GD\0êÑˆ\n‘#¢\0HB{Í—\0$°ΩıàË\0í–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†^$	;Ò¯|æ`0h_hii±Œù;7ïJ©ﬁ4\0hD†^l‹∏±©Ã‚≈ãì…§ÍMÄ∆AÙÍÖeYsÊÃ)Œ=ÛÁœoii…f≥™7\r\0\Z—®#´WØû5kñ}VÆ\\ŸﬁﬁÆz£\0†°}Ä˙2oﬁºBÓY∂lôﬂÔ∑,Kı@C!˙\0ıeÎ÷≠≥gœ∂£O8Ê]>\0‡:¢Pwñ,YRà>™7\0\Z—®;ôL∆é>|¶\0d ˙\0ıàØ4\0IhØ¿á,ÀJ$—h4\n˘˝˛ÚoŸ1ÑΩÔˆ#âD‚Ò8≠–`à>¿zzzÏ)ﬂŒ=Î◊ØﬂºeÀë£GGr93Àﬁw˚ËÓÓ^æ|π˝òÿHı‡\0Äkà>Ä»f≥±X¨≠≠Ì¯â„#π™∏Œú=c ˚¡…d2™\n\0\\@ÙÅÈÏ‹ü]˜ÃHnòö™^xÒÖ§”i’√\03EÙÅÈb±X>˜\\°*◊Ê-õ-˙™Í·Äô\"˙¿h===mmKs£UM˝‰ß?^≥Ê1’É\03BÙÅπ,ÀÚ˚˝\'N¶s£ó©jjpË˝÷÷˘|·\0≠}`Æx<ã≈r£óúZ˛fïˇ.æïQµfÕ/˘ã™\0¥FÙÅπ\"ëH˜Üøò{ñ∂Ω+ƒ€c‚pNº>,ˆ\rã›É£]^y˘‰Öù#‚øñÿiâmóƒ¶+‚˜€<∞‚AÂ)DIÌÈÔÉ™á\0¶èËsÅÉ˜ÊFá\n’‘‘4(ƒ–∏∏0*ŒèàKB¸Ëgè6›—ÖK#\'s‚¯∞8~E§-qdT<˜Íæ¸âü!kpËúœÁS=t\00}Dò´ππ˘Ïπìπ—¡BŸiÊ“òõ∏jt|‚ÁÛ/˝Û”_¯“œˇÌ®G≈Öú8üY!6Ì⁄üè>ÉfVdÄŒha0W>æ\\t ˛Á–®8wYåå}∞@6õ˝›ìO?ˆõ\'èüö¯6ø‹∏…G¢{ˆï‹÷®\"˙\0–\Z-Ê «óˇ95}∆ƒôK‚ΩAëbdx8p«MM765˘Ó˘ÓÚ‚ÓÓﬂ[r[£äË@k¥0ò+_.8Ux¡Î‹eqÍ¢8}EÏ>¯÷ºyÛnúıëõnπ5zﬂ5—g◊û˛í€\ZUD\0Z£Ö¡\\˘¯íu ˛ÁÂqqﬁö8ÎsÊäÿ≤+ıÂ÷;o˝ƒ\'oi˛ÿ”yÓäÉ√‚“ƒ\r∑ıÌ*π≠QEÙ†5ZÃeO·££Ô;Uò—ÌÙs!\'ﬁß.ÊvH∑~ÂÆ≈_ˇ∆ÈaÒû%N[‚‹∞∞√œ∂ùªJnkT}\0hçsïƒó–‚E˚ﬂ8º˚@™o µΩ?µ}Ô°˚è˛kÁÎØ8∂µˇ–˙ﬂ‹æ˜Õæ}á~Á©?ÆªwŸΩ #—\0¶ÅsÂ£œ˘‚zË°´˘*ÁÔ‹sO…\rç*¢\0≠—¬`Æ|Ù9G’ZD\0Z£Ö¡\\—gÏ,Uk}\0hçsÂ£œ™÷\"˙\0–\Z-Ê Gü”T≠EÙ†5ZÃïè>ÔQµ—Ä÷hahpâD\"ùNOzU>˙d®Zk™ËS·°Ä˙AÙA#;tËP·„Ë7ﬂ|swww…µDW¢O6õΩÔæ˚\nèÛß>ı)“Ä:GÙA#≥,ÎÜn(Ã ≥gœ˛‚øX<1Á£œªT≠U}÷Æ]ÎÛ˘\nè∞}°••%ì…(i\0®\Z—\rŒûåãøç¶õn∫ˇ˛˚ÌH$Ú—glÏUk¢O*ï˙¸Á?_¸ÿ.\\∏–Ô˜´p\0∏¢O#∞\'Úﬁﬁﬁééé–UˆTÕ∑clÏ$UkŸèõ˝S=t⁄∞FÁ¿¥“ûûûl6´∫g\0F#˙ËÕN<ëHƒÁÛ∫jÔUºﬂ¬qÀ-∑8ìP$œ~¨R©î¯‡¨œ	™÷j üı±üc_˚⁄◊>˚Ÿœ:ÔÕ7ﬂUx›±(Á¿¥“p8‹‹‹l?	ì…§ÍMEÙ—U&ì)¸?íZÅ˝ﬂÎ¬¨æˇ˝Ô€?âÑsm>˙óQŒöKN\0T^∏ö^˜˜Úv™¯.ú«∞ßßÁ∂€n˚Ãg>Sÿ¡9sÊ^LDeÖˇ¥ÿI±ê¬xâË£%{æ±gqª{™ﬁêz˜ˆ€o˚|>˚ˇŸ~øøΩΩΩ‰ÖÜ|JxGF9k.æã‚_VVaÖS]UÂz‹⁄ª‚á—Œ:ü˚‹ÁÏâ‹˛900‡Ì kÃ~¨Ï≠8é\0—G?…d2\nÒvÅ*ŸW<üÙ@·†$yTŒ\"ì£IWU}¶ëóx¶ä>ˆ#l?ŒúÉ¨ï£—®˝–©ﬁ¿ DÕÿå˝ﬂDrè+Ú)·mÂ¨π¯.JÓÆ¸ﬁ+,Pa=Œ/\'KH≤ˆNı–5;˝ÿˇôÈÎÎSΩ!Ä)haöY∏p!-“-·`<-£>HW/|òEäp~V¯Õîg}ÆΩóíªñ¥S≈w°zË\Zç˝_ö@ ¿€§\0o–¬tíL&#ëàÍ≠h˘îpÃı∫öH*-Pr°‰rÂk\'Ω<EBrÔ\n˜•zË\Z–™U´∫∫∫To`ZòN¬·pOOèÍ≠h˘pñªUXßÛs≤8R∫p˘Â ◊÷zY∆>™∫îJ•ÅÄÍ≠\0å@”F&ìiiiQΩ\r%üé (gÕÖÓ®¬_*Ω£ÚÂ%ÌZ·éT]c‚Âl¿¥0mjóÎÚ˘‡àår÷\\∏PG*-\\Õ\n\'˝}ÒœÍ◊9ìΩS=tçâ◊º\0o–¬¥A[t]>ñQÖ5;?ß∫#Á™\nÀØ∞¬\ZúÀE1K ÆÓHı–5&˛{xÉ¶çP(ƒw∫KF>ò4|î¸r™tR!µTà>◊ΩLÙ—o˜ºA”Ôpù=Öèè¢j-¢è$Èt⁄Ô˜´ﬁ\n†Ò—¬¥a˜D˛(©ªÚ—ÁM™÷\"˙»√cxÄ√LÕÕÕ|â≥ªÚ—\'E’ZLœÚÿ‡0”=—u˘ËÛUkÒTîá«\0áô6ËâÆÛ˘|ó/Ôù™©x* √cxÄ√LÙD◊˘˝˛c«^?H’T<Â·±<¿a¶\rz¢Î¬·?z÷éã◊®ÍÎç‘Û|\0[s¿f⁄†\'∫Æ≥≥≥Ω˝~ÂaBØ˙s¸ÒX,¶zË\Zá9‡3m–]óNßÅ€/[ª«≈™ äDñ$ìI’C◊∞8ÃpòiÉû(C«Ñ„b?UM˝-ÒÎh4¨z–\Zá9‡3m–e∞,+∫´ØÔØBÏ£*W&≥%∏=õ›¶z–\Zá9‡3m–%I•R¡‡©TRàj™≤sèù{{üQ=\\\ré√\0áô6ËâÚÙııŸÈß≥ÛBÏ• +ô|\"˜ˆ˛Iı@5>s¿f⁄†\'JeYV{{,∫3ˇE&≥Ià~*õ˝w\"Ò´h¥-	ŸóUë8ÃpòiÉûËÅﬁﬁﬁXÏ[--oBSSsÛÕ—ËR;˝®É4qòÚqòiÉûhæ;«LÊÄ8Ã¥AO4\n√m&∆\0áô6ËâFa∏Õƒ∏‡0”=—(∑ôw¿f⁄†\'\ZÖ·6„xÄ√LÙD£0‹fb‹pòiÉûhÜ€Lå;‡3m–ç¬põâq<¿a¶\rz¢Qn31ÓÄ8Ã¥AO4\n√m&∆\0áô6ËâFa∏Õƒ∏‡0”=—(∑ôw¿f⁄†\'\ZÖ·6„xÄ√LÙD£0‹fb‹pòiÉûhÜ€Lå;‡3m–ç¬põâq<¿a¶\rz¢Qn31ÓÄ8Ã¥AO4\n√m&∆\0áô6ËâFa∏ÕTy‹õäî,\\rπyËÇ√@Ù,£0‹f™r‹ù≈ 3PÂïº—G#Ù,£0‹f∫Ó∏OzæáË‘Ñ√@Ù,£0‹f™5˙î_(^¶¸u.ûWÄ ˙hÑûeÜ€L5Eü©NˆTx\'œ+@}4Bœ2\n√m¶j¢œ§oXûÙ¨O˘µ<Ø\0AÙ—=À(∑ô™˜©^˘º‡\\áÅ6ËYFa∏ÕTÕ∏ßô\nØ|q÷ò\náÅ6ËY\r/ëHÿ£ÏÛ˘Ç¡†}°••≈˛9wÓ‹T*•z”‡ë á˘§Áo o¬\'ºÄ 8¥Aœjx7nl*≥xÒ‚d2©z”‡ëÈΩ‡U~÷ß◊∑–áÅ6ËY\rœ≤¨9sÊœRÛÁœoii…f≥™7\r©˛mŒ¢Ï%≠j^’¢ç\0ÇË£zñ	VØ^=k÷,gz[πre{{ªÍçÇw8ÃpòiÉûhàyÛÊrœ≤eÀ¸~øeY™∑ﬁ·0<¿a¶\rz¢!∂n›:{ˆl{∏√·0ÔÚ1\rá9‡3m–Õ±d…íBÙQΩ!\Zá9‡3m–Õë…dÏ·Ê3Ì‚0<¿a¶\rz¢Qn31ÓÄ8Ã¥AOÙÄeYâD\"\ZçÜB!øﬂ_˘˚Q\ZòΩÔˆ#âD‚Ò8≠˜Rá9 áô6Ëâ≤ıÙÙÿSæù{÷Ø_øyÀñ#Gèé‰rfñΩÔˆ#–››Ω|˘r˚1±êÍ¡1á9‡3m–Â…f≥±X¨≠≠Ì¯â„#π™∏Œú=c ˚¡…d2™™Òqò‡0”=Q;˜É¡g◊=3í¶¶™^|a¡ÇÈtZıp58s¿f⁄†\'Jã≈ÚπÁ\nUπ6oŸ¥h—WUWÉ„0<¿a¶\rz¢===mmKs£UM˝‰ß?^≥Ê1’É÷»8ÃpòiÉûË:À≤¸~ˇâìÈ‹Ëe™ö\Zzøµu>_8$á9‡3m–]è«c±XnÙíSã√ﬂ¨Ú„ﬂ≈∑2™÷¨˘%QUs¿f⁄†\'∫.âto¯˚áπgi€ªBº=&ÁƒÎ√bﬂ∞ÿ=8⁄µ·ïóO^ÿ9\"˛kâùñÿvIl∫\"~øÌ¿+TûBî‘û˛æ`0®zË\Zá9‡3m–]‹õ*î˝\n14..åäÛ#‚í?˙Ÿ£M7|t·“»…ú8>,é_iKœΩ∫/‚g»¿\Z:ÁÛ˘T]√‚0<¿a¶\rz¢Îöõõœû;ô,î˝_\Z√cWçéO¸|˛•~˙_˙˘„ø‚‚®∏êÁs\"+ƒ¶]˚Û—g–Ã‚©(è-‡3m–]óè/ù≤ˇ94*Œ]#c,êÕf˜‰”è˝Ê…„ß&æÕ/7.FÚëh«û}%∑5™x* √cxÄ√LÙD◊Â„Àˇúöà>c‚Ã%Òﬁ†»	12<∏„é¶¶õö|˜|wyÒ\rw˜Ô-π≠Q≈SQ[¿f⁄†\'∫._.8Ux¡Î‹eqÍ¢8}EÏ>¯÷ºyÛnúıëõnπ5zﬂ5—g◊û˛í€\ZU<Â·±<¿a¶\rz¢ÎÚÒ%Îî˝œÀ„‚º5q÷ÁÃ±eWÍÀ≠wﬁ˙âOﬁ“¸±ßˇÚ‹!á≈•·ânÎ€Ur[£äß¢$ôL¶••EıV\0çè¶\rÊ◊ŸÈËË˚Na;˝\\»â˜Gƒ©ãπ“≠_πkÒ◊øqzXºgâ”ñ87,Ï≥mÁÆí€\ZU<%Iß”~ø_ıV\0çè¶\rÊ◊ïƒó–‚E˚ﬂ8º˚@™o µΩ?µ}Ô°˚è˛kÁÎØ8∂µˇ–˙ﬂ‹æ˜Õæ}á~Á©?ÆªwŸΩ #—ß¡ÙÙÙÑ√a’[4>Zò6òo\\óè>ÁãÎ°á¨Ê´úøsœ=%74™x*J“ëßz+Ä∆G”ÛçÎÚ—ÁUkÒTî$˜ÙÙ®ﬁ\n†Ò—¬¥¡|„∫âË3vñ™µx* ê…d¸~øeY™7h|¥0m0ﬂ∏.}ŒPµOE∫∫∫V≠Z•z+\0#–¬¥¡|„∫|Ù9M’Z<]gYñﬂÔœd2™70-LÃ7ÆÀGü˜®Zãß¢Îb±X<WΩÄ)ha⁄`æq]>˙d®Zãß¢ª∫∫∫V¨X°z+\0É–¬¥¡|„:¢—G-À≤b±π-LÃ7ÆÀGüw©Zãß‚Ãe≥ŸÆÆ.øﬂœÎ\\Ä˜ha⁄`æqù˝êéçù¢j-ûä”÷€€€ŸŸâDÏ–≥j’*ﬁ◊(A”ÛçÎÚ—Á$UkŸè[(™ÊkØQ¬~‹⁄€€ì…d6õU˝ÙÃ≈l™ç&¢è€ö&¢œ	™÷‚©@k¥0m0ﬂ∏.}éœº\nÎ)ˇ/~˘2ìﬁ∞˙ﬂWπåsU˘∑ˆWı–¿Ù—¬¥¡|„∫| xgÊUæû\nøô,!]Öìﬁp™ıﬂWÖŒdU\0L-LÃ7Æs%Tì3¶∫j™\r®>ï\\[íÑà>\0Pé¶ç ÛMÒúW≤p…Â\n‰m|} Ç∑gRŒ\Zä/\\MS.S~UïøØrôI∑™ ’Vπ◊™á\0¶è¶ç*Ág±ÚTy%ŒgQ`<=ì˙0Ë\\˝gÒUS-sÕπô)V[˘Ó MzsÁ™\n˜5ΩΩV=t\00}¥0m\\wæ)œ:ÂÁrà>≈Úi‡ÿÃ´∞ûÚµ9ø)æÍ∫w:’⁄*¨ßd·´AgÚ\rpeU\0L-LµFüÚ≈À´r˝ç\'ﬁöaV‚¸ºˆLÃá_[˝\nÀØö˙¨œ$wQ~¡ï2©†ë–¬¥QSÙôÍdœ§gÜ™\\„…Ç£3©¢®qÕ/+,s›Öß∫™¬µS≠d™;ù˘^´:\0ò>Zò6™â>%\'r oHÙ)ñG\\©´·ÊÉÀïó¨ÚüÂÎ©x÷gíï.8∏µø>U\04Zò6™üoö¶xÂKÇ◊µÚQ‡L™(y\\ÛÀ©ñ,ø∂¯üÂ7¨∞Ö’\\Urß3ﬂ_gµ™á\0¶è¶çjÊõ‚4S~Çg“_}‹™)N∆|ò?¶Zr“e 3S5—ß$äïd ¢\0¢èF*œ7ìûø)øIÖï8üŸª<>~à™µ|™\0h$¥0mT?ﬂT>ÎSÅÎ€\\ÁÚ—ÁM™÷2©†ë–¬¥q›˘¶¸’Æ‚ﬂ_w%Œg˘Ëì¢j-ü*\0\Z	-LÃ7ÆÀGü7®Zãß\"\0≠—¬¥¡|„:üœw˘ÚﬁÒÒ◊©öäß\"\0≠—¬¥¡|„:øﬂÏÿÀ„„©öäß\"\0≠—¬¥¡|„∫p8¸èûµ„‚5™˙z#ı| P=t\00}Ã¶⁄ ˙∏Æ≥≥≥Ω˝~ÂaBØ˙s¸ÒX,¶zË\0`˙òMµAÙq]:ùnølÌ®*+YíL&U\0L≥©6à>2tLX1.ˆS’‘ﬂøéF√™\r\0fÑŸTD,À\nÖÓÍÎ˚´˚® ï…l	nœf∑©4\0òfSm}$I•R¡‡©TRàj™≤sèù{{üQ=\\\00SÃ¶⁄ ˙»”◊◊gßüŒŒ±ó*ØdÚâ@¿ﬂ€˚\'’\0.`6’—G*À≤⁄€c°–ùÒ¯/2ôMBÙSŸÏøâ_E£mëH»æ¨zà\0¿Ã¶⁄ ˙x†∑∑7˚VKÀ«+ˇùWC47ﬂç.µ”èÍa\071õj£âËcæ;\0$a6’—«(7\0HB{’s°Qn\0êÑˆ™\rÊB£0‹\0 	ÌUÃÖFa∏@⁄´6òç¬pÄ$¥Wm0\ZÖ·\0IhØ⁄`.4\n√\r\0í–^µ¡\\hÜ\0$°ΩjÉπ–(7\0HB{’s°Qn\0êÑˆ™\rÊB£0‹\0 	ÌUÃÖFa∏@⁄´6òç¬pÄ$¥Wm0\ZÖ·\0IhØ⁄`.4\n√\r\0í–^µ¡\\hÜ\0$°ΩjÉπ–(7\0HB{’s°Qn\0êÑˆ™\rÊB£0‹\0 	ÌUÃÖFa∏@⁄´6òç¬pÄ$¥Wm0\Z•ö·vñ)ø0’¬<ã\0Ä>®\r&-£Ã<˙îd¢\0–µ¡§eî √›TDL}÷ßxÅr“∂\0Í\ZÌOÃUFô…YüÎû˚\0ì—µ¡§eîZ£OÒŸùí&=Â√”	Ä±h⁄`Æ2Jï—Á∫/xMu\0åE‘ìñQ™|ØO…¬%ß|à>\0Pé>®\r&-£∏Ú·ˆíWƒx¡\0—G#ÃUFôFÙ©˙g}\0¿A‘ìñQ¶˝6gAÙÄäËÉ⁄`“2 ¥ﬂÎ3ÈãYº‡\0⁄ü6ò´\Z^\"ë∞GŸÁÛÉA˚BKKã˝sÓ‹π©TJı¶@„`6’—ß·m‹∏±¸‹Ã‚≈ãì…§ÍMÄ∆¡l™\r¢O√≥,kŒú9≈πg˛¸˘---ŸlVı¶@„`6’—«´WØû5kñ}VÆ\\ŸﬁﬁÆz£\0†°0õjÉËcàyÛÊrœ≤eÀ¸~øeY™∑\0\Z\n≥©6à>Üÿ∫uÎÏŸ≥Ì·á√ºÀ\0\\«l™\r¢è9ñ,YRà>™7\0\Z≥©6à>Ê»d2ˆpÛôv\0êÅŸTD£0‹\0 	ÌUÃÖ∞,+ëHD£—P(‰˜˚\'˝dÿ˚n?ëH$èÛ—z\0\rÜŸTMD…zzzÏ)ﬂŒ=Î◊ØﬂºeÀë£GGr93Àﬁw˚ËÓÓ^æ|π˝òÿHı‡\0ÄkòMµAÙë\'õÕ∆b±∂∂∂„\'éè‰F®‚:sˆåÄÏ\'ì…®(\0p≥©6à>íÿπ\'>ªÓôë‹05UΩ‚,Hß”™á\0fäŸTDIb±X>˜\\°*◊Ê-õ-˙™Í·Äôb6’—GÜûûû∂∂•πQã™¶~Ú”ØYÛòÍAÄa6’—«uñe˘˝˛\'”π—ÀT558Ù~kÎ|æpÄ÷òMµAÙq]<è≈bπ—KN-≥ èﬂ ®Z≥Êó¸EU\0Zc6’—«uëH§{√ﬂ?Ã=K€ﬁ‚Ì1q8\'^˚Ü≈Ó¡—Æ\rØº|Ú¬ŒÒ_KÏ¥ƒ∂Kb”Ò˚mXÒ†Ú¢§ˆÙ˜ÉA’C\0”«l™\r¢èÎÅ¿¡É{s£CÖ≤·A!Ü∆≈ÖQq~D\\‚G?{¥ÈÜè.\\\Z9ô«á≈Ò+\"mâ#£‚πW˜ÂO¸XÉCÁ|>üÍ°ÄÈc6’—«uÕÕÕgœùÃç ~Ñ/çâ·±â´F«\'~>ˇ“??˝Ö/˝¸Òﬂé\nqqT\\»âÛ9ëb”Æ˝˘Ë3hfÒT†5Zò6òo\\óè/ù≤ˇ94*Œ]#c,êÕf˜‰”è˝Ê…„ß&æÕ/7.FÚëh«û}%∑5™x*–\Z-LÃ7ÆÀ«óˇ95}∆ƒôK‚ΩAëbdx8p«MM765˘Ó˘ÓÚ‚ÓÓﬂ[r[£äß\"\0≠—¬¥·Û˘,ÀRΩ\r%_.8Ux¡Î‹eqÍ¢8}EÏ>¯÷ºyÛnúıëõnπ5zﬂ5—g◊û˛í€\ZUD\0Z£Öi√Ô˜Ûg‹ïè/YßÏ^Á≠â≥>gÆà-ªR_nΩÛ÷O|ÚñÊè=˝óÁÆ18,.\rO‹p[ﬂÆí€\ZUD\0Z£Öi#®ﬁäÜbO·££Ô;Uò—ÌÙs!\'ﬁß.ÊvH∑~ÂÆ≈_ˇ∆ÈaÒû%N[‚‹∞∞√œ∂ùªJnkT}\0hç¶çP(‘€€´z+\ZJI|	-^¥ˇç√ª§˙R€˚S€˜⁄±ˇËøvæ˛ÍÅc[˚˝ßˇÕÌ{ﬂÏ€wË¿·wû˙„∫{ó›´<Ç}\0`\Zha⁄à≈bÒx\\ıV4î|Ù9_\\=Ù`5_Â¸ù{Ó)π°QEÙ†5Zò6\nuAıV4î|Ù9G’ZD\0Z£Öi#ïJ’[—P&¢œÿY™÷\"˙\0–\Z-L\'º”Ÿ]˘ËsÜ™µà>\0¥F”IWW◊™U´ToE„»Gü”T≠EÙ†5ZòN,ÀÚ˚˝ôLFıÜ4à|Ùyè™µà>\0¥F”Looo(RΩ\r\"}2T≠EÙ†5Zò~:::xŸÀD¢\0—¬¥‘ﬁﬁá≥Ÿ¨Í\r—[>˙ºK’ZD\0Z£ÖÈ™ßß«Ô˜wtt÷üi≥ß±±ST≠EÙ†5Zò∆≤Ÿ¨}Ï\0áÌí˛ÃEØK‚ÒxáKB.…GüìT≠EÙ†5Zòˆ,ÀÍÈÈ)Çj˛C≠‹ ±XÃ≠Ë„V\ZÀGüT≠EÙ†5ZÃïè>«•VÂª(æ∂˙%ß∫™¸ÇºùR=t\00}¥0ò+ﬁëZ≈w1È›~Y~’uœ∆ïØ∂¸ÇºùR=t\00}¥0òKRD∏nX©f± €Ê¶‚[}\0†\Z¥0ò+ﬁñZÖªòÙé™ˇeÖﬂ_UrAﬁﬁ}\0hçsMÑÉÒ¥ªu˝™äñúÙÊ’¨j“õ8Wï/„˙>™:\0ò>ZÃïœ«§VÖªò:÷Lr€©.;Î)˛ΩÏ˝\"˙\0–\Z-Ê GÑ∑‰ï≥˛´È§ÊõOèÆY†¸ÓdÔóÍ°ÄÈ£Ö¡\\˘àpTR]õT¶\\∆˘Y|°¸üS]ûÙÊR˜´∞~’C\0”GÉπÚ·àå*¨πd˝≈ˇ,Y†¸B·Ú‘g}&Y≠≥ŒIÔ››ΩS=t\00}¥0ò+ª[Wì«óKÆ*π<ÈìnUÖM-æª‚5»ÿ;ÁéT\0L-Êíä≥»µgk&	+ÂT}ÆªZ¢\0î£Ö¡\\ˆ>>~à™µà>\0¥FÉπÚ—ÁM™÷\"˙\0–\Z-Ê GüUk}\0hçsÂ£œT≠EÙ†5ZÃÂÛ˘._ﬁ;>˛:US}\0hçs˘˝˛c«^?H’TD\0Z£Ö¡\\·p¯=k«≈kTııFÍ˘@ †zË\0`˙à>0Wggg{˚˝ √Ñ^ıÁ¯„±XLı–¿Ù}`Æt:‹~Ÿ⁄=.PUV$≤$ôL™:\0ò>¢å÷1a≈∏ÿOUSK¸:\Z\r´4\0ò¢åfYV(tW_ﬂ_ÖÿGUÆLfK p{6ªMı†¿å}`∫T*ﬁëJ%Ö†¶*;˜ÿ±∑˜’√\03EÙD__üù~:; ƒ^™ºí…\'oÔüT\0∏ÄËL∞,´Ω=\n›èˇ\"ìŸ$D?ïÕ˛;ë¯U4⁄âÑÏÀ™á\0‹AÙ>‘€€ã}´•Â„Mhjjnæ9\Z]jß’√\0n\"˙\0ıàÔŒ\0Ià>@=j‚èE\0Ä¥W†}\0@⁄+Pèà>\0 	Ì®GD\0êÑˆ\n‘#¢\0HB{Í—\0$°ΩıàË\0í–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†}\0@⁄+Pèà>\0 	Ì®GD\0êÑˆ\n‘#¢\0HB{Í—\0$°ΩıàË\0í–^ÅzDÙ\0IhØ@=\"˙\0Ä$¥W†}\0@⁄+Pèà>\0 	Ì®G’DgôÚS-L¢\0˙ Pèf}J≤—\0\nËÉ@=™úQöäà©œ˙/PN⁄∂@]£˝ıh&g}Æ{Ó\0LFÍQ≠—ß¯ÏN…ìûÚ!0Ì®GUFüÎæ‡5’\00}®GUæ◊ßd·íS>D\0(GÍë+n/yEåº\0@}Ä˙4çËS·ı/Œ˙\0ÄÉ>‘ãD\"aGüœÌ---ˆœπsÁ¶R©IóüÙmŒÇË\0—Åz±q„∆Úó•/^úL&Kñ¨^üI_Ã‚/\0p–˛ÄzaY÷ú9sä”…¸˘Û[ZZ≤Ÿ¨ÍMÄ∆AÙÍ»Í’´gÕöÂDüï+W∂∑∑´ﬁ(\0h(D†æÃõ7Øê{ñ-[Ê˜˚-ÀRΩE\0–Pà>@}Ÿ∫uÎÏŸ≥ÌËáÀﬂÂ\0ò!¢Pwñ,YRà>™7\0\Z—®;ôL∆é>S}¶\00D†Ò·s\0êÑˆ\n‘À≤í…dGGG$	]áÌﬂƒ„ÒL&£z†A}\0≈Ïƒc«ùIøu∞X0\\ªv-¯Ä\"˙\0 Ùˆˆ.\\∏∫°ßòﬂÔÁc_\00D@À≤b±X˘yùü¸‰ß››6oy≈©Gy¥≠≠≠d…H$¬W<¿Ù}\0Øe2ôíì=?¸√#Gèé‰Fß™3gœ˝·©ß\n–‘9˝300†zW\0@?D¿SÈt⁄N-NÇ	á√ïCOI\0z‰ëGù€˙|æææ>’;\0ö!˙\0ﬁ±,´¯|œ„k÷Tzäk˝˙ˇ≥CèsÓá@Mà>Äw¢—®ì{∫ª7L#˜j˜û˛ÊÊÊ¬zB°êÍ›\0ù}\0è$ì…ûÔ)Æ^|…Y[WWóÍù\0m}\0èÉAÁ˝=3Ã=Örﬁ˜”““¬˜˝\0@ïà>ÄâÑÛﬁ‰„\'N∫}.9ü˘ZµjïÍ]\0=}\0/ÑB!ÁsÏÆ‰ûB=ªn]aµÕÕÕ™w\0Ù@Ù§Àf≥Œ˚r‹:Â„‘m∑}Q˘ﬁﬁ^’;\n\0\Z ˙\0“≈„qÁ”XÓÊªx‡¡¬ €€€UÔ(\0hÄËH∑b≈\n∑>ÿU^õ∑ºRX˘¬ÖUÔ(\0hÄËHáÈ‰Ö_r=˙9z‘˘zC’;\n\0\Z ˙\0“9kﬂΩßﬂıËcóÛF\"’;\n\0\Z†W“9AØ˛œu’TŒ˙UÔ(\0hÄ^	H\n—‰µÉeDÁOz©ﬁQ\0–\0ΩêŒ˘RüÕ[^q=˜ú9{éØˆÄÍ}\0Èb±X!ù¸·©ß\\è>Ø<XXy0TΩ£\0†¢ ]ggg!ù,_˛=◊£œ„k÷VçFUÔ(\0hÄËHóJ•ú◊§.π}-ZTXy<WΩ£\0†¢‡øˇÉ?7—›Ω¡≈‹„|©è-õÕ™ﬁK\0–\0—B{{{!†¥∂∂∫x‚Á€wﬂ]Xm$QΩã\0†¢‡Öl6Î|˚é[Œb€ˆŒ)üÅÅ’ª\0z ˙\0ÈÍÍ*ƒüœ7ÛOπ9z‘…R+V¨PΩs\0†\r¢‡ùÖ¬äùZfÚÕŒáZ[[ùUe2’{\0⁄ ˙\0ﬁIß”ÕÕÕNdôﬁüÙ:~‚§ì{|>_ooØÍ›\0ù}\0OŸI≈yÉé\\j˝í√m€w8ØsŸ∫∫∫TÔ\0hÜËx-ôL:Á~\nü˘z·≈ó™9ŸsÔ≤eME»=\00\rD@ÅT*Â¸MS\'\0=Ú»£Âﬂ‘N<xÍ©∂∂∂‚ÖÌ‰ƒÎ\\\00=D@çl6€——·¸—ı,òÍ™h4 ˚ö`⁄à>ÄJvàq˛∏ÈuÖB°ææ>’õ\0z#˙\0ÍYñïH$ÏK‚éﬂÔèD\"k◊ÆÂL\0∏ÇË\0\0BÙ\0\0!˙\0\0\0É}\0\0ÄAà>\0\0¿ ˇ÷rOÅŸ±˛.\0\0\0\0IENDÆB`Ç',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','47501',20),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('11','LeaveBill:1:4','5','5','usertask1','12',NULL,'Êèê‰∫§Áî≥ËØ∑','userTask','test','2018-08-16 15:28:34.065','2018-08-16 21:44:58.893',22584828,''),('35002','LeaveBill:1:4','5','5','usertask2','35003',NULL,'ÁªèÁ∫™‰∫∫ÂÆ°Êâπ','userTask','ÂÜØÂ∞èÂàö','2018-08-16 21:44:58.894','2018-08-16 23:38:25.241',6806347,''),('37502','LeaveBill:1:4','37501','37501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-08-16 22:33:08.169','2018-08-16 22:33:08.180',11,''),('37507','LeaveBill:1:4','37501','37501','usertask1','37508',NULL,'Êèê‰∫§Áî≥ËØ∑','userTask','test','2018-08-16 22:33:08.181','2018-08-16 22:48:51.501',943320,''),('40002','LeaveBill:1:4','37501','37501','usertask2','40003',NULL,'ÁªèÁ∫™‰∫∫ÂÆ°Êâπ','userTask','ÂÜØÂ∞èÂàö','2018-08-16 22:48:51.502','2018-08-16 23:38:38.358',2986856,''),('42504','LeaveBill:1:4','5','5','usertask3','42505',NULL,'ËÄÅÊÄªÂÆ°Êâπ','userTask','ÂÜØÂ∞èÂàöÁªèÁ∫™‰∫∫','2018-08-16 23:38:25.242','2018-08-16 23:43:19.216',293974,''),('42510','LeaveBill:1:4','37501','37501','usertask1','42511',NULL,'Êèê‰∫§Áî≥ËØ∑','userTask','test','2018-08-16 23:38:38.358','2018-08-16 23:41:07.019',148661,''),('45002','LeaveBill:1:4','37501','37501','usertask2','45003',NULL,'ÁªèÁ∫™‰∫∫ÂÆ°Êâπ','userTask','ÂÜØÂ∞èÂàö','2018-08-16 23:41:07.020',NULL,NULL,''),('45006','LeaveBill:1:4','5','5','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-08-16 23:43:19.217','2018-08-16 23:43:19.217',0,''),('6','LeaveBill:1:4','5','5','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-08-16 15:28:34.051','2018-08-16 15:28:34.063',12,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('20001','comment','2018-08-16 21:18:15.888','test','12','5','AddComment','ÂêåÊÑèËØ∑ÂÅá','ÂêåÊÑèËØ∑ÂÅá'),('22501','comment','2018-08-16 21:26:26.417','test','12','5','AddComment','ÂêåÊÑèËØ∑ÂÅáÔºÅÔºÅ','ÂêåÊÑèËØ∑ÂÅáÔºÅÔºÅ'),('25001','comment','2018-08-16 21:32:13.706','test','12','5','AddComment','ÂõûÊù•Â∏¶Â•ΩÂêÉÁöÑ','ÂõûÊù•Â∏¶Â•ΩÂêÉÁöÑ'),('27501','comment','2018-08-16 21:36:21.756','test','12','5','AddComment','1111','1111'),('30001','comment','2018-08-16 21:39:28.235','test','12','5','AddComment','1222','1222'),('32501','comment','2018-08-16 21:43:03.471','test','12','5','AddComment','123','123'),('35001','comment','2018-08-16 21:44:58.776','test','12','5','AddComment','1452','1452'),('37510','comment','2018-08-16 22:33:25.031','test','37508','37501','AddComment','ÂõûÊù•Â∏¶ÂêÉÁöÑ','ÂõûÊù•Â∏¶ÂêÉÁöÑ'),('40001','comment','2018-08-16 22:48:51.388','test','37508','37501','AddComment','21231','21231'),('42501','comment','2018-08-16 23:38:25.067','ÂÜØÂ∞èÂàö','35003','5','AddComment','123','123'),('42507','comment','2018-08-16 23:38:38.244','ÂÜØÂ∞èÂàö','40003','37501','AddComment','2','2'),('45001','comment','2018-08-16 23:41:06.888','test','42511','37501','AddComment','ÂõûÊù•Â∏¶Â•ΩÂêÉÁöÑÁªô‰Ω†','ÂõûÊù•Â∏¶Â•ΩÂêÉÁöÑÁªô‰Ω†'),('45004','comment','2018-08-16 23:43:19.121','ÂÜØÂ∞èÂàöÁªèÁ∫™‰∫∫','42505','5','AddComment','ÂêåÊÑèÔºÅÔºÅ','ÂêåÊÑèÔºÅÔºÅ');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('10','VariableUpdate','5','5',NULL,'6','inputUser','string',0,'2018-08-16 15:28:34.052',NULL,NULL,NULL,'test',NULL),('37504','VariableUpdate','37501','37501',NULL,'37502','objId','string',0,'2018-08-16 22:33:08.170',NULL,NULL,NULL,'LeaveBill.2',NULL),('37506','VariableUpdate','37501','37501',NULL,'37502','inputUser','string',0,'2018-08-16 22:33:08.171',NULL,NULL,NULL,'test',NULL),('42503','VariableUpdate','5','5',NULL,'35002','outcome','string',0,'2018-08-16 23:38:25.215',NULL,NULL,NULL,'ÊâπÂáÜ',NULL),('42509','VariableUpdate','37501','37501',NULL,'40002','outcome','string',0,'2018-08-16 23:38:38.354',NULL,NULL,NULL,'È©≥Âõû',NULL),('45005','VariableUpdate','5','5',NULL,'42504','outcome','string',1,'2018-08-16 23:43:19.203',NULL,NULL,NULL,'ÊâπÂáÜ',NULL),('8','VariableUpdate','5','5',NULL,'6','objId','string',0,'2018-08-16 15:28:34.051',NULL,NULL,NULL,'LeaveBill.1',NULL);

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('13',NULL,'participant','test',NULL,'5'),('35004',NULL,'participant','ÂÜØÂ∞èÂàö',NULL,'5'),('37509',NULL,'participant','test',NULL,'37501'),('40004',NULL,'participant','ÂÜØÂ∞èÂàö',NULL,'37501'),('42506',NULL,'participant','ÂÜØÂ∞èÂàöÁªèÁ∫™‰∫∫',NULL,'5');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('37501','37501','LeaveBill.2','LeaveBill:1:4','2018-08-16 22:33:08.168',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'',NULL),('5','5','LeaveBill.1','LeaveBill:1:4','2018-08-16 15:28:34.051','2018-08-16 23:43:19.218',29685167,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('12','LeaveBill:1:4','usertask1','5','5','Êèê‰∫§Áî≥ËØ∑',NULL,NULL,NULL,'test','2018-08-16 15:28:34.067',NULL,'2018-08-16 21:44:58.880',22584813,'completed',50,NULL,'/audit',NULL,''),('35003','LeaveBill:1:4','usertask2','5','5','ÁªèÁ∫™‰∫∫ÂÆ°Êâπ',NULL,NULL,NULL,'ÂÜØÂ∞èÂàö','2018-08-16 21:44:58.894',NULL,'2018-08-16 23:38:25.224',6806330,'completed',50,NULL,'/audit',NULL,''),('37508','LeaveBill:1:4','usertask1','37501','37501','Êèê‰∫§Áî≥ËØ∑',NULL,NULL,NULL,'test','2018-08-16 22:33:08.183',NULL,'2018-08-16 22:48:51.492',943309,'completed',50,NULL,'/audit',NULL,''),('40003','LeaveBill:1:4','usertask2','37501','37501','ÁªèÁ∫™‰∫∫ÂÆ°Êâπ',NULL,NULL,NULL,'ÂÜØÂ∞èÂàö','2018-08-16 22:48:51.502',NULL,'2018-08-16 23:38:38.357',2986855,'completed',50,NULL,'/audit',NULL,''),('42505','LeaveBill:1:4','usertask3','5','5','ËÄÅÊÄªÂÆ°Êâπ',NULL,NULL,NULL,'ÂÜØÂ∞èÂàöÁªèÁ∫™‰∫∫','2018-08-16 23:38:25.242',NULL,'2018-08-16 23:43:19.208',293966,'completed',50,NULL,'/audit',NULL,''),('42511','LeaveBill:1:4','usertask1','37501','37501','Êèê‰∫§Áî≥ËØ∑',NULL,NULL,NULL,'test','2018-08-16 23:38:38.358',NULL,'2018-08-16 23:41:06.993',148635,'completed',50,NULL,'/audit',NULL,''),('45003','LeaveBill:1:4','usertask2','37501','37501','ÁªèÁ∫™‰∫∫ÂÆ°Êâπ',NULL,NULL,NULL,'ÂÜØÂ∞èÂàö','2018-08-16 23:41:07.020',NULL,NULL,NULL,NULL,50,NULL,'/audit',NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('37503','37501','37501',NULL,'objId','string',0,NULL,NULL,NULL,'LeaveBill.2',NULL,'2018-08-16 22:33:08.170','2018-08-16 22:33:08.170'),('37505','37501','37501',NULL,'inputUser','string',0,NULL,NULL,NULL,'test',NULL,'2018-08-16 22:33:08.171','2018-08-16 22:33:08.171'),('42502','5','5',NULL,'outcome','string',1,NULL,NULL,NULL,'ÊâπÂáÜ',NULL,'2018-08-16 23:38:25.215','2018-08-16 23:43:19.219'),('42508','37501','37501',NULL,'outcome','string',0,NULL,NULL,NULL,'È©≥Âõû',NULL,'2018-08-16 23:38:38.354','2018-08-16 23:38:38.354'),('7','5','5',NULL,'objId','string',1,NULL,NULL,NULL,'LeaveBill.1',NULL,'2018-08-16 15:28:34.051','2018-08-16 23:43:19.219'),('9','5','5',NULL,'inputUser','string',1,NULL,NULL,NULL,'test',NULL,'2018-08-16 15:28:34.052','2018-08-16 23:43:19.219');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('1','ËØ∑ÂÅáÊµÅÁ®ã',NULL,'','2018-08-16 15:27:55.795');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('LeaveBill:1:4',2,'leaveBill2.zip','LeaveBillProcess','LeaveBill',1,'1','leaveBill2.bpmn','leaveBill2.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('37501',4,'37501','LeaveBill.2',NULL,'LeaveBill:1:4',NULL,'usertask2',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('37509',1,NULL,'participant','test',NULL,'37501',NULL),('40004',1,NULL,'participant','ÂÜØÂ∞èÂàö',NULL,'37501',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('45003',1,'37501','37501','LeaveBill:1:4','ÁªèÁ∫™‰∫∫ÂÆ°Êâπ',NULL,NULL,'usertask2',NULL,'ÂÜØÂ∞èÂàö',NULL,50,'2018-08-16 23:41:07.020',NULL,NULL,1,'','/audit');

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('37503',1,'string','objId','37501','37501',NULL,NULL,NULL,NULL,'LeaveBill.2',NULL),('37505',1,'string','inputUser','37501','37501',NULL,NULL,NULL,NULL,'test',NULL),('42508',1,'string','outcome','37501','37501',NULL,NULL,NULL,NULL,'È©≥Âõû',NULL);

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `persistent_logins` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'Áà∂ËèúÂçïIDÔºå‰∏ÄÁ∫ßËèúÂçï‰∏∫0',
  `name` varchar(50) DEFAULT NULL COMMENT 'ËèúÂçïÂêçÁß∞',
  `url` varchar(200) DEFAULT NULL COMMENT 'ËèúÂçïURL',
  `perms` varchar(500) DEFAULT NULL COMMENT 'ÊéàÊùÉ(Â§ö‰∏™Áî®ÈÄóÂè∑ÂàÜÈöîÔºåÂ¶ÇÔºöuser:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT 'Á±ªÂûã   0ÔºöÁõÆÂΩï   1ÔºöËèúÂçï   2ÔºöÊåâÈíÆ',
  `icon` varchar(50) DEFAULT NULL COMMENT 'ËèúÂçïÂõæÊ†á',
  `order_num` int(11) DEFAULT NULL COMMENT 'ÊéíÂ∫è',
  `gmt_create` datetime DEFAULT NULL COMMENT 'ÂàõÂª∫Êó∂Èó¥',
  `gmt_modified` datetime DEFAULT NULL COMMENT '‰øÆÊîπÊó∂Èó¥',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='ËèúÂçïÁÆ°ÁêÜ';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (1,0,'‰∏öÂä°ÁÆ°ÁêÜ',NULL,NULL,0,NULL,NULL,NULL,NULL),(2,0,'ÊµÅÁ®ãÁÆ°ÁêÜ',NULL,NULL,0,NULL,NULL,NULL,NULL),(3,1,'ËØ∑ÂÅáÁÆ°ÁêÜ','/home',NULL,1,NULL,NULL,NULL,NULL),(4,2,'‰ªªÂä°ÁÆ°ÁêÜ','/task',NULL,1,NULL,NULL,NULL,NULL),(5,2,'ÈÉ®ÁΩ≤ÁÆ°ÁêÜ','/deployHome',NULL,1,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT 'ËßíËâ≤ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT 'ËèúÂçïID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='ËßíËâ≤‰∏éËèúÂçïÂØπÂ∫îÂÖ≥Á≥ª';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Áî®Êà∑ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT 'ËßíËâ≤ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Áî®Êà∑‰∏éËßíËâ≤ÂØπÂ∫îÂÖ≥Á≥ª';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (1,6,1),(2,5,1),(3,4,1),(4,3,1),(5,2,1),(6,1,1);

/*Table structure for table `sysrole` */

DROP TABLE IF EXISTS `sysrole`;

CREATE TABLE `sysrole` (
  `id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf32 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sysrole` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
