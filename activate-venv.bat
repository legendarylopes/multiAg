@echo off
REM Script para ativar a venv e instalar dependências
setlocal enabledelayedexpansion

cd /d "%~dp0"

echo ========================================
echo Ativando ambiente virtual...
echo ========================================

call .venv\Scripts\activate.bat

if errorlevel 1 (
    echo Erro ao ativar a venv
    exit /b 1
)

echo ========================================
echo Ambiente ativado com sucesso!
echo ========================================
echo.
echo Python: 
python --version
echo Pip:
pip --version
echo.
echo Para instalar dependencias, execute:
echo pip install -r requirements.txt
echo.
