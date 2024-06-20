unit Console.ProgressBar;

interface

procedure ConsoleProgressBar(CurrentValue, Total, Line: Integer);
procedure ConsolePosition(Line: Integer);

var
  ConsoleBarWidth: Integer;
  ConsoleBarChar: String;
  ConsoleLock: TObject;

implementation

uses
  System.SysUtils, Winapi.Windows;

procedure GotoXY(X, Y: Integer);
var
  Handle: THandle;
  Coord: TCoord;
begin
  Handle := GetStdHandle(STD_OUTPUT_HANDLE);
  Coord.X := X - 1;
  Coord.Y := Y - 1;
  SetConsoleCursorPosition(Handle, Coord);
end;

procedure ConsoleProgressBar(CurrentValue, Total, Line: Integer);
var
  Tick, ProgressedTicks: Integer;
  Percentage: Double;
begin
  Percentage := CurrentValue / Total;
  ProgressedTicks := Round(Percentage * ConsoleBarWidth);
  TMonitor.Enter(ConsoleLock);
  try
    GotoXY(1, Line);
    Write(Format('(%s/%d): [', [FormatFloat('0##', CurrentValue), Total]));
    for Tick := 1 to ConsoleBarWidth do
      if Tick <= ProgressedTicks then
        Write(ConsoleBarChar)
      else
        Write(' ');
    Write(Format('] %.2f%%', [Percentage * 100]));
  finally
    TMonitor.Exit(ConsoleLock);
  end;
end;

procedure ConsolePosition(Line: Integer);
begin
  TMonitor.Enter(ConsoleLock);
  try
    GoToXY(1, Line);
    WriteLn;
  finally
    TMonitor.Exit(ConsoleLock);
  end;
end;

initialization
  ConsoleBarWidth := 50;
  ConsoleBarChar := '#';
  ConsoleLock := TObject.Create;

finalization
  ConsoleLock.Free;

end.
