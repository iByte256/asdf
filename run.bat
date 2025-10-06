@echo off
git fetch origin main
git pull origin main --rebase

if %errorlevel% neq 0 (
    git rebase --abort
    git merge origin/main
)

git add .

for /f "tokens=1-3 delims=/" %%a in ('date /t') do set DATE=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set TIME=%%a%%b
git commit -m "auto commit %DATE% %TIME%"

git push origin main
