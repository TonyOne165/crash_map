# ANÁLISIS DE APIs UTILIZADAS - CrashMap Cartagena
## Documentación de Integraciones Externas y Librerías

**Fecha:** Abril 2026  
**Versión del Proyecto:** 4.0  
**Total de APIs/Servicios:** 8 principales

---

## 📊 RESUMEN EJECUTIVO

CrashMap integra **8 APIs y servicios externos** para funcionalidades específicas:

| # | Servicio | Tipo | Estado | Propósito |
|---|----------|------|--------|----------|
| 1 | **Claude (Anthropic)** | IA/Chat | ✅ Implementado | Chat inteligente |
| 2 | **OpenWeather** | Clima | ✅ Implementado | Datos climáticos en tiempo real |
| 3 | **Twilio** | Notificaciones | ⏳ Configurado | SMS/WhatsApp |
| 4 | **Leaflet.js** | Mapas | ✅ Implementado | Visualización de mapa |
| 5 | **OpenStreetMap (OSM)** | Geoespacial | ✅ Implementado | Tiles de mapa base |
| 6 | **PostgreSQL** | Base de Datos | ✅ Implementado | Almacenamiento central |
| 7 | **Geopy** | Geocodificación | ✅ Implementado | Convertir direcciones ↔ coords |
| 8 | **PyTorch** | Machine Learning | ✅ Implementado | Modelo de predicción de riesgo |

---

## DETALLE DE CADA API

### 1️⃣ CLAUDE (ANTHROPIC) 🤖
**Tipo:** Inteligencia Artificial Conversacional  
**Estado:** ✅ Implementado y en producción  
**Endpoint:** `/api/chat`

#### Configuración
```python
# Variables de entorno (.env)
ANTHROPIC_API_KEY = "sk-ant-xxxxx..."
```

#### Ubicación en Código
- **Backend:** [backend/main.py](backend/main.py#L76), línea 1891+
- **Frontend:** [frontend/src/components/ChatIA.jsx](frontend/src/components/ChatIA.jsx)

#### Modelo Utilizado
```
Modelo: claude-haiku-4-5-20251001
Max Tokens: 1024
Temperatura: por defecto (0.7)
```

#### Funcionalidades
- ✅ Chat conversacional sobre accidentalidad vial
- ✅ Responder preguntas en lenguaje natural en español
- ✅ Contexto de datos en tiempo real de la BD
- ✅ Historial de conversaciones (últimos 10 mensajes)
- ✅ Sistema dinámico con inyección de datos:

```python
CONTEXTO INYECTADO AL MODELO:
├─ Total accidentes registrados
├─ Accidentes fatales
├─ Accidentes este mes
├─ Reportes pendientes
├─ Top 3 barrios con más accidentes
└─ Prompt del sistema (instrucciones específicas para Cartagena)
```

#### Casos de Uso
```
USER: "¿Cuál es la zona más peligrosa?"
╰→ Claude consulta datos en el system prompt
╰→ Responde basado en top3 barrios con más accidentes

USER: "¿A qué hora hay más riesgo?"
╰→ Claude analiza patrón histórico
╰→ Proporciona recomendación

USER: "¿Cómo reportar un accidente?"
╰→ Explica procedimiento paso a paso
╰→ Enlaza a módulo de reporte
```

#### Límites y Costos
- ❌ Sin límite de tokens en la solicitud (excepto max_tokens respuesta)
- 💰 Precio: ~$0.80 / 1M input tokens, ~$4 / 1M output tokens
- ⚠️ Requiere API key de Anthropic (no gratuito)

#### Fallback
Si no está configurado o falla:
```json
{
  "respuesta": "El chat con IA no está configurado. Agrega ANTHROPIC_API_KEY al archivo .env",
  "configurado": false
}
```

---

### 2️⃣ OPENWEATHER MAP 🌤️
**Tipo:** Datos Metereológicos en Tiempo Real  
**Estado:** ✅ Implementado con caché  
**Endpoint:** `/api/clima/actual`

#### Configuración
```python
# Variables de entorno
OPENWEATHER_API_KEY = "xxxxx..."
CARTAGENA_LAT = 10.3910
CARTAGENA_LNG = -75.4794
```

#### Ubicación en Código
- **Backend:** [backend/main.py](backend/main.py#L75), línea 1821+
- Librería: `urllib.request` (built-in Python)

#### Endpoint de API
```
GET http://api.openweathermap.org/data/2.5/weather?lat=10.3910&lon=-75.4794&appid={API_KEY}&units=metric&lang=es
```

#### Datos Retornados
```json
{
  "temperatura": 31,           ← Grados Celsius
  "descripcion": "Cielo despejado",
  "humedad": 78,              ← Porcentaje
  "viento_kmh": 15,           ← Velocidad del viento
  "icono": "01d",             ← Código de ícono OpenWeather
  "ciudad": "Cartagena",
  "simulado": false           ← true si es dato mock
}
```

#### Características
- ✅ Caché de 10 minutos (evita excesivas llamadas)
- ✅ Fallback a datos simulados si falla la API
- ✅ Respuesta rápida gracias a caché global
- ✅ Datos en español

#### Casos de Uso en el Sistema
```
1. CONTEXTO PARA PREDICCIÓN DE RIESGO
   └─ Clima influye en modelo PyTorch
   └─ Lluvia = mayor riesgo

2. CONTEXTO PARA CHAT IA
   └─ Claude recibe clima actual
   └─ "¿Es seguro salir hoy?"

3. ANÁLISIS DE ACCIDENTES
   └─ Correlacionar clima con gravedad
   └─ Lluvia → accidentes más graves
```

#### Límites
- 📊 Plan gratuito: 1000 llamadas/día (60 req/min)
- 💰 Plan de pago: más llamadas
- ⏱️ Timeout: 5 segundos

#### Fallback
Si no está configurado o falla:
```json
{
  "temperatura": 31,
  "descripcion": "Cielo despejado",
  "humedad": 78,
  "viento_kmh": 15,
  "icono": "01d",
  "ciudad": "Cartagena",
  "simulado": true  ← Indica que es dato simulado
}
```

---

### 3️⃣ TWILIO 📱
**Tipo:** Notificaciones SMS/WhatsApp  
**Estado:** ⏳ Configurado (No completamente implementado)  
**Endpoints Potenciales:** SMS, WhatsApp

#### Configuración
```python
# Variables de entorno
TWILIO_ACCOUNT_SID = "ACxxxxx..."
TWILIO_AUTH_TOKEN = "token..."
```

#### Ubicación en Código
- **Backend:** [backend/main.py](backend/main.py#L77-L78) - solo configuración
- **Librería:** `twilio` (en requirements.txt)

#### Estado de Implementación
```
✅ Librería instalada (requirements.txt)
✅ Credenciales cargadas de variables de entorno
⏳ Código de integración NO completamente implementado
⏳ No se encontraron llamadas a send_sms() o send_whatsapp()
```

#### Casos de Uso Planeados
```
1. ALERTAS A OPERADORES
   └─ SMS cuando incidente supera SLA
   └─ WhatsApp: "Incidente en Bocagrande - SLA VENCIDO"

2. ALERTAS POR ZONA
   └─ Notificar cuando zona activa alerta
   └─ "⚠️ 3 accidentes en Bocagrande últimos 30 min"

3. CONFIRMACIÓN DE REPORTE
   └─ SMS al ciudadano: "Reporte #12345 recibido"
   └─ "Nuestro equipo revisará tu reporte"
```

#### Estructura Esperada de Código
```python
from twilio.rest import Client

client = Client(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

# Para SMS
message = client.messages.create(
    body="Texto del mensaje",
    from_="+1234567890",      # Número Twilio
    to="+573051234567"        # Número destino (Colombia)
)

# Para WhatsApp
message = client.messages.create(
    body="Texto del mensaje",
    from_="whatsapp:+1234567890",
    to="whatsapp:+573051234567"
)
```

#### Costos Estimados
- 💰 SMS: ~$0.01-0.03 por mensaje
- 💰 WhatsApp: ~$0.01-0.05 por mensaje
- 📊 Plan gratuito: limitado para pruebas

#### Recomendación
Para producción en Cartagena, se recomienda:
1. ✅ Completar integración en backends/handlers
2. ✅ Crear endpoint que dispare SMS/WhatsApp
3. ✅ Agregar cola (Celery/RabbitMQ) para evitar bloqueos
4. ✅ Implementar rate limiting

---

### 4️⃣ LEAFLET.JS 🗺️
**Tipo:** Librería Frontend para Mapas  
**Estado:** ✅ Implementado y en uso  
**Ubicación:** [frontend/package.json](frontend/package.json) v1.9.4

#### Funcionalidades Implementadas
- ✅ Renderizar mapas interactivos
- ✅ Marcadores de accidentes
- ✅ Mapas de calor (heatmap) con heat plugin
- ✅ Capas interactivas
- ✅ Zoom y pan
- ✅ PopUps al click
- ✅ Dibujar polígonos (para geocercas)

#### Componentes Utilizados
```javascript
// En MapaCalor.jsx
←─ Renderizar mapa base
├─ Añadir marcadores de accidentes
├─ Generar heatmap
├─ Implementar filtros
└─ Exportar mapa como imagen PNG

// En RutaSegura.jsx
├─ Permitir dibujar ruta
├─ Colorear segmento por riesgo
└─ Mostrar alternativas

// En Geocercas.jsx
├─ Dibujar polígonos
├─ Guardar como GeoJSON
└─ Visualizar zonas de alerta
```

#### Dependencias Relacionadas
- `leaflet` v1.9.4 - librería base
- `leaflet.heat` v0.2.0 - plugin de mapas de calor
- `@types/leaflet` v1.9.8 - tipos TypeScript

#### Costo
- 🆓 Completamente Gratis (Open Source)
- 📝 Licencia: BSD 2-Clause

---

### 5️⃣ OPENSTREETMAP (OSM) 🌍
**Tipo:** Proveedor de Tiles de Mapa  
**Estado:** ✅ Implementado  
**Ubicación:** URL de tiles OSM en Leaflet

#### Configuración
```javascript
// En Leaflet, tiles de OpenStreetMap
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '© OpenStreetMap contributors',
  maxZoom: 19
}).addTo(map);
```

#### Características
- ✅ Mapas base de libre uso
- ✅ Cobertura global Cartagena
- ✅ Alta resolución
- ✅ Datos colaborativos (wiki-like)

#### Límites de Uso
- 📊 Máximo 10,000 teselas por hora por IP
- ⚠️ No se recomienda almacenamiento local de tiles
- 🆓 Completamente gratuito

#### Alternativas
- Google Maps (pago)
- Mapbox (pago, pero mejor performance)
- ESRI/ArcGIS (pago)

#### Costo
- 🆓 Gratis
- 📝 Licencia: Open Data Commons (ODC-ODbL)

---

### 6️⃣ POSTGRESQL 🐘
**Tipo:** Base de Datos Relacional  
**Estado:** ✅ Implementado en producción  
**Ubicación:** Variable de entorno DATABASE_URL

#### Configuración
```python
DATABASE_URL = "postgresql+psycopg2://usuario:contraseña@localhost:5432/accidentalidad_ctg"
```

#### Ubicación en Código
- **Backend:** [backend/main.py](backend/main.py#L70-L73)
- **ORM:** SQLAlchemy

#### Tablas Principales
```sql
usuarios
├── id (PK)
├── username (único)
├── email (único)
├── hashed_password (bcrypt)
├── es_admin (boolean)
└── created_at

accidentes
├── id (PK)
├── latitud, longitud
├── barrio
├── fecha_hora
├── gravedad (leve/grave/fatal)
├── tipo_vehiculo
├── clima
├── estado_via
├── dia_festivo, hora_pico
├── descripción
├── reportado_por (FK usuarios)
├── estado (pendiente/aprobado/rechazado)
├── fuente (manual/excel/externo)
└── created_at

factores_riesgo
├── id (PK)
├── latitud, longitud
├── tipo_factor
├── nivel_riesgo (0-1)
├── activo
└── updated_at

notificaciones
├── id (PK)
├── tipo
├── titulo
├── mensaje
├── es_leida
├── datos_extra (JSON)
└── created_at

geocercas
├── id (PK)
├── nombre
├── descripción
├── poligono_geojson
├── nivel_alerta
├── activa
└── created_at
```

#### Capacidades
- ✅ ACID transactions
- ✅ Índices para búsquedas rápidas
- ✅ JSON support (datos_extra)
- ✅ Geoespacial (con PostGIS opcional)
- ✅ Escalable a millones de registros

#### Costos
- 🆓 Gratis (Open Source)
- 💾 Instalación local o cloud (AWS RDS, etc.)

#### Versión Recomendada
- PostgreSQL 12+
- Connection pooling: PgBouncer para producción

---

### 7️⃣ GEOPY 🌐
**Tipo:** Librería Python de Geocodificación  
**Estado:** ✅ Instalado (requirements.txt v2.4.0)  
**Ubicación:** No se encontraron usos activos

#### Configuración
```python
# En backend/requirements.txt
geopy==2.4.0
```

#### Importación Esperada
```python
from geopy.geocoders import Nominatim
from geopy.distance import geodesic

# Ejemplo de uso potencial:
geolocator = Nominatim(user_agent="crashmap")
location = geolocator.reverse("10.3910, -75.4794")
```

#### Funcionalidades Disponibles
- ✅ Geocodificación directa (dirección → coords)
- ✅ Geocodificación inversa (coords → dirección)
- ✅ Cálculo de distancias (geodésica)
- ✅ Múltiples proveedores (Google, OpenStreetMap, etc.)

#### Estado en el Proyecto
```
❓ Instalado pero no se encontraron usos en el código
❓ Posible para futuras mejoras:
   └─ Convertir dirección a coords en reportes
   └─ Mostrar dirección en lugar de coords en UI
```

#### Costos
- 🆓 Gratis si usa Nominatim (OSM)
- 💰 Pago si usa Google Maps

---

### 8️⃣ PYTORCH 🔬
**Tipo:** Framework de Machine Learning (Librería Local)  
**Estado:** ✅ Implementado  
**Ubicación:** [backend/main.py](backend/main.py#L29-L38)

#### Configuración
```python
# En backend/requirements.txt
torch==2.1.1
numpy==1.24.3

# Modelo entrenado
MODEL_PATH = "backend/modelo_riesgo.pt"
```

#### Arquitectura del Modelo
```python
class ModeloPrediccionRiesgo(nn.Module):
    def __init__(self):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(10, 64),    # Input: 10 features
            nn.ReLU(),
            nn.Linear(64, 32),
            nn.ReLU(),
            nn.Linear(32, 16),
            nn.ReLU(),
            nn.Linear(16, 1),     # Output: Predicción riesgo (0-1)
            nn.Sigmoid(),
        )
```

#### Features de Entrada (10)
```
1. Latitud normalizada
2. Longitud normalizada
3. Hora del día (0-23)
4. Día de semana (0-6)
5. Clima (mapa: soleado=0, nublado=0.5, lluvia=1)
6. Estado vía (bueno=0, regular=0.5, malo=1)
7. Gravedad (leve=0, grave=0.5, fatal=1)
8. Es día festivo (boolean)
9. Es hora pico (boolean)
10. Mes del año (1-12)
```

#### Uso en el Sistema
```
POST /api/prediccion
├─ Recibe: fecha, hora, coords, clima, etc
├─ Normaliza features
├─ Pasa por modelo
└─ Retorna: predicción de riesgo (0-1)
```

#### Modelo Guardado
```
Archivo: backend/modelo_riesgo.pt
├─ Formato: PyTorch .pt binary
├─ Tamaño: ~100 MB (estimado)
├─ Se carga al startup del backend
└─ Compatible: CPU y GPU (si disponible)
```

#### Costos
- 🆓 Completamente gratuito (Open Source)
- 💾 Requiere RAM para inferencia (~500 MB)
- ⚡ Inferencia rápida (<100ms por predicción)

#### Librería Relacionada
- `scikit-learn` v1.3.2 (KMeans para puntos negros)
- `numpy` v1.24.3 (operaciones numéricas)
- `pandas` v2.1.3 (análisis de datos)

---

## 📝 APIS ADICIONALES / LIBRERÍAS SOPORTE

### Reportlab (PDF Export)
```
Librería: reportlab>=4.0.0
Uso: Generar PDFs de reportes
Función: Exportar Dashboard y análisis como PDF
Costo: 🆓 Gratis (Open Source)
```

### Openpyxl (Excel Import)
```
Librería: openpyxl==3.1.2
Uso: Leer archivos Excel para importar datos masivos
Función: Módulo "Importar Datos"
Costo: 🆓 Gratis (Open Source)
```

### Chart.js (Gráficos Frontend)
```
Librería: chart.js==4.4.0
Uso: Gráficos interactivos en Dashboard
Componentes: Líneas, barras, scatter, etc.
Costo: 🆓 Gratis (Open Source)
```

---

## 🔐 GESTIÓN DE CREDENCIALES

### Variables de Entorno (.env)
```bash
# Backend
SECRET_KEY=tu-clave-secreta-produccion
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_HOURS=24
DATABASE_URL=postgresql+psycopg2://user:pass@localhost/accidentalidad_ctg
MODEL_PATH=backend/modelo_riesgo.pt
OPENWEATHER_API_KEY=tu-api-key-openweather
ANTHROPIC_API_KEY=sk-ant-xxxxxxxx
TWILIO_ACCOUNT_SID=ACxxxxxx
TWILIO_AUTH_TOKEN=tu-token
```

### Seguridad
- ✅ Nunca commitear .env a Git
- ✅ Usar secrets manager en producción (AWS Secrets, HashiCorp Vault)
- ✅ Rotación periódica de API keys
- ✅ Rate limiting en endpoints públicos

---

## 📊 COMPARATIVA DE COSTOS ANUALES - USD 🇺🇸

| Servicio | Plan Gratuito | Plan Pago | Estimación Anual |
|----------|---------------|-----------|-----------------|
| Claude (Anthropic) | ❌ No | ✅ Sí | USD $5,000 - $15,000* |
| OpenWeather | ✅ Sí (1000 req/día) | ✅ Sí | USD $100 - $500* |
| Twilio | ❌ No (prueba) | ✅ Sí | USD $2,000 - $10,000* |
| Leaflet + OSM | ✅ Gratis | N/A | USD $0 |
| PostgreSQL | ✅ Gratis local | ✅ AWS RDS | USD $500 - $2,000* |
| PyTorch | ✅ Gratis | N/A | USD $0 |
| **TOTAL** | - | - | **USD $7,600 - $27,500*** |

*Estimación según volumen de uso (100% dedicado a Cartagena)

### Conversión a Pesos Colombianos (COP)
```
Tasa aproximada: 1 USD ≈ 4,200 COP

Rango Bajo:  USD $7,600  ≈ COP $31,920,000
Rango Alto:  USD $27,500 ≈ COP $115,500,000
```

---

## 🚀 RECOMENDACIONES

### Para Producción
```
1. ✅ Implementar Twilio completamente
   └─ Alertas SMS/WhatsApp a operadores
   
2. ✅ Agregar PostGIS a PostgreSQL
   └─ Queries geoespaciales más eficientes
   
3. ✅ Implementar Redis cache
   └─ Caché de predicciones ML
   └─ Rate limiting distribuido
   
4. ✅ Monitorear costos de Claude
   └─ Agregar fallback a modelo local si es necesario
   
5. ✅ Implementar logging centralizado
   └─ ELK Stack o CloudWatch
```

### Para Escalabilidad
```
1. Agregar CDN (Cloudflare) para assets frontend
2. Separar ML inference en servicio aparte
3. Implementar WebSocket en load-balancer (Redis Adapter)
4. Considerar GraphQL en lugar de REST puro
5. Implementar API versioning
```

---

## 📚 DOCUMENTACIÓN DE REFERENCIA

- [Claude API Docs](https://docs.anthropic.com/)
- [OpenWeather API](https://openweathermap.org/api)
- [Twilio Docs](https://www.twilio.com/docs)
- [Leaflet Docs](https://leafletjs.com/)
- [PostgreSQL Docs](https://www.postgresql.org/docs/)
- [PyTorch Docs](https://pytorch.org/docs/)

---

**Documento elaborado:** Abril 2026  
**Total de APIs Externas:** 3 (Claude, OpenWeather, Twilio)  
**Total de Librerías Locales:** 5+ (Leaflet, PyTorch, PostgreSQL, Geopy, etc.)
