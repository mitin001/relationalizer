CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO undefined DEFAULT VALUES;
CREATE TABLE 'menu' ('menu_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'menu' ADD COLUMN 'id';
ALTER TABLE 'menu' ADD COLUMN 'value';
ALTER TABLE 'menu' ADD COLUMN 'undefined_id' REFERENCES 'undefined' ('undefined_id');
INSERT INTO 'menu' ('id','value','undefined_id') VALUES ('file','File',1);
CREATE TABLE 'popup' ('popup_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'popup' ADD COLUMN 'menu_id' REFERENCES 'menu' ('menu_id');
INSERT INTO 'popup' ('menu_id') VALUES (1);
CREATE TABLE 'menuitem' ('menuitem_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'menuitem' ADD COLUMN 'value';
ALTER TABLE 'menuitem' ADD COLUMN 'onclick';
ALTER TABLE 'menuitem' ADD COLUMN 'popup_id' REFERENCES 'popup' ('popup_id');
INSERT INTO 'menuitem' ('value','onclick','popup_id') VALUES ('New','CreateNewDoc()',1);
INSERT INTO 'menuitem' ('value','onclick','popup_id') VALUES ('Open','OpenDoc()',1);
INSERT INTO 'menuitem' ('value','onclick','popup_id') VALUES ('Close','CloseDoc()',1);

