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
set file_md5="540f68ccd3891bce15d207a0a0fe9070"
set file_name="Blender_3.3.14.MSI"
call :check
set file_md5="6a2aea9ea30a75c0f6a52d59bfad01aa"
set file_name="CAD_Sketcher_Addon.ZIP"
call :check
set file_md5="0ed9a33af49d7d4da5297af66eddf236"
set file_name="CAD_Sketcher_Solver_Module.ZIP"
call :check
set file_md5="4bc4af2efd3bb4ba8924bdf234be1b3b"
set file_name="Java8_Runtime.MSI"
call :check
set file_md5="a4ebe1471c16bf35102a8ea5a756cdfc"
set file_name="MTXCONV.EXE"
call :check
set file_md5="c27b2a986d1e5a84b4fafc5d89b21cfa"
set file_name="OriginalSmashHit.APK"
call :check
set file_md5="171aa60ff61fed031268723251e9dbfb"
set file_name="Shatter_Addon_Improved_@2024.3.4.mod.3.12.ZIP"
call :check
set file_md5="19e9d3729e6b35253af7761d54f151d9"
set file_name="ShatterClient.APK"
call :check
set file_md5="635810432255428943ccf289bf2ad1c0"
set file_name="Voxelator_Addon.ZIP"
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
