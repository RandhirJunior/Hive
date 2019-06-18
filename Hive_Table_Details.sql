--All Hive keywords are case-insensitive, including the names of Hive operators and functions.
--For more details ,Please refer to https://cwiki.apache.org/confluence/display/Hive/Tutorial
-- Hive On Spark https://cwiki.apache.org/confluence/display/Hive/Hive+on+Spark%3A+Getting+Started

--From the user's perspective, the typical HDFS/Hive/Spark set up looks something like this: ... So, instead of using MapReduce as the execution engine, you can use Apache Spark. Same SQL interface, same raw data on HDFS, but use Spark instead of Hive MapReduce to do the computation / query execution.

--Creating Tables

CREATE TABLE page_view(viewTime INT, userid BIGINT,
                page_url STRING, referrer_url STRING,
                ip STRING COMMENT 'IP Address of the User')
COMMENT 'This is the page view table'
PARTITIONED BY(dt STRING, country STRING)
STORED AS SEQUENCEFILE;

--Browsing Tables and Partitions
----------------------------------------------------------------------------------------------------
SHOW TABLES;
---To list existing tables in the warehouse; there are many of these, likely more than you want to browse.

SHOW TABLES 'page.*';
---To list tables with prefix 'page'. The pattern follows Java regular expression syntax (so the period is a wildcard).

SHOW PARTITIONS page_view;
--To list partitions of a table. If the table is not a partitioned table then an error is thrown.

DESCRIBE page_view;
--To list columns and column types of table.

DESCRIBE EXTENDED page_view;
--To list columns and all other properties of table. This prints lot of information and that too not in a pretty format. Usually used for debugging.

DESCRIBE EXTENDED page_view PARTITION (ds='2008-08-08');
--To list columns and all other properties of a partition. This also prints lot of information which is usually used for debugging.

--Order, Sort, Cluster, and Distribute By
------------------------------------------------------------------------------------------------------------
/*
ORDER BY
--------

There are some limitations in the "order by" clause. In the strict mode (i.e., hive.mapred.mode=strict), 
the order by clause has to be followed by a "limit" clause. 
The limit clause is not necessary if you set hive.mapred.mode to nonstrict. 
The reason is that in order to impose total order of all results, 
there has to be one reducer to sort the final output.
If the number of rows in the output is too large, the single reducer could take a very long time to finish.

SORT BY
--------

Hive uses the columns in SORT BY to sort the rows before feeding the rows to a reducer.
The sort order will be dependent on the column types. 
If the column is of numeric type, then the sort order is also in numeric order. 
If the column is of string type, then the sort order will be lexicographical order.

In Hive 3.0.0 and later, sort by without limit in subqueries and views will be removed by the optimizer. 
To disable it, set hive.remove.orderby.in.subquery to false.

Difference between Sort By and Order By
----------------------------------------
Hive supports SORT BY which sorts the data per reducer. The difference between "order by" and "sort by" is that the former guarantees total order in the output while the latter only guarantees ordering of the rows within a reducer. If there are more than one reducer, "sort by" may give partially ordered final results.
Note: It may be confusing as to the difference between SORT BY alone of a single column and CLUSTER BY. The difference is that CLUSTER BY partitions by the field and SORT BY if there are multiple reducers partitions randomly in order to distribute data (and load) uniformly across the reducers.
Basically, the data in each reducer will be sorted according to the order that the user specified.




*/

