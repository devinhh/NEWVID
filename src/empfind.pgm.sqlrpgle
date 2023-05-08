**FREE
Ctl-Opt Main(EMPFIND);

dcl-ds employee_t extname('EMPLOYEE') qualified template;
end-ds;

Dcl-Proc EMPFIND;
   Dcl-Pi *N;
      employeeNumber char(6);
   End-Pi;

   dcl-ds employee likeds(employee_t);

   exec sql  
   select firstnme, lastname, job
   into :employee.FIRSTNME, :employee.LASTNAME, :employee.JOB
   from employee
   where empno = :employeeNumber;

   if (sqlstate = '00000');
      dsply 'We have data';
   else;
      dsply 'No data found!';
   endif;
End-Proc;