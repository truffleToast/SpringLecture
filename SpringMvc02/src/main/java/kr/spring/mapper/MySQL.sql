-- SQL 문장 작성 -- 
CREATE TABLE BOARD(
	IDX INT NOT NULL AUTO_INCREMENT,
	TITLE VARCHAR(100) NOT NULL ,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT NOT NULL DEFAULT 0,
	PRIMARY KEY(IDX)
);

INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES 
('[속보]명훔쌤 시내에서 미상의 여자와 걷는 모습 발견되어..','힝 뻥인데','준용쌤');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES 
('[속보]다음주 13일 팀 편성합니다.','팀장 지원 하실분들 말씀해주세요','명훈쌤');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES 
('[속보]다음주부터 간식은 2일에 한번씩만 나갑니다..','진자 믿었어?','조미소');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES 
('[속보]AI카페에서 태연씨 다른반 교육생과 이야기 하고 있더라','처음 보는 여자애 같은데...','박치우');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES 
('[속보]저는 사실벼 병관쌤과 닮지 않았습니다','힝 뻥인데','김대현');

SELECT * FROM BOARD;


