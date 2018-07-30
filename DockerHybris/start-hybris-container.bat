SET cur_dir=%~dp0
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 9999 -Minimum 0000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "RAND=%%A"

echo %RAND%
cd %cur_dir%/..
cls



docker build -t joy1987/hybris-6.7:0.1.0 -f Dockerfile --build-arg CACHE_DATE=%RAND% .

if %errorlevel% neq 0 (
  echo Oops !!!! There is an error .
  cd %cur_dir%
  exit /b
)

docker stop hybris_docker
docker rm hybris_docker
docker run --name hybris_docker -v media-volume:/var/lib/media --link hybris_sql:mysql -p 9002:9002 -p 9001:9001 -p 8983:8983 -p 8000:8000 -e buildType=%1 -e debug=y -e initialize=n joy1987/hybris-6.7:0.1.0


if %errorlevel% neq 0 (
  echo Oops !!!! There is an error .
  cd %cur_dir%
  exit /b
)
cd %cur_dir%