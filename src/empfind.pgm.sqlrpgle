**FREE
Ctl-Opt Main(EMPFIND) dftactgrp(*no) bnddir('MYAPP');

dcl-ds employee_t extname('EMPLOYEE') qualified template;
end-ds;

dcl-pr getEmployee likeds(employee_t) extproc('GETEMPLOYEE');
  employeeNumber char(6) const;
end-pr;

dcl-pr getEmpName char(40) extproc('GETEMPNAME');
  employeeNumber char(6) const;
end-pr;

Dcl-Proc EMPFIND;
  Dcl-Pi *N;
    employeeNumber char(6);
  End-Pi;

  dcl-ds employee likeds(employee_t);
  dcl-s empName char(40);

  employee = getEmployee(employeeNumber);

  dsply employee.firstnme;

  empName = getEmpName(employeeNumber);

  dsply empName;

End-Proc;