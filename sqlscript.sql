CREATE TABLE  "DEVICES_LINKS" 
    ("DEVICE_TYPE" CHAR(10), 
     "STATS_ACCESS_LINK" CHAR(100));
     
INSERT INTO DEVICES_LINKS VALUES ('AXO145', '<url>https://xcd32112.smart_meter.com</url>');
INSERT INTO DEVICES_LINKS VALUES ('TRU151', '<url>http://tXh67.dia_meter.com</url>');
INSERT INTO DEVICES_LINKS VALUES ('ZOD231', '<url>http://yT5495.smart_meter.com</url>');
INSERT INTO DEVICES_LINKS VALUES ('YRT326', '<url>https://ret323_TRu.crown.com</url>');
INSERT INTO DEVICES_LINKS VALUES ('LWR245', '<url>https://luwr3243.celcius.com</url>');

-- We must get rid of the first ('<url>https://' or '<url>http://') and the last ('</url>') parts of the string
-- In order to do that, we must identify the unique substrings that are among the "to be removed" parts
-- In this case, the unique substrings of the first and the last part are respectively "//" and "</"
-- After that, we must determine the unique substrings' indexes using the INSTR function and slash the string based on found indexes using the SUBSTR function
-- Below query returns all device types and their corresponding pure links
-- It retrieves pure links by starting to read the link from its index no that is right after the occurrence of "//"
-- (cont.) and it reads through the end of the pure link's length, which is retrieved by the subtraction of the index no of "//" from the index no of "</"
select DEVICE_TYPE,
SUBSTR(STATS_ACCESS_LINK, INSTR(STATS_ACCESS_LINK, '//') + 2, INSTR(STATS_ACCESS_LINK, '</') - INSTR(STATS_ACCESS_LINK, '//') - 2) as PURE_LINK
from DEVICES_LINKS