@echo off
set docinfotgt=%~dp1%~n1.txt
set webpdftgt=%~dp1%~n1 - WEB.pdf

echo File: %~nx1
echo.
REM See if we have a title
IF [%2]==[] (
set /P doctitle="Title of Zine: "
) ELSE (
set doctitle=%2
)

REM Create the document information
echo [ /Author RAD Remedy and Isabella Rotman (http://zines.radremedy.org)> %docinfotgt%
echo /Creator Glitter and Unicorns>> %docinfotgt%
echo /Producer Arcane Rituals>> %docinfotgt%
echo /Title %doctitle%>> %docinfotgt%
echo /Subject Dr. RAD's Queer Health Show>> %docinfotgt%
echo /Keywords RAD Remedy, radremedy, zine, Izzy Rotman, Isabella Rotman, trans, transgender, queer, wellness, health>> %docinfotgt%
echo /DOCINFO pdfmark>> %docinfotgt%

REM Delete the file if it exists
@echo on
IF EXIST %webpdftgt% DEL /f "%webpdftgt%"
@echo off

REM Create the PDF using the source and the document information
pushd C:\Program Files\gs\gs9.19\bin
@echo on
gswin64c.exe -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -dNOPAUSE ^
-dCompatibilityLevel=1.6 -dEmbedAllFonts=true -dSubsetFonts=true ^
-sOutputFile="%webpdftgt%" -dBATCH "%~1" "%docinfotgt%"
@echo off

popd
