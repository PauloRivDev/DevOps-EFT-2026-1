# 📘 Guía para Informe Final y Presentación (DevOps & AWS)

Esta guía contiene la estructura recomendada tanto para tu **Informe Final (Word/PDF)** como para tu **Presentación (PowerPoint/Canva)**. Está basada estrictamente en la rúbrica oficial de evaluación. Cada sección indica exactamente qué texto agregar y qué captura de pantalla (evidencia) insertar.

---

## 🏗️ 1. Portada y Objetivo del Proyecto
**Texto / Discurso:**
- Presentar el proyecto: Plataforma de Ventas y Despachos bajo arquitectura de microservicios.
- **Objetivo:** Automatizar el ciclo de integración y entrega continua (CI/CD) de la plataforma (Frontend, Backend, BD relacional), empaquetada en contenedores y orquestada en AWS.

---

## 🏛️ 2. Arquitectura y Método de Integración
**Texto / Discurso:**
- Explicar la comunicación: Frontend (Vite/React) se comunica con los Backends (Spring Boot) a través de peticiones REST (ALB), y los Backends se conectan a la Base de Datos Relacional (MySQL) por el puerto 3306 mediante JDBC.
- Describir la infraestructura cloud: VPC, Subredes Privadas (ECS, RDS) y Públicas (ALB).

📸 **[INSERTE IMAGEN AQUÍ: DIAGRAMA DE ARQUITECTURA]**
- *Captura a tomar:* Diagrama arquitectónico (ej. Draw.io o Mermaid) mostrando la VPC, ALB, ECS, y RDS.

---

## 🐙 3. Repositorio (GitHub)
**Texto / Discurso:**
- Mostrar la estructura del repositorio monorepo y justificar el uso de ramas y commits ordenados.

📸 **[INSERTE IMAGEN 1 AQUÍ: URL Y CÓDIGO EN GITHUB]**
- *Captura a tomar:* Pantalla principal de tu repositorio en GitHub donde se vea el archivo `README.md` y la URL pública.
📸 **[INSERTE IMAGEN 2 AQUÍ: HISTORIAL DE COMMITS]**
- *Captura a tomar:* Pestaña "Commits" de GitHub mostrando mensajes claros y descriptivos.

---

## 🐳 4. Contenedores y Desarrollo Local
**Texto / Discurso:**
- Explicar la estructura del `Dockerfile` (Optimizaciones como Multi-stage build, uso de imágenes Alpine minimalistas y archivo `.dockerignore`).
- Mostrar cómo el archivo `docker-compose.yml` levanta el entorno completo (redes internas, volúmenes) localmente.

📸 **[INSERTE IMAGEN 1 AQUÍ: DOCKERFILES Y DOCKER COMPOSE]**
- *Captura a tomar:* Fragmento de tu archivo `docker-compose.yml` o del `Dockerfile` mostrando las etapas (build y runtime).
📸 **[INSERTE IMAGEN 2 AQUÍ: ENTORNO LOCAL RUNNING]**
- *Captura a tomar:* Consola corriendo `docker-compose up` o Docker Desktop con los contenedores corriendo localmente.

---

## ⚙️ 5. Pipeline de CI/CD (GitHub Actions)
**Texto / Discurso:**
- Explicar el archivo de workflow (`.github/workflows/ci-cd.yml`): Etapas de build, test, push a ECR y deploy automatizado.
- Detallar cómo se gestionaron los secretos para la conexión con AWS (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_SESSION_TOKEN`) siguiendo el principio de mínimo privilegio (IAM).

📸 **[INSERTE IMAGEN 1 AQUÍ: GITHUB ACTIONS LOGS]**
- *Captura a tomar:* Pestaña "Actions" en GitHub mostrando el pipeline completado en verde (Checkmark exitoso).
📸 **[INSERTE IMAGEN 2 AQUÍ: SECRETOS EN GITHUB]**
- *Captura a tomar:* Settings -> Secrets en GitHub mostrando que existen las variables de AWS configuradas.

---

## 📦 6. Registro de Imágenes (Amazon ECR)
**Texto / Discurso:**
- Mostrar la publicación de imágenes en ECR y destacar el uso de etiquetas de versión (tags como el hash del commit o `:latest`).

📸 **[INSERTE IMAGEN AQUÍ: CONSOLA DE AWS ECR]**
- *Captura a tomar:* Consola de AWS -> **Elastic Container Registry**. Muestra tus repositorios (`front-despacho`, `back-ventas`, `back-despachos`) y entra a uno para mostrar las etiquetas (tags) subidas.

---

## ☁️ 7. Orquestación y Despliegue en la Nube (AWS ECS y RDS)
**Texto / Discurso:**
- **Seguridad básica:** Prácticas aplicadas en los grupos de seguridad (Security Groups con reglas restrictivas).
- **Orquestación:** Justificar la elección de Amazon ECS con Fargate frente a un despliegue manual (EC2 puro). (Beneficios: serverless, escalabilidad automática, no administrar servidores subyacentes).
- **Escalabilidad:** Explicar el Auto Scaling configurado.

📸 **[INSERTE IMAGEN 1 AQUÍ: AMAZON RDS (BASE DE DATOS)]**
- *Captura a tomar:* Consola RDS mostrando la base de datos "Available".
📸 **[INSERTE IMAGEN 2 AQUÍ: ECS CLUSTER Y SERVICIOS]**
- *Captura a tomar:* Consola ECS mostrando el cluster y el servicio "Active" y sus Tasks "Running".
📸 **[INSERTE IMAGEN 3 AQUÍ: APPLICATION LOAD BALANCER]**
- *Captura a tomar:* Consola EC2 -> Load Balancers mostrando tu ALB activo.

---

## ✅ 8. Demostración y Funcionamiento (Verificación del Sistema)
**Texto / Discurso:**
- Mostrar la evidencia final de la aplicación desplegada y funcional en la nube (AWS).
- Comprobar que los endpoints funcionan y hay persistencia en base de datos.

📸 **[INSERTE IMAGEN 1 AQUÍ: APLICACIÓN EN EL NAVEGADOR]**
- *Captura a tomar:* Captura de tu navegador accediendo a la URL del Load Balancer, mostrando la interfaz del frontend cargada.
📸 **[INSERTE IMAGEN 2 AQUÍ: PRUEBAS FUNCIONALES / LOGS]**
- *Captura a tomar:* Captura de pantalla ejecutando el script `test_api.ps1` local o a través de Postman probando los endpoints del ALB y obteniendo Status 200/201.
📸 **[INSERTE IMAGEN 3 AQUÍ: CLOUDWATCH LOGS (OBSERVABILIDAD)]**
- *Captura a tomar:* Consola AWS -> CloudWatch -> Log Groups. Muestra los logs de tu aplicación corriendo.

---

## 🧠 Preparación para Defensa Técnica Individual
*(Revisa estos puntos para las preguntas del docente al final de tu presentación)*
1. **¿Por qué usaste Dockerfile multi-stage?** (Para reducir el peso de la imagen final y no incluir herramientas de compilación en producción por seguridad).
2. **¿Por qué elegiste ECS Fargate?** (Porque es serverless, autoescalable y delega la gestión de los servidores host a AWS, a diferencia de EC2 tradicional).
3. **¿Cómo configuraste la seguridad de red?** (Con VPC, subredes públicas para el ALB y privadas para los contenedores y RDS. Los Security Groups restringen puertos y orígenes).
4. **¿Cómo funciona el CI/CD?** (Al hacer push en GitHub, Actions levanta un entorno runner, compila, corre tests, empaqueta la imagen Docker, se autentica en AWS usando Secrets, sube a ECR y fuerza un nuevo despliegue en ECS).
