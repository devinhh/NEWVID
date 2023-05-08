**free 

Ctl-Opt nomain;

dcl-ds employee_t extname('EMPLOYEE') qualified template;
end-ds;

dcl-proc getEmployee export;
  dcl-pi *n likeds(employee_t);
    employeeNumber char(6) const;
  end-pi;

  dcl-ds employee likeds(employee_t);

  exec sql  
     select firstnme, lastname, job
     into :employee.FIRSTNME, :employee.LASTNAME, :employee.JOB
     from employee
     where empno = :employeeNumber;   

  return employee;
end-proc;  

dcl-proc getEmpName export;
  dcl-pi *n char(40);
    employeeNumber char(6) const;
  end-pi;

  dcl-ds employee likeds(employee_t);

  exec sql  
     select firstnme
     into :employee.FIRSTNME
     from employee
     where empno = :employeeNumber;   
  return employee.FIRSTNME;
end-proc;    