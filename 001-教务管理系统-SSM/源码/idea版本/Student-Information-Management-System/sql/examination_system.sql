`examination_system``college`DROP TABLE IF EXISTS `college` ;

CREATE TABLE `college` (
  `collegeID` INT(11) NOT NULL,
  `collegeName` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `course` ;

CREATE TABLE `course` (
  `courseID` INT(11) NOT NULL,
  `courseName` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `teacherID` INT(11) NOT NULL,
  `courseTime` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开课时间',
  `classRoom` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开课地点',
  `courseWeek` INT(200) DEFAULT NULL COMMENT '学时',
  `courseType` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程类型',
  `collegeID` INT(11) NOT NULL COMMENT '所属院系',
  `score` INT(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`) USING BTREE,
  KEY `collegeID` (`collegeID`) USING BTREE,
  KEY `teacherID` (`teacherID`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `role` ;

CREATE TABLE `role` (
  `roleID` INT(11) NOT NULL,
  `roleName` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissions` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `selectedcourse` ;

CREATE TABLE `selectedcourse` (
  `courseID` INT(11) NOT NULL,
  `studentID` INT(11) NOT NULL,
  `mark` INT(11) DEFAULT NULL COMMENT '成绩',
  KEY `courseID` (`courseID`) USING BTREE,
  KEY `studentID` (`studentID`) USING BTREE,
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `selectedcourse_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `student` ;

CREATE TABLE `student` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthYear` DATE DEFAULT NULL COMMENT '出生日期',
  `grade` DATE DEFAULT NULL COMMENT '入学时间',
  `collegeID` INT(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`) USING BTREE,
  KEY `collegeID` (`collegeID`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB AUTO_INCREMENT=10106 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `teacher` ;

CREATE TABLE `teacher` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthYear` DATE NOT NULL,
  `degree` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学历',
  `title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职称',
  `grade` DATE DEFAULT NULL COMMENT '入职时间',
  `collegeID` INT(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`) USING BTREE,
  KEY `collegeID` (`collegeID`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=INNODB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `userlogin` ;

CREATE TABLE `userlogin` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2' COMMENT '角色权限',
  PRIMARY KEY (`userID`) USING BTREE,
  KEY `role` (`role`) USING BTREE,
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

TRUNCATE TABLE `college` ;

INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('1','计算机系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('2','设计系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('3','财经系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('4','物理系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('5','化学系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('6','生物系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('7','数学系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('8','教育系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('9','外语系');
INSERT INTO `college` (`collegeID`, `collegeName`) VALUES ('10','声乐系');

TRUNCATE TABLE `course` ;

INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('1','C语言程序设计','1001','周二','科401','18','必修课','1','3');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('2','Python爬虫技巧','1001','周四','X402','18','必修课','1','3');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('3','数据结构','1001','周四','科401','18','必修课','1','2');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('4','Java程序设计','1002','周五','科401','18','必修课','1','2');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('5','英语1','1001','周四','X302','18','必修课','1','2');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('6','1','1002','周二','5号楼5005','30','必修课','2','99');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('7','1','1012','周三','2号楼2002','90','选修课','9','6');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('8','1','1023','周二','2号楼2002','35','选修课','8','85');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('9','1','1009','周二','5号楼5005','33','必修课','9','36');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('10','1','1001','周三','1号楼1001','90','选修课','10','49');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('11','1','1010','周三','6号楼6006','54','选修课','2','63');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('12','1','1021','周五','2号楼2002','72','选修课','3','43');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('13','1','1004','周二','实验楼s4306','72','选修课','2','31');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('14','1','1015','周四','1号楼1001','57','选修课','7','9');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('15','1','1004','周一','3号楼3003','48','必修课','9','92');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('16','1','1016','周五','实验楼s4306','38','选修课','5','8');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('17','1','1012','周三','3号楼3003','9','必修课','7','48');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('18','1','1017','周一','5号楼5005','59','必修课','1','45');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('19','1','1012','周一','实验楼s4306','11','必修课','8','38');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('20','1','1004','周一','5号楼5005','12','选修课','2','12');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('21','1','1007','周一','实验楼s4306','20','必修课','6','81');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('22','1','1009','周二','10号楼10108','86','必修课','1','94');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('23','1','1007','周二','2号楼2002','97','选修课','9','15');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('24','1','1019','周三','5号楼5005','50','必修课','5','90');
INSERT INTO `course` (`courseID`, `courseName`, `teacherID`, `courseTime`, `classRoom`, `courseWeek`, `courseType`, `collegeID`, `score`) VALUES ('25','1','1009','周一','5号楼5005','49','选修课','5','94');

TRUNCATE TABLE `role` ;

INSERT INTO `role` (`roleID`, `roleName`, `permissions`) VALUES ('0','admin',null);
INSERT INTO `role` (`roleID`, `roleName`, `permissions`) VALUES ('1','teacher',null);
INSERT INTO `role` (`roleID`, `roleName`, `permissions`) VALUES ('2','student',null);

TRUNCATE TABLE `selectedcourse` ;

INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('2','10001','12');
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('1','10001','95');
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('1','10002','66');
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('1','10003','100');
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('2','10003','99');
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('3','10001',null);
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('5','10001',null);
INSERT INTO `selectedcourse` (`courseID`, `studentID`, `mark`) VALUES ('4','10001',null);

TRUNCATE TABLE `student` ;

INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10001','小黄','男','1996-09-02','2015-09-02','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10002','小米','女','1995-09-14','2015-09-02','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10003','小陈','女','1996-09-02','2015-09-02','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10005','小左','女','1996-09-02','2015-09-02','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10006','孔蓉可','男','2019-06-25','2020-03-05','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10007','马荣','男','2002-10-20','2009-11-20','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10008','贾时超','男','2000-10-13','2006-06-16','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10009','嵇固','女','2002-11-11','2018-06-04','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10010','茅雄','女','2009-08-16','2008-05-21','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10011','房昭萍','男','2018-07-18','2001-08-31','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10012','阮荔','女','2017-08-03','2000-03-25','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10013','卢善','女','2019-11-26','2017-10-26','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10014','戚菲姬','女','2004-08-19','2005-04-16','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10015','袁谦','女','2014-01-29','2010-06-23','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10016','贺荷','女','2001-07-06','2011-02-27','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10017','毕娴','女','2012-10-11','2011-03-27','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10018','陶彪','女','2003-01-06','2013-03-28','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10019','沈珠蓉','男','2003-09-15','2003-06-05','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10020','顾翰信','男','2012-11-28','2015-03-08','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10021','奚轮山','男','2015-07-09','2000-09-21','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10022','严华','女','2007-10-13','2008-02-29','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10023','张乐','男','2018-11-03','2005-07-29','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10024','鲍琴露','男','2003-09-19','2017-01-17','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10025','毕永','男','2001-09-13','2006-01-25','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10026','祁珍','男','2017-08-08','2004-11-11','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10027','梅影','男','2018-12-30','2019-11-29','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10028','高榕泽','男','2016-05-08','2012-02-17','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10029','包杰德','女','2003-04-14','2015-12-21','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10030','郭爱丹','男','2014-08-30','2005-05-13','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10031','魏纯','男','2006-07-21','2000-01-06','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10032','凤泰俊','女','2005-08-18','2017-04-01','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10033','岑世','男','2013-01-26','2018-01-02','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10034','韩青','女','2019-03-18','2010-08-14','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10035','季福','男','2002-01-26','2007-10-06','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10036','阮华美','女','2003-08-24','2000-11-26','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10037','霍宏','男','2018-12-10','2008-06-08','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10038','唐宜','女','2018-11-28','2019-05-16','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10039','宋翰伦','女','2003-10-24','2013-12-31','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10040','喻珊','女','2011-12-07','2018-10-01','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10041','陶素','女','2017-04-10','2019-03-18','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10042','毕眉','男','2001-08-03','2018-11-14','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10043','奚滢','男','2015-08-15','2007-07-02','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10044','房谦达','女','2016-06-24','2000-06-16','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10045','颜腾才','女','2001-09-16','2016-07-22','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10046','宋荷桂','女','2016-05-09','2012-12-04','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10047','江榕','男','2002-09-17','2002-07-02','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10048','江发健','男','2007-09-27','2008-11-30','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10049','苗子奇','女','2000-08-19','2014-10-22','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10050','郎蓓聪','男','2020-11-21','2002-03-11','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10051','祝萍','男','2004-02-16','2015-07-10','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10052','杨宏','男','2000-07-08','2003-09-28','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10053','丁璐','男','2002-01-30','2001-06-27','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10054','云超','女','2000-07-03','2003-12-06','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10055','虞晨','男','2014-03-29','2008-05-04','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10056','梅眉茗','男','2004-09-15','2006-04-03','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10057','石行天','女','2012-03-19','2014-08-07','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10058','施星','男','2007-07-11','2009-03-08','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10059','马珍','男','2016-11-18','2001-02-18','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10060','卫东','女','2007-07-21','2004-11-19','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10061','曹进','男','2012-09-05','2001-07-14','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10062','邢朋浩','女','2020-01-29','2009-08-05','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10063','史娣','女','2016-10-22','2017-06-13','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10064','陈中和','女','2014-02-10','2012-07-22','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10065','房超琛','男','2005-02-20','2000-12-18','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10066','任悦','女','2001-11-13','2010-03-27','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10067','方娴','男','2012-07-06','2011-10-10','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10068','严娅琳','女','2019-10-09','2010-04-29','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10069','纪娴锦','男','2016-01-01','2005-05-10','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10070','顾伊','女','2021-03-05','2008-05-10','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10071','马策','女','2013-12-08','2012-09-22','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10072','韩芳','男','2003-07-20','2012-07-20','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10073','舒泽文','女','2000-05-30','2000-04-13','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10074','毛蕊','男','2020-09-20','2003-09-04','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10075','阮素丽','男','2015-07-01','2017-06-17','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10076','冯斌','女','2011-05-04','2018-12-18','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10077','史秀娣','女','2001-01-28','2006-02-18','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10078','罗先杰','男','2017-02-27','2010-05-16','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10079','祝明承','男','2014-02-07','2012-12-29','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10080','尹德','男','2005-09-16','2005-09-06','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10081','崔波河','女','2011-08-07','2006-02-27','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10082','朱朋','男','2015-06-07','2015-09-06','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10083','岑达才','女','2008-05-14','2013-06-23','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10084','郝广','男','2018-12-21','2003-03-02','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10085','丁芳咏','女','2009-08-31','2015-04-29','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10086','路翰东','女','2019-01-05','2008-02-21','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10087','丁枫娣','女','2004-10-08','2006-11-20','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10088','姜嘉','男','2005-09-09','2003-11-22','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10089','凤功俊','女','2002-01-27','2013-12-30','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10090','姜珠琦','男','2011-02-09','2016-02-10','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10091','陈山','女','2014-08-26','2019-04-19','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10092','万兰','女','2016-10-03','2017-06-12','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10093','鲁宜','男','2007-05-02','2009-03-07','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10094','孔策心','女','2004-09-14','2014-01-06','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10095','穆绍天','男','2012-10-30','2009-01-04','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10096','霍爽','女','2003-10-08','2008-08-10','3');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10097','章松飞','男','2018-05-15','2005-09-23','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10098','鲁波固','男','2015-05-01','2010-04-04','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10099','昌滢婕','男','2003-09-16','2007-02-07','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10100','陈琬悦','男','2018-11-03','2006-01-03','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10101','吴凡','男','2008-09-11','2004-05-31','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10102','洪妍环','女','2000-06-08','2000-09-17','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10103','施波行','女','2020-04-30','2006-06-14','2');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10104','袁彬若','女','2000-05-28','2016-05-24','1');
INSERT INTO `student` (`userID`, `userName`, `sex`, `birthYear`, `grade`, `collegeID`) VALUES ('10105','邵仪芸','男','2004-06-08','2007-04-16','2');

TRUNCATE TABLE `teacher` ;

INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1001','刘老师1','女','1990-03-08','硕士','副教授','2015-09-02','2');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1002','张老师','男','1996-09-02','本科','普通教师','2015-09-02','1');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1003','郭嘉豪','男','1988-08-11','本科','教授','2006-08-17','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1004','李蕊','男','1988-08-25','博士','院士','2007-02-27','3');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1005','潘琬馨','女','1982-11-08','硕士','院士','2007-04-12','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1006','柯飞','男','1987-05-25','博士','教授','2007-06-23','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1007','苗静妹','男','1983-12-14','博士','普通本科','2007-09-28','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1008','苗福','男','1984-09-21','本科','院士','2007-09-11','2');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1009','穆强','女','1985-06-18','本科','普通本科','2007-08-08','1');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1010','邹香','男','1989-05-31','本科','普通本科','2007-05-13','2');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1011','姜坚','女','1986-04-22','博士','普通本科','2006-09-22','2');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1012','裘生','女','1982-12-18','硕士','普通本科','2007-04-19','3');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1013','房明昌','男','1985-10-30','本科','普通本科','2007-08-20','4');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1014','彭素','男','1988-06-25','本科','教授','2007-01-16','3');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1015','雷薇丹','女','1981-11-21','博士','院士','2007-04-07','4');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1016','鲍珊影','女','1983-06-18','硕士','院士','2006-09-27','2');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1017','邹和山','女','1984-02-09','博士','普通本科','2006-12-22','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1018','邵有林','女','1989-03-24','硕士','普通本科','2007-04-26','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1019','蒋群','男','1984-12-30','本科','院士','2007-05-03','3');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1020','林蓉','男','1987-09-04','本科','教授','2007-06-05','3');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1021','张友厚','女','1989-05-09','本科','教授','2007-09-25','5');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1022','丘育','男','1986-05-14','博士','院士','2006-10-17','1');
INSERT INTO `teacher` (`userID`, `userName`, `sex`, `birthYear`, `degree`, `title`, `grade`, `collegeID`) VALUES ('1023','贺壮庆','男','1988-08-04','本科','普通本科','2006-11-05','5');

TRUNCATE TABLE `userlogin` ;

INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('1','admin','123','0');
INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('8','10001','123','2');
INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('9','10002','123','2');
INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('10','10003','123','2');
INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('11','10005','123','2');
INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('14','1001','123','1');
INSERT INTO `userlogin` (`userID`, `userName`, `password`, `role`) VALUES ('15','1002','123','1');

