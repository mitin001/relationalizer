PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO "undefined" VALUES(1);
CREATE TABLE 'widget' ('widget_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'debug', 'undefined_id' REFERENCES 'undefined' ('undefined_id'));
INSERT INTO "widget" VALUES(1,'on',1);
CREATE TABLE 'window' ('window_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'title', 'name', 'width', 'height', 'widget_id' REFERENCES 'widget' ('widget_id'));
INSERT INTO "window" VALUES(1,'Sample Konfabulator Widget','main_window',500,500,1);
CREATE TABLE 'image' ('image_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'src', 'name', 'hOffset', 'vOffset', 'alignment', 'widget_id' REFERENCES 'widget' ('widget_id'));
INSERT INTO "image" VALUES(1,'Images/Sun.png','sun1',250,250,'center',1);
CREATE TABLE 'text' ('text_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'data', 'size', 'style', 'name', 'hOffset', 'vOffset', 'alignment', 'onMouseUp', 'widget_id' REFERENCES 'widget' ('widget_id'));
INSERT INTO "text" VALUES(1,'Click Here',36,'bold','text1',250,100,'center','sun1.opacity = (sun1.opacity / 100) * 90;',1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('undefined',1);
INSERT INTO "sqlite_sequence" VALUES('widget',1);
INSERT INTO "sqlite_sequence" VALUES('window',1);
INSERT INTO "sqlite_sequence" VALUES('image',1);
INSERT INTO "sqlite_sequence" VALUES('text',1);
COMMIT;
