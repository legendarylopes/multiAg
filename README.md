# multiAg

Um projeto de multi-agentes com LangChain e OpenAI.

## 🚀 Quick Start

### 1. Ativar o Ambiente Virtual

**Windows (PowerShell):**
```powershell
.\activate-venv.ps1
```

**Windows (CMD):**
```cmd
.\activate-venv.bat
```

### 2. Instalar Dependências

```bash
pip install -r requirements.txt
```

### 3. Configurar Variáveis de Ambiente

```bash
# Copie o arquivo de exemplo
copy .env.example .env

# Abra .env e adicione suas chaves:
# OPENAI_API_KEY=sua_chave
# TAVILY_API_KEY=sua_chave
```

### 4. Executar o Projeto

```bash
python main.py
```

## 📋 Requisitos

- Python 3.11+
- pip/virtualenv
- Chaves de API para OpenAI e Tavily

## 📦 Dependências Principais

- **langchain** - Framework para criar aplicações com LLM
- **langchain-openai** - Integração com OpenAI
- **langchain-tavily** - Integração com Tavily Search
- **python-dotenv** - Gerenciar variáveis de ambiente
- **black** - Formatador de código
- **isort** - Organizador de imports

## 🛠️ Desenvolvimento

Para mais informações sobre setup da venv, veja [SETUP_VENV.md](SETUP_VENV.md)

## 📝 Estrutura do Projeto

```
multiAg/
├── .venv/              # Ambiente virtual (não fazer commit)
├── main.py             # Entrada principal
├── pyproject.toml      # Configuração do projeto
├── requirements.txt    # Dependências
├── .env.example        # Exemplo de variáveis de ambiente
├── activate-venv.ps1   # Script para ativar (PowerShell)
├── activate-venv.bat   # Script para ativar (CMD)
└── SETUP_VENV.md       # Instruções detalhadas
```
