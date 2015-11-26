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
CREATE TABLE message
(
	msg_no               INTEGER  NOT NULL AUTO_INCREMENT,
	msg_title             VARCHAR(100)  NOT NULL,
	msg_sender           INTEGER  NOT NULL ,
    msg_receiver	      VARCHAR(50)  NOT NULL ,
	msg_send_date        DATE  NOT NULL ,
	msg_details           TINYTEXT  NOT NULL ,
	PRIMARY KEY (msg_no),
    FOREIGN KEY (msg_sender) REFERENCES member(member_no)
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
    projcet_name  		VARCHAR(50)  NOT NULL ,
	project_company_name   VARCHAR(50)  NOT NULL ,
	project_hope_start_date  	DATE  NOT NULL ,
	project_hope_end_date   	DATE  NOT NULL ,
	project_register_date   	DATE  NOT NULL ,
	project_client_address  	VARCHAR(255)  NULL ,
	project_contents      	TINYTEXT  NOT NULL ,
	project_status            VARCHAR(10)  NOT NULL,
    PRIMARY KEY (project_request_no)
);
CREATE TABLE project
(
	project_no    INTEGER  NOT NULL, 
	project_start_date    DATE  NOT NULL ,
	project_end_date      DATE NULL,
	project_details       TINYTEXT  NULL ,
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
	project_avg         FLOAT  NULL, 
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
	details               TINYTEXT  NULL ,
    PRIMARY KEY(member_no,project_no,appraiser_code,appraiser_member_no),
    FOREIGN KEY(member_no,project_no) REFERENCES member_history(member_no,project_no),
    FOREIGN KEY(appraiser_code) REFERENCES appraiser(appraiser_code)
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
ALTER TABLE message AUTO_INCREMENT=984584;

