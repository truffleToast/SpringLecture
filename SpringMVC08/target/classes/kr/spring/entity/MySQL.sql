
CREATE TABLE TBLBOARD(
	IDX INT NOT NULL,
	MEMID VARCHAR(20) NOT NULL,
	TITLE VARCHAR(100) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0,
	-- 댓글기능 추가 --
	BOARDGROUP INT, -- 부모 댓글 하나의 그룹 --
	BOARDSEQUENCE INT, -- 같은 그룹안에서 댓글의 순서 --
    BOARDLEVEL INT, -- 1단계 댓글인지 2단계 댓글인지에 대한 정보 --	
	BOARDAVAILABLE INT, -- 삭제된 글인지 여부 --
	PRIMARY KEY(IDX)
);

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다1', '11월에 우리 전시회 갈까요?', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다1', '11월에 우리 전시회 갈까요?1', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다2', '11월에 우리 전시회 갈까요?2', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다3', '11월에 우리 전시회 갈까요?3', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다4', '11월에 우리 전시회 갈까요?4', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다5', '11월에 우리 전시회 갈까요?5', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다6', '11월에 우리 전시회 갈까요6', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다7', '11월에 우리 전시회 갈까요?7', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다8', '11월에 우리 전시회 갈까요?8', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다9', '11월에 우리 전시회 갈까요?9', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다10', '11월에 우리 전시회 갈까요?10', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다11', '11월에 우리 전시회 갈까요?11', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다12', '11월에 우리 전시회 갈까요?12', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다13', '11월에 우리 전시회 갈까요?13', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다14', '11월에 우리 전시회 갈까요?14', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다15', '11월에 우리 전시회 갈까요?15', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다16', '11월에 우리 전시회 갈까요?16', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다17', '11월에 우리 전시회 갈까요?17', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다18', '11월에 우리 전시회 갈까요?18', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다19', '11월에 우리 전시회 갈까요?19', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다20', '11월에 우리 전시회 갈까요?20', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;




INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'aischool', '공지사항입니다.', '다음주 월요일 정상 등원하겠습니다', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'pbk', 'Spring반 친구들은 들으라', '맛있는 간식 또 사줄께요 ^^*', '병관쌤',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1),
'jjy', '준용쌤 입니다! 여러분 제발 늦지마세요', '아침마다 연락 자주받는 친구들 알겠지?', '준용대디',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

SELECT * FROM TBLBOARD;

CREATE TABLE TBLMEMBER(
	MEMID VARCHAR(50) NOT NULL,
	MEMPWD VARCHAR(50) NOT NULL,
	MEMNAME VARCHAR(50) NOT NULL,
	MEMPHONE VARCHAR(50) NOT NULL,
	MEMADDR VARCHAR(100),
	LATITUDE DECIMAL(13, 10), -- 현재위치위도 --
	LONGITUDE DECIMAL(13, 10), -- 현재위치경도 --
	PRIMARY KEY(MEMID)
);

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES('aischool', '1234', '교육운영부', '010-1111-2222');

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES('pbk', '1234', '병관쌤', '010-4611-5278');

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES('jjy', '1234', '준용대디', '010-3333-4444');

SELECT * FROM TBLMEMBER;

























