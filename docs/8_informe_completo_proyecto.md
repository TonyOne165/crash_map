# INFORME COMPLETO DEL PROYECTO
## CrashMap Cartagena - Sistema de Gestión y Análisis de Accidentalidad Vial

---

**Entidad:** Secretaría de Movilidad — Distrito de Cartagena de Indias  
**Sistema:** CrashMap Cartagena v4.0  
**Fecha:** Abril 2026  
**Ubicación (Producción):** Cartagena de Indias (10.3910°N, -75.4794°W)  

---

## ÍNDICE
1. [Resumen Ejecutivo](#resumen-ejecutivo)
2. [Objetivo General](#objetivo-general)
3. [Objetivos Específicos](#objetivos-específicos)
4. [Visión General de Funcionalidades](#visión-general-de-funcionalidades)
5. [Descripción Detallada de Módulos](#descripción-detallada-de-módulos)
6. [Arquitectura Técnica](#arquitectura-técnica)
7. [Infraestructura](#infraestructura)
8. [Flujo de Información](#flujo-de-información)
9. [Usuarios y Roles](#usuarios-y-roles)
10. [Indicadores de Éxito](#indicadores-de-éxito)
11. [Conclusiones](#conclusiones)

---

## RESUMEN EJECUTIVO

### ¿Qué es CrashMap Cartagena?

**CrashMap Cartagena** es una plataforma tecnológica integral y de código abierto desarrollada para centralizar, analizar y gestionar en tiempo real la información sobre accidentalidad vial en el Distrito de Cartagena de Indias.

El sistema integra:
- **Historiales** de accidents reales (datos históricos consolidados)
- **Reportes en tiempo real** desde ciudadanía y operadores
- **Inteligencia Artificial (IA)** y Machine Learning (ML) para análisis predictivo
- **Herramientas de operación** para toma de decisiones inmediata
- **Información pública** para ciudadanía y planificadores urbanos

### Problema que Resuelve

La accidentalidad vial en Cartagena ha sido un problema crítico de seguridad pública y movilidad urbana. Antes de CrashMap:

- ❌ No existía una herramienta centralizada para consolidar accidentes
- ❌ Era imposible identificar "puntos negros" en tiempo real
- ❌ Los operadores de turno carecían de dashboard de control
- ❌ No se podían medir impactos de intervenciones viales
- ❌ La información estaba desagregada en múltiples sistemas

### Solución Propuesta

CrashMap proporciona:

✅ **Panel central** con toda la información de accidentes  
✅ **Visualización geoespacial** mediante mapas de calor interactivos  
✅ **Predicción automática** de zonas de riesgo (IA)  
✅ **Alertas en tiempo real** cuando se supera umbral en zonas  
✅ **Control SLA** de incidentes para operadores  
✅ **Análisis comparativo** anual para medir impacto  
✅ **PWA móvil** para reportes desde campo  

---

## OBJETIVO GENERAL

**Centralizar, analizar y gestionar información sobre accidentalidad vial en Cartagena mediante una plataforma tecnológica integrada, que facilite la toma de decisiones operativas en tiempo real y permita medir el impacto de intervenciones en seguridad vial.**

---

## OBJETIVOS ESPECÍFICOS

### 1. **CAPTURA Y CONSOLIDACIÓN DE DATOS**
   - Recibir reportes de accidentes desde múltiples fuentes (manual, móvil, Excel, sistemas externos)
   - Validar y estandarizar información de accidentes
   - Mantener historiales completos con metadatos (fecha, hora, clima, tipo vehículo, etc.)
   - **Resultado esperado:** Base de datos centralizada con 100% de accidentes registrados

### 2. **ANÁLISIS GEOESPACIAL EN TIEMPO REAL**
   - Visualizar accidentes en mapas interactivos con filtros avanzados
   - Identificar "puntos negros" mediante clustering automático (KMeans)
   - Generar mapas de calor por zona, día, hora y severidad
   - **Resultado esperado:** Operadores pueden detectar zonas críticas en < 2 minutos

### 3. **PREDICCIÓN DE RIESGO CON MACHINE LEARNING**
   - Entrenar modelo neuronal (PyTorch) para predecir riesgo por franja horaria
   - Incorporar variables: hora del día, día de semana, clima, histórico
   - Generar "mapas predictivos" que anticipe dónde ocurrirán accidentes
   - **Resultado esperado:** Precisión > 70% en predicciones de riesgo

### 4. **OPERACIÓN EN TIEMPO REAL**
   - Proporcionar dashboard de control para sala de operaciones (Panel de Turno)
   - Implementar alertas automáticas cuando accidentes superen umbral por zona
   - Gestionar incidentes activos con control SLA
   - **Resultado esperado:** Respuesta operativa en < 15 minutos

### 5. **PLANIFICACIÓN INTELIGENTE DE RUTAS**
   - Analizar rutas seguras para ciudadanía basado en histórico de accidentes
   - Proporcionar alternativas de trayectos con menor riesgo
   - **Resultado esperado:** Ciudadanía tiene acceso a recomendaciones de rutas seguras

### 6. **MEDICIÓN DE IMPACTO DE INTERVENCIONES**
   - Comparar accidentalidad año a año (interanual)
   - Permitir marcar zonas "intervenidas" vs "sin intervenir"
   - Calcular reducción de accidentes post-intervención
   - **Resultado esperado:** Demostrar ROI de proyectos de movilidad

### 7. **ASISTENCIA INTELIGENTE CIUDADANA**
   - Implementar chatbot IA que responda preguntas sobre accidentalidad
   - Proporcionar estadísticas abiertas al público (Panel Público)
   - Información sobre zonas seguras, alertas y tendencias
   - **Resultado esperado:** Ciudadanía informada toma mejores decisiones

### 8. **INTEGRACIÓN MULTIMODAL**
   - Integrar feeds de cámaras de tránsito (MJPEG)
   - Conectar con sistemas externos de transporte público
   - Recibir alertas de fuentes externas (policía, bomberos, etc.)
   - **Resultado esperado:** Información consolidada de múltiples fuentes

### 9. **ESCALABILIDAD Y SOSTENIBILIDAD**
   - Diseñar arquitectura escalable (Frontend React, Backend FastAPI)
   - Permitir fácil integración con otros municipios
   - Documentación completa para transferencia tecnológica
   - **Resultado esperado:** Código reutilizable en otros contextos

---

## VISIÓN GENERAL DE FUNCIONALIDADES

CrashMap está distribuido en **5 categorías de módulos**, accesibles según rol del usuario:

### 📊 **MÓDULOS DE ACCESO GENERAL** (Todos los usuarios autenticados)
```
1. Mapa de Calor          → Visualización interactiva de accidentes
2. Ruta Segura            → Planificador de rutas de menor riesgo
3. Asistente IA (Chat)    → Chatbot inteligente sobre accidentalidad
4. Panel Público          → Estadísticas abiertas a ciudadanía
5. Reportar Accidente     → App PWA móvil para reporte en campo
```

### 🚨 **MÓDULOS DE OPERACIÓN** (Administradores)
```
1. Dashboard              → Panel principal con métricas y control
2. Gestión Incidentes     → Control de incidentes activos (SLA)
3. Panel de Turno         → Pantalla control para sala operaciones (TV)
4. Alertas por Zona       → Configuración de alertas automáticas
```

### 📈 **MÓDULOS DE ANÁLISIS** (Administradores)
```
1. Puntos Negros          → Identificación de zonas críticas
2. Comparativo Interanual → Análisis año a año de accidentes
3. Predicción Riesgo      → Mapas predictivos con IA
```

### ⚙️ **MÓDULOS DE CONFIGURACIÓN** (Administradores)
```
1. Cámaras de Tránsito    → Gestión de feeds MJPEG en vivo
2. Importar Datos         → Carga masiva desde archivos Excel
3. Fuentes Externas       → Integración con sistemas externos
4. Geocercas              → Zonas virtuales de monitoreo (GeoJSON)
5. Códigos QR             → Generación de QR para reportes rápidos
```

---

## DESCRIPCIÓN DETALLADA DE MÓDULOS

### 1️⃣ MAPA DE CALOR 🔥

**Propósito:** Visualización geoespacial de toda la accidentalidad en Cartagena

**Funcionalidades:**
- Mapa interactivo con Leaflet.js + OpenStreetMap
- Visualización en tiempo real de accidentes como marcadores
- Mapa de calor (heatmap) que muestra densidad de accidentes
- Filtros avanzados:
  - Por rango de fechas
  - Por gravedad (leve, grave, fatal)
  - Por tipo de vehículo
  - Por barrio
  - Por fuente de reporte
- Información emergente al hacer click en accidente
- Zoom y pan interactivos
- Exportar mapa como imagen PNG

**Datos mostrados:**
```
Para cada accidente:
├── Ubicación (lat/lng)
├── Fecha y hora exacta
├── Barrio
├── Gravedad (leve/grave/fatal)
├── Tipo de vehículos involucrados
├── Descripción
├── Condiciones climáticas
└── Estado de la vía
```

**Usuarios:** Todos los autenticados  
**Frecuencia de uso:** Múltiples veces por día

---

### 2️⃣ RUTA SEGURA 🗺️

**Propósito:** Planificar trayectos con menor riesgo de accidentes

**Funcionalidades:**
- Seleccionar origen y destino en mapa
- Análisis de riesgo por zona
- Proponer 3 rutas alternativas (verde/amarillo/rojo)
- Verde: Ruta segura (bajo riesgo)
- Amarillo: Ruta moderada (riesgo medio)
- Rojo: Ruta evitar si es posible (alto riesgo)
- Información de tiempo estimado y distancia
- Historial de rutas frecuentes

**Algoritmo:**
```
Para cada segmento vial:
1. Obtener accidentes históricos en buffer de 100m
2. Calcular densidad de accidentes últimos 30 días
3. Asignar puntuación de riesgo (0-100)
4. Proponer rutas alternativas mediante pathfinding
5. Colorear según riesgo acumulado
```

**Usuarios:** Todos los autenticados (especialmente ciudadanía)  
**Impacto esperado:** Reducir exposición a zonas de alto riesgo

---

### 3️⃣ ASISTENTE IA (CHAT) 🤖

**Propósito:** Responder preguntas sobre accidentalidad en lenguaje natural

**Funcionalidades:**
- Chat conversacional con IA (Claude/Anthropic)
- Responder preguntas como:
  - "¿Cuál es la zona más peligrosa?"
  - "¿A qué hora va a lluvia hoy?"
  - "¿Cuántos accidentes hubo el lunes?"
  - "¿Qué barrios son seguro para ir en moto?"
- Acceso a base de datos de accidentes en tiempo real
- Contexto de condiciones climáticas (OpenWeather API)
- Respuestas en español conversacional
- Historial de conversaciones

**Casos de uso:**
- Ciudadanía consultando sobre seguridad vial
- Operadores pidiendo análisis rápidos
- Reportes de situación por demanda

**Usuarios:** Todos los autenticados  
**Modelo:** Claude (Anthropic)

---

### 4️⃣ PANEL PÚBLICO 📢

**Propósito:** Información abierta para ciudadanía sobre accidentalidad

**Funcionalidades:**
- Estadísticas generales (accidentes totales, tasa anual, etc.)
- Gráficos de tendencias sin autenticación
- Top 10 barrios por accidente
- Análisis por hora del día
- Análisis por tipo de vehículo
- Análisis por gravedad
- Mapa público de calor (sin detalles sensibles)
- **NO requiere login**

**Limitaciones:**
- No acceso a datos personales
- Datos agregados (no accidentes individuales)
- Estadísticas generales únicamente

**Usuarios:** Ciudadanía en general (sin autenticación)  
**Objetivo:** Transparencia y conciencia

---

### 5️⃣ REPORTAR ACCIDENTE 📝

**Propósito:** Captura de accidentes desde campo en tiempo real

**Características:**
- **App PWA** (Progressive Web App) - funciona sin conexión
- Interfaz simplificada para reportar desde celular
- Campos del reporte:
  - Ubicación (GPS automático)
  - Fecha y hora
  - Gravedad (selector 1-5)
  - Tipo de vehículos
  - Descripción breve
  - Foto del accidente (opcional)
- Validación básica antes de enviar
- Confirmación visual al reportar
- **Hash desde URL** para acceso directo (#reportar)
- Service Worker para funcionar sin conexión

**Flujo:**
```
1. Usuario abre app desde celular
2. Se solicita permiso de geolocalización
3. Rellena datos del accidente
4. App envía al backend (o cola si no hay conexión)
5. Backend valida y aprueba/rechaza
6. Notificación al operador
```

**Usuarios:** Agentes de tránsito, polícia, ciudadanía general  
**Impacto:** Mayor cobertura de reportes desde campo

---

### 6️⃣ DASHBOARD 🏠

**Propósito:** Panel principal para administradores con control y métricas

**Componentes:**
```
┌─────────────────────────────────────────────────┐
│  DASHBOARD PRINCIPAL                            │
├─────────────────────────────────────────────────┤
│  📊 TARJETAS DE MÉTRICAS                        │
│  ├─ Total accidentes este mes                   │
│  ├─ Promedio diario                             │
│  ├─ Gravedad promedio                           │
│  └─ Zona más crítica hoy                        │
│                                                 │
│  📈 GRÁFICOS                                    │
│  ├─ Tendencia últimos 30 días                   │
│  ├─ Distribución por hora                       │
│  ├─ Distribución por barrio                     │
│  ├─ Distribución por gravedad                   │
│  └─ Distribución por tipo vehículo              │
│                                                 │
│  🎯 ACCIONES RÁPIDAS                            │
│  ├─ Crear nuevo accidente                       │
│  ├─ Gestionar incidentes                        │
│  ├─ Ver alertas pendientes                      │
│  └─ Exportar reporte PDF                        │
└─────────────────────────────────────────────────┘
```

**Funcionalidades:**
- Gráficos con Chart.js (interactivos)
- Filtros de rango de fechas
- Exportación a PDF (ReportLab)
- Actualización automática cada 5 min
- Atajo a otros módulos

**Usuarios:** Administradores  
**Frecuencia:** Múltiples veces por turno

---

### 7️⃣ GESTIÓN DE INCIDENTES 🚨

**Propósito:** Control operativo de incidentes activos con SLA

**Campos por incidente:**
```
├─ ID único
├─ Accidente asociado (lat/lng)
├─ Estado: Abierto → En atención → Cerrado
├─ Tiempo SLA (15 min por defecto)
├─ Cronómetro en tiempo real
├─ Asignado a (operador)
├─ Notas de atención
├─ Equipos despachados (ambulancia, policía, etc.)
├─ Fotos de documentación
└─ Fecha cierre
```

**Funcionalidades:**
- Lista de incidentes activos ordenada por SLA
- Color rojo si se supera SLA (urgencia visual)
- Cambiar estado con botones
- Agregar notas en tiempo real
- Desificar como "resuelto"
- Historial de cambios
- Filter por estado/asignado/zone
- WebSocket para actualizaciones en vivo

**Alertas:**
- Notificación roja cuando falta 1 min para vencer SLA
- Email/WhatsApp al operador asignado
- Escalación al supervisor si se vence

**Usuarios:** Operadores y supervisores de turno  
**Impacto:** Garantizar respuesta rápida

---

### 8️⃣ PANEL DE TURNO 📺

**Propósito:** Pantalla de control para sala de operaciones (en TV)

**Características:**
- Interfaz full-screen en 1080p/4K
- Actualización automática cada 10 seg
- Métrica grande: Accidentes HOY
- Reloj digital
- Gráfico de incidentes activos
- Mapa en tiempo real de accidentes del día
- Alertas y notificaciones prominentes
- NO requiere interacción (solo lectura)

**Casos de uso:**
- Pantalla fija en sala de operaciones
- Referencia visual rápida para supervisores
- Información en briefing de turno

**Usuarios:** Personal en sala de operaciones  
**Formato:** Full-screen, fácil lectura desde distancia

---

### 9️⃣ ALERTAS POR ZONA ⚡

**Propósito:** Configurar alertas automáticas cuando accidentes superan umbral

**Funcionalidades:**
- Crear alertas por barrio/zona
- Establecer umbral (ej: > 3 accidentes en 30 min)
- Seleccionar tipos de accidente a monitorear
- Elegir canal de notificación:
  - Notificación en app
  - Email
  - SMS (Twilio)
  - WhatsApp (Twilio)
- Activar/desactivar alertas
- Histórico de alertas disparadas
- Configurar "horas de silencio" (no alertar después de horario)

**Ejemplo de regla:**
```
ZONA: Bocagrande
UMBRAL: >= 2 accidentes graves en 30 min
ACCIONES: 
├─ Notificación en app
├─ Email a supervisor
└─ SMS a operador guardia
ACTIVO: Si
HORARIO: 6am - 10pm
```

**Usuarios:** Administradores y supervisores  
**Impacto:** Respuesta proactiva a crisis

---

### 🔟 PUNTOS NEGROS 🔴

**Propósito:** Identificación automática de zonas críticas mediante clustering

**Algoritmo (KMeans):**
```
1. Obtener últimos N accidentes (últimos 90 días)
2. Normalizar coordenadas (lat/lng)
3. Aplicar KMeans clustering (k=15 clusters)
4. Identificar cluster con mayor densidad
5. Calcular radio de influencia para cada cluster
6. Rankear por número de accidentes y gravedad promedio
```

**Salida:**
```
TOP PUNTOS NEGROS:
┌──────────────────────────────────────┐
│ 1. Bocagrande - Carrera 2            │
│    📊 12 accidentes últimos 30 días   │
│    ⚠️  Gravedad promedio: 2.8/5       │
│    📍 Radio: 200m                     │
│    ✅ INTERVENIDO: No                 │
├──────────────────────────────────────┤
│ 2. Getsemaní - Calle San Juan         │
│    📊 11 accidentes últimos 30 días   │
│    ... (más detalles)                 │
└──────────────────────────────────────┘
```

**Funcionalidades:**
- Ranking dinámico de puntos negros
- Marcar punto como "Intervenido" 
- Agregar notas sobre intervención
- Mostrar histórico de tendencia
- Fecha de intervención proyectada
- Impacto esperado (reducción %)
- Exportar reporte de puntos negros

**Usuarios:** Analistas, planificadores viales  
**Frecuencia:** Una vez por semana

---

### 1️⃣1️⃣ COMPARATIVO INTERANUAL 📊

**Propósito:** Medir impacto de intervenciones comparando año a año

**Análisis:**
```
AÑO 2024:
├─ Total accidentes: 2,450
├─ Promedio diario: 6.7
├─ Gravedad promedio: 2.1/5
└─ Barrio más peligroso: Bocagrande (187)

AÑO 2025:
├─ Total accidentes: 2,180
├─ Promedio diario: 6.0
├─ Gravedad promedio: 1.9/5
└─ Barrio más peligroso: Bocagrande (156)

VARIACIÓN:
├─ Reducción total: 11.0% ✅
├─ Mejora diaria: 10.4% ✅
├─ Reducción gravedad: 9.5% ✅
└─ Mejora Bocagrande: 16.6% ✅ (INTERVENCIÓN)
```

**Gráficos:**
- Timeline lineal comparando años
- Barras por barrio (año vs año)
- Matriz de calor (mes × gravedad)
- Tabla detallada con variaciones

**Filtros:**
- Rango de fechas personalizado
- Por barrio
- Por gravedad
- Por tipo vehículo

**Usuarios:** Tomadores de decisión, analistas políticas públicas  
**Impacto:** Demostrar ROI de intervenciones

---

### 1️⃣2️⃣ PREDICCIÓN DE RIESGO 🔮

**Propósito:** Mapas predictivos que anticipan zonas de alto riesgo

**Modelo ML:**
```
ENTRADA:
├─ Hora del día (0-23)
├─ Día de semana (0-6)
├─ Clima (despejado/lluvia/nublado)
├─ Histórico 30 días
└─ Factores de riesgo conocidos

RED NEURONAL (PyTorch):
├─ Input layer: 8 features
├─ Hidden layers: [64, 32, 16]
├─ Output: 20x20 grid de riesgos (0-100)
└─ Entrenamiento: ADAM optimizer

SALIDA:
├─ Mapa de riesgo para próximas 24h
├─ Predicción por zona geográfica
├─ Confianza de predicción
└─ Recomendaciones de patrullaje
```

**Interfaz:**
- Mapa de calor con gradiente rojo (alto riesgo) a verde (bajo)
- Selector para elegir hora futura
- Mostrar variables que influyen en predicción
- Comparar con real (cuando llega)
- Slider de confianza

**Ejemplo:**
```
Predicción para HOY 6pm:
└─ Zona Bocagrande: ALTO RIESGO (82/100)
   Factores: Viernes + hora pico + clima lluvia
   Recomendación: Aumentar patrullaje
```

**Usuarios:** Operadores, planificadores  
**Impacto:** Prevención proactiva

---

### 1️⃣3️⃣ CÁMARAS DE TRÁNSITO 📹

**Propósito:** Integración y monitoreo de feeds de cámaras MJPEG en vivo

**Funcionalidades:**
- Agregar URL de cámara MJPEG
- Nombre/ubicación de cámara
- Mostrar feed en tiempo real
- Zoom digital
- Cambiar entre cámaras con botones
- Grabar clips de accidente (opcional)
- Auditar acceso a feeds (logs)

**Requisitos técnicos:**
- Cámaras IP con salida MJPEG
- URL accesible desde red (ej: http://192.168.1.100/mjpeg)
- Token/credenciales si requiere autenticación

**Casos de uso:**
- Operador ve accidente en tiempo real
- Validar reporte ciudadano
- Documentar escena
- Investigación post-accidente

**Usuarios:** Operadores  
**Limitación:** Depende de disponibilidad de cámaras

---

### 1️⃣4️⃣ IMPORTAR DATOS ⬆️

**Propósito:** Carga masiva de accidentes desde archivos Excel

**Formato esperado (Excel):**
```
| Fecha      | Hora  | Barrio | Gravedad | Vehículo 1 | Vehículo 2 | Clima    |
|-----------|-------|--------|----------|-----------|-----------|----------|
| 2025-01-15| 14:30 | Bocag. | Grave    | Auto      | Moto      | Despejad|
| 2025-01-15| 15:45 | Getsem | Leve     | Auto      | -         | Lluvia   |
```

**Funcionalidades:**
- Cargar archivo Excel
- Validar estructura y campos
- Mostrar vista previa (primeros 10 registros)
- Detectar duplicados
- Mostrar errores por fila
- Importar con opción de "actualizar duplicados" o "ignorar"
- Registrar fuente como "excel"
- Log de importación

**Seguridad:**
- Validar tipos de datos
- Requerir autenticación admin
- Auditar quién/cuándo importó
- Opción de "dry run" antes de confirmar

**Usuarios:** Administradores  
**Frecuencia:** Carga histórica inicial, luego ocasional

---

### 1️⃣5️⃣ FUENTES EXTERNAS 📡

**Propósito:** Integración con sistemas externos que envían accidentes

**Proveedores potenciales:**
- Policía Nacional (sistema de denuncias)
- Hospital Universitario (reportes de trauma)
- Transporte público (reportes de conductores)
- Google (datos anonimizados de congestión)
- APIs de terceros

**Mecanismo de integración:**
```
FUENTE EXTERNA → API Webhook CrashMap
                ├─ Validar token de seguridad
                ├─ Deserializar JSON
                ├─ Mapear campos
                ├─ Crear accidente con fuente="externa"
                └─ Notificar al admin
```

**Configuración:**
- Nombre de fuente
- URL webhook único generado
- Token de autenticación
- Mapeo de campos (cómo convertir formato externo)
- Activar/desactivar fuente
- Histórico de solicitudes

**Seguridad:**
- Autenticación por token único
- Rate limiting por fuente
- Validación de JSON
- Log de todos los WebHooks

**Usuarios:** Administradores técnicos  
**Impacto:** Información consolidada

---

### 1️⃣6️⃣ GEOCERCAS 🔶

**Propósito:** Crear zonas virtuales geográficas para monitoreo y alertas

**Características:**
- Dibujar polígono en mapa (GeoJSON)
- Nombre descriptivo (ej: "Sector Hospital")
- Nivel de alerta (bajo/medio/alto/crítico)
- Activar/desactivar geocerca
- Descripción de la zona

**Uso:**
```
GEOCERCA: "Bocagrande - Zona Turística"
├─ Polígono: GeoJSON con 4 vértices
├─ Nivel: ALTO
├─ Descripción: Área de mayor flujo turístico, vigilancia 24/7
└─ ACTIVA: Si

Cuando accidente cae dentro de geocerca:
├─ Se marca con color especial
├─ Se agrega tag "Bocagrande - Zona Turística"
├─ Alerta especial si nivel es ALTO
└─ Reporta específicamente a supervisor de zona
```

**Algoritmo de detección:**
```
Para cada accidente nuevo:
1. Obtener lat/lng del accidente
2. Para cada geocerca activa:
   - ¿Punto está dentro del polígono?
   - Si SI: Marcar accidente con tag de geocerca
3. Si nivel=ALTO y nueva geocerca: Disparar alerta
```

**Usuarios:** Administradores  
**Impacto:** Control granular por zona

---

### 1️⃣7️⃣ CÓDIGOS QR 📱

**Propósito:** Generar código QR para reportes rápidos desde campo

**Funcionalidad:**
- Generar QR que enlace directamente a "Reportar accidente"
- Imprimible en tarjetas para distribuir
- QR apunta a: `https://crashmap.local/#reportar`
- Al escanear: Abre app y va a módulo de reporte

**Casos de uso:**
- Pegar QR en semáforos dañados
- Distribuir en tarjetas a agentes
- Información en campañas públicas
- Fácil acceso sin necesidad de link complejo

**Técnica:**
- Librería QR.js para generar código
- Enlace hash (#reportar) para navegación
- PNG descargable/imprimible

**Usuarios:** Administradores (para imprimir)  
**Impacto:** Mayor reportería ciudadana

---

## ARQUITECTURA TÉCNICA

### Stack Tecnológico

```
┌─────────────────────────────────────────────────────────────┐
│                   CLIENTE (FRONTEND)                        │
│  React 18 + Leaflet.js + Chart.js + Axios                   │
│  PWA: Service Worker + Web App Manifest                      │
├─────────────────────────────────────────────────────────┤
│           RED (HTTPS + WebSocket)                           │
├─────────────────────────────────────────────────────────────┤
│                   SERVIDOR (BACKEND)                        │
│  FastAPI (Python 3.x)                                        │
│  ├─ API REST endpoints                                       │
│  ├─ WebSocket para tiempo real                             │
│  ├─ JWT Authentication                                       │
│  └─ Rate Limiting                                            │
├─────────────────────────────────────────────────────────────┤
│                   SERVICIOS                                  │
│  ├─ Base de datos: PostgreSQL                               │
│  ├─ IA/Chat: Anthropic Claude API                           │
│  ├─ Notificaciones: Twilio (SMS/WhatsApp)                   │
│  ├─ Clima: OpenWeather API                                  │
│  ├─ ML Model: PyTorch (modelo_riesgo.pt)                    │
│  └─ Mapas: OpenStreetMap + Leaflet                          │
└─────────────────────────────────────────────────────────────┘
```

### Frontend (React)

**Estructura:**
```
frontend/src/
├── index.js                 # Entry point
├── App.jsx                  # Componente raíz
├── api.js                   # Cliente HTTP (Axios)
├── App.css                  # Estilos globales
├── crashmap-styles.css      # Estilos específicos
├── components/              # Componentes React
│   ├── Login.jsx
│   ├── Dashboard.jsx
│   ├── MapaCalor.jsx
│   ├── RutaSegura.jsx
│   ├── ChatIA.jsx
│   ├── PanelPublico.jsx
│   ├── ReporteAccidente.jsx
│   ├── GestorIncidentes.jsx
│   ├── PanelTurno.jsx
│   ├── AlertasZona.jsx
│   ├── PuntosNegros.jsx
│   ├── ComparativoInteranual.jsx
│   ├── PrediccionRiesgo.jsx
│   ├── CamarasPanel.jsx
│   ├── ImportarDatos.jsx
│   ├── FuentesExternas.jsx
│   ├── Geocercas.jsx
│   ├── PerfilPanel.jsx
│   └── Toast.jsx
└── hooks/                   # React Hooks
    └── useToast.js
```

**Características:**
- Componentes reutilizables
- State management con hooks
- Lazy loading opcional (try/catch en App.jsx)
- Notificaciones toast (esquina inferior derecha)
- Estilos con variables CSS
- PWA lista para offline

### Backend (FastAPI)

**Estructura (main.py):**
```python
Features:
├── SQLAlchemy ORM para modelos
├── JWT authentication
├── CORS middleware
├── WebSocket support
├── Error handling y validación
├── Database auto-migration
└── Graceful degradation (IA/ML opcionales)
```

**Base de Datos:**
```
Tablas:
├── usuarios               # Cuentas de acceso
├── accidentes             # Registro de accidentes
├── factores_riesgo        # Puntos críticos
├── notificaciones         # Alertas y mensajes
└── geocercas              # Zonas virtuales
```

**Modelos SQLAlchemy:**
```python
Usuario:
  ├─ id, username, email
  ├─ hashed_password (bcrypt)
  ├─ es_admin (boolean)
  └─ created_at

Accidente:
  ├─ id, latitud, longitud
  ├─ barrio, fecha_hora
  ├─ gravedad (leve/grave/fatal)
  ├─ tipo_vehiculo, clima, estado_via
  ├─ dia_festivo, hora_pico
  ├─ descripción, reportado_por
  ├─ estado (pendiente/aprobado/rechazado)
  ├─ fuente (manual/excel/externo)
  └─ created_at

FactorRiesgo:
  ├─ id, latitud, longitud
  ├─ tipo_factor (semáforo_dañado/hueco/cruce_peligroso)
  ├─ nivel_riesgo (0-1)
  ├─ activo
  └─ updated_at

Geocerca:
  ├─ id, nombre, descripción
  ├─ poligono_geojson (GeoJSON string)
  ├─ nivel_alerta (bajo/medio/alto/crítico)
  ├─ activa
  └─ created_at
```

### Machine Learning

**Modelo de Predicción de Riesgo:**
```
Archivo: backend/modelo_riesgo.pt (PyTorch)

Entrada:
├─ Hora del día (0-23) → normalizado
├─ Día de semana (0-6)
├─ Código clima (0-4)
├─ 30 últimos accidentes por zona
└─ Factores de riesgo activos

Arquitectura Neural:
Input(8) → Dense(64, ReLU) 
        → Dense(32, ReLU)
        → Dense(16, ReLU)
        → Output(400) [20x20 grid]
        → Sigmoid → [0,1] rango

Entrenamiento:
├─ Optimizer: ADAM
├─ Loss: BCEWithLogitsLoss
└─ Épocas: 50+
```

**Clustering (KMeans):**
```
Para identificar puntos negros:
├─ Normalizar coordenadas
├─ k=15 clusters
├─ StandardScaler
├─ Iterar hasta convergencia
├─ Ranking por densidad + gravedad
```

### APIs Externas Integradas

| Servicio | Propósito | Biblioteca |
|----------|-----------|-----------|
| Claude (Anthropic) | Chat IA | `anthropic` |
| Twilio | SMS/WhatsApp | `twilio` |
| OpenWeather | Clima | HTTP request |
| OpenStreetMap | Mapas | Leaflet.js |
| Geopy | Geocodificación | `geopy` |

---

## INFRAESTRUCTURA

### Requisitos Mínimos

```
SERVIDOR DE PRODUCCIÓN:
├─ CPU: 2 núcleos
├─ RAM: 4 GB
├─ Almacenamiento: 50 GB SSD
├─ SO: Ubuntu 20.04+ o Windows Server 2019+
├─ Python: 3.9+
└─ Node.js: 16+

RED:
├─ Ancho de banda: 5 Mbps (mínimo)
├─ Latencia: < 50ms
└─ Conectividad: Internet pública para APIs

CLIENTES:
├─ Navegadores: Chrome 90+, Firefox 88+, Edge 90+
├─ Celulares: iOS 12+ / Android 6+
└─ PWA: Almacenamiento offline 50 MB
```

### Instalación

```bash
# Backend
cd backend
pip install -r requirements.txt
python setup_database.py
python main.py  # Uvicorn on 0.0.0.0:8000

# Frontend
cd frontend
npm install
npm start      # React dev server on :3000
```

### Base de Datos

```bash
# PostgreSQL (producción)
createdb accidentalidad_ctg
# User: postgres | Password: [configured]

# SQLite (desarrollo)
# Automático en backend/accidentes.db
```

---

## FLUJO DE INFORMACIÓN

```
┌────────────────────┐
│   REPORTAR ACCIDENTE (PWA MÓVIL)
│   ├─ GPS location
│   ├─ Gravedad
│   └─ Descripción
└──────────────┬─────┘
               │ POST /api/accidentes
               ▼
┌────────────────────┐
│   BACKEND (FastAPI)
│   ├─ Validar datos
│   ├─ Guardar en DB
│   └─ Notificar via WebSocket
└──────────────┬─────┘
               │
      ┌────────┼────────┐
      │        │        │
      ▼        ▼        ▼
   ┌──┐    ┌──┐    ┌──────┐
   │DB│    │IA│    │Alert │
   └──┘    └──┘    └──────┘
      │        │        │
      └────────┼────────┘
               │
               ▼
   ┌─────────────────────────┐
   │  NOTIFICACIONES
   │  ├─ In-app notification
   │  ├─ Email (SMTP)
   │  ├─ SMS/WhatsApp (Twilio)
   │  └─ WebSocket broadcast
   └─────────────────────────┘
               │
               ▼
   ┌─────────────────────────┐
   │  DASHBOARD/OPERACIONES
   │  ├─ Mapa actualizado
   │  ├─ Incidente creado
   │  └─ Operador notificado
   └─────────────────────────┘
```

---

## USUARIOS Y ROLES

### 1. **CIUDADANÍA GENERAL** 👥
- **Acceso:** Sin autenticación (Panel Público)
- **Módulos:** Mapa Calor (lectura), Ruta Segura, Chat IA
- **Acciones:** Ver estadísticas, reportar accidente
- **Responsabilidades:** Mantener información actualizada de reportes

### 2. **AGENTES DE TRÁNSITO** 👮‍♂️
- **Acceso:** Autenticación JWT
- **Módulos:** Reportar Accidente (PWA), Chat IA, Mapa Calor, Ruta Segura
- **Acciones:** Reportar en tiempo real, consultar datos
- **Responsabilidades:** Validez de reportes, actualización en campo

### 3. **OPERADORES DE TURNO** 👨‍💼
- **Acceso:** Autenticación JWT
- **Módulos:** Dashboard, Gestión Incidentes, Panel de Turno, Mapa Calor
- **Acciones:** Controlar SLA, asignar recursos, crear alertas
- **Responsabilidades:** Respuesta inmediata a incidentes

### 4. **SUPERVISORES** 👔
- **Acceso:** Autenticación JWT + admin
- **Módulos:** Todos
- **Acciones:** Configurar alertas, revisar reportes, escalar incidentes
- **Responsabilidades:** Calidad de operación, SLA

### 5. **ANALISTAS DE DATOS** 📊
- **Acceso:** Autenticación JWT + admin
- **Módulos:** Comparativo Interanual, Puntos Negros, Predicción, Análisis
- **Acciones:** Generar reportes, identificar tendencias
- **Responsabilidades:** Insight para políticas públicas

### 6. **ADMINISTRADORES TÉCNICOS** ⚙️
- **Acceso:** Autenticación JWT + admin
- **Módulos:** Todos
- **Acciones:** Importar datos, gestionar cámaras, configurar fuentes externas
- **Responsabilidades:** Mantenimiento técnico, integraciones

### 7. **SECRETARÍA DE MOVILIDAD** 🎯
- **Acceso:** Administración central
- **Modules:** Reportes ejecutivos, Dashboard, Políticas
- **Responsabilidades:** Toma de decisión estratégica

---

## INDICADORES DE ÉXITO

### Métricas de Proceso

| Indicador | Meta | Medición |
|-----------|------|----------|
| **Tiempo de Respuesta SLA** | ≤ 15 min | % incidentes cerrados a tiempo |
| **Cobertura de Reporte** | 80%+ | Accidentes reportados / totales |
| **Uptime del Sistema** | 99%+ | Horas disponible / total |
| **Tiempo de Carga Mapa** | ≤ 2 seg | Latencia promedio |
| **Precisión de Predicción** | ≥ 70% | Aciertos / total predicciones |

### Métricas de Impacto

| Indicador | Línea Base 2024 | Meta 2026 |
|-----------|-----------------|-----------|
| **Accidentes Totales** | 2,450/año | -15% (2,082) |
| **Accidentes Graves** | 612/año | -20% (489) |
| **Tiempo Emergencia** | 25 min promedio | 12 min promedio |
| **Adopción ciudadanía** | 5% reportes | 40%+ reportes |
| **ROI** | N/A | Costo operativo vs vidas salvadas |

### Métricas de Sostenibilidad

- **Documentación:** 100% de módulos documentados
- **Código:** Disponible en GitHub para reutilización
- **Capacitación:** Manuales de usuario y programador
- **Mantenimiento:** Plan de updates y patches

---

## CONCLUSIONES

### Logros del Proyecto

✅ **Sistema integral** que consolida accidentalidad en tiempo real  
✅ **Inteligencia artificial** para predicción y análisis automático  
✅ **App móvil PWA** que funciona sin conexión  
✅ **Integración multimodal** con cámaras, APIs, reportes ciudadanos  
✅ **Panel operativo** con control SLA y alertas automáticas  
✅ **Medición de impacto** mediante análisis comparativo  
✅ **Sostenibilidad** con documentación y transferencia tecnológica  

### Impacto Esperado

🎯 **Seguridad Vial:** Reducir accidentes graves en 20% mediante intervención preventiva  
🎯 **Respuesta Operativa:** Mejorar tiempo de atención de 25 a 12 minutos  
🎯 **Información Ciudadana:** Empoderamiento con datos públicos transparentes  
🎯 **Decisiones Basadas en Datos:** Análisis predictivo para políticas viales  
🎯 **Escalabilidad:** Modelo reutilizable para otros municipios  

### Próximas Fases (Futuro)

- Integración con transporte público
- Análisis de comportamiento de conductores
- Gamification para reportes ciudadanos
- Realidad aumentada (AR) para visualización
- IoT de sensores viales
- Integración con seguros automotrices
- Análisis con Deep Learning más avanzado

---

**Documento elaborado:** Abril 2026  
**Versión:** 1.0 Completa  
**Clasificación:** Uso interno / Público

---

*CrashMap Cartagena - Transformando datos en seguridad vial*
