-- CREATE VIEW LIVR1 AS 
-- SELECT *
-- FROM FPJ
-- WHERE NOMJ='J1' ;
-- CREATE VIEW LIVR2 AS 
-- SELECT NP , NF , NJ , DPAY=DLIV + 3
-- FROM FPJ ;
-- CREATE VIEW LIVR3 AS 
-- SELECT * 
-- FROM FPJ , F , J , P 
-- WHERE VILLEJ=VILLEF and VILLEF=VILLEP 
-- And FPJ.NF=F.NF and FPJ.NJ=J.NJ and FPJ.NP=P.NP ;
-- CREATE SEQUENCE SEQ_F 
-- MINVALUE 100 MAXVALUE 9000
-- START WITH 1000 CYCLE ;
-- INSERT INTO F 
-- VALUES(SEQ_F.NEXTVAL || TO_CHAR(SYSDATE,'YY') , 'CLIMBAX' , 'ROME' ) ;
-- CREATE INDEX F_VILLEF ON F(VILLEF) ; 
-- CREATE VIEW V_MOY_ELT AS
-- SELECT NCE ,CODE ,((note_cc1 + note_cc2 + note_cc3) - least(note_cc1,note_cc2,note_cc3))/2 AS MOY_ELT
-- FROM EVALUATION EV , ELEMENT ELEMENT
-- where EV 
---exercice 2
-- ACCEPT s_n1 PROMPT'saisir le premier entier';
-- ACCEPT s_n2 PROMPT'saisir le deuxieme entier';
-- DECLARE
-- v_n1 NUMBER ;
-- v_n2 NUMBER ;
-- v_n3 NUMBER ;
-- BEGIN
-- v_n1:=&s_n1 ;
-- v_n2:=&s_n2 ;
-- v_n3=v_n1+v_n2 ;
-- DBMS_OUTPUT.PUT_LINE('les entiers sont' || v_n3 ) ;
---exercice 3
-- variable g_s varchar2(50) 
-- variable g_n number 
-- BEGIN
-- v_s VARCHAR2(50) := '42 est la réponse' ;
-- v_n NUMBER := SUBSTR(v_s,1,2) ;
-- :g_s := v_s ;
-- :g_n := v_n ;
-- END ;
-- /
-- PRINT g_s ;
-- PRINT g_n ;
---exercice 4 
-- ACCEPT s_sal PROMPT'donner le salaire ' ;
-- ACCEPT s_com PROMPT'donner la commission' ;
-- DECLARE
-- v_sal_ann
-- BEGIN
-- v_sal_ann:= (&s_sal + nvl(&s_com ,0))*12 ;
-- DBMS_OUTPUT.PUT_LINE('le salaire annuel est' || v_sal_ann);
-- END ;
-- /
-- ACCEPT s_code PROMPT 'donner le code ' ;
-- DECLARE
-- v_code NUMBER ;
-- BEGIN
-- IF( v_code=&s_code)
-- CREATE SEQUENCE  DEPT_ID_SEQ
-- MAXVALUE 10 MAXVALUE 90 START WITH 50 INCREMENT BY 10 ;
-- ACCEPT s_dname PROMPT'donner le nom de département' ;
-- BEGIN
-- INSERT INTO DEPT 
-- VALUES(DEPT_ID_SEQ.NEXTVAL || '&s_dname' ||NULL) ;
-- END ;
-- /
-- ACCEPT s_deptno PROMPT ' saisir le numero de département' ;
-- BEGIN
-- DELETE FROM DEPT
-- where deptno = &s_deptno ;
-- END ;
-- /
-- ACCEPT s_car PROMPT 'saisir un caractère' ;
-- SET SERVEROUTPUT ON 
-- BEGIN
-- DELETE FROM EMP
-- WHERE ENAME LIKE '&s_car%' ;
-- DBMS_OUTPUT.PUT_LINE(' le nombre effacé est ' || SQL%ROWCOUNT )
-- COMMIT ;
-- END; 
-- /
-- ACCEPT s_empno PROMPT 'donner le code de l employe'
-- DECLARE
-- v_sal , v_comm NUMBER ;
-- BEGIN
-- UPDATE EMP
-- CASE v_sal
-- WHEN <1000
-- THEN SET v_comm = v_sal*0.1
-- when >= 1000 AND <1500
-- THEN SET v_comm = v_sal*0.15
-- ELSE
-- SET v_comm = v_sal*0.2
-- where empno = &s_empno ;
-- END ;
-- /
ACCEPT s_nb PROMPT 'donner le nombre des employes' 
DECLARE 
emp_cursor is select emp,ename,sal
from emp
order by sal desc ;
emp_record emp_cursor%ROWTYPE ;
i NUMBER :=0;
BEGIN
open emp_cursor
while i < &s_nb
loop
fetch emp_cursor into emp_record ;
update emp
values(emp_record.empno || emp_record.ename || emp_record.sal) ;
i=i+1 ;
end loop ;
close emp_cursor ;
end emp_cursor ;
end ;
/