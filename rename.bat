@echo off
setlocal enabledelayedexpansion

rem 设置支持的图片扩展名列表（空格分隔，不带点）
set "extensions=jpg jpeg png bmp gif tiff webp ico"

rem 设置临时前缀（保证不与原文件名冲突）
set "prefix=bg"

rem 计数器从1开始
set count=1

echo 开始重命名图片文件...

rem 第一步：将所有图片文件重命名为带前缀的临时文件
for %%x in (%extensions%) do (
    for /f "delims=" %%i in ('dir /b /on "*.%%x" 2^>nul') do (
        if not "%%i"=="%~nx0" (
            ren "%%i" "%prefix%!count!%%~xi" 2>nul
            if !errorlevel! equ 0 (
                echo 重命名 "%%i" 为 "%prefix%!count!%%~xi"
                set /a count+=1
            ) else (
                echo 无法重命名 "%%i"
            )
        )
    )
)

rem 重置计数器，用于确认（可选）
set count=1

rem 第二步：将临时文件重命名为数字序号
for /f "delims=" %%i in ('dir /b /on "%prefix%*.*" 2^>nul') do (
    set "filename=%%i"
    rem 去除前缀
    set "newname=!filename:%prefix%=!"
    ren "%%i" "!newname!" 2>nul
    if !errorlevel! equ 0 (
        echo 最终重命名 "%%i" 为 "!newname!"
    ) else (
        echo 无法重命名临时文件 "%%i"
    )
)

echo 重命名完成！
pause