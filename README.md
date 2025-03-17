# Comentários API

## Visão Geral

Este projeto é uma **API RESTful** simples que permite aos usuários **enviar e listar comentários** sobre matérias. A API foi construída utilizando o framework **Flask** e está **containerizada** com **Docker**, o que torna o processo de deployment bem simples e rápido.

A aplicação foi configurada para ser **deployada automaticamente** no **Azure** utilizando **GitHub Actions** para o processo de **CI/CD** (Integração Contínua e Deploy Contínuo). Além disso, a infraestrutura foi provisionada com **Terraform**.

## Funcionalidades

- **POST /api/comment/new**: Envia um novo comentário.
- **GET /api/comment/list/{content_id}**: Lista todos os comentários de uma matéria específica.

## Como Rodar Localmente

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/Andersonluizvieira/comentarios-api.git
   cd comentarios-api
