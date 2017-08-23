PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE 'undefined' (id INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO "undefined" VALUES(1);
CREATE TABLE 'menu' (id INTEGER PRIMARY KEY AUTOINCREMENT, 'value', 'undefined_id');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('undefined',1);
COMMIT;
