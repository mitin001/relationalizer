CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'undefined' ADD COLUMN 'batchcomplete';
INSERT INTO undefined ('batchcomplete') VALUES ('');
CREATE TABLE 'continue' ('continue_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'continue' ADD COLUMN 'accontinue';
ALTER TABLE 'continue' ADD COLUMN 'continue';
ALTER TABLE 'continue' ADD COLUMN 'undefined_id' REFERENCES 'undefined' ('undefined_id');
INSERT INTO 'continue' ('accontinue','continue','undefined_id') VALUES ('List_of_Equestrian_Sports','-||',1);
CREATE TABLE 'query' ('query_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'query' ADD COLUMN 'undefined_id' REFERENCES 'undefined' ('undefined_id');
INSERT INTO 'query' ('undefined_id') VALUES (1);
CREATE TABLE 'allcategories' ('allcategories_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'allcategories' ADD COLUMN '*';
ALTER TABLE 'allcategories' ADD COLUMN 'query_id' REFERENCES 'query' ('query_id');
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of African-American Nonfiction Writers',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of African-American Writers',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of Albanians',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of Ambassadors of the Kingdom of the Netherlands',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of Batman characters',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of British television programmes',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of C-SPAN Q&A interviews by year',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of Chabad Houses',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of Chicago Bears Players',1);
INSERT INTO 'allcategories' ('*','query_id') VALUES ('List of Entrepreneurs',1);

