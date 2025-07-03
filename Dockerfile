# Etapa 1: Usar uma imagem oficial do Python como imagem base.
# python:3.9-slim é uma boa escolha por ser leve.
FROM python:3.11-slim

# Etapa 2: Definir o diretório de trabalho dentro do container.
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

# Etapa 4: Instalar as dependências definidas no requirements.txt.
# A flag --no-cache-dir reduz o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar todo o código da aplicação para o diretório de trabalho.
COPY . .

# Etapa 6: Expor a porta em que a aplicação será executada.
EXPOSE 8000

# Etapa 7: Definir o comando para executar a aplicação quando o container iniciar.
# Uvicorn é o servidor ASGI que executará a aplicação FastAPI.
# --host 0.0.0.0 torna o servidor acessível de fora do container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]