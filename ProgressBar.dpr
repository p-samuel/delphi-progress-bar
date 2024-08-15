program ProgressBar;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  System.Threading,
  Winapi.Windows,
  Console.ProgressBar in 'src\Console.ProgressBar.pas';

var
  Input: String;
  Task1, Task2, Task3, Task4, Task5, Task6, Task7, Task8, Task9, Task10: ITask;
  i, Total1, Total2, Total3, Total4, Total5, Total6, Total7, Total8, Total9, Total10: Integer;

begin
  while True do
  begin

    SetConsoleOutputCP(CP_UTF8);
    Write('Ready to start tasks? (Y)');
    ReadLn(Input);

    if Input = 'Y' then
    begin

      HideConsoleCursor;
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
          ConsoleProgressBar(i, Total2, 3, 'With title', '', True, 0, 0, 39);
          Sleep(5);
        end;
      end);

      Total3 := 300;
      Task3 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total3 do
        begin
          ConsoleProgressBar(i, Total3, 4, 'Title & Emoji', '☢ ', True, 0, 0, 34);
          Sleep(7);
        end;
      end);

      Total4 := 300;
      Task4 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total4 do
        begin
          ConsoleProgressBar(i, Total4, 5, 'Without progress indicator', '🧱', False, 0, 0, 30);
          Sleep(2);
        end;
      end);

      Total5 := 300;
      Task5 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total5 do
        begin
          ConsoleProgressBar(i, Total5, 6, 'Custom bar color', '🎨', True, 213, 0, 31);
          Sleep(4);
        end;
      end);

      Total6 := 300;
      Task6 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total6 do
        begin
          ConsoleProgressBar(i, Total6, 7, 'Foreground & background color', '🎨', True, 180, 180, 18);
          Sleep(13);
        end;
      end);

      Total7 := 300;
      Task7 := TTask.Create(procedure
      var i: Integer;
      begin
        for i := 1 to Total7 do
        begin
          ConsoleProgressBar(i, Total7, 8, 'Custom char', '🛴', True, 79, 79, 36, '🗝');
          Sleep(6);
        end;
      end);

      Task1.Start;
      Task2.Start;
      Task3.Start;
      Task4.Start;
      Task5.Start;
      Task6.Start;
      Task7.Start;
      Task1.Wait;
      Task2.Wait;
      Task3.Wait;
      Task4.Wait;
      Task5.Wait;
      Task6.Wait;
      Task7.Wait;
      ShowConsoleCursor;

      ConsolePosition(9);
      ReadLn;
    end;
  end;
end.
