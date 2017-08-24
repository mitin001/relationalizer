PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO "undefined" VALUES(1);
CREATE TABLE 'glossary' ('glossary_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'title', 'undefined_id');
INSERT INTO "glossary" VALUES(1,'example glossary',1);
CREATE TABLE 'GlossDiv' ('GlossDiv_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'title', 'glossary_id');
INSERT INTO "GlossDiv" VALUES(1,'S',1);
CREATE TABLE 'GlossList' ('GlossList_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'GlossDiv_id');
INSERT INTO "GlossList" VALUES(1,1);
CREATE TABLE 'GlossEntry' ('GlossEntry_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'ID', 'SortAs', 'GlossTerm', 'Acronym', 'Abbrev', 'GlossSee', 'GlossList_id');
INSERT INTO "GlossEntry" VALUES(1,'SGML','SGML','Standard Generalized Markup Language','SGML','ISO 8879:1986','markup',1);
CREATE TABLE 'GlossDef' ('GlossDef_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'para', 'GlossEntry_id');
INSERT INTO "GlossDef" VALUES(1,'A meta-markup language, used to create markup languages such as DocBook.',1);
CREATE TABLE 'GlossSeeAlso' ('GlossSeeAlso_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'GlossSeeAlso', 'GlossDef_id');
INSERT INTO "GlossSeeAlso" VALUES(1,'GML',1);
INSERT INTO "GlossSeeAlso" VALUES(2,'XML',1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('undefined',1);
INSERT INTO "sqlite_sequence" VALUES('glossary',1);
INSERT INTO "sqlite_sequence" VALUES('GlossDiv',1);
INSERT INTO "sqlite_sequence" VALUES('GlossList',1);
INSERT INTO "sqlite_sequence" VALUES('GlossEntry',1);
INSERT INTO "sqlite_sequence" VALUES('GlossDef',1);
INSERT INTO "sqlite_sequence" VALUES('GlossSeeAlso',2);
COMMIT;
