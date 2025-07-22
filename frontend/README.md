# BondyApp - Flutter & Node.js Demo

Este proyecto es una **iniciativa personal** creada con el objetivo de demostrar mi motivación por unirme al equipo de **Bondy**. He querido plasmar mi forma de trabajar aplicando buenas prácticas, diseño limpio y una arquitectura sólida tanto en frontend como en backend.

> También me ha servido para iniciarme en Flutter, una tecnología previamente desconocida para mí, con el fin de estar alineado con el stack tecnológico del equipo.

---

## 🛠️ Tecnologías Utilizadas

### Frontend (Flutter)

- **Flutter 3.x** con Material 3
- Navegación por rutas nombradas
- `http` para llamadas a la API
- `shared_preferences` para almacenamiento local (token JWT)
- UI adaptada a la estética de Bondy

### Backend (Node.js)

- **Node.js + Express**
- Arquitectura **hexagonal** (Domain-Driven Design)
- `dotenv` para gestión de variables de entorno
- `bcrypt` para hashing seguro de contraseñas
- `jsonwebtoken` (JWT) para autenticación
- `mysql2` para la conexión con la base de datos
- `Docker + docker-compose` para levantar el servicio de MySQL

---

## ✅ Funcionalidades Actuales

### Autenticación de usuarios
- Registro de usuario con nombre, email, nombre de usuario y contraseña
- Login con validación segura
- Autenticación basada en JWT
- Almacenamiento de sesión en local usando `shared_preferences`

### Flujo de navegación
- **Landing page** con diseño introductorio y botones para registro/login
- Registro y login conectados al backend en tiempo real
- Página de bienvenida tras iniciar sesión, con saludo personalizado
- Botón de logout con borrado de sesión local

---

## 🔒 Seguridad

- Contraseñas almacenadas con hash (bcrypt, sal aleatoria)
- JWT firmado con secreto de servidor
- Middleware para control de acceso en futuras rutas privadas
- Validación de input en backend y frontend

---

## 📂 Estructura del Backend

- `src/domain`: Entidades del dominio (`User`)
- `src/application`: Casos de uso (`registerUser`, `loginUser`)
- `src/infrastructure`: Repositorios y persistencia
- `src/services`: Servicios externos (hashing, JWT)
- `src/routes`: Endpoints HTTP
- `controllers`: Lógica HTTP desacoplada de la infraestructura

---

## 📌 Próximas mejoras

- Añadir pantalla de perfil con edición de datos
- Implementar pagos entre usuarios (base de la funcionalidad Bondy)
- Añadir persistencia de sesión en frontend y refresh tokens
- Validación de formularios en Flutter
- Pruebas unitarias en backend (Jest) y en frontend (Flutter test)
- Mejora de diseño responsive y dark mode

---

## 🚀 Cómo ejecutar el proyecto

### Requisitos
- Flutter instalado
- Node.js >= 18
- Docker y docker-compose

### Backend

```bash
cd backend
cp .env.example .env
docker-compose up -d
node src/app.js
```

### Frontend

```bash
cd frontend
flutter pub get
flutter run
```