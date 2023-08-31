-- Consultas hier�rquicas
SELECT [LEVEL], coluna, expressao
  FROM tabela 
[WHERE condicao] 
[START WITH condicao] -- a partir de que condicao
[CONNECT BY PRIOR condicao]; -- de cima pra baixo ou de baixo pra cima

-- Consulta hier�rquica na tabela EMPLOYEES UP to DOWN
SELECT LEVEL,
       e.employee_id,
       e.first_name,
       e.last_name,
       e.job_id,
       e.manager_id
  FROM employees e
 START WITH e.manager_id IS NULL -- vai come�ar quando o id do gerente for null
CONNECT BY PRIOR e.employee_id = e.manager_id;

-- Consulta hier�rquica na tabela EMPLOYEES BOTTOM to DOWN
SELECT LEVEL,
       e.employee_id,
       e.first_name,
       e.last_name,
       e.job_id,
       e.manager_id
  FROM employees e
 START WITH e.manager_id IS NULL -- vai come�ar quando o id do gerente for null
CONNECT BY e.employee_id = PRIOR e.manager_id;

-- Formatando sa�da da estrutura em �rvore
SELECT LEVEL, LPAD(e.last_name, LENGTH(e.last_name) + (LEVEL * 4) - 4, ' ')
  FROM employees e
 START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id;

-- Suprimindo branchs (galhos) da nossa �rvore
SELECT LEVEL,
       e.employee_id,
       e.first_name,
       e.last_name,
       e.job_id,
       e.manager_id
  FROM employees e
 START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id
       AND e.employee_id <> 108;
			 
-- Ordena��o do LEVEL
SELECT LEVEL,
       e.employee_id,
       e.first_name,
       e.last_name,
       e.job_id,
       e.manager_id
  FROM employees e
 START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id
 ORDER SIBLINGS BY e.last_name;
