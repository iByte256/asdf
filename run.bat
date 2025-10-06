@echo off
REM === 자동 Git Push 스크립트 ===
REM 작성자: byte256

:: 현재 디렉토리 표시
echo ======================================
echo   🔁 Git 자동 푸시 실행 중...
echo ======================================

:: Git 상태 확인
git status

:: 모든 변경사항 추가
git add .

:: 현재 날짜와 시간을 커밋 메시지에 포함
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set DATE=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set TIME=%%a%%b
git commit -m "Auto commit on %DATE% %TIME%"

:: 원격 저장소로 푸시
git push origin main

echo ======================================
echo   ✅ 푸시 완료! Vercel에서 자동 배포됩니다 🚀
echo ======================================
pause
