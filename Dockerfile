# Usa Node
FROM node:18

# Carpeta de trabajo
WORKDIR /app

# Copiar dependencias
COPY package*.json ./

# Instalar deps
RUN npm install --legacy-peer-deps

# Copiar el resto
COPY . .

# Exponer puerto de Vite
EXPOSE 80

# Ejecutar Vite
CMD ["npm", "run", "dev", "--", "--host"]