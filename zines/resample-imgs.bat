@echo off
REM This script converts a given folder of PNG files with numeric names
REM (e.g. "0.png", "1.png", etc.)
REM to equivalent resampled JPEGs (with corresponding thumbnails)
REM located in a "<directory>-resamp" folder.

IF NOT EXIST %~x1\NUL (
	echo Directory not provided.
	GOTO end
)

set destdir=%~dp1%~n1-resamp

IF EXIST "%destdir%" RMDIR /S /Q "%destdir%"
MKDIR "%destdir%"

REM Setting the colorspace on PNGs messes up the final output
FOR %%G IN (%1\*.png) DO (
convert -density 300x300 -quality 90 -resize 1198x1851^> %%G "%destdir%\page-%%~nG.jpg"
convert -density 300x300 -quality 70 -resize 250 -crop 250x250+0+0 %%G "%destdir%\thumb-%%~nG.jpg"
)

:end
@pause
