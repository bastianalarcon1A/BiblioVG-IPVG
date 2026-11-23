## Bitácora Oficial de Proyecto — Sistema de Gestión Bibliotecaria "BiblioVG"

**Institución:** Instituto Profesional Virginio Gómez — Sede Concepción (Corporación Universidad de Concepción)[cite: 7]
**Área de Estudio:** Biblioteca Institucional — Proceso de Préstamo y Devolución de Recursos[cite: 5, 7]
**Módulo / Asignaturas Articuladas:** Módulo de Análisis TNS (Análisis de Sistemas, Análisis y Diseño Orientado a Objetos y Modelamiento de Datos)
**Docente Guía:** Iván San Martín
**Contraparte / Usuario Representante:** Alida Luengo (Bibliotecaria Encargada)[cite: 4]
**Metodología de Desarrollo:** Iterativa e incremental bajo marco ágil **Scrum**[cite: 5, 7]
**Control de Versiones:** Git / GitHub[cite: 3]

---

## 1. Equipo de Proyecto y Roles Asignados

| Integrante | Rol Principal | Responsabilidades y Evidencia de Aporte |
| :--- | :--- | :--- |
| **Bastián Alarcón** | Facilitador / Coordinador | Coordinación general del equipo, gestión de cronograma, conducción de la sesión JAD, nexo con la Biblioteca IPVG y preparación de la defensa oral. |
| **Ivanna Villarroel** | Analista de Requerimientos | Levantamiento, clasificación y validación bajo estándar IEEE 830 de los 17 Requerimientos Funcionales (RF-01 a RF-17) y 12 No Funcionales (RNF-01 a RNF-12)[cite: 3, 7]. |
| **Cristóbal Villalobos** | Documentador / Arquitecto | Trazabilidad técnica del informe final (Capítulos 1 al 4), modelamiento UML 2.5, MERE, Modelo Relacional 3FN, script SQL y gestión del repositorio GitHub[cite: 2, 4]. |

---

## 2. Registro Cronológico de Avances y Decisiones Técnicas (Capítulos 1 al 4)

| Fase / Capítulo | Actividades Ejecutadas | Hallazgos y Decisiones Técnicas Adoptadas | Entregables y Artefactos Generados |
| :--- | :--- | :--- | :--- |
| **Capítulo 1: Análisis Previo y Diagnóstico** | • Visita a terreno y observación directa discreta en el mesón de atención[cite: 2, 3].<br>• Sesión colaborativa **JAD** con la bibliotecaria encargada Alida Luengo[cite: 2, 3, 4].<br>• Mapeo organizacional de Sede Concepción[cite: 2, 7]. | • Se identifican 3 brechas críticas: (1) validación verbal insegura por RUT[cite: 5], (2) caída total del sistema FOLIO ante cortes de red/energía sin protocolo offline[cite: 5], y (3) ausencia de consultas remotas, alertas y reportes estadísticos.<br>• Se detecta vulnerabilidad legal en devolución de Tablets por sesiones personales abiertas (**Ley N° 19.628**)[cite: 5]. | • Organigrama institucional y de sede (Figura 1.1)[cite: 2, 7].<br>• Diagramas As-Is y To-Be con Frontera de Automatización (Figuras 1.2 y 1.3)[cite: 2, 6].<br>• Tabla de Análisis Crítico (Tabla 1.2)[cite: 2]. |
| **Capítulo 1.5: Alternativas y Factibilidad** | • Evaluación multicriterio y económica entre **Alternativa 1** (Desarrollo Open Source a medida) y **Alternativa 2** (Software Comercial SaaS)[cite: 2, 5]. | • Se selecciona **Alternativa 1 (Open Source)** por costo de licenciamiento $0 (**RNF-12**)[cite: 5], compatibilidad con equipos existentes (**RNF-06**)[cite: 5, 7] y autonomía para implementar persistencia offline (**RNF-04**)[cite: 5, 7]. | • Desglose de costos y matriz multicriterio (Tablas 1.3 y 1.4)[cite: 2].<br>• Planificación iterativa Scrum[cite: 5, 7]. |
| **Capítulo 2: Especificación de Requerimientos (IEEE 830)** | • Redacción de **17 RF** y **12 RNF** (producto, organizacionales y externos)[cite: 2, 3, 7].<br>• Definición de requisitos de información (almacenamiento y salida) y hardware/software[cite: 2, 3].<br>• Validación IEEE 830 con prototipos de baja fidelidad[cite: 3]. | • **Corrección de validación:** Se eliminan ambigüedades en **RF-12** y **RF-17** precisando exportación en **PDF y Excel (.xlsx)**, y en **RF-15** definiendo acceso vía portal web[cite: 3].<br>• Se desacopla el flujo de préstamo en RF independientes (`RF-02`, `RF-04`, `RF-07`, `RF-08`, `RF-09`)[cite: 3].<br>• Se fija regla reglamentaria de **15 días corridos** (**RNF-09**)[cite: 5, 7]. | • Catálogo RF/RNF y matrices de validación (Tablas 2.1 a 2.10)[cite: 2].<br>• Plan de Pruebas por Sprints y Aceptación UAT (Sección 2.6)[cite: 3].<br>• Registro de errores detectados y corregidos (Sección 2.7)[cite: 3]. |
| **Capítulo 3: Diseño Global del Software** | • Modelamiento Orientado a Objetos (UML 2.5) y Modelo Entidad-Relación Extendido (MERE) en herramienta CASE[cite: 2, 4].<br>• Diseño funcional mediante Diagramas de Actividades con *swimlanes*, Máquinas de Estados y Casos de Uso (`CU-01` a `CU-03`)[cite: 2, 4].<br>• Definición de estándares de interfaz y accesibilidad WCAG 2.1 AA[cite: 2]. | • Se modela jerarquía de generalización desde superclase `Recurso` hacia `Libro`, `Calculadora` y `Tablet`[cite: 4].<br>• Se incorpora entidad bloqueante `ChecklistPrivacidadTablet` en devolución de tablets (**RF-06** / **Ley N° 19.628**)[cite: 4].<br>• Se crea tabla de parámetros fuera del esquema (`DIAS_PLAZO_PRESTAMO = 15`, `DIAS_AVISO_PREVENTIVO = 3`)[cite: 2, 4]. | • Diagrama de Clases Conceptual y MERE (Figuras 3.1 y 3.2)[cite: 2, 4].<br>• Diagramas de Actividades y Estados (Figuras 3.3 a 3.7)[cite: 2].<br>• Estándares visuales y validación con usuario representante (Figura 3.8 y Tabla 3.7)[cite: 2]. |
| **Capítulo 4: Diseño Detallado del Software** | • Refinamiento lógico de clases con firmas técnicas completas (argumentos y tipos de retorno)[cite: 2, 4].<br>• Mapeo del MERE a Modelo Relacional Lógico (MR) en 3FN y Diccionario de Datos Físico[cite: 2, 4].<br>• Diseño Arquitectónico, Layouts de interfaz, Mapa Navegacional y Diseño de Informes[cite: 2]. | • Arquitectura híbrida resiliente en **Python 3.11+ (Django/FastAPI)** con base de datos central **PostgreSQL** y almacenamiento local cifrado **SQLite** con sincronización automática (**RNF-04**, **RNF-10**)[cite: 3, 4].<br>• Definición de PK simples, FK, PK compuestas (`NOTIFICACION_CORREO`) y dominios SQL[cite: 2, 4]. | • Diagrama de Clases Detallado y Modelo Relacional 3FN (Figuras 4.1 y 4.2)[cite: 2, 4].<br>• Diccionario de Datos Físico (Tabla 4.4) y script DDL (`sql/esquema_bibliovg_3fn.sql`)[cite: 2].<br>• Arquitectura, Layouts de pantallas, Mapa Navegacional e Informes (Figuras 4.3 a 4.6)[cite: 2]. |

---

## 3. Matriz de Cobertura — Rúbrica Módulo de Análisis TNS

| Desempeño / Competencia | Criterio Evaluado en Rúbrica | Evidencia Documentada en el Proyecto BiblioVG | Estado |
| :--- | :--- | :--- | :--- |
| **D1 y D2** (Análisis de Sistemas) | Diagnóstico narrativo y UML de la situación actual, análisis crítico, alternativas de solución y casos de uso. | **Capítulo 1 (1.1 a 1.6):** Levantamiento JAD y observación directa, diagramas As-Is/To-Be con Frontera de Automatización, evaluación Open Source vs SaaS y Casos de Uso (`CU-01` a `CU-03`)[cite: 2, 4, 5]. | Completado |
| **D3** (Especificación IEEE 830) | Construcción de Especificación de Requisitos Funcionales y No Funcionales verificables bajo estándar IEEE 830. | **Capítulo 2 (2.1 a 2.7):** 17 RF, 12 RNF con métricas de comprobación, requisitos de información/técnicos, plan de pruebas y matriz de validación IEEE 830[cite: 2, 3, 7]. | Completado |
| **D4 y D5** (Modelamiento Conceptual) | Modelo Entidad-Relación en herramienta CASE completo, legible y mínimo (sin redundancias), con documentación de entidades, atributos y relaciones. | **Capítulo 3 (3.1 y 3.2):** MERE normalizado, matriz de cardinalidades e integridad referencial (Tabla 3.2), diccionario conceptual y tabla de parámetros[cite: 2, 4]. | Completado |
| **D6** (Modelamiento Lógico) | Mapeo correcto desde el modelo conceptual al Modelo Relacional Lógico (PK, FK, dominios) previo a implementación. | **Capítulo 4 (4.1 y 4.2):** Transformación 3FN a 10 tablas relacionales (Figura 4.2, Tablas 4.2 a 4.4) y script DDL ejecutable (`sql/esquema_bibliovg_3fn.sql`)[cite: 2, 4]. | Completado |
| **CT1, CT2, CT3** (Transversales y Actitudinal) | Trabajo colaborativo responsable, respeto a marcos éticos/legales y rigurosidad documental. | Repositorio colaborativo en GitHub con aportes de los 3 integrantes, cumplimiento **Ley N° 19.628** (Checklist obligatorio en Tablets) y aplicación de normativa formal IPVG[cite: 3, 4, 5]. | Completado |

---

## 4. Plan de Implementación y Pruebas (Backlog Scrum)

- [x] **Fase 0 — Análisis, Especificación IEEE 830 y Diseño (Capítulos 1 al 4):** Levantamiento JAD, validación de prototipos con Alida Luengo, modelamiento UML/MERE/MR 3FN y entrega de informe final consolidado[cite: 2, 3, 4].
- [ ] **Sprint 1 — Núcleo de Seguridad y Préstamos (Semanas 2-3):**
  - Autenticación con credenciales institucionales (`RF-02`, `RNF-05`)[cite: 3, 4].
  - Registro de préstamos con cálculo automático a 15 días corridos (`RF-04`, `RF-08`, `RNF-09`)[cite: 3, 4, 7].
  - Bloqueo condicional por morosidad vigente (`RF-09`)[cite: 3, 4].
- [ ] **Sprint 2 — Control de Tablets y Contingencia Offline (Semanas 4-5):**
  - Checklist bloqueante de cierre de sesiones y estado físico en devolución de Tablets (`RF-05`, `RF-06`, `RNF-10` Ley N° 19.628)[cite: 3, 4].
  - Persistencia local en **SQLite** cifrado y sincronización automática con **PostgreSQL** (`RNF-04`)[cite: 3, 4].
  - Respaldos automáticos diarios de base de datos (`RNF-08`)[cite: 7].
- [ ] **Sprint 3 — Disponibilidad, Alertas y Reportes (Semanas 6-7):**
  - Portal web de consulta de disponibilidad en tiempo real y fecha estimada de retorno (`RF-07`, `RF-15`)[cite: 3, 4].
  - Notificaciones automáticas por correo institucional SMTP (`RF-10`, `RF-14`)[cite: 3, 4].
  - Comprobantes digitales (`RF-13`) y reportes exportables en PDF y Excel `.xlsx` (`RF-12`, `RF-17`)[cite: 3, 4].

---

## 5. Checklist de Exposición Final (Pauta de Cotejo — Máx. 10 Minutos)

- [ ] **Control de tiempo estricto:** Presentación ensayada bajo los **10 minutos máximos** exigidos por pauta.
- [ ] **Formalidad y participación:** Vestimenta formal de los 3 integrantes (**Bastián Alarcón**, **Ivanna Villarroel** y **Cristóbal Villalobos**) y exposición equilibrada con dominio técnico.
- [ ] **Cobertura de ítems evaluados (20 pts):**
  - [ ] Presentación del Instituto Profesional Virginio Gómez y Biblioteca Sede Concepción (2 pts)[cite: 2, 7].
  - [ ] Procesos actuales del área de estudio (As-Is) y brechas detectadas en sesión JAD (4 pts)[cite: 2, 7].
  - [ ] Solución propuesta **BiblioVG** y Frontera de Automatización To-Be (4 pts)[cite: 2, 5, 6].
  - [ ] Funcionalidades principales de la solución explicadas mediante **Casos de Uso** `CU-01`, `CU-02` y `CU-03` (4 pts)[cite: 2, 4].
  - [ ] Conclusiones técnicas, operativas y cierre del trabajo (2 pts)[cite: 3, 5, 7].
