# 🎬 Netflix Clone React.js

## Overview
Este proyecto es un clon de Netflix desarrollado con React.js, diseñado para simular una experiencia moderna de plataforma de streaming.

La aplicación consume datos desde la API de TMDB y utiliza Firebase para autenticación y gestión de usuarios.

## Screenshots

![PC screen](https://i.imgur.com/FLNs9Qy.jpg)



### mobile experience 
![mobile screens](https://i.imgur.com/ForTeQi.jpg)
 
## Key Functionalities
- 🔐 Registro e inicio de sesión (Firebase Authentication)
- 🏠 Página principal con catálogo de películas
- ❤️ Lista personalizada (My List)
- 👍 Películas favoritas
- 👁️ Películas vistas
- 👤 Perfil de usuario
- ▶️ Reproductor de películas
- 🔎 Búsqueda de contenido

## Technologies Used
- [React.js](https://react.dev/)
- [TMDB API](https://www.themoviedb.org/)
- [Firebase](https://firebase.google.com/)
- [Axios](https://www.npmjs.com/package/axios)
- [Swiper.js](https://swiperjs.com/)
- [React-Youtube](https://www.npmjs.com/package/react-youtube)
- [Tailwind CSS](https://tailwindcss.com/)

## Soporte con Docker
El proyecto está dockerizado para facilitar su ejecución y despliegue.

### 📄 Dockerfile
```
FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]
```
## 🚀 Ejecutar con Docker
```
docker build -t netflix-react .
docker run -p 5173:5173 netflix-react
```
👉 Abrir en el navegador:
```
http://localhost:5173
```
## ⚙️ CI/CD con GitHub Actions
Este proyecto incluye un pipeline de integración continua que construye y publica la imagen Docker automáticamente en cada push a la rama master.

```
name: 🚀 CI/CD Frontend Docker 
on: 
    push: 
        branches: 
            - master 
jobs: 
    docker-frontend: 
        runs-on: ubuntu-latest 
        
        steps: 
            - name: Checkout código 
            uses: actions/checkout@v3 
            - name: Login en Docker Hub 
            uses: docker/login-action@v2 
            with: 
                username: ${{ secrets.DOCKER_USERNAME }} 
                password: ${{ secrets.DOCKER_PASSWORD }} 
            - name: Build & Push frontend image 
                uses: docker/build-push-action@v5 
                with: 
                    context: . 
                    file: ./Dockerfile 
                    push: true 
                    tags: ${{ secrets.DOCKER_USERNAME }}/aeropuerto-front:latest
```
## 🔐 Secrets necesarios

Configura estos secretos en GitHub:
- DOCKER_USERNAME
- DOCKER_PASSWORD

## Link to the Site
[Netflix Clone](https://movieflix-reactjs.vercel.app/)

## 👨‍💻 Autor
Este proyecto está basado en un clon original desarrollado por otro autor, utilizado como referencia para aprendizaje.
Se han realizado modificaciones y mejoras propias, incluyendo:

- Dockerización del proyecto 🐳
- Configuración de CI/CD con GitHub Actions 🚀
- Ajustes y correcciones en el código