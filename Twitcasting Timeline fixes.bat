@echo off
title Twitcasting Timeline fixes
set patha=%~dp0
for %%a in (%*) do (
	mkvmerge --output "%patha%%%~na.mkv" --language 0:und --fix-bitstream-timing-information 0:1 --language 1:und "%%a" --track-order 0:0,0:1
	ffmpeg -i "%patha%%%~na.mkv" -acodec copy -vcodec copy "%patha%%%~na.n.mp4"
	del "%patha%%%~na.mkv"
)
echo.
echo.
echo All done. Please press any key to exit.
pause>nul