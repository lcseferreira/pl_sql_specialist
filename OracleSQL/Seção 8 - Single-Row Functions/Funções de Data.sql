-- Fun��es para o tipo DATE
-- O format default de data � definido pelo DBA
SELECT SYSDATE FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD/MM/YY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL;

-- Quando realizamos opera��es do com datas, estamos trabalhando com dias
SELECT SYSDATE + 30 FROM DUAL;

-- MONTHS_BETWEEN: retorna o n�mero de meses entre duas datas
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('31-12-1997', 'DD-MM-YYYY'))) NASCIMENTO_AT�_HOJE
  FROM DUAL;

-- ADD_MONTHS: adiciona meses em uma data
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;

-- NEXT_DAY: pr�ximo dia em rela��o ao argunmento passado
SELECT NEXT_DAY(SYSDATE, 'SEXTA-FEIRA') FROM DUAL;

-- LAST_DAY: �ltimo dia do m�s
SELECT LAST_DAY(SYSDATE) FROM DUAL;
