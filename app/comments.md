# DOCUMENTAÇÃO DO PROJETO

## 1. **Visão Geral**
O projeto é uma **API RESTful** que permite aos usuários **enviar e listar comentários** sobre matérias. O backend foi feito com **Flask**, e para rodar a aplicação em produção, usei o **Gunicorn**. Além disso, a aplicação foi **dockerizada**, o que facilita a execução em qualquer ambiente (seja local ou na nuvem). Para o deploy, usei **GitHub Actions**, que automatiza o processo sempre que houver atualizações no código.

### O que a API faz:
- **POST** `/api/comment/new`: Envia um comentário para uma matéria.
- **GET** `/api/comment/list/{content_id}`: Lista todos os comentários de uma matéria específica.

---

## 2. **Tecnologias Usadas**

### 2.1. **Flask**
- **Por que escolhi?** Porque o Flask é super simples de usar, fácil de configurar e já faz tudo o que preciso para uma API simples como essa. Ele é minimalista, o que é perfeito para não perder tempo com configuração excessiva.

### 2.2. **Gunicorn**
- **Por que escolhi?** O **Gunicorn** é o servidor WSGI recomendado para Flask em produção. Ele é robusto, rápido e fácil de configurar, além de ser bem compatível com o Flask. 

### 2.3. **Docker**
- **Por que escolhi?** Dockerizar a aplicação é sempre uma boa escolha para garantir que o ambiente de execução seja o mesmo em qualquer lugar. Isso elimina aquele "funcionou na minha máquina" e facilita o deploy em outros servidores.

---

## 3. **Decisões Tomadas**

### 3.1. **Gunicorn + Docker**
- O **Gunicorn** foi configurado para escutar em **0.0.0.0** em vez de apenas `localhost`. Isso permite que a API seja acessada de fora do container (por exemplo, no caso de acessos externos, como no **Azure**).
- A aplicação foi **dockerizada**, o que significa que você pode rodar ela em qualquer lugar, sem problemas de dependência ou configuração de ambiente.

---

## 4. **Processo de Desenvolvimento**

### 4.1. **Execução Local**
- Quando eu estava desenvolvendo, usei muito o **Postman** e **curl** para testar a API, criando e listando comentários. Basicamente, testei a API de forma simples e sem complicação.

### 4.2. **Dockerização**
- O Docker foi super útil para garantir que a aplicação rodasse sem nenhum problema, independentemente de onde eu estivesse. Isso facilita bastante quando o projeto precisa ser rodado em outros servidores, como em **produção** ou em máquinas de outras pessoas.

### 4.3. **Deploy Automático com GitHub Actions**
- Como não sou fã de deploy manual (quem é, né?), criei uma **pipeline CI/CD** usando **GitHub Actions**. Isso permite que sempre que eu faça alterações no código, ele seja **construído, enviado para o Docker Hub** e implantado no servidor automaticamente. Tudo sem apertar um botão.

### 4.4. **Testes**
- Não criei testes automatizados com **pytest** ou algo do tipo. Mas testei manualmente a aplicação, usando **curl** e **Postman**, para garantir que ela estivesse funcionando direitinho. A aplicação está rodando certinho, sem problemas por enquanto.

---

## 5. **Aditivos**

### 5.1.: **Monitoramento com Prometheus e Grafana**
- Embora o monitoramento não tenha sido implementado nesta versão, em um cenário de produção, seria interessante integrar o **Prometheus** para coletar métricas sobre a aplicação, como o tempo de resposta, quantidade de requisições e erros.
- **Grafana** seria utilizado para visualizar essas métricas de forma interativa e criar **dashboards** para facilitar a análise de desempenho e saúde da aplicação.

### 5.2. **Uso de Kong API Gateway**
- Em um cenário de produção mais robusto, o uso de um **API Gateway** como o **Kong** poderia ser considerado. O Kong forneceria funcionalidades importantes como **autenticação** de usuários (JWT, OAuth2), **rate limiting** para proteger a API de abusos, e **balanceamento de carga** para garantir a distribuição eficiente das requisições.
- O **Kong** também pode ajudar no **monitoramento de APIs** com métricas detalhadas, além de melhorar a segurança e a escalabilidade do sistema à medida que o número de APIs e usuários cresce.

---


## 6. **Conclusão**

A aplicação foi construída de forma simples, mas eficiente, utilizando **Flask**, **Gunicorn** e **Docker**. O deploy foi automatizado com **GitHub Actions**, garantindo que a aplicação seja sempre atualizada e implantada sem erros. Se tivesse mais tempo, teria integrado um **banco de dados** e implementado **autenticação**.

---


---

