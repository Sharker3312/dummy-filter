# syntax=docker/dockerfile:1.4

# Etapa base: builder con Angular
FROM node:17.0.1-bullseye-slim as builder

WORKDIR /project

# Instala Angular CLI
RUN npm install -g @angular/cli@13

# Copia dependencias y las instala
COPY package*.json ./
RUN npm ci

# Copia el resto del código
COPY . .

# Etapa final: entorno de desarrollo con herramientas adicionales
FROM node:17.0.1-bullseye-slim as dev-envs

WORKDIR /project

# Copia desde el builder el proyecto listo
COPY --from=builder /project /project

# Expone el puerto por defecto de ng serve
EXPOSE 4200

# Ejecuta la app en modo desarrollo
CMD ["npx", "ng", "serve", "--host", "0.0.0.0"]
