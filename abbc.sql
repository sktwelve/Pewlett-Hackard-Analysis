-- Drop table if exists
DROP TABLE wordassociation;

-- Create table and view column datatypes
CREATE TABLE wordassociation (
	author INT,
	word1 VARCHAR,
	word2 VARCHAR,
	source VARCHAR
);

SELECT *
FROM wordassociation;

select * 
from wordassociation
where word1 = 'stone';

select *
from wordassociation
where author > 0
and author < 10;

select *
from wordassociation
where word1 = 'pie'
or word2 = 'pie';
