CREATE TABLE `membertbl` (
  `mid` varchar(20) NOT NULL COMMENT '회원 아이디',
  `pw` varchar(20) DEFAULT NULL COMMENT '비밀번호',
  `email` varchar(50) DEFAULT NULL COMMENT '이메일',
  `pfp` varchar(500) DEFAULT NULL COMMENT '프로필사진',
  `phone` varchar(15) DEFAULT NULL COMMENT '전화번호',
  `name` varchar(15) DEFAULT NULL COMMENT '회원 이름',
  `birth` date DEFAULT NULL COMMENT '생년월일',
  `intro` varchar(100) DEFAULT NULL COMMENT '자기소개',
  `follower` varchar(500) DEFAULT '' COMMENT '팔로워',
  `isprivate` varchar(45) DEFAULT 'no',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `boardtbl` (
  `bid` int NOT NULL AUTO_INCREMENT COMMENT '게시글 번호',
  `content` varchar(500) DEFAULT NULL COMMENT '게시글 내용',
  `birth` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 날짜',
  `likecount` int NOT NULL DEFAULT '0' COMMENT '좋아요 수',
  `photo` varchar(500) DEFAULT NULL COMMENT '사진 주소',
  `id` varchar(20) DEFAULT NULL COMMENT '작성자 아이디',
  `likeWho` varchar(2000) DEFAULT '',
  PRIMARY KEY (`bid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `commenttbl` (
  `commentid` int NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
  `cid` varchar(20) NOT NULL COMMENT '댓글 작성자 아이디',
  `content` varchar(100) NOT NULL COMMENT '댓글 내용',
  `birth` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 등록일',
  `id` int NOT NULL COMMENT '댓글 등록할 게시글 아이디',
  `likecount` int NOT NULL DEFAULT '0' COMMENT '좋아요 수',
  PRIMARY KEY (`commentid`),
  KEY `cid` (`cid`),
  KEY `id` (`id`),
  CONSTRAINT `commenttbl_FK` FOREIGN KEY (`cid`) REFERENCES `membertbl` (`mid`) ON DELETE CASCADE,
  CONSTRAINT `commenttbl_FK_1` FOREIGN KEY (`id`) REFERENCES `boardtbl` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `messagetbl` (
  `id` varchar(20) NOT NULL COMMENT '보내는 사람',
  `rid` varchar(20) DEFAULT NULL COMMENT '받는 사람',
  `message` varchar(100) DEFAULT NULL COMMENT '메시지 내용',
  `birth` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '보낸 날짜',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `noti` (
  `notiid` int NOT NULL AUTO_INCREMENT,
  `getid` varchar(20) NOT NULL,
  `putid` varchar(20) NOT NULL,
  `notice` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `read_at` date DEFAULT NULL,
  PRIMARY KEY (`notiid`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into membertbl (mid,pw,email,pfp,phone,name,birth,intro) values ('admin', '1', 'admin@naver.com', 'none', '010-1111-1111', '관리자', '1999-12-12', 'intro1');
insert into boardtbl (content, id) values ('test12','admin');
insert into boardtbl (content, id) values ('test123','admin');
insert into boardtbl (content, id) values ('test1234','admin');