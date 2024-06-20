program ProgressBar;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  System.Threading,
  Console.ProgressBar in 'src\Console.ProgressBar.pas';

var
  Input: String;
  Task1, Task2, Task3, Task4, Task5, Task6: ITask;
  i, Total1, Total2, Total3, Total4, Total5, Total6: Integer;

begin
  while True do
  begin
    Write('Ready to start tasks? (Y)');
    ReadLn(Input);

    if Input = 'Y' then
    begin
      WriteLn;
      Total1 := 400;
      Task1 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total1 do
        begin
          ConsoleProgressBar(i, Total1, 2);
          Sleep(11);
        end;
      end);

      Total2 := 250;
      Task2 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total2 do
        begin
          ConsoleProgressBar(i, Total2, 3);
          Sleep(5);
        end;
      end);

      Total3 := 300;
      Task3 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total3 do
        begin
          ConsoleProgressBar(i, Total3, 4);
          Sleep(7);
        end;
      end);

      Total4 := 300;
      Task4 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total4 do
        begin
          ConsoleProgressBar(i, Total4, 5);
          Sleep(2);
        end;
      end);

      Total5 := 300;
      Task5 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total5 do
        begin
          ConsoleProgressBar(i, Total5, 6);
          Sleep(4);
        end;
      end);

      Total6 := 300;
      Task6 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total6 do
        begin
          ConsoleProgressBar(i, Total6, 7);
          Sleep(13);
        end;
      end);

      Task1.Start;
      Task2.Start;
      Task3.Start;
      Task4.Start;
      Task5.Start;
      Task6.Start;
      Task1.Wait;
      Task2.Wait;
      Task3.Wait;
      Task4.Wait;
      Task5.Wait;
      Task6.Wait;

      ConsolePosition(8);
      ReadLn;
    end;
  end;
end.
