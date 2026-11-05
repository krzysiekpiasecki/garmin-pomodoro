# garmin-pomodoro
Garmin smartwatch Pomodoro timer supporting work intervals, short breaks, and long breaks.

## Wymagania
Connect IQ SDK + rozszerzenie VS Code 'Monkey C', klucz deweloperski.

## Uruchomienie
'Monkey C: Build Current Project' / 'Run Without Debugging' (symulator).

## Sterowanie
START/STOP - start/pauza; dlugie UP (menu) - reset.

## Struktura
- manifest.xml - id, urzadzenia, uprawnienia
- source/PomodoroModel.mc - logika timera i faz (25/5, 15 co 4 sesje)
- source/PomodoroView.mc, PomodoroDelegate.mc - UI i wejscie
