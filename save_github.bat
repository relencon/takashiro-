@echo off
chcp 65001 > nul
echo ---------------------------------------------------
echo GitHubへの保存を開始します...
echo ---------------------------------------------------

cd /d "%~dp0"

echo [1/3] 変更を検出中... (git add)
git add .

echo [2/3] メモを記録中... (git commit)
set TIMESTAMP=%date% %time%
git commit -m "Auto save: %TIMESTAMP%"

echo [3/3] GitHubへ送信中... (git push)
git push origin main

echo ---------------------------------------------------
if %ERRORLEVEL% equ 0 (
    echo [成功] 保存が完了しました！
) else (
    echo [注意] 何らかのエラーが発生したか、変更がありませんでした。
    echo 画面を確認してください。
)
echo ---------------------------------------------------
pause
