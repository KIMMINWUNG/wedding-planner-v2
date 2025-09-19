# 자동 Git Push 스크립트
# 사용법: .\auto-push.ps1 "커밋 메시지"

param(
    [Parameter(Mandatory=$true)]
    [string]$CommitMessage
)

Write-Host "🚀 자동 Git Push 시작..." -ForegroundColor Green

try {
    # 변경사항 확인
    $status = git status --porcelain
    if (-not $status) {
        Write-Host "⚠️  변경사항이 없습니다." -ForegroundColor Yellow
        exit 0
    }

    # 변경사항 추가
    Write-Host "📝 변경사항 추가 중..." -ForegroundColor Blue
    git add .

    # 커밋
    Write-Host "💾 커밋 중..." -ForegroundColor Blue
    git commit -m $CommitMessage

    # 푸시
    Write-Host "⬆️  푸시 중..." -ForegroundColor Blue
    git push origin main

    Write-Host "✅ 자동 Git Push 완료!" -ForegroundColor Green
    Write-Host "📊 커밋 메시지: $CommitMessage" -ForegroundColor Cyan

} catch {
    Write-Host "❌ 오류 발생: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
