# **Evaluación Final Transversal Encargo con Presentación** Instrucciones y pauta de evaluación | Estudiante 

2025 

## DuocUC: 

## **Evaluación Final Transversal** 

## **Encargo con Presentación** 

## **Instrucciones y pauta de evaluación Estudiante** 

|**Sigla**|**Nombre Asignatura**|**Tiempo Asignado**|**% Ponderación**|**Semana inicio**<br>**EFT**|
|---|---|---|---|---|
|ISY1101|Introducción a Herramientas Devops|10 h|**40%**|**18**|



## **1. Instrucciones generales** 

## **Descripción** 

- La **Presentación / Defensa** corresponde a la exposición técnica en duplas del **Examen Final Transversal** , donde las/los estudiantes deberán **explicar, justificar y demostrar** el producto final del proyecto práctico desarrollado durante el semestre. 

- El proyecto consiste en la **automatización completa del ciclo de integración y entrega continua (CI/CD)** de una plataforma compuesta por **Frontend, Backend y Base de Datos relacional** , desplegada en un proveedor Cloud y operando en un entorno de **producción orquestado** . 

- ▪ Si bien el proyecto se desarrolla en parejas, la **defensa es evaluada de manera individual** , considerando exclusivamente el dominio técnico, la claridad conceptual y la capacidad de fundamentar las decisiones de diseño y tecnología adoptadas. 

|Evaluación|Tipo de situación<br>evaluativa|Distribución de porcentajes<br>en el ET|Individual/Grupal|
|---|---|---|---|
|Evaluación Final Transversal (EFT):<br>40%|Encargo|20%|Grupal|
||Defensa|80%|Individual|
|Total||100%||



Página 1 de 7 

2025 

## DuocUC: 

## Tiempo asignado 

- **Duración de la presentación:** entre **10 y 15 minutos** por dupla. 

- La defensa se realiza de manera **síncrona en laboratorio** . 

- El orden de presentación será definido por el/la docente. 

- Cada estudiante debe estar preparado para defender **la totalidad del proyecto** , independientemente de la división interna de tareas. 

## Instrucciones específicas de la Presentación / Defensa 

La presentación técnica debe realizarse **en clase** , utilizando lenguaje técnico profesional, y debe incluir de forma clara, estructurada y demostrable los siguientes elementos: 

## **Explicación de la arquitectura final del sistema** 

Las/los estudiantes deberán explicar y justificar: 

- La arquitectura general de la solución: 

   - Frontend 

   - Backend 

   - Base de datos relacional 

- La forma en que se integran y comunican los componentes del sistema. 

- El proveedor Cloud utilizado (AWS, Azure o GCP) y la razón de su elección. 

- La arquitectura de red y seguridad aplicada (segmentación, accesos, mínimo privilegio). 

Página 2 de 7 

2025 

## **Contenedorización de la solución** 

## La defensa debe incluir: 

- Explicación de la estructura de los **Dockerfile** por componente: 

   - Uso de Dockerfile multietapa. 

   - Imágenes base minimalistas. 

   - Uso de variables de entorno. 

   - Buenas prácticas de seguridad y optimización. 

- Uso de **.dockerignore** . 

- Orquestación del entorno de desarrollo local mediante **docker-compose** . 

- Justificación de las decisiones técnicas adoptadas en la contenedorización. 

## **Pipeline de Integración y Entrega Continua (CI/CD)** 

## Las/los estudiantes deberán explicar: 

- El flujo completo del pipeline CI/CD implementado con **GitHub Actions** : `o` Build 

   - Test 

   - Empaquetado 

   - Publicación de imágenes 

   - Despliegue automatizado 

- Gestión de secretos mediante: 

   - GitHub Secrets 

   - AWS Secrets Manager (si aplica) 

- Evidencia de ejecución exitosa del pipeline, mostrando logs y resultados. 

- Uso de tags/versionado para la trazabilidad de las imágenes. 

Página 3 de 7 

2025 

## **Registro de imágenes y despliegue en la nube** 

La presentación debe demostrar: 

- Publicación de imágenes en **Amazon ECR o Docker Hub** . 

- Evidencia del despliegue activo del sistema en la nube: 

   - Acceso funcional al Frontend (URL o IP). 

   - Backend operativo y conectado a la base de datos. 

- Funcionamiento correcto del sistema tras el despliegue automatizado. 

## **Orquestación y operación en entorno productivo** 

Las/los estudiantes deberán exponer: 

- Uso de un servicio de orquestación: `o` Amazon ECS `o` Amazon EKS `o` AKS / GKE (si aplica) 

- Justificación de la elección del orquestador frente a un despliegue manual. 

- Funcionamiento de: 

   - Escalabilidad 

   - `o` Balanceo `o` Recuperación ante fallos 

- Evidencia de monitoreo básico: 

   - Logs 

   - `o` Métricas (CloudWatch u otro servicio equivalente). 

Página 4 de 7 

2025 

## DuocUC: 

## **Seguridad básica y observabilidad** 

## La defensa debe incluir: 

- Prácticas de seguridad aplicadas: 

   - Endurecimiento de imágenes. 

   - Exposición mínima de puertos. 

   - Reglas restrictivas en Security Groups o firewalls. 

- Evidencias de observabilidad: 

   - Logs del pipeline CI/CD. 

   - Métricas básicas del entorno desplegado. 

- Cumplimiento del principio de **mínimo privilegio** mediante IAM. 

## **Defensa técnica individual** 

## Posterior a la presentación, cada estudiante deberá: 

- Responder preguntas del docente. 

- Fundamentar las decisiones de diseño, arquitectura y herramientas utilizadas. 

- Demostrar comprensión integral del proyecto y su operación en un entorno productivo. 

- Argumentar cómo la solución propuesta responde a un escenario real de la industria. 

## Aspectos formales de la presentación 

- **Formato:** exposición en vivo (no se aceptan videos pregrabados). 

- **Recursos permitidos:** 

   - Presentación en PowerPoint o PDF. 

   - Diagramas de arquitectura. 

Página 5 de 7 

2025 

DuocUC 

   - Evidencias prácticas (GitHub Actions, Cloud Console, logs, métricas). 

- **Medio de entrega:** 

   - Subir la presentación al AVA dentro del plazo establecido. 

## **2. Pauta de Evaluación (Rúbrica, Escala de Valoración, Lista de cotejo)** 

|**Categoría**<br>**% logro**<br>**Descripción niveles de logro**|**Categoría**<br>**% logro**<br>**Descripción niveles de logro**|**Categoría**<br>**% logro**<br>**Descripción niveles de logro**|
|---|---|---|
|**Muy buen desempeño**|**100%**|Demuestra un desempeño destacado, evidenciando el logro de todos los aspectos evaluados en el indicador.|
|**Buen desempeño**|**80%**|Demuestra un alto desempeño del indicador, presentando pequeñas omisiones, dificultades y/o errores.|
|**Desempeño aceptable**|**60%**|Demuestra un desempeño competente, evidenciando el logro de los elementos básicos del indicador, pero con<br>omisiones, dificultades o errores.|
|**Desempeño incipiente**|**30%**|Presenta importantes omisiones, dificultades o errores en el desempeño, que no permiten evidenciar los<br>elementos básicos del logro del indicador, por lo que no puede ser considerado competente.|
|**Desempeño no logrado**|**0%**|Presenta ausencia o incorrecto desempeño.|



|**Indicador de Evaluación**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Ponderación**<br>**Indicador de**<br>**Evaluación**|
|---|---|---|---|---|---|---|
||**Muy buen**<br>**desempeño**<br>**100%**|**Buen desempeño**<br>**80%**|**Desempeño**<br>**aceptable**<br>**60%**|**Desempeño**<br>**incipiente**<br>**30%**|**Desempeño no**<br>**logrado**<br>**0%**||
|**IE8. Explicación de fundamentos**<br>**de orquestación**|**Explicación**<br>**clara,**<br>**profunda y**<br>**correcta**<br>**sobre**<br>**clúster,**|**Explicación**<br>**adecuada con**<br>**leves**<br>**omisiones.**|**Explicación**<br>**general sin**<br>**profundidad.**|**Explicación**<br>**confusa o**<br>**incompleta.**|**No justifica.**|**25%**|



Página 6 de 7 

2025 

||**nodos,**<br>**autoscaling**<br>**y balanceo.**||||||
|---|---|---|---|---|---|---|
|**IE9. Demostración del pipeline**<br>**CI/CD**|**Demuestra**<br>**build →**<br>**push →**<br>**deploy con**<br>**claridad y**<br>**evidencia.**|**Demostración**<br>**correcta con**<br>**pequeños**<br>**vacíos.**|**Demostración**<br>**incompleta o**<br>**parcial.**|**Demostración**<br>**confusa o**<br>**con fallas.**|**No demuestra.**|**25%**|
|**IE10. Defensa técnica**|**Responde**<br>**con claridad,**<br>**precisión y**<br>**dominio**<br>**total.**|**Responde**<br>**adecuadamente**<br>**con dudas**<br>**menores.**|**Responde**<br>**parcialmente.**|**Responde**<br>**con errores**<br>**conceptuales.**|**No responde**<br>**adecuadamente.**|**25%**|
|**IE11. Claridad, estructura y**<br>**calidad de la presentación**|**Presentación**<br>**profesional,**<br>**clara,**<br>**ordenada y**<br>**técnica.**|**Presentación**<br>**correcta con**<br>**leves fallas.**|**Presentación**<br>**aceptable con**<br>**desorden**<br>**moderado.**|**Presentación**<br>**desordenada.**|**Presentación**<br>**deficiente.**|**25%**|
||||||||
|**Total**||||||**20%**|



Página 7 de 7 

2025 

