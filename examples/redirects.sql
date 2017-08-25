CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'undefined' ADD COLUMN 'batchcomplete';
INSERT INTO undefined ('batchcomplete') VALUES ('');
CREATE TABLE 'query' ('query_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'query' ADD COLUMN 'undefined_id' REFERENCES 'undefined' ('undefined_id');
INSERT INTO 'query' ('undefined_id') VALUES (1);
CREATE TABLE 'redirects' ('redirects_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'redirects' ADD COLUMN 'from';
ALTER TABLE 'redirects' ADD COLUMN 'to';
ALTER TABLE 'redirects' ADD COLUMN 'query_id' REFERENCES 'query' ('query_id');
INSERT INTO 'redirects' ('from','to','query_id') VALUES ('Main page','Main Page',1);
CREATE TABLE 'pages' ('pages_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'pages' ADD COLUMN 'query_id' REFERENCES 'query' ('query_id');
INSERT INTO 'pages' ('query_id') VALUES (1);
CREATE TABLE '15580374' ('15580374_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE '15580374' ADD COLUMN 'pageid';
ALTER TABLE '15580374' ADD COLUMN 'ns';
ALTER TABLE '15580374' ADD COLUMN 'title';
ALTER TABLE '15580374' ADD COLUMN 'pages_id' REFERENCES 'pages' ('pages_id');
INSERT INTO '15580374' ('pageid','ns','title','pages_id') VALUES (15580374,0,'Main Page',1);

