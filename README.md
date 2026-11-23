# Sistema de Gestión de Préstamos y Recursos Bibliográficos — "BiblioVG"

* **Institución:** Instituto Profesional Virginio Gómez — Sede Concepción (Corporación Universidad de Concepción)[cite: 3, 7]
* **Departamento / Área de Estudio:** Departamento de Biblioteca — Proceso de Préstamo y Devolución de Recursos[cite: 7]
* **Módulo / Asignatura:** Módulo de Análisis TNS (Análisis de Sistemas, Análisis y Diseño Orientado a Objetos y Modelamiento de Datos)
* **Profesor Guía:** Iván San Martín[cite: 3]
* **Contraparte Institucional:** Alida Luengo (Bibliotecaria Encargada)[cite: 7]
* **Equipo de Proyecto (Equipo 4):**[cite: 3]
  * **Bastián Alarcón** (Facilitador / Coordinador)
  * **Ivanna Villarroel** (Analista de Requerimientos)
  * **Cristóbal Villalobos** (Documentador / Arquitecto)
* **Ciudad y Año:** Concepción, Chile — 2026[cite: 3]

---

## Resumen Ejecutivo del Proyecto

**BiblioVG** es un proyecto de análisis de sistemas, especificación de requerimientos (estándar **IEEE 830**) y diseño de software orientado a objetos y relacional (**3FN**), desarrollado para optimizar el proceso de préstamo y devolución de recursos bibliográficos y tecnológicos (**libros, calculadoras y tablets**) de la Biblioteca del Instituto Profesional Virginio Gómez, Sede Concepción[cite: 4, 6, 7].

A partir de un diagnóstico en terreno mediante **observación directa** y una **sesión colaborativa JAD** con la bibliotecaria encargada (Alida Luengo) y estudiantes de la sede, se identificaron tres problemáticas críticas en el funcionamiento actual con el sistema FOLIO[cite: 5, 7]:
1. **Vulnerabilidad en la verificación de identidad y privacidad:** Identificación únicamente verbal por RUT sin credencial institucional y devolución de tablets sin protocolo de cierre de sesiones personales, exponiendo datos privados bajo la **Ley N° 19.628**[cite: 7].
2. **Interrupción operativa ante caídas de red o energía:** Dependencia total de conexión en línea, trasladando los registros a hojas de papel sin formato estandarizado y provocando errores de transcripción[cite: 5, 7].
3. **Ausencia de consulta remota y reportes estadísticos:** Falta de visualización web de disponibilidad en tiempo real, notificaciones automáticas de vencimiento y reportes consolidados para la Dirección de Sede[cite: 5, 7].

### Propuesta de Solución Tecnológica (Stack Open Source)

Para resolver estas brechas con costo de licenciamiento **$0 (RNF-12)** y total compatibilidad con el equipamiento actual del mesón de atención **(RNF-06)**, se diseñó una arquitectura web híbrida basada en tecnologías de código abierto (**Python 3.11+ / Django-FastAPI**)[cite: 4, 7]:
* **Autenticación Institucional y Control Normativo (`RF-02`, `RF-06`):** Validación digital de credenciales IPVG y *Checklist* obligatorio bloqueante en la devolución de tablets para asegurar el cumplimiento de la **Ley N° 19.628**[cite: 4, 6].
* **Resiliencia y Contingencia Offline (`RNF-04`):** Persistencia local cifrada en **SQLite (AES-256)** ante cortes de conectividad, con sincronización automática e idempotente hacia el servidor central **PostgreSQL** al restablecer la red[cite: 4, 6].
* **Portal Web, Alertas SMTP y Reportería (`RF-10` a `RF-17`):** Consulta de stock en tiempo real con fecha estimada de retorno, avisos automáticos por correo institucional (3 días antes del vencimiento y en caso de mora) y exportación de estadísticas en **PDF** y **Excel (`.xlsx`)**[cite: 4, 6].

---

## Estructura del Repositorio

* `README.md`: Portada del proyecto, ficha institucional y resumen ejecutivo.
* `BITACORA.md`: Registro cronológico de avances (Capítulos 1 al 4), matriz de cobertura de la rúbrica TNS, planificación Scrum y checklist de exposición[cite: 3, 7].
* `docs/`: Informe final consolidado (`Proyecto terminado Revision.docx`) y respaldos documentales.
* `diagramas/`: Diagramas UML 2.5 (Clases Conceptual y Detallado, Actividades con *swimlanes*, Máquina de Estados, Despliegue), MERE, Modelo Relacional 3FN y Layouts de interfaz[cite: 3, 6].
* `sql/`: Script DDL de creación de tablas relacionales en Tercera Forma Normal (`esquema_bibliovg_3fn.sql`).
