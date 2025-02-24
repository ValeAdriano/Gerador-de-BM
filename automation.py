import requests
from playwright.sync_api import sync_playwright

# Função para iniciar o perfil do AdsPower
def start_adspower_profile(profile_id):
    url = f"http://localhost:50325/api/v1/browser/start?user_id={profile_id}"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()["data"]["ws"]["selenium"]
    else:
        raise Exception("Failed to start AdsPower profile")

# Função principal de automação
def main():
    profile_id = "your_adspower_profile_id"  # Substitua pelo ID do seu perfil AdsPower
    selenium_url = start_adspower_profile(profile_id)

    with sync_playwright() as p:
        browser = p.chromium.connect_over_cdp(selenium_url)
        page = browser.new_page()
        
        # Exemplo de navegação
        page.goto("https://example.com")
        print(page.title())
        
        # Fechar o navegador
        browser.close()

if __name__ == "__main__":
    main()
