@echo off
set "CURRENT_DIR=%~dp0"
echo ***** Current directory: %CURRENT_DIR% *****

set FFMPEG_BINARY=%CURRENT_DIR%lib\ffmpeg\ffmpeg-7.0-essentials_build\ffmpeg.exe
echo ***** FFmpeg file: %FFMPEG_BINARY% *****
set IMAGEMAGICK_BINARY=%CURRENT_DIR%lib\imagemagic\ImageMagick-7.1.1-29-portable-Q16-x64\magick.exe
echo ***** ImageMagick file: %IMAGEMAGICK_BINARY% *****

set "USER_HOME=%USERPROFILE%"
set "STREAMLIT_DIR=%USER_HOME%\.streamlit"
set "CREDENTIAL_FILE=%STREAMLIT_DIR%\credentials.toml"
if not exist "%STREAMLIT_DIR%" (
    mkdir "%STREAMLIT_DIR%"
    (
        echo [general]
        echo email=""
    ) > "%CREDENTIAL_FILE%"
)


%CURRENT_DIR%lib\python\python.exe -m streamlit run %CURRENT_DIR%MoneyPrinterTurbo\webui\Main.py 
