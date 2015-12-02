CREATE DATABASE db_design_project;
USE db_design_project;
CREATE TABLE positions
(
	position_code 	     VARCHAR(3)  NOT NULL ,
	position_type         VARCHAR(50)  NOT NULL, 
    PRIMARY KEY(position_code)
);
CREATE TABLE member
(
	member_no             INTEGER  NOT NULL AUTO_INCREMENT,
	member_id             VARCHAR(50)  NOT NULL,
	member_password       VARCHAR(100)  NOT NULL ,
	member_degree         VARCHAR(50)  NOT NULL ,	
	member_name           VARCHAR(50)  NOT NULL ,	
	member_cellphone       VARCHAR(20)  NOT NULL ,
 	member_pos_code 	VARCHAR(3)  NOT NULL ,
	member_personal_id 	VARCHAR(15)  NOT NULL ,
	PRIMARY KEY(member_no),
	FOREIGN KEY(member_pos_code) REFERENCES positions(position_code)
);
CREATE TABLE member_career
(
	member_no             INTEGER  NOT NULL,
	before_company_name   VARCHAR(100)  NOT NULL ,
	work_at_date          DATE  NOT NULL ,
	work_end_date         DATE  NOT NULL ,
	position              VARCHAR(100)  NOT NULL ,
	PRIMARY KEY(member_no,before_company_name),
    FOREIGN KEY(member_no) REFERENCES member(member_No)
);
CREATE TABLE member_skillset
(
	member_no             INTEGER  NOT NULL,	
	member_skillset          VARCHAR(255) NOT NULL ,
	 
    FOREIGN KEY (member_no) REFERENCES member(member_no)
);
CREATE TABLE project_request
(
	project_request_no    INTEGER  NOT NULL AUTO_INCREMENT,
    project_name  		VARCHAR(50)  NOT NULL ,
	project_company_name   VARCHAR(50)  NOT NULL ,
	project_hope_start_date  	DATE  NOT NULL ,
	project_hope_end_date   	DATE  NOT NULL ,
	project_register_date   	DATE  NOT NULL ,
	project_postcode  	VARCHAR(15)  NOT NULL ,
    project_address  	VARCHAR(100)  NOT NULL ,
    project_address_detail  	VARCHAR(100)  NOT NULL ,
	project_contents      	TEXT  NOT NULL ,
	project_status            VARCHAR(10)  NOT NULL,
    PRIMARY KEY (project_request_no)
);
CREATE TABLE project
(
	project_no    INTEGER  NOT NULL, 
	project_start_date    DATE  NOT NULL ,
	project_end_date      DATE NULL,
	PRIMARY KEY (project_no),
    FOREIGN KEY (project_no) REFERENCES project_request(project_request_no)
);
CREATE TABLE project_role
(
	role_no		VARCHAR(3),
   	role		VARCHAR(50),
   	PRIMARY KEY (role_no)
);
CREATE TABLE member_history
(
	member_no         INTEGER  NOT NULL ,
	project_no          INTEGER  NOT NULL, 
    role_no             VARCHAR(3)  NOT NULL ,
	project_start_date    DATE  NOT NULL ,
	project_end_date     DATE  NULL ,
	PRIMARY KEY(member_no,project_no),
    FOREIGN KEY(member_no) REFERENCES member(member_no),
    FOREIGN KEY(project_no) REFERENCES project(project_no),
    FOREIGN KEY(role_no) REFERENCES project_role(role_no)
);
CREATE TABLE appraiser
(
	appraiser_code	    VARCHAR(3) NOT NULL,
	appraiser_type	    VARCHAR(50),
	PRIMARY KEY(appraiser_code)
);

CREATE TABLE member_rate
(
	member_no          INTEGER  NOT NULL ,
	project_no           INTEGER  NOT NULL, 
	appraiser_code	     VARCHAR(3) NOT NULL,
	appraiser_member_no    INTEGER NOT NULL,
	performance_score     INTEGER  NOT NULL ,
	communication_score   INTEGER  NOT NULL ,
	detail               TEXT  NULL ,
    PRIMARY KEY(member_no,project_no,appraiser_code,appraiser_member_no),
    FOREIGN KEY(member_no,project_no) REFERENCES member_history(member_no,project_no),
    FOREIGN KEY(appraiser_code) REFERENCES appraiser(appraiser_code)
);

CREATE TABLE approval
(
	member_no          INTEGER     NOT NULL ,
	project_no         INTEGER     NOT NULL, 
	approval_max_num   VARCHAR(3)  NOT NULL,
	approval_checknum  VARCHAR(2)  NOT NULL,
	approval_count     VARCHAR(2)  NOT NULL ,
	approval_detail    TEXT 	   NOT NULL ,
    PRIMARY KEY(member_no,project_no),
    FOREIGN KEY(member_no)  REFERENCES member_history(member_no),
    FOREIGN KEY(project_no)  REFERENCES project_request(project_request_no)
);
CREATE TABLE approval_status
(
	member_no          INTEGER      NOT NULL ,
	project_no         INTEGER      NOT NULL, 
	approval_select	   VARCHAR(2)   NOT NULL,	
	approval_opinion   VARCHAR(255) NOT NULL ,
    PRIMARY KEY(member_no,project_no),
    FOREIGN KEY(member_no)  REFERENCES member_history(member_no),
    FOREIGN KEY(project_no)  REFERENCES project_request(project_request_no)
);

INSERT INTO positions VALUES(0,'임원');
INSERT INTO positions VALUES(1,'PM');
INSERT INTO positions VALUES(2,'비서');
INSERT INTO positions VALUES(3,'일반사원');

INSERT INTO project_role VALUES(10,'PM');
INSERT INTO project_role VALUES(11,'PL');
INSERT INTO project_role VALUES(12,'분석자');
INSERT INTO project_role VALUES(13,'설계자');
INSERT INTO project_role VALUES(14,'프로그래머');
INSERT INTO project_role VALUES(15,'테스터');
INSERT INTO appraiser VALUES(100,'PM평가');
INSERT INTO appraiser VALUES(101,'동료평가');
INSERT INTO appraiser VALUES(102,'고객평가');

ALTER TABLE member AUTO_INCREMENT=234696;
ALTER TABLE project_request AUTO_INCREMENT=783473;
INSERT INTO `member` (`member_id`,`member_password`,`member_degree`,`member_name`,`member_cellphone`,`member_pos_code`,`member_personal_id`)
VALUES('dladnjs1','dladnjs1','박사','임원1','010-1231-3453','0','8302051851812');
INSERT INTO `member_skillset` (`member_no`,`member_skillset`)VALUES('234696','C#,');
INSERT INTO `member_career` (`member_no`,`before_company_name`,`work_at_date`,`work_end_date`,`position`)
VALUES('234696','삼성','1992-06-19','2002-04-03','과장');

INSERT INTO `member` (`member_id`,`member_password`,`member_degree`,`member_name`,`member_cellphone`,`member_pos_code`,`member_personal_id`)
VALUES('dladnjs2','dladnjs2','박사','임원2','010-5464-3453','0','8706051851812');
INSERT INTO `member_skillset` (`member_no`,`member_skillset`)VALUES('234697','C++,');
INSERT INTO `member_career` (`member_no`,`before_company_name`,`work_at_date`,`work_end_date`,`position`)
VALUES('234697','명지대','2000-10-19','2010-08-03','전임교수');

INSERT INTO `member` (`member_id`,`member_password`,`member_degree`,`member_name`,`member_cellphone`,`member_pos_code`,`member_personal_id`)
VALUES('dladnjs3','dladnjs3','박사','임원3','010-5634-3434','0','9002051851812');
INSERT INTO `member_skillset` (`member_no`,`member_skillset`)VALUES('234698','C#,');
INSERT INTO `member_career` (`member_no`,`before_company_name`,`work_at_date`,`work_end_date`,`position`)
VALUES('234698','효성','1998-11-20','2006-04-03','과장');

INSERT INTO `member` (`member_id`,`member_password`,`member_degree`,`member_name`,`member_cellphone`,`member_pos_code`,`member_personal_id`)
VALUES('pm1','pm1','대졸','피엠1','010-1354-1334','1','8406111861812');
INSERT INTO `member_skillset` (`member_no`,`member_skillset`)VALUES('234699','자바,C언어,');
INSERT INTO `member_career` (`member_no`,`before_company_name`,`work_at_date`,`work_end_date`,`position`)
VALUES('234699','다음','2008-12-02','2010-06-03','과장');

INSERT INTO `member` (`member_id`,`member_password`,`member_degree`,`member_name`,`member_cellphone`,`member_pos_code`,`member_personal_id`)
VALUES('qltj1','qltj1','고졸','비서1','010-1234-1114','2','9408222751812');
INSERT INTO `member_skillset` (`member_no`,`member_skillset`)VALUES('234700','엑셀,');
INSERT INTO `member_career` (`member_no`,`before_company_name`,`work_at_date`,`work_end_date`,`position`)
VALUES('234700','나모웹','2014-11-20','2015-04-03','비서');



