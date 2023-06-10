# Etapa 1: Construir o aplicativo
FROM node:18 AS builder

# Crie o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos necessários (incluindo o package.json e o package-lock.json)
COPY package*.json ./

# Instale as dependências
RUN npm ci

# Copie o código-fonte do aplicativo
COPY . .

# Execute a etapa de construção (exemplo: transpilar TypeScript)
RUN npm run build

# Etapa 2: Imagem final
FROM node:alpine

# Crie o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos necessários do estágio de construção
COPY --from=builder /app/dist ./dist
COPY package*.json ./

# Instale apenas as dependências de produção
RUN npm ci --only=production

# Exponha a porta em que o aplicativo está escutando
EXPOSE 3000

# Inicie o aplicativo
CMD ["node", "dist/main.js"]
