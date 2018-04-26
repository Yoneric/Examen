CREATE TABLESPACE mid_term
DATAFILE 'C:\PARCIALDB\PARCIALDATAFILE.dat' SIZE 20M
ONLINE;

CREATE PROFILE exam LIMIT
SESSIONS_PER_USER 1
FAILED_LOGIN_ATTEMPTS 3
IDLE_TIME 5

CREATE USER ejercicios
IDENTIFIED BY 123
DEFAULT TABLESPACE mid_term
QUOTA UNLIMITED ON mid_term
PROFILE exam


CREATE OR REPLACE FUNCTION function_1(a IN NUMBER, b IN NUMBER, c IN NUMBER)
RETURN varchar IS
  
BEGIN
  IF b >= c THEN
    RETURN CONCAT(CONCAT(CONCAT(a,'/'),(a*b)),'/andres');
  ELSE
    RETURN CONCAT(CONCAT(CONCAT(a,'/'),(a*b)),'/martinez');
  END IF;  
END;


SELECT function_1(1,2,3) FROM DUAL


CREATE OR REPLACE FUNCTION function_2(n IN NUMBER)
RETURN number IS
  first number:=1;
  second number:=2;
  third number;
  i number;
  fib number;
BEGIN
  dbms_output.put_line('Fibonacci series is:');
  dbms_output.put_line(first);
  dbms_output.put_line(second-1);
  
  FOR i IN 2..n LOOP
    third:=first+(second+2);
    first:=second;
    second:=third;
    dbms_output.put_line(third);
    fib := third;
  END LOOP;  
  RETURN fib;
END;

BEGIN
  dbms_output.put_line(function_2(6));
END;

