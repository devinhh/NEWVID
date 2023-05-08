**FREE
Ctl-Opt Main(EMPFIND) dftactgrp(*no) bnddir('MYAPP');

/copy 'headers/emp.rpgleinc'

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