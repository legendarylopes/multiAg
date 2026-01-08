# Script para ativar a venv no PowerShell
# Uso: .\activate-venv.ps1

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

Write-Host "========================================" -ForegroundColor Green
Write-Host "Ativando ambiente virtual..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Ativa a venv
& '.\.venv\Scripts\Activate.ps1'

if ($LASTEXITCODE -eq 0) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Ambiente ativado com sucesso!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Python version:"
    python --version
    Write-Host ""
    Write-Host "Pip version:"
    pip --version
    Write-Host ""
} else {
    Write-Host "Erro ao ativar a venv" -ForegroundColor Red
    exit 1
}
