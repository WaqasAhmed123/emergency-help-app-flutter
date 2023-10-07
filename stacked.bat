@echo off
rem This file was created by pub v3.0.5.
rem Package: stacked_cli
rem Version: 1.11.1
rem Executable: stacked
rem Script: stacked
if exist "C:\Users\Waqas Ahmed\AppData\Local\Pub\Cache\global_packages\stacked_cli\bin\stacked.dart-3.0.5.snapshot"                                                                                                                                                             (
  call dart "C:\Users\Waqas Ahmed\AppData\Local\Pub\Cache\global_packages\stacked_cli\bin\stacked.dart-3.0.5.snapshot"                                                                                                                                                             %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  call dart pub global run stacked_cli:stacked %*
) else (
  call dart pub global run stacked_cli:stacked %*
)
goto eof
:error
exit /b %errorlevel%
:eof
