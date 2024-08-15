unit Console.ProgressBar;

interface

procedure ConsoleProgressBar(
  CurrentValue, Total, Line: Integer;
  const Title: String = '';
  const Emoji: String = '';
  const BarColor: Integer = 0;
  const BarBackgroundColor: Integer = 0;
  const ShowProgressLabel: Boolean = True;
  const CustomBarWidth:Integer = 0);

procedure ConsolePosition(Line: Integer);
procedure ShowConsoleCursor;
procedure HideConsoleCursor;

var
  ConsoleBarWidth: Integer;
  ConsoleBarChar: String;
  ConsoleLock: TObject;

implementation

uses
  System.SysUtils, Winapi.Windows, System.Math;

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

procedure HideConsoleCursor;
var
  ConsoleHandle: THandle;
  CursorInfo: CONSOLE_CURSOR_INFO;
begin
  ConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  GetConsoleCursorInfo(ConsoleHandle, CursorInfo);
  CursorInfo.bVisible := False;
  SetConsoleCursorInfo(ConsoleHandle, CursorInfo);
end;

procedure ShowConsoleCursor;
var
  ConsoleHandle: THandle;
  CursorInfo: CONSOLE_CURSOR_INFO;
begin
  ConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  GetConsoleCursorInfo(ConsoleHandle, CursorInfo);
  CursorInfo.bVisible := True;
  SetConsoleCursorInfo(ConsoleHandle, CursorInfo);
end;

procedure ConsoleProgressBar(
  CurrentValue, Total, Line: Integer;
  const Title: String = '';
  const Emoji: String = '';
  const BarColor: Integer = 0;
  const BarBackgroundColor: Integer = 0;
  const ShowProgressLabel: Boolean = True;
  const CustomBarWidth:Integer = 0);
var
  Tick, ProgressedTicks: Integer;
  Percentage: Double;
begin
  SetConsoleOutputCP(CP_UTF8);
  Percentage := CurrentValue / Total;
  ProgressedTicks := Round(Percentage * Max(ConsoleBarWidth, CustomBarWidth));
  TMonitor.Enter(ConsoleLock);
  try
    GotoXY(1, Line);

    if Emoji <> '' then
      Write(Format('%s', [Emoji]));

    if Title <> '' then
      Write(Format('%s ', [Title]));

    if ShowProgressLabel then
      Write(Format('(%s/%d)', [FormatFloat('#,00', CurrentValue), Total]));

    Write('[');

    for Tick := 1 to Max(ConsoleBarWidth, CustomBarWidth) do
      if Tick <= ProgressedTicks then
      begin

        if BarColor > 0 then
          Write(#27+Format('[38;5;%dm', [BarColor]));

        if BarBackgroundColor > 0 then
          Write(#27+Format('[48;5;%dm', [BarBackgroundColor]));

        Write(ConsoleBarChar);
        Write(#27'[0m');
      end
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
