#!/bin/bash

# Criar ambiente virtual
if [ ! -d "venv" ]; then
    python -m venv venv
fi
source venv/bin/activate || source venv/Scripts/activate

# Instalar dependências
pip install --upgrade pip
pip install -r requirements.txt

# Criar arquivo .env
if [ ! -f .env ]; then
cat <<EOT >> .env
DJANGO_SECRET_KEY=your-secret-key
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1
EOT
fi

# Verificar se o diretório backend existe
if [ ! -d backend ]; then
    echo "Erro: O diretório backend não foi encontrado!"
    exit 1
fi

# Verificar se manage.py existe
if [ ! -f backend/manage.py ]; then
    echo "Erro: O arquivo manage.py não foi encontrado em backend/"
    exit 1
fi

# Migrar banco de dados
cd backend
python manage.py migrate
