# Setup da Venv - Instruções

## Para ativar a venv:

### No Windows (PowerShell):
```powershell
.\activate-venv.ps1
```

### No Windows (CMD):
```cmd
.\activate-venv.bat
```

### Manualmente (PowerShell):
```powershell
.\.venv\Scripts\Activate.ps1
```

### Manualmente (CMD):
```cmd
.venv\Scripts\activate.bat
```

## Para instalar/atualizar dependências:

Após ativar a venv, execute:
```bash
pip install -r requirements.txt
```

## Para sair da venv:
```bash
deactivate
```

## Solução para erros de permissão no pip:

Se receber erro do tipo:
```
Fatal error in launcher: Unable to create process using '...\python.exe'
```

Execute:
```powershell
.\activate-venv.ps1
pip install --upgrade pip
pip install -r requirements.txt
```

## Configuração de variáveis de ambiente:

1. Copie `.env.example` para `.env`
2. Preencha com suas chaves de API necessárias
3. O arquivo `.env` será carregado automaticamente pelo `python-dotenv`

## Verificar instalação:

```bash
python --version
pip --version
pip list
```
