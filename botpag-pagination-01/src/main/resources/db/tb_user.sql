/*
Navicat PGSQL Data Transfer

Source Server         : LocalDatabase
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : postgres
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2016-08-09 20:15:54
*/


-- ----------------------------
-- Sequence structure for tbuser_id_seq
-- ----------------------------
DROP SEQUENCE "tbuser_id_seq";
CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 5, true);

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS "tbuser";
CREATE TABLE "tbuser" (
"id" int4 DEFAULT nextval('tbuser_id_seq'::regclass) NOT NULL,
"lastname" varchar(100) COLLATE "default",
"firstname" varchar(100) COLLATE "default",
"gender" varchar(10) COLLATE "default",
"email" varchar(100) COLLATE "default",
"role" varchar(100) COLLATE "default",
"status" varchar(1) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
BEGIN;
INSERT INTO "tbuser" VALUES ('1', 'test', 'test', 'male', 'a@gmail.com', 'admin', '1');
INSERT INTO "tbuser" VALUES ('2', 'jiva', 'lee', 'female', 'b@gmail.com', 'editor', '0');
INSERT INTO "tbuser" VALUES ('3', 'mina', 'meas', 'male', 'c@gmail.com', 'visitor', '1');
INSERT INTO "tbuser" VALUES ('4', 'dara', 'ly', 'female', 'd@gmail.com', 'admin', '0');
INSERT INTO "tbuser" VALUES ('5', 'chenda', 'reth', 'male', 'e@gmail.com', 'editor', '1');
COMMIT;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "tbuser_id_seq" OWNED BY "tbuser"."id";

-- ----------------------------
-- Primary Key structure for table tbuser
-- ----------------------------
ALTER TABLE "tbuser" ADD PRIMARY KEY ("id");
