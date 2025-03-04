# 🚀 Automação de Criação de BMs no Facebook com Playwright e AdsPower

Este projeto tem como objetivo a criação automatizada de **Business Managers (BMs)** no Facebook utilizando **Playwright** e **AdsPower**. A automação permite a geração e configuração de contas de forma eficiente e menos detectável.

## 🎯 Funcionalidades
✅ Criar **Business Managers (BMs)** automaticamente no Facebook.  
✅ Conectar o Playwright a perfis do AdsPower via **API** ou **CDP** (Chromium DevTools Protocol).  
✅ Automação de tarefas como login, preenchimento de formulários e configurações de BM.  
✅ Suporte a proxies configurados no AdsPower.  
✅ Execução headless ou em modo visível para debugging.  

## 🛠️ Tecnologias Utilizadas
- **Python 3**
- **Playwright** (para automação do navegador)
- **AdsPower API** (para gerenciamento de perfis)
- **Requests** (para chamadas à API do AdsPower)

## 🚀 Como Configurar
### 1️⃣ Instalar dependências
```bash
pip install playwright requests
```

### 2️⃣ Ativar a API do AdsPower
1. No AdsPower, vá até **Configurações > API** e ative a API.
2. Anote o **profile_id** do navegador que deseja automatizar.

### 3️⃣ Executar a automação
#### 🔹 Opção 1: Conectar via API do AdsPower
```python
import requests
from playwright.sync_api import sync_playwright

ADSP_API_URL = "http://local.adspower.net:50325/api/v1/browser/start"
PROFILE_ID = "123456"  # Substitua pelo seu ID

response = requests.get(f"{ADSP_API_URL}?profile_id={PROFILE_ID}")
data = response.json()

if data["code"] == 0:
    ws_endpoint = data["data"]["ws"]["puppeteer"]
    with sync_playwright() as p:
        browser = p.chromium.connect_over_cdp(ws_endpoint)
        page = browser.new_page()
        page.goto("https://business.facebook.com")
        print("BM criado com sucesso!")
        browser.close()
else:
    print("Erro ao iniciar o perfil:", data)
```

#### 🔹 Opção 2: Conectar a um navegador já aberto no AdsPower
```python
from playwright.sync_api import sync_playwright

ws_endpoint = "ws://127.0.0.1:9222/devtools/browser/abcdef123456"  # Pegue essa URL no AdsPower

with sync_playwright() as p:
    browser = p.chromium.connect_over_cdp(ws_endpoint)
    page = browser.new_page()
    page.goto("https://business.facebook.com")
    print("BM criado com sucesso!")
    browser.close()
```

## 📝 Notas
- O **profile_id** pode ser encontrado na interface do AdsPower.
- Se estiver usando proxies, configure-os diretamente no AdsPower antes de iniciar a automação.
- Para evitar bloqueios, utilize **delays aleatórios** entre as ações e tente simular o comportamento humano.

## 📌 Próximos Passos
🔹 Melhorar a automação para configurar automaticamente permissões do BM.  
🔹 Implementar suporte para múltiplas contas simultâneas.  
🔹 Criar um painel para gerenciar automações.  

---

Feito com ❤️ por Adriano Vale. Contribuições são bem-vindas! 🚀

