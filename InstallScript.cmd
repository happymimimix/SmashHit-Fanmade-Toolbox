@echo off &chcp 850 >nul &pushd "%~dp0"
mkdir SmashHit_Fanmade
cd SmashHit_Fanmade
echo.Extracting files, please wait... 
set "0=%~f0" &powershell -nop -c $f=[IO.File]::ReadAllText($env:0)-split':bat2file\:.*';iex($f[1]); X(1)
echo.Begin package integrity check: 
set file_md5="602715af27262e592d1118afe662c7d0"
set file_name="ApkEditorStudio.EXE"
call :check
set file_md5="66e416f8e397b5b15a7fbc1e8fa9e3ee"
set file_name="AssetsRenamer.CMD"
call :check
set file_md5="6226c961bf09934459c22c3b86e4084c"
set file_name="Blender_2.7_Skin.XML"
call :check
set file_md5="60dbb0ac670978781a9ae9d6dafb1186"
set file_name="Blender_3.0.BAT"
call :check
set file_md5="9285e4d283c20f15b01e2a3c2d9825b0"
set file_name="JDK18.MSI"
call :check
set file_md5="a4ebe1471c16bf35102a8ea5a756cdfc"
set file_name="MTXCONV.EXE"
call :check
set file_md5="c27b2a986d1e5a84b4fafc5d89b21cfa"
set file_name="OriginalSmashHit.APK"
call :check
set file_md5="a2e49b4aded34e373ddaff37027e1c9a"
set file_name="Shatter_Addon_Improved_@2023.12.14.mod.12.20.ZIP"
call :check
set file_md5="975747975401c8fd844291990b9f1ab7"
set file_name="ShatterClient.APK"
call :check
goto end
:check
CertUtil -hashfile %file_name% MD5 > x
set /a row=0
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (x) do (set /a row+=1 & if !row! EQU 2 set f=%%i)
setlocal disabledelayedexpansion
del x /f /q
IF /I "%f%" EQU %file_md5% (echo.[92m%file_name% -- Success! [39m) ELSE (echo.[91m%file_name% -- Failed! [39m&call :redownload)
exit /b
:redownload
mshta vbscript:msgbox("Critical error: The file "%file_name%" is damaged and can no longer work. Please redownload! "+vbCrLf+"File MD5: ""%f%"" "+vbCrLf+"Excepted MD5: "%file_md5%"",48,"Please redownload! ")(window.close)
exit /b
:end
cmd /k
exit