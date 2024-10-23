ALTER database template1 is_template=false;

DROP database template1;

CREATE DATABASE template1
WITH OWNER = postgres
   ENCODING = 'UTF8'
   TABLESPACE = pg_default
   LC_COLLATE = 'ru_RU.UTF-8'
   LC_CTYPE = 'ru_RU.UTF-8'
   CONNECTION LIMIT = -1
   TEMPLATE template0;

ALTER database template1 is_template=true;