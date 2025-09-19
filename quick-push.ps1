# 빠른 Git Push 함수
function QuickPush {
    param([string]$msg = "자동 업데이트")
    
    Write-Host "🚀 빠른 푸시 시작..." -ForegroundColor Green
    
    git add . 2>$null
    git commit -m $msg 2>$null
    git push origin main 2>$null
    
    Write-Host "✅ 완료!" -ForegroundColor Green
}

# 함수를 전역으로 등록
Set-Alias -Name qp -Value QuickPush

Write-Host "💡 사용법: qp '커밋 메시지'" -ForegroundColor Cyan
Write-Host "💡 예시: qp 'UI 개선'" -ForegroundColor Cyan
