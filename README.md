# Plataforma de Ventas y Despachos - Proyecto DevOps (AWS Academy)

Este repositorio contiene la plataforma integrada de **Ventas** y **Despachos**, unificada en un monorepositorio con orquestación local en contenedores de Docker y despliegue continuo automatizado (CI/CD) a la nube de AWS (ECS Fargate + RDS MySQL) con una cuenta de estudiante de AWS Academy.

---

## 🚀 Arquitectura del Proyecto

El sistema se compone de los siguientes elementos:

1. **Frontend (`front_despacho`)**: Aplicación React compilada con Vite y servida en producción a través de un servidor Nginx con proxy inverso.
2. **Backend de Ventas (`back-Ventas_SpringBoot`)**: Servicio Spring Boot REST (puerto 8080) encargado de procesar y listar las compras realizadas.
3. **Backend de Despachos (`back-Despachos_SpringBoot`)**: Servicio Spring Boot REST (puerto 8081) que procesa los despachos, asignaciones de vehículos y entregas.
4. **Base de Datos (MySQL)**: Base de datos relacional MySQL donde se almacenan las tablas de forma aislada.

---

## 🛠️ Requisitos Previos

Antes de ejecutar el proyecto, asegúrate de tener instalado:
* **Docker** (versión 20+ recomendada)
* **Docker Compose**
* **Git**

---

## 💻 Inicio Rápido Local (Orquestación)

Para levantar el entorno completo de desarrollo local con un solo comando:

1. **Clonar este repositorio** (si aún no lo has hecho):
   ```bash
   git clone https://github.com/iTzAsaro/Examen-devops-.git
   cd Examen-devops-
   ```

2. **Levantar todos los contenedores**:
   ```bash
   docker compose up --build
   ```

3. **Verificar acceso**:
   * **Frontend (Interfaz de Usuario)**: Accede en tu navegador a [http://localhost](http://localhost)
   * **API de Ventas (Documentación Swagger)**: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
   * **API de Despachos (Documentación Swagger)**: [http://localhost:8081/swagger-ui.html](http://localhost:8081/swagger-ui.html)

4. **Detener el entorno**:
   ```bash
   docker compose down -v
   ```
   *(El flag `-v` limpia los volúmenes de base de datos para pruebas limpias).*

---

## ☁️ Acceso al Despliegue en la Nube (Producción AWS)

La aplicación ha sido desplegada en un clúster de **Amazon ECS Fargate** y se conecta de forma segura a una base de datos relacional administrada **Amazon RDS MySQL**. 

Puedes acceder a la versión productiva mediante los siguientes enlaces:
* **Enlace de Producción (Frontend)**: [http://52.55.135.216](http://52.55.135.216)
* **API de Ventas**: [http://52.55.135.216/api/v1/ventas](http://52.55.135.216/api/v1/ventas)
* **API de Despachos**: [http://52.55.135.216/api/v1/despachos](http://52.55.135.216/api/v1/despachos)

---

## ⛓️ Automatización CI/CD con GitHub Actions

El pipeline está automatizado mediante la configuración en `.github/workflows/ci-cd.yml` y ejecuta el siguiente flujo al empujar cambios a las ramas `master` o `main`:

1. **Build & Test**: Ejecuta las pruebas automatizadas JUnit de los backends de Spring Boot y compila el frontend de React para verificar la integridad sintáctica.
2. **Docker Build & Push**: Construye las imágenes Docker utilizando las directivas multi-etapa y las sube etiquetadas a **Amazon ECR**.
3. **AWS ECS Deploy**: Actualiza el cluster ECS Fargate con la última versión de las imágenes de forma automática y transparente (Zero-Downtime deployment).

### Configuración de Secretos en GitHub (AWS Academy / Cuenta de Estudiante)
Debido a que las cuentas de AWS Academy proporcionan credenciales temporales que expiran, es necesario actualizar en GitHub Secrets los siguientes valores antes de ejecutar el pipeline:
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_SESSION_TOKEN` (Token temporal obligatorio en cuentas estudiantiles)

---

## 🔒 Buenas Prácticas de Seguridad Aplicadas
* **Imágenes Minimalistas**: Uso de Alpine Linux como sistema operativo base reduciendo el tamaño y eliminando herramientas innecesarias.
* **Usuarios No-Root**: Los microservicios de Spring Boot se ejecutan bajo un usuario del sistema no privilegiado para prevenir escalamiento de privilegios.
* **Proxy Inverso Nginx**: El frontend encapsula las llamadas a las APIs dentro del propio puerto 80 mediante proxy inverso, evitando configurar CORS con direcciones IPs externas cableadas en el código del cliente.
* **Mínimo Privilegio**: Toda la infraestructura se ejecuta en subredes privadas aisladas tras un balanceador de carga público (ALB).

---

## 📁 Estructura del Repositorio

```text
├── .github/workflows/       # Workflow de CI/CD (GitHub Actions)
├── Docs/                    # Pautas de evaluación e Informe Técnico
│   ├── EFT_Instrucciones... # Pautas DuocUC
│   └── DevOps_Reporte.md    # INFORME TÉCNICO OFICIAL PARA ENTREGA
├── back-Despachos_SpringBoot/
│   └── Springboot-API-REST-DESPACHO/
│       ├── Dockerfile       # Dockerfile optimizado (Java 17 JRE Alpine)
│       └── src/             # Código fuente de Despachos
├── back-Ventas_SpringBoot/
│   └── Springboot-API-REST/
│       ├── Dockerfile       # Dockerfile optimizado (Java 17 JRE Alpine)
│       └── src/             # Código fuente de Ventas
├── front_despacho/
│   ├── Dockerfile           # Dockerfile optimizado (Nginx + React dist)
│   ├── nginx.conf           # Configuración Nginx (SPA + Proxy Inverso)
│   └── src/                 # Código fuente Frontend (Vite + React)
├── db-init/
│   └── init.sql             # Inicializador de base de datos MySQL local
├── docker-compose.yml       # Orquestador local multi-contenedor
└── README.md                # Esta guía de usuario
```
