# Usar a imagem oficial do Python
FROM python:3.9-slim

#diretório de trabalho dentro do container
WORKDIR /app

#Copia dos arquivos do projeto para o container
COPY . /app

# Instalar as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta 8000 (onde a API estará disponível)
EXPOSE 8000

# Rodar a aplicação com Gunicorn
CMD ["gunicorn", "--log-level", "debug", "--bind", "0.0.0.0:8000", "api:app"]

