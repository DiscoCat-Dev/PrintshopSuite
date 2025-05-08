Program PageCounter(input, output);
{$mode objFPC}

Uses sysutils;

Const 
  pagesPerSheet = 4;

Var 
  endPage, startPage: word;
  totalPages, sheets: real;
  blankPages: word;

Function remainingBlankPages(startPg, endPg: word): word;
Var 
  modPages: word;
Begin
  modPages := (endPg - startPg + 1) mod pagesPerSheet;
  remainingBlankPages := (pagesPerSheet - modPages) mod pagesPerSheet;
End;

Begin
  writeln;

  write('Enter the number of an end page: ');
  Try
    readln(endPage);
  Except
    on E: Exception do
    begin
      writeln('ERROR: ', E.Message, ' (non-natural number). Re-run the program.');
      exit;
    end;
  end;

  if endPage = 0 then
  begin
    writeln('ERROR: Naturally, a page cannot have number 0.');
    writeln('Re-run the program and enter a more natural number.');
    exit;
  end;

  write('Enter the number of a start page: ');
  Try
    readln(startPage);
  Except
    on E: Exception do
    begin
      writeln('ERROR: ', E.Message, ' (non-natural number). Re-run the program.');
      exit;
    end;
  end;

  if startPage = 0 then
  begin
    writeln('ERROR: Naturally, a page cannot have number 0.');
    writeln('Re-run the program and enter a more natural number.');
    exit;
  end;

  if endPage < startPage then
  begin
    writeln;
    writeln('ERROR: The end page cannot be less than the start page.');
    writeln('Re-run the program and enter the correct number!');
    exit;
  end;

  totalPages := endPage - startPage + 1;
  blankPages := remainingBlankPages(startPage, endPage);
  sheets := totalPages / pagesPerSheet;

  writeln;

  if blankPages > 0 then
    writeln(blankPages, ' page(s) will be blank.')
  else
    writeln('No pages will be blank!');

  writeln;

  if sheets > trunc(sheets) then
    writeln('(Total number of sheets: ', trunc(sheets) + 1, ')')
  else
    writeln('(Total number of sheets: ', trunc(sheets), ')');

End.

