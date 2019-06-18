# All Hive keywords are case-insensitive, including the names of Hive operators and functions.
# For more details ,Please refer to https://cwiki.apache.org/confluence/display/Hive/Tutorial

#Creating Tables

CREATE TABLE page_view(viewTime INT, userid BIGINT,
                page_url STRING, referrer_url STRING,
                ip STRING COMMENT 'IP Address of the User')
COMMENT 'This is the page view table'
PARTITIONED BY(dt STRING, country STRING)
STORED AS SEQUENCEFILE;
