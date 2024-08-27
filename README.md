## ⌛ Stacked Progress Bars 

Simplified implementation of stacked progress bars for a console application.
![alt text](assets/animation.gif)

``` pascal
uses Console.ProgressBar;

Line := 1; 
Total := 1000; 
for i := 0 to Total do
    ConsoleProgressBar(i, Total, Line);
```

### Basic stacked bars
You can use stacked bars as long as you place them at different lines.
``` pascal
uses Console.ProgressBar;

for i := 1 to 1000 do
    ConsoleProgressBar(i, 1000, 1); // runs at line 1
    
for i := 1 to 2000 do
    ConsoleProgressBar(i, 2000, 2); // runs at line 2

```
### Advanced options

``` pascal
 ConsoleProgressBar(
    i,     
    Total, 
    2,          
    'Sign',     // label
    '☢',       // emoji
    False,      // progress indicator
    92,         // foreground bar color
    50,         // background bar color
    59          // customized dynamic size
    '='         // custom bar char
);
```
### Bar length and char customization:

``` pascal
  ConsoleBarWidth := 50;
  ConsoleBarChar := '#';
```

### Foreground and backgroud colors
Foreground and background colors can follow the index from 0 to 255 as shown in this table. 

![alt text](assets/color-codes.png)
_Source: https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797_

### Summary
This project is aimed on education purposes. It will not work if the console does not support utf-8 or advanced ascii escape sequences. There are other issues which haven't been addressed (yet), so it might also not properly work under all scenarios of a console app. If you like to play with advanced settings I suggest you to read [this](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797) repository.


