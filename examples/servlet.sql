CREATE TABLE 'undefined' ('undefined_id' INTEGER PRIMARY KEY AUTOINCREMENT);
INSERT INTO undefined DEFAULT VALUES;
CREATE TABLE 'web-app' ('web-app_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'web-app' ADD COLUMN 'undefined_id' REFERENCES 'undefined' ('undefined_id');
INSERT INTO 'web-app' ('undefined_id') VALUES (1);
CREATE TABLE 'servlet' ('servlet_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'servlet' ADD COLUMN 'servlet-name';
ALTER TABLE 'servlet' ADD COLUMN 'servlet-class';
ALTER TABLE 'servlet' ADD COLUMN 'web-app_id' REFERENCES 'web-app' ('web-app_id');
INSERT INTO 'servlet' ('servlet-name','servlet-class','web-app_id') VALUES ('cofaxCDS','org.cofax.cds.CDSServlet',1);
INSERT INTO 'servlet' ('servlet-name','servlet-class','web-app_id') VALUES ('cofaxEmail','org.cofax.cds.EmailServlet',1);
INSERT INTO 'servlet' ('servlet-name','servlet-class','web-app_id') VALUES ('cofaxAdmin','org.cofax.cds.AdminServlet',1);
INSERT INTO 'servlet' ('servlet-name','servlet-class','web-app_id') VALUES ('fileServlet','org.cofax.cds.FileServlet',1);
INSERT INTO 'servlet' ('servlet-name','servlet-class','web-app_id') VALUES ('cofaxTools','org.cofax.cms.CofaxToolsServlet',1);
CREATE TABLE 'servlet-mapping' ('servlet-mapping_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'servlet-mapping' ADD COLUMN 'cofaxCDS';
ALTER TABLE 'servlet-mapping' ADD COLUMN 'cofaxEmail';
ALTER TABLE 'servlet-mapping' ADD COLUMN 'cofaxAdmin';
ALTER TABLE 'servlet-mapping' ADD COLUMN 'fileServlet';
ALTER TABLE 'servlet-mapping' ADD COLUMN 'cofaxTools';
ALTER TABLE 'servlet-mapping' ADD COLUMN 'web-app_id' REFERENCES 'web-app' ('web-app_id');
INSERT INTO 'servlet-mapping' ('cofaxCDS','cofaxEmail','cofaxAdmin','fileServlet','cofaxTools','web-app_id') VALUES ('/','/cofaxutil/aemail/*','/admin/*','/static/*','/tools/*',1);
CREATE TABLE 'taglib' ('taglib_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'taglib' ADD COLUMN 'taglib-uri';
ALTER TABLE 'taglib' ADD COLUMN 'taglib-location';
ALTER TABLE 'taglib' ADD COLUMN 'web-app_id' REFERENCES 'web-app' ('web-app_id');
INSERT INTO 'taglib' ('taglib-uri','taglib-location','web-app_id') VALUES ('cofax.tld','/WEB-INF/tlds/cofax.tld',1);
CREATE TABLE 'init-param' ('init-param_id' INTEGER PRIMARY KEY AUTOINCREMENT);
ALTER TABLE 'init-param' ADD COLUMN 'configGlossary:installationAt';
ALTER TABLE 'init-param' ADD COLUMN 'configGlossary:adminEmail';
ALTER TABLE 'init-param' ADD COLUMN 'configGlossary:poweredBy';
ALTER TABLE 'init-param' ADD COLUMN 'configGlossary:poweredByIcon';
ALTER TABLE 'init-param' ADD COLUMN 'configGlossary:staticPath';
ALTER TABLE 'init-param' ADD COLUMN 'templateProcessorClass';
ALTER TABLE 'init-param' ADD COLUMN 'templateLoaderClass';
ALTER TABLE 'init-param' ADD COLUMN 'templatePath';
ALTER TABLE 'init-param' ADD COLUMN 'templateOverridePath';
ALTER TABLE 'init-param' ADD COLUMN 'defaultListTemplate';
ALTER TABLE 'init-param' ADD COLUMN 'defaultFileTemplate';
ALTER TABLE 'init-param' ADD COLUMN 'useJSP';
ALTER TABLE 'init-param' ADD COLUMN 'jspListTemplate';
ALTER TABLE 'init-param' ADD COLUMN 'jspFileTemplate';
ALTER TABLE 'init-param' ADD COLUMN 'cachePackageTagsTrack';
ALTER TABLE 'init-param' ADD COLUMN 'cachePackageTagsStore';
ALTER TABLE 'init-param' ADD COLUMN 'cachePackageTagsRefresh';
ALTER TABLE 'init-param' ADD COLUMN 'cacheTemplatesTrack';
ALTER TABLE 'init-param' ADD COLUMN 'cacheTemplatesStore';
ALTER TABLE 'init-param' ADD COLUMN 'cacheTemplatesRefresh';
ALTER TABLE 'init-param' ADD COLUMN 'cachePagesTrack';
ALTER TABLE 'init-param' ADD COLUMN 'cachePagesStore';
ALTER TABLE 'init-param' ADD COLUMN 'cachePagesRefresh';
ALTER TABLE 'init-param' ADD COLUMN 'cachePagesDirtyRead';
ALTER TABLE 'init-param' ADD COLUMN 'searchEngineListTemplate';
ALTER TABLE 'init-param' ADD COLUMN 'searchEngineFileTemplate';
ALTER TABLE 'init-param' ADD COLUMN 'searchEngineRobotsDb';
ALTER TABLE 'init-param' ADD COLUMN 'useDataStore';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreClass';
ALTER TABLE 'init-param' ADD COLUMN 'redirectionClass';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreName';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreDriver';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreUrl';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreUser';
ALTER TABLE 'init-param' ADD COLUMN 'dataStorePassword';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreTestQuery';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreLogFile';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreInitConns';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreMaxConns';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreConnUsageLimit';
ALTER TABLE 'init-param' ADD COLUMN 'dataStoreLogLevel';
ALTER TABLE 'init-param' ADD COLUMN 'maxUrlLength';
ALTER TABLE 'init-param' ADD COLUMN 'servlet_id' REFERENCES 'servlet' ('servlet_id');
INSERT INTO 'init-param' ('configGlossary:installationAt','configGlossary:adminEmail','configGlossary:poweredBy','configGlossary:poweredByIcon','configGlossary:staticPath','templateProcessorClass','templateLoaderClass','templatePath','templateOverridePath','defaultListTemplate','defaultFileTemplate','useJSP','jspListTemplate','jspFileTemplate','cachePackageTagsTrack','cachePackageTagsStore','cachePackageTagsRefresh','cacheTemplatesTrack','cacheTemplatesStore','cacheTemplatesRefresh','cachePagesTrack','cachePagesStore','cachePagesRefresh','cachePagesDirtyRead','searchEngineListTemplate','searchEngineFileTemplate','searchEngineRobotsDb','useDataStore','dataStoreClass','redirectionClass','dataStoreName','dataStoreDriver','dataStoreUrl','dataStoreUser','dataStorePassword','dataStoreTestQuery','dataStoreLogFile','dataStoreInitConns','dataStoreMaxConns','dataStoreConnUsageLimit','dataStoreLogLevel','maxUrlLength','servlet_id') VALUES ('Philadelphia, PA','ksm@pobox.com','Cofax','/images/cofax.gif','/content/static','org.cofax.WysiwygTemplate','org.cofax.FilesTemplateLoader','templates','','listTemplate.htm','articleTemplate.htm',0,'listTemplate.jsp','articleTemplate.jsp',200,200,60,100,50,15,200,100,10,10,'forSearchEnginesList.htm','forSearchEngines.htm','WEB-INF/robots.db',1,'org.cofax.SqlDataStore','org.cofax.SqlRedirection','cofax','com.microsoft.jdbc.sqlserver.SQLServerDriver','jdbc:microsoft:sqlserver://LOCALHOST:1433;DatabaseName=goon','sa','dataStoreTestQuery','SET NOCOUNT ON;select test=''test'';','/usr/local/tomcat/logs/datastore.log',10,100,100,'debug',500,1);
ALTER TABLE 'init-param' ADD COLUMN 'mailHost';
ALTER TABLE 'init-param' ADD COLUMN 'mailHostOverride';
INSERT INTO 'init-param' ('mailHost','mailHostOverride','servlet_id') VALUES ('mail1','mail2',2);
ALTER TABLE 'init-param' ADD COLUMN 'log';
ALTER TABLE 'init-param' ADD COLUMN 'logLocation';
ALTER TABLE 'init-param' ADD COLUMN 'logMaxSize';
ALTER TABLE 'init-param' ADD COLUMN 'dataLog';
ALTER TABLE 'init-param' ADD COLUMN 'dataLogLocation';
ALTER TABLE 'init-param' ADD COLUMN 'dataLogMaxSize';
ALTER TABLE 'init-param' ADD COLUMN 'removePageCache';
ALTER TABLE 'init-param' ADD COLUMN 'removeTemplateCache';
ALTER TABLE 'init-param' ADD COLUMN 'fileTransferFolder';
ALTER TABLE 'init-param' ADD COLUMN 'lookInContext';
ALTER TABLE 'init-param' ADD COLUMN 'adminGroupID';
ALTER TABLE 'init-param' ADD COLUMN 'betaServer';
INSERT INTO 'init-param' ('templatePath','log','logLocation','logMaxSize','dataLog','dataLogLocation','dataLogMaxSize','removePageCache','removeTemplateCache','fileTransferFolder','lookInContext','adminGroupID','betaServer','servlet_id') VALUES ('toolstemplates/',1,'/usr/local/tomcat/logs/CofaxTools.log','',1,'/usr/local/tomcat/logs/dataLog.log','','/content/admin/remove?cache=pages&id=','/content/admin/remove?cache=templates&id=','/usr/local/tomcat/webapps/content/fileTransferFolder',1,4,1,5);

