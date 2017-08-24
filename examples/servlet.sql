PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO "undefined" VALUES(1);
CREATE TABLE 'web-app' ('web-app_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'undefined_id' REFERENCES 'undefined' ('undefined_id'));
INSERT INTO "web-app" VALUES(1,1);
CREATE TABLE 'servlet' ('servlet_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'servlet-name', 'servlet-class', 'web-app_id' REFERENCES 'web-app' ('web-app_id'));
INSERT INTO "servlet" VALUES(1,'cofaxCDS','org.cofax.cds.CDSServlet',1);
INSERT INTO "servlet" VALUES(2,'cofaxEmail','org.cofax.cds.EmailServlet',1);
INSERT INTO "servlet" VALUES(3,'cofaxAdmin','org.cofax.cds.AdminServlet',1);
INSERT INTO "servlet" VALUES(4,'fileServlet','org.cofax.cds.FileServlet',1);
INSERT INTO "servlet" VALUES(5,'cofaxTools','org.cofax.cms.CofaxToolsServlet',1);
CREATE TABLE 'servlet-mapping' ('servlet-mapping_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'cofaxCDS', 'cofaxEmail', 'cofaxAdmin', 'fileServlet', 'cofaxTools', 'web-app_id' REFERENCES 'web-app' ('web-app_id'));
INSERT INTO "servlet-mapping" VALUES(1,'/','/cofaxutil/aemail/*','/admin/*','/static/*','/tools/*',1);
CREATE TABLE 'taglib' ('taglib_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'taglib-uri', 'taglib-location', 'web-app_id' REFERENCES 'web-app' ('web-app_id'));
INSERT INTO "taglib" VALUES(1,'cofax.tld','/WEB-INF/tlds/cofax.tld',1);
CREATE TABLE 'init-param' ('init-param_id' INTEGER PRIMARY KEY AUTOINCREMENT, 'configGlossary:installationAt', 'configGlossary:adminEmail', 'configGlossary:poweredBy', 'configGlossary:poweredByIcon', 'configGlossary:staticPath', 'templateProcessorClass', 'templateLoaderClass', 'templatePath', 'templateOverridePath', 'defaultListTemplate', 'defaultFileTemplate', 'useJSP', 'jspListTemplate', 'jspFileTemplate', 'cachePackageTagsTrack', 'cachePackageTagsStore', 'cachePackageTagsRefresh', 'cacheTemplatesTrack', 'cacheTemplatesStore', 'cacheTemplatesRefresh', 'cachePagesTrack', 'cachePagesStore', 'cachePagesRefresh', 'cachePagesDirtyRead', 'searchEngineListTemplate', 'searchEngineFileTemplate', 'searchEngineRobotsDb', 'useDataStore', 'dataStoreClass', 'redirectionClass', 'dataStoreName', 'dataStoreDriver', 'dataStoreUrl', 'dataStoreUser', 'dataStorePassword', 'dataStoreTestQuery', 'dataStoreLogFile', 'dataStoreInitConns', 'dataStoreMaxConns', 'dataStoreConnUsageLimit', 'dataStoreLogLevel', 'maxUrlLength', 'servlet_id' REFERENCES 'servlet' ('servlet_id'), 'mailHost', 'mailHostOverride', 'log', 'logLocation', 'logMaxSize', 'dataLog', 'dataLogLocation', 'dataLogMaxSize', 'removePageCache', 'removeTemplateCache', 'fileTransferFolder', 'lookInContext', 'adminGroupID', 'betaServer');
INSERT INTO "init-param" VALUES(1,'Philadelphia, PA','ksm@pobox.com','Cofax','/images/cofax.gif','/content/static','org.cofax.WysiwygTemplate','org.cofax.FilesTemplateLoader','templates','','listTemplate.htm','articleTemplate.htm',0,'listTemplate.jsp','articleTemplate.jsp',200,200,60,100,50,15,200,100,10,10,'forSearchEnginesList.htm','forSearchEngines.htm','WEB-INF/robots.db',1,'org.cofax.SqlDataStore','org.cofax.SqlRedirection','cofax','com.microsoft.jdbc.sqlserver.SQLServerDriver','jdbc:microsoft:sqlserver://LOCALHOST:1433;DatabaseName=goon','sa','dataStoreTestQuery','SET NOCOUNT ON;select test=''test'';','/usr/local/tomcat/logs/datastore.log',10,100,100,'debug',500,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "init-param" VALUES(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'mail1','mail2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "init-param" VALUES(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'toolstemplates/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,1,'/usr/local/tomcat/logs/CofaxTools.log','',1,'/usr/local/tomcat/logs/dataLog.log','','/content/admin/remove?cache=pages&id=','/content/admin/remove?cache=templates&id=','/usr/local/tomcat/webapps/content/fileTransferFolder',1,4,1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('undefined',1);
INSERT INTO "sqlite_sequence" VALUES('web-app',1);
INSERT INTO "sqlite_sequence" VALUES('servlet',5);
INSERT INTO "sqlite_sequence" VALUES('servlet-mapping',1);
INSERT INTO "sqlite_sequence" VALUES('taglib',1);
INSERT INTO "sqlite_sequence" VALUES('init-param',3);
COMMIT;
