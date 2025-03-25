FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Garantir que os arquivos estáticos sejam coletados
RUN python backend/manage.py collectstatic --noinput || echo "Nenhum arquivo estático para coletar."

CMD ["python", "backend/manage.py", "runserver", "0.0.0.0:8000"]
