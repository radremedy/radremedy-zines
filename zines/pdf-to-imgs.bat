@echo off
REM ZenCoding shortcut for HTML:
REM (a[href="img/page-$@0.jpg"]>img[src="img/thumb-$@0.jpg" alt="Page $"])*25

IF %~x1 NEQ .pdf (
	echo PDF not provided.
	GOTO end
)

IF EXIST "%~n1" RMDIR /S /Q "%~n1"
MKDIR "%~n1"

echo on
convert -monitor -colorspace rgb -density 300x300 -quality 90 -resize 1198x1851^> "%1" "%~n1/page.jpg"
convert -monitor -colorspace rgb -density 300x300 -quality 70 -resize 250 -crop 250x250+0+0 "%1" "%~n1/thumb.jpg"

:end
@pause
