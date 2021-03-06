
select column_name, column_id from user_tab_columns where table_name = 'LVXX_ARTICOLO';

spool c:\temp\RevViews.sql

set heading off verify off feedback off arraysize 1 long 1000000 termout off
set pages 0 lines 78 trims on
column vtext format a78 wrap
column AA NOPRINT
column BB NOPRINT
column CC NOPRINT
select 'PROMPT *** Vista: '||upper(v.view_name)||chr(10)||chr(10)||'CREATE OR REPLACE VIEW '||upper(v.view_name)||CHR(10)||'('||column_name||') AS ',text,';'  vtext,
	object_name   AA,
	d.dlevel      BB,
	o.object_type CC
from   	sys.dba_objects o,
	sys.order_object_by_dependency d,
	all_views v,
        all_tab_columns ac
where  	o.object_id    = d.object_id(+)
and  	o.object_type  = 'VIEW'
and 	o.owner = upper('CQ')
and 	o.owner = v.owner
and 	o.owner = ac.owner
and 	v.view_name = o.object_name
and 	v.view_name = ac.table_name
order  by d.dlevel desc, o.object_type
/

spool off
set termout on feedback on verify on heading on

 
 
 
