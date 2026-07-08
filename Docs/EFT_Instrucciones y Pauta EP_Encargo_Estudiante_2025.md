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

▪ **La Evaluación Final Transversal** corresponde al producto final del proyecto práctico desarrollado en parejas con presentación **y  defensa individual.** El caso consiste en **automatizar el ciclo de integración y entrega continua (CI/CD)** de una **plataforma compuesta por un frontend, un backend y una base de datos relacional** . **Todo el proceso de integración, pruebas, empaquetado y despliegue** debe estar **automatizado con GitHub Actions** . El **despliegue** puede realizarse en un proveedor cloud ( **por ejemplo, AWS, Azure o GCP** ). Tanto el frontend como el backend deben ejecutarse en **contenedores** , siguiendo **buenas prácticas** (Dockerfile multietapa, .dockerignore, imágenes minimalistas, variables de entorno y **orquestación local con docker-compose** ). Se debe evidenciar **monitoreo básico (métricas y/o logs)** del entorno desplegado, llevando el producto a un entorno de producción orquestándolo con servicios como EKS, ECS, AKS ,GKE ,etc **El tiempo asignado** para esta evaluación es de **1 semana** . 

▪ La distribución de los porcentajes en esta evaluación es la siguiente: 

|Evaluación|Tipo de situación<br>evaluativa|Distribución de porcentajes<br>en el ET|Individual/Grupal|
|---|---|---|---|
|Evaluación Final Transversal (EFT):<br>40%|Encargo|20%|Grupal|
||Defensa|80%|Individual|



Página 1 de 7 

2025 

## DuocUC: 

Total 100% 

- El tiempo asignado para desarrollar esta evaluación es de 1 semanas, que incluyen la elaboración del encargo con  presentación. 

- Donde los estudiantes inician su trabajo en el Taller de Proyectos (TAITE 7), pero lo finalizan en su tiempo de trabajo autónomo. 

- El encargo se elabora en parejas , correspondientes al mismo equipo de trabajo constituido durante el semestre. 

- La defensa del proyecto se debe realizar de manera síncrona en laboratorio. 

- Las instrucciones se proporcionarán en la semana 16, la entrega de producto y defensa debe realizarse en la semana 18. 

## **Instrucciones específicas de la Evaluación:** 

## **Ítem I: Consideraciones para el encargo** 

- El proyecto desarrollado a lo largo del semestre se entrega mediante AVA en un repositorio de Github. Este debe contener el código fuente de los componentes del sistema con su integración correspondiente y un informe que justifique las decisiones tomadas en los siguientes puntos: 

- **Método de integración del sistema:** Explicación de la comunicación entre frontend, backend y base de datos relacional. 

- ● **Contenedores:** Imágenes Docker creadas por componente, definición de redes internas y orquestación para el entorno de desarrollo local con Docker Compose. 

- **Registro de imágenes:** Descripción del flujo de publicación de imágenes en Amazon ECR o Docker Hub, incluyendo el uso de etiquetas (tags) para la trazabilidad. 

- **CI/CD:** Diagrama y explicación del pipeline configurado en GitHub Actions (etapas de build, test, push de imagen y deploy automatizado). 

- ● **Infraestructura en la nube:** Descripción de la arquitectura en AWS, incluyendo VPC, subred(es), grupos de seguridad y la plataforma de despliegue (instancias EC2 o un clúster ECS/EKS). 

- **Configuración y secretos:** Detalle de cómo se gestionaron las variables de entorno y los secretos (usando GitHub Secrets y/o AWS Secrets Manager) siguiendo el principio de mínimo privilegio (IAM). 

- **Observabilidad:** Evidencias de logs de la ejecución del pipeline (obtenidos desde GitHub Actions) y métricas básicas de los recursos desplegados en la nube (obtenidas desde AWS CloudWatch). 

Página 2 de 7 

2025 

## DuocUC: 

- **Seguridad básica:** Prácticas aplicadas para el endurecimiento de imágenes (ej. uso de imágenes base alpine o slim, escaneo de vulnerabilidades), configuración de puertos mínimos expuestos y reglas restrictivas en los grupos de seguridad (Security Groups). 

- **Orquestación y escalabilidad:** Fundamentación de por qué se eligió un servicio de orquestación como Amazon ECS o EKS para gestionar aplicaciones en un entorno de producción, explicando sus beneficios frente a un despliegue manual. 

- **Aspectos formales del encargo:** 

- **Formato:** El entregable principal es un informe en formato Word que explique y fundamente las decisiones técnicas tomadas. 

- **Diagrama:** El informe debe incluir un diagrama de arquitectura o de despliegue que represente gráficamente la solución implementada. Se pueden utilizar herramientas como Draw.io, Lucidchart, etc. 

- **Repositorio:** El repositorio en GitHub debe ser público y contener un archivo README.md que explique los detalles del proyecto. El historial de commits debe ser claro, con mensajes descriptivos. 

- **Medio de entrega:** El informe y el enlace al repositorio se entregan a través del Ambiente Virtual de Aprendizaje (AVA). 

## _**Consideraciones para la presentación**_ 

- La presentación del proyecto se realiza en duplas, pero cada estudiante debe fundamentar la propuesta de manera individual. La presentación debe tener una duración de 10 a 15 minutos y demostrar el funcionamiento del sistema. 

## **Checklist de evidencias mínimas a demostrar en la presentación:** 

- **Repositorio:** Mostrar la URL del repositorio y la estructura de ramas y commits. 

- **Contenedores:** 

   - Explicar la estructura del Dockerfile, las optimizaciones aplicadas y cómo se construye la imagen. 

   - Mostrar el archivo docker-compose.yml y demostrar cómo levanta el entorno de desarrollo localmente. 

- **Pipeline de CI/CD:** 

   - Explicar el archivo de workflow (.yml) de GitHub Actions, detallando cada una de las etapas (build, test, push, deploy) y cómo se gestionan los secretos para la conexión con AWS. 

   - Mostrar evidencia de la publicación de imágenes en Amazon ECR o Docker Hub, destacando las etiquetas de versión. 

   - Demostrar la ejecución exitosa del pipeline, mostrando los logs que confirmen que los componentes de la aplicación quedaron funcionales y accesibles en la nube (mediante URL, IP, etc.). 

Página 3 de 7 

2025 

## DuocUC 

- **Orquestación y Despliegue en la Nube:** 

   - Mostrar la evidencia del despliegue activo en AWS (endpoints de la aplicación funcionando, recursos visibles en la consola de AWS). 

   - Explicar y demostrar la configuración del **clúster de orquestación en AWS (EKS o ECS)** , mostrando cómo se despliegan, gestionan y escalan los servicios en la nube. 

   - Describir la arquitectura de la solución en la nube, explicando cómo interactúan los diferentes servicios de AWS utilizados (VPC, EC2, ECS/EKS, ECR, IAM). 

- **Defensa Técnica:** Posterior a la presentación, cada estudiante debe responder a las preguntas formuladas por el docente, fundamentando las decisiones de diseño y tecnologías utilizadas. 

## **2.Pauta de Evaluación (Rúbrica, Escala de Valoración, Lista de cotejo)** 

|**Categoría**<br>**% logro**<br>**Descripción niveles de logro**|**Categoría**<br>**% logro**<br>**Descripción niveles de logro**|**Categoría**<br>**% logro**<br>**Descripción niveles de logro**|
|---|---|---|
|**Muy buen desempeño**|**100%**|Demuestra un desempeño destacado, evidenciando el logro de todos los aspectos evaluados en el indicador.|
|**Buen desempeño**|**80%**|Demuestra un alto desempeño del indicador, presentando pequeñas omisiones, dificultades y/o errores.|
|**Desempeño aceptable**|**60%**|Demuestra un desempeño competente, evidenciando el logro de los elementos básicos del indicador, pero con<br>omisiones, dificultades o errores.|
|**Desempeño incipiente**|**30%**|Presenta importantes omisiones, dificultades o errores en el desempeño, que no permiten evidenciar los<br>elementos básicos del logro del indicador, por lo que no puede ser considerado competente.|
|**Desempeño no logrado**|**0%**|Presenta ausencia o incorrecto desempeño.|



|**Indicador de**<br>**Evaluación**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Categorías de Respuesta**|**Ponderación**<br>**Indicador de**<br>**Evaluación**|
|---|---|---|---|---|---|---|
||**Muy buen desempeño**<br>**100%**|**Buen desempeño**<br>**80%**|**Desempeño**<br>**aceptable**<br>**60%**|**Desempeño**<br>**incipiente**<br>**30%**|**Desempeño no**<br>**logrado**<br>**0%**||
|**Dimensión: Encargo**|||||||



Página 4 de 7 

2025 

## DuocUC: 

|**IE1. Gestión de**<br>**Versiones y**<br>**Arquitectura**|Mantiene un<br>repositorio Git<br>ordenado con ramas<br>bien estructuradas y<br>commits<br>descriptivos. El<br>diagrama de<br>arquitectura<br>representa todos los<br>flujos de<br>comunicación y<br>tecnologías de forma<br>precisa y completa.|Mantiene el<br>repositorio Git de<br>forma mayormente<br>correcta y el<br>diagrama representa<br>la mayoría de los<br>flujos, pero con<br>omisiones menores.|Utiliza Git de<br>forma básica y<br>el diagrama<br>presenta<br>algunas<br>omisiones o<br>confusiones en<br>las<br>conexiones.|El repositorio está<br>desordenado y el<br>diagrama es<br>incompleto o poco<br>claro, dificultando<br>la comprensión.|No utiliza Git<br>correctamente o no<br>presenta un<br>diagrama funcional.|10%|
|---|---|---|---|---|---|---|
|**IE2.**<br>**Contenerización**<br>**para Desarrollo**<br>**Local**|Construye un<br>Dockerfileoptimizado<br>y un archivo Docker<br>Compose que define<br>y levanta<br>perfectamente todos<br>los servicios<br>(frontend, backend,<br>BD), redes y<br>volúmenes para el<br>entorno de<br>desarrollo.|Construye un<br>Dockerfile y Docker<br>Composefuncionales,<br>pero con leves<br>omisiones en<br>optimización o<br>buenas prácticas en<br>la definición de los<br>servicios.|Construye<br>archivos que<br>levantan los<br>servicios de<br>forma básica,<br>pero con<br>errores<br>menores o<br>carencia de<br>optimización.|Los archivos de<br>contenedorización<br>son incompletos o<br>generan<br>imágenes/servicios<br>con problemas<br>funcionales.|No presenta<br>Dockerfile o Docker<br>Composefuncionales.|**10%**|
|**IE3.**<br>**Configuración**<br>**del Pipeline de**<br>**CI/CD**|Configura un<br>pipeline en GitHub<br>Actions completo y<br>automatizado, que<br>ejecuta<br>exitosamente las<br>etapas de build, test,<br>push a un registro<br>(ECR/Docker Hub) y<br>despliegue,<br>manejando secretos<br>de forma segura.|Configura un pipeline<br>que realiza el<br>despliegue<br>correctamente,<br>aunque con algunos<br>pasos manuales,<br>detalles por optimizar<br>o manejo de secretos<br>mejorable.|Configura un<br>pipeline<br>funcional pero<br>incompleto, o<br>con errores<br>que requieren<br>intervención<br>frecuente para<br>lograr el<br>despliegue.|El pipeline<br>configurado<br>presenta fallas<br>recurrentes que<br>impiden el<br>despliegue<br>efectivo en la<br>nube.|No configura un<br>pipeline funcional.|**20%**|
|**IE4. Despliegue y**<br>**Orquestación en**<br>**la Nube (AWS**<br>**EKS o ECS)**|Configura un clúster<br>en EKS o ECS de<br>manera eficiente y<br>segura, despliega|Configura el clúster<br>correctamente y<br>logra desplegar los<br>servicios, aunque|Crea un clúster<br>parcial o<br>inestable,<br>logrando un|Intenta configurar<br>el clúster, pero no<br>logra un<br>despliegue|No configura ni<br>despliega servicios<br>en un clúster de<br>orquestación.|**20%**|



Página 5 de 7 

2025 

## DuocUC: 

||todos los servicios<br>de la aplicación<br>exitosamente y<br>demuestra su<br>funcionamiento y<br>escalabilidad en la<br>nube.|con limitaciones<br>menores en el<br>balanceo de carga, la<br>persistencia o la<br>escalabilidad.|despliegue de<br>servicios con<br>funcionalidad<br>limitada.|funcional de los<br>servicios de la<br>aplicación.|||
|---|---|---|---|---|---|---|
|**IE5. Verificación y**<br>**Funcionalidad del**<br>**Sistema**|**Demuestra que todos**<br>**los endpoints de la**<br>**aplicación son**<br>**funcionales en el**<br>**entorno de la nube.**<br>**Verifica el correcto**<br>**funcionamiento**<br>**mediante pruebas y**<br>**análisis de logs del**<br>**pipeline y de la**<br>**aplicación**<br>**desplegada.**|**Demuestra la mayoría**<br>**de los endpoints**<br>**funcionales y realiza**<br>**pruebas adecuadas,**<br>**con leves omisiones en**<br>**la validación.**|**Demuestra un**<br>**funcionamiento**<br>**parcial de la**<br>**aplicación,**<br>**omitiendo la**<br>**prueba de**<br>**algunos**<br>**escenarios**<br>**relevantes.**|**Las pruebas**<br>**realizadas son**<br>**insuficientes para**<br>**evidenciar la**<br>**funcionalidad de la**<br>**aplicación en la**<br>**nube.**|**No demuestra que la**<br>**aplicación desplegada**<br>**esté funcional.**|**20%**|
|**IE6. Presentación**<br>**y Defensa**<br>**Técnica**|La presentación en<br>video está<br>claramente<br>estructurada y utiliza<br>lenguaje técnico<br>preciso. Responde<br>con seguridad y<br>profundidad a todas<br>las preguntas del<br>docente,<br>demostrando<br>dominio integral del<br>tema.|La presentación tiene<br>un orden general<br>correcto y responde<br>adecuadamente a la<br>mayoría de las<br>preguntas, con<br>claridad conceptual.|La<br>presentación<br>transmite las<br>ideas<br>principales<br>pero con fallos<br>en el orden.<br>Responde de<br>forma general<br>a algunas<br>preguntas,<br>aunque con<br>vacíos<br>técnicos.|La presentación es<br>desordenada o<br>incompleta. Las<br>respuestas a las<br>preguntas son<br>superficiales o<br>ambiguas.|La presentación es<br>ininteligible o no<br>responde<br>correctamente a las<br>preguntas del<br>docente.|**20%**|
||||||**Total**|**100%**|



Página 6 de 7 

2025 

Página 7 de 7 

2025 

