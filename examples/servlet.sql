PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE 'undefined' (id INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO "undefined" VALUES(1);
CREATE TABLE 'web-app' (id INTEGER PRIMARY KEY AUTOINCREMENT, undefined_id);
INSERT INTO "web-app" VALUES(1,1);
CREATE TABLE 'servlet' (id INTEGER PRIMARY KEY AUTOINCREMENT);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('undefined',1);
INSERT INTO "sqlite_sequence" VALUES('web-app',1);
COMMIT;