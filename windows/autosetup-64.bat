@echo off
FOR /F "tokens=* USEBACKQ" %%F IN (`chdir`) DO (
SET dir=%%F
)

"%dir%\windows\win64\nssm.exe" install "GoDaddy Dynamic DNS" "%dir%\windows\dnsupdate.bat"
"%dir%\windows\win64\nssm.exe" stop "GoDaddy Dynamic DNS"

"%dir%\windows\win64\nssm.exe" set "GoDaddy Dynamic DNS" Application "%dir%\windows\dnsupdate.bat"
"%dir%\windows\win64\nssm.exe" set "GoDaddy Dynamic DNS" AppParameters "%dir%\bin\godaddy.py"
"%dir%\windows\win64\nssm.exe" set "GoDaddy Dynamic DNS" AppDirectory "%dir%\bin"
"%dir%\windows\win64\nssm.exe" set "GoDaddy Dynamic DNS" Start SERVICE_DELAYED_AUTO_START

"%dir%\windows\win64\nssm.exe" start "GoDaddy Dynamic DNS"

echo Setup Done... 
echo.
echo Be sure to change the settings in 
echo %dir%\bin\godaddy.py.
echo.
echo The windows service should now start automatically.