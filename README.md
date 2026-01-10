# MultiAg - Agentes de IA com Arquitetura React 🦜🔗

**Sistema de Agentes Inteligentes com LangChain, implementando arquitetura React para raciocínio estruturado e tomada de decisão autônoma**

MultiAg é um projeto robusto que demonstra como construir agentes de inteligência artificial sofisticados utilizando LangChain. O sistema implementa a arquitetura **ReAct** (Reasoning + Acting), permitindo que os agentes de IA resolvam problemas complexos através de um ciclo iterativo de pensamento, ação e observação.

![LangChain Logo](/static/LangChain-logo.svg)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.11+-blue)](https://www.python.org/)
[![LangChain](https://img.shields.io/badge/LangChain-1.2.0+-green)](https://python.langchain.com/)



## 🎯 Visão Geral do Projeto

MultiAg é um framework completo para construção de agentes de inteligência artificial que utiliza:

- **LangChain**: Framework principal para orquestração de modelos de linguagem
- **Arquitetura ReAct**: Padrão de raciocínio estruturado (Reasoning + Acting)
- **Tavily Search**: Integração com buscador para acesso a informações em tempo real
- **Pydantic**: Validação e estruturação de dados com schemas tipados

### Aplicações Práticas

Este projeto pode ser utilizado para:
- 🔍 **Busca e Pesquisa Inteligente** - Agentes que buscam informações em tempo real
- 🎮 **Análise de Videogames** - Consultas estruturadas sobre metas e estratégias (ex: Elden Ring)
- 💡 **Resolução de Problemas** - Agentes que decompõem problemas complexos
- 📊 **Extração de Dados** - Coleta e estruturação de informações da web
- 🤖 **Automação Inteligente** - Integração com APIs e ferramentas externas

## 🏗️ Arquitetura do Projeto

### Componentes Principais

#### 1. **LangChain - Orquestração de Agentes**

[LangChain](https://python.langchain.com/) é a biblioteca central que fornece:

- **`create_agent()`** - Factory function que cria agentes inteligentes com interface simplificada
- **`ChatOpenAI`** - Integração com modelos de linguagem OpenAI (GPT-4o, etc.)
- **`TavilySearch`** - Ferramenta para buscas em tempo real na internet
- **Tool Calling** - Mecanismo de integração com ferramentas externas
- **Message Protocol** - Protocolo padronizado de comunicação entre componentes

**Benefícios:**
- Abstração de complexidade da orquestração de LLMs
- Suporte nativo a múltiplos modelos (OpenAI, Anthropic, Ollama, etc.)
- Integração facilitada com APIs e ferramentas
- Typings fortes com Pydantic

```python
from langchain.agents import create_agent
from langchain_openai import ChatOpenAI
from langchain_tavily import TavilySearch

# Definir ferramentas disponíveis
tools = [TavilySearch()]

# Inicializar modelo de linguagem
llm = ChatOpenAI(model="gpt-4o")

# Criar agente com interface simplificada
agent = create_agent(
    model=llm,
    tools=tools,
    response_format=AgentResponse,
)
```

#### 2. **Arquitetura ReAct (Reasoning + Acting)**

ReAct é o padrão arquitetural que governa o comportamento dos agentes. Implementa um ciclo iterativo:

```
┌─────────────────────────────────────────┐
│  PENSAMENTO (Thought/Reasoning)         │
│  - Analisar o problema                  │
│  - Planejar abordagem                   │
│  - Decidir qual ferramenta usar         │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│  AÇÃO (Action/Acting)                   │
│  - Executar ferramenta selecionada      │
│  - Passar argumentos apropriados        │
│  - Obter resultado                      │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│  OBSERVAÇÃO (Observation)               │
│  - Analisar resultado obtido            │
│  - Atualizar compreensão do problema    │
│  - Decidir próximo passo                │
└──────────────┬──────────────────────────┘
               │
               ▼ (Repetir até solução)
```

**Fluxo em Prompt.py:**
O arquivo `prompt.py` contém o template ReAct que instrui o agente:

```
Question: [pergunta do usuário]
Thought: [raciocínio]
Action: [ferramenta a usar]
Action Input: [parâmetros]
Observation: [resultado da ferramenta]
... (repetir N vezes conforme necessário)
Final Answer: [resposta estruturada]
```

**Vantagens:**
- ✅ Raciocínio transparente e auditável
- ✅ Decomposição de problemas complexos
- ✅ Integração natural com múltiplas ferramentas
- ✅ Capacidade de corrigir erros durante o processo
- ✅ Explicabilidade das decisões tomadas

#### 3. **Schemas Pydantic - Estruturação de Dados**

O arquivo `schemas.py` define a estrutura esperada das respostas dos agentes:

```python
class Source(BaseModel):
    """Referência a uma fonte utilizada"""
    url: str  # URL da fonte

class AgentResponse(BaseModel):
    """Resposta estruturada do agente"""
    answer: str  # Resposta textual
    sources: List[Source]  # Fontes consultadas
```

**Benefícios:**
- 🔒 **Type Safety** - Validação automática de tipos
- 📋 **Documentação** - Auto-documentação através de docstrings
- ✔️ **Validação** - Garantia de dados válidos
- 🔄 **Serialização** - Conversão para JSON automática
- 🎯 **Rastreabilidade** - Identificação de fontes confiáveis

#### 4. **Tavily Search - Acesso a Dados em Tempo Real**

Ferramenta que permite ao agente buscar informações atualizadas na internet:

```python
from langchain_tavily import TavilySearch

tools = [TavilySearch()]
```

**Características:**
- 🌐 Busca em tempo real na internet
- 📱 Integração simples com LangChain
- 📰 Acesso a notícias e informações atualizadas
- 🔗 Retorna URLs das fontes
- ⚡ Rápido e eficiente

#### 5. **OpenAI ChatGPT-4o - Motor de Raciocínio**

Modelo de linguagem que alimenta o raciocínio do agente:

```python
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(model="gpt-4o")
```

**Características:**
- 🧠 Raciocínio avançado com compreensão contextual
- 📚 Conhecimento amplo de múltiplos domínios
- 🎯 Excelente em seguir instruções estruturadas
- 🌐 Suporte a múltiplos idiomas
- ⚡ Modelos rápidos para baixa latência

---

## 📚 Fluxo de Execução Completo

```
1. INICIALIZAÇÃO
   └─> Carregar variáveis de ambiente (.env)
   └─> Inicializar ChatOpenAI com credenciais
   └─> Registrar ferramentas (TavilySearch)

2. CRIAÇÃO DO AGENTE
   └─> Instanciar agent com create_agent()
   └─> Definir response_format (AgentResponse)
   └─> Preparar template de prompt ReAct

3. INVOCAÇÃO
   └─> Enviar mensagem de usuário
   └─> Agent inicia loop ReAct

4. CICLO REACT (repetido)
   └─> LLM processa estado atual
   └─> Gera Thought (raciocínio)
   └─> Seleciona Action (ferramenta)
   └─> Executa Action Input (parametrização)
   └─> Observa resultado
   └─> Atualiza scratchpad interno

5. CONCLUSÃO
   └─> Agent gera Final Answer
   └─> Estrutura resposta em AgentResponse
   └─> Retorna answer + sources
   └─> Exibe resultado ao usuário
```

---

## 🚀 Primeiros Passos

### 📋 Pré-requisitos

- **Python 3.11+** - Versão mínima requerida
- **pip ou poetry** - Gerenciador de pacotes Python
- **Chave OpenAI API** - Para acesso ao GPT-4o ([Obter em OpenAI](https://platform.openai.com/))
- **Chave Tavily API** - Para buscas em tempo real ([Obter em Tavily](https://tavily.com/))
- **Git** - Para controle de versão (opcional)

### 💻 Instalação e Configuração

#### 1. **Clone ou Extraia o Repositório**
```bash
git clone <repositório>
cd multiAg
```

#### 2. **Crie Ambiente Virtual (Recomendado)**

**Windows (PowerShell):**
```powershell
# Usar script fornecido
.\activate-venv.ps1

# Ou manualmente:
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

**Windows (CMD):**
```cmd
.\activate-venv.bat
```

**Linux/macOS:**
```bash
python3 -m venv .venv
source .venv/bin/activate
```

#### 3. **Instale as Dependências**
```bash
# Usando pip
pip install -r requirements.txt

# Ou usando poetry
poetry install
```

#### 4. **Configure as Variáveis de Ambiente**

Crie um arquivo `.env` na raiz do projeto:

```env
# OpenAI API Configuration
OPENAI_API_KEY=sk_seu_api_key_aqui

# Tavily Search Configuration
TAVILY_API_KEY=seu_tavily_api_key_aqui

# Modelo (opcional, padrão é gpt-4o)
OPENAI_MODEL_NAME=gpt-4o
```

**Segurança:** ⚠️ Nunca commit o arquivo `.env` - está incluído no `.gitignore`

#### 5. **Execute o Agente**

```bash
python main.py
```

**Exemplo de saída esperada:**
```
Searching for meta builds in Elden Ring...

Agent Response:
{
  "answer": "As principais builds meta no Elden Ring incluem...",
  "sources": [
    {"url": "https://example.com/elden-ring-builds"}
  ]
}
```

---

## 📁 Estrutura do Projeto

```
multiAg/
├── main.py                    # Arquivo principal com implementação do agente
├── schemas.py                 # Definições Pydantic para estruturação de dados
├── prompt.py                  # Templates de prompt ReAct
├── requirements.txt           # Dependências do projeto
├── pyproject.toml            # Configuração do projeto (poetry)
├── SETUP_VENV.md             # Instruções detalhadas de setup
├── README.md                 # Este arquivo
├── .env.example              # Exemplo de variáveis de ambiente
├── activate-venv.ps1         # Script para ativar venv (PowerShell)
├── activate-venv.bat         # Script para ativar venv (CMD)
└── .venv/                    # Ambiente virtual (criado após install)
```

### Arquivos Chave

#### `main.py` - Ponto de Entrada
Define e executa o agente de IA. Componentes principais:
- Carregamento de variáveis de ambiente
- Inicialização do ChatOpenAI
- Registro de ferramentas (TavilySearch)
- Criação do agente com `create_agent()`
- Loop de execução

#### `schemas.py` - Contrato de Dados
Define estruturas Pydantic que garantem:
- Respostas estruturadas e tipadas
- Validação automática de dados
- Rastreamento de fontes
- Auto-documentação

#### `prompt.py` - Instruções ReAct
Template de prompt que guia o agente através do ciclo ReAct. Inclui:
- Instruções de raciocínio
- Definição de formato de ações
- Estrutura de observações
- Geração de resposta final

---

## 🔄 Exemplo de Uso Completo

### Código
```python
from dotenv import load_dotenv
from langchain.agents import create_agent
from langchain_openai import ChatOpenAI
from langchain_tavily import TavilySearch
from schemas import AgentResponse

# Carregar credenciais
load_dotenv()

# Inicializar componentes
tools = [TavilySearch()]
llm = ChatOpenAI(model="gpt-4o")

# Criar agente
agent = create_agent(
    model=llm,
    tools=tools,
    response_format=AgentResponse,
)

# Invocar agente
result = agent.invoke({
    "messages": [{
        "role": "user",
        "content": "Qual é a melhor build para bosses em Elden Ring?"
    }]
})

# Processar resposta
structured = result.get("structured_response")
print(f"Resposta: {structured.answer}")
print(f"Fontes: {[s.url for s in structured.sources]}")
```

### Fluxo de Execução Detalhado

1. **Invocação:** Agente recebe a pergunta do usuário
2. **Raciocínio (Thought):** LLM analisa a pergunta
   - "Preciso buscar informações sobre builds Elden Ring"
3. **Ação (Action):** Seleciona TavilySearch
4. **Input:** "best builds Elden Ring bosses"
5. **Observação:** Recebe resultados da busca
6. **Iteração:** Repete se necessário mais informações
7. **Resposta Final:** Estrutura dados em AgentResponse
8. **Retorno:** Usuário recebe answer + sources

---

## ⚙️ Configuração Avançada

### Trocar Modelo de IA

Para usar outro modelo, edite `main.py`:

```python
# GPT-3.5 Turbo (mais rápido, mais barato)
llm = ChatOpenAI(model="gpt-3.5-turbo")

# GPT-4 (mais poderoso)
llm = ChatOpenAI(model="gpt-4")

# Ollama Local (sem custos)
from langchain_ollama import ChatOllama
llm = ChatOllama(model="llama2")
```

### Adicionar Novas Ferramentas

Estenda `main.py` com ferramentas adicionais:

```python
from langchain_community.tools import WikipediaQueryRun
from langchain_community.utilities import WikipediaAPIWrapper

# Adicionar Wikipedia
tools = [
    TavilySearch(),
    WikipediaQueryRun(api_wrapper=WikipediaAPIWrapper())
]

agent = create_agent(
    model=llm,
    tools=tools,
    response_format=AgentResponse,
)
```

### Customizar Resposta

Estenda `schemas.py` para capturar mais informações:

```python
from typing import List
from pydantic import BaseModel, Field

class AgentResponse(BaseModel):
    answer: str = Field(description="Resposta principal")
    sources: List[str] = Field(description="URLs das fontes")
    confidence: float = Field(description="Nível de confiança (0-1)")
    reasoning_steps: List[str] = Field(description="Passos de raciocínio")
```

---

## 🐛 Solução de Problemas

### Erro: "OpenAI API Key not found"
- ✅ Verifique se `.env` existe na raiz do projeto
- ✅ Confirme que `OPENAI_API_KEY` está definida
- ✅ Teste a chave em https://platform.openai.com/account/api-keys

### Erro: "Tavily API Key not found"
- ✅ Configure `TAVILY_API_KEY` no `.env`
- ✅ Obtenha a chave em https://tavily.com/

### Agente não retorna fontes
- ✅ Verifique se `response_format=AgentResponse` está definido
- ✅ Confirme que TavilySearch está nas ferramentas
- ✅ Aumentar timeout: `ChatOpenAI(model="gpt-4o", timeout=60)`

### Resposta lenta
- ✅ Use `gpt-3.5-turbo` em vez de `gpt-4o`
- ✅ Reduza o escopo da busca no prompt
- ✅ Implemente cache de resultados

---

## 📊 Componentes Técnicos em Detalhe

### LangChain - Ecossistema Completo

**LangChain** não é apenas um framework, é um ecossistema:

- **langchain-core**: Abstrações fundamentais
- **langchain**: Componentes de alto nível
- **langchain-openai**: Integração com OpenAI
- **langchain-tavily**: Integração com Tavily
- **langchain-classic**: APIs clássicas compatibilidade
- **langchain-ollama**: Modelos locais Ollama

**Vantagens:**
- 🔌 Integração plug-and-play com 100+ LLMs
- 🛠️ Ferramentas nativas para search, SQL, APIs
- 📊 Memory e estado persistente
- 🔗 Composição de cadeias complexas
- 📈 Production-ready com logging e tracing

### Arquitetura ReAct - Padrão de Ouro

ReAct (Reasoning + Acting) é o padrão mais robusto porque:

```
Transparência      →  Cada pensamento e ação é visível
├─ Auditoria fácil de decisões
├─ Debugging simplificado
└─ Conformidade regulatória

Decomposição       →  Problemas complexos → tarefas simples
├─ Reduz chance de erros
├─ Permite correção iterativa
└─ Escalonável para N passos

Ferramentas        →  Integração natural com APIs/DBs
├─ Acesso a dados em tempo real
├─ Cálculos precisos
└─ Ações concretas no mundo

Correção           →  Capacidade de se auto-corrigir
├─ Se ação falhar, tenta alternativa
├─ Aprende do erro
└─ Melhor taxa de sucesso
```

### Pydantic - Segurança de Tipos

Pydantic garante contrato entre agente e aplicação:

```python
class AgentResponse(BaseModel):
    # Validação automática
    answer: str  # Deve ser string
    sources: List[Source]  # Deve ser lista
    
    # Metadata automática
    __doc__ = "Resposta estruturada"
    
    # Serialização automática
    .model_dump()  # → dicionário
    .model_dump_json()  # → JSON
    .model_validate()  # ← Parsing
```

**Por que usar:**
- ✅ Evita bugs por tipos incorretos
- ✅ API clara e documentada
- ✅ Fácil integração com APIs REST
- ✅ Validação em runtime

---

## 🎯 Casos de Uso Recomendados

| Caso de Uso | Descrição | Ferramentas | Modelo |
|-------------|-----------|-----------|--------|
| 🔍 **Busca Inteligente** | Encontrar informações na web | TavilySearch | gpt-3.5-turbo |
| 📊 **Análise de Dados** | Processar e estruturar dados | Python REPL, SQL | gpt-4o |
| 🎮 **Recomendações** | Sugerir builds/estratégias | Web Search | gpt-4o |
| 💬 **Q&A** | Responder perguntas | RAG, Search | gpt-3.5-turbo |
| 🤖 **Automação** | Executar tarefas complexas | APIs, Webhooks | gpt-4o |

---

## 📚 Recursos Externos

### Documentação Oficial
- [LangChain Documentation](https://python.langchain.com/)
- [LangChain API Reference](https://api.python.langchain.com/)
- [OpenAI API](https://platform.openai.com/docs)
- [Tavily API](https://docs.tavily.com/)

### Artigos e Tutoriais
- [ReAct Paper](https://arxiv.org/abs/2210.03629) - Reasoning + Acting in Language Models
- [LangChain Blog](https://blog.langchain.dev/) - Novidades e tutoriais
- [OpenAI Cookbook](https://github.com/openai/openai-cookbook) - Exemplos práticos

### Comunidade
- [LangChain Discord](https://discord.gg/langchain) - Chat comunitário
- [GitHub Issues](https://github.com/langchain-ai/langchain) - Reporte bugs
- [Stack Overflow](https://stackoverflow.com/questions/tagged/langchain) - Q&A

---

## ✨ Próximos Passos

Para evoluir este projeto:

1. **Adicione Persistência:** Implemente banco de dados para cache
2. **Múltiplos Agentes:** Crie sistema multi-agente com delegação
3. **Interface Web:** Desenvolva UI com Streamlit ou FastAPI
4. **Monitoramento:** Adicione logging e tracing com LangSmith
5. **Otimização:** Implemente caching e rate limiting

---

## 📄 Licença

Este projeto está sob licença **Apache 2.0**. Veja o arquivo [LICENSE](LICENSE) para detalhes.

---

## 🤝 Contribuições

Contribuições são bem-vindas! Por favor:

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

<div align="center">

### 🌟 Se gostou do projeto, deixe uma estrela! ⭐

**Construído com ❤️ usando LangChain e IA Moderna**

Desenvolvido em 2026

</div>

