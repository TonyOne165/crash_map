# MODELO DE PRICING Y MONETIZACIÓN
## CrashMap Cartagena - Propuesta para Fundadores

**Fecha:** Abril 2026  
**Escenario:** 2 Fundadores/Desarrolladores como encargados de mantenimiento y operación  
**Objetivo:** Sostenibilidad financiera + ganancia justa

---

## 📊 ANÁLISIS FINANCIERO ACTUAL

### Costos Fijos Mensuales (Operación Mínima)

```
INFRAESTRUCTURA & APIs:
├─ PostgreSQL (AWS RDS t3.small)           USD $75
├─ Backend (EC2 t3.small)                  USD $40
├─ Cloudflare CDN + DDoS protection        USD $50
├─ Claude API (caché inteligente)          USD $400 (promedio)
├─ OpenWeather API                         USD $30
├─ Twilio (SMS/WhatsApp)                   USD $300 (prom. 10k msgs/mes)
├─ Backup & Logging (S3)                   USD $25
└─ Dominios & SSL                          USD $20

SUBTOTAL INFRAESTRUCTURA:                  USD $940/mes

RECURSOS HUMANOS (2 personas):
├─ Salary Developer #1 (Senior)            USD $2,500 (COP $10.5M)
├─ Salary Developer #2 (Full-stack)        USD $2,000 (COP $8.4M)
├─ 25% Beneficios/Contribuciones           USD $1,125
└─ Herramientas dev (GitHub, etc)          USD $100

SUBTOTAL RR.HH:                            USD $5,725/mes

MISCELÁNEOS:
├─ Versiones (patches, updates)            USD $100
├─ Seguros/Legal                           USD $50
└─ Marketing/Documentación                 USD $75

SUBTOTAL MISC:                             USD $225/mes

═══════════════════════════════════════════
COSTO TOTAL OPERATIVO MENSUAL:             USD $6,890/mes
COSTO ANUAL:                               USD $82,680/año
```

---

## 💰 MODELO 1: CONTRATO DE SERVICIO MENSUAL (SLA-Based)

**Estructura:** Cuota mensual fija + variable según performance

### Opción 1A: BÁSICO
```
CUOTA BASE MENSUAL:                        USD $7,500/mes
                                          (COP $31.5M)

SLAS & PENALTIES:
├─ Uptime: 99.5% → Cumple: +0%
├─ Uptime: <99% → -5% del mes
├─ Respuesta incidentes: <1h → +10%
├─ Response time API: <500ms → +5%

SLA AJUSTADO (ejemplo):                    USD $7,500 a $8,250/mes

ANUAL:                                     USD $90,000 - $99,000/año
```

**Ventajas:**
- ✅ Predecible para ambas partes
- ✅ Cubre costos + margen justo (30%)
- ✅ Fácil de facturar
- ✅ Incentiva buena performance

**Desventajas:**
- ❌ Limitado a un cliente (Secretaría)
- ❌ Margen bajo para crecimiento
- ❌ Sin escalabilidad

---

### Opción 1B: PROFESIONAL (Recomendado)
```
CUOTA BASE MENSUAL:                        USD $10,000/mes
                                          (COP $42M)

INCLUYE:
├─ Monitoreo 24/7/365
├─ Respuesta incidentes: <1 hora
├─ Actualizaciones mensuales
├─ Reportes de analytics
├─ Soporte por email + teléfono
├─ 2 nuevas features por trimestre
└─ Auditoría de seguridad trimestral

ADICIONALES (if needed):
├─ Feature custom: USD $2,000-5,000/c.u.
├─ Integración terceros: USD $1,500-3,000/c.u.
├─ Capacitación operadores: USD $1,000/sesión
└─ Consultoría estratégica: USD $500/hora

ANUAL BASE:                                USD $120,000/año
PROMEDIO CON ADICIONALES:                  USD $150,000-180,000/año
```

**Ventajas:**
- ✅ Cubre costos con ganancia razonable (40-50%)
- ✅ Permite crecer con nuevas features
- ✅ Valor agregado claro
- ✅ Sostenible para 2 developers

**Desventajas:**
- ❌ Aún limitado a un cliente
- ❌ Riesgo de pérdida de cliente

---

## 💰 MODELO 2: FREEMIUM + PREMIUM (Multi-cliente)

**Estructura:** Versión gratis limitada, pagar por features premium

### Usuarios del Sistema Público (Sin costo)
```
Panel Público:
├─ Acceso a estadísticas generales
├─ Mapa de calor historiales
├─ Chat IA limitado (5 chats/día)
└─ Reporte de accidentes ciudadano

COSTO PARA USUARIO: USD $0
```

### Plan MUNICIPAL (Mínimo)
```
CUOTA MENSUAL:                             USD $8,000/mes
                                          (COP $33.6M)

INCLUYE:
├─ Dashboard operativo completo
├─ Gestión incidentes (SLA)
├─ Chat IA ilimitado
├─ Alertas por zona (5 zonas)
├─ Predicción riesgo básica
├─ Soporte horario (8am-6pm)
└─ 1 usuario admin + 5 operadores

USUARIOS ADICIONALES:                      USD $100/mes c/u
ZONAS ADICIONALES (>5):                    USD $200/mes c/u
```

---

### Plan INTEGRAL (Recomendado para Cartagena)
```
CUOTA MENSUAL:                             USD $12,000/mes
                                          (COP $50.4M)

INCLUYE (TODO de Municipal PLUS):
├─ Cámaras de tránsito integradas (20)
├─ Análisis interanual completo
├─ Puntos negros con clustering avanzado
├─ IA predictiva 24/72 hrs adelante
├─ Alertas ilimitadas por zona
├─ Integración con sistemas externos
├─ Soporte 24/7 (emergencias)
├─ 2 nuevas features trimestral
├─ Auditoría de seguridad anual
├─ 1 usuario admin + 15 operadores
├─ API abierta para terceros
└─ Reportes PDF automáticos semanales

USUARIOS ADICIONALES:                      USD $150/mes c/u
CÁMARAS ADICIONALES (>20):                 USD $300/mes c/u
INTEGRACIONES EXTERNAS:                    USD $2,000 setup + USD $500/mes

ANUAL:                                     USD $144,000 + extras
```

**Ventajas:**
- ✅ Escalable a múltiples municipios
- ✅ Margen más alto (50-60%)
- ✅ Menos dependencia de 1 cliente
- ✅ Permite crecimiento con features

---

## 💰 MODELO 3: HYBRID (Recomendado)

**Estructura:** Contrato con Cartagena + Expansión a otros municipios

### AÑO 1-2: FASE INICIAL
```
CARTAGENA (Contrato Anual):
├─ Plan Integral: USD $120,000/año
└─ Incluye: Mantenimiento + mejoras

PLUS:
├─ Expansión a 1-2 ciudades
├─ Consultoría de implementación: USD $15,000/ciudad
└─ Licencia anual (SaaS): USD $8,000/ciudad

AÑO 1 INGRESOS PROYECTADOS:               USD $140,000-165,000
MARGEN DESPUÉS COSTOS:                    USD $57,000-85,000 (dos)
POR DEVELOPER:                            USD $28,500-42,500/año
                                          Más incentivos por nuevas ciudades
```

### AÑO 3+: ESCALAMIENTO
```
CLIENTES POTENCIALES (otras ciudades):
├─ Barranquilla                            USD $120,000/año
├─ Santa Marta                             USD $80,000/año
├─ Montería                                USD $80,000/año
├─ Sincelejo                               USD $60,000/año
├─ Valledupar                              USD $60,000/año
└─ Riohacha                                USD $50,000/año

INGRESOS POSIBLES (5-6 ciudades):           USD $450,000-550,000/año

COSTOS (al escalar):
├─ Infraestructura multi-tenant: USD $3,000/mes
├─ Developer adicional (parte-time): USD $1,000/mes
└─ Otros: USD $500/mes

COSTOS VARIABLES:                          USD $54,000/año
MARGEN NETO:                               USD $396,000-496,000/año

POR FUNDADOR (2 personas):                 USD $198,000-248,000/año
```

---

## 📈 COMPARATIVA DE MODELOS

| Modelo | Año 1 | Margen | Escalabilidad | Riesgo |
|--------|-------|--------|---------------|--------|
| **Modelo 1A (Básico)** | USD $7,500/mes | 30% | Baja | Alto |
| **Modelo 1B (Prof.)** | USD $10,000/mes | 45% | Baja | Alto |
| **Modelo 2 (Freemium)** | USD $12,000/mes | 50% | Alta | Medio |
| **Modelo 3 (Hybrid)** | USD $10-15k/mes | 55% | Muy Alta | Medio |

---

## 🎯 RECOMENDACIÓN FINAL

### Para 2 Fundadores: **MODELO 3 (HYBRID)**

#### Fase 1: Contrato Base (Cartagena)
```
PROPUESTA INICIAL A SECRETARÍA DE MOVILIDAD:

Plan INTEGRAL:                             USD $12,000/mes
                                          (COP $50.4M)

CONTRATO: 2 años (mínimo)
└─ 15% descuento por duración
└─ Precio real: USD $10,200/mes (COP $42.8M)

INCLUYE:
├─ Plataforma completa + mantenimiento
├─ Monitoreo 24/7 de alertas críticas
├─ Actualizaciones mensuales
├─ Soporte técnico dedicado
├─ Reportes de ROI trimestral
├─ Capacitación continua de operadores
└─ Expansión a nuevas features según necesidades

FACTURACIÓN: Mensual o trimestral
PAGO: A 30 días de emitida factura
```

#### Fase 2: Expansión (Años 1-2)
```
Mientras Cartagena corre:
├─ Adaptar código para multi-tenant
├─ Documentación para otros municipios
├─ Prospectar 2-3 ciudades adicionales
└─ Crear SDK/API pública

Meta: 1-2 nuevos clientes año 1
Meta: 3-4 nuevos clientes año 2
```

#### Proyección de Ingresos (2 Fundadores)
```
AÑO 1:
├─ Cartagena: USD $122,400
├─ Expansión (1 ciudad): USD $20,000 (implantación)
└─ TOTAL: USD $142,400
└─ POR DEVELOPER: USD $71,200 (neto USD ~45K después impuestos)

AÑO 2:
├─ Cartagena: USD $122,400
├─ 2 ciudades nuevas: USD $160,000
└─ TOTAL: USD $282,400
└─ POR DEVELOPER: USD $141,200 (neto USD ~90K)

AÑO 3+:
├─ 5-6 ciudades activas: USD $450,000+
└─ POR DEVELOPER: USD $225,000+ (neto USD ~140K+)
```

---

## 🤝 CÓMO PRESENTAR A CARTAGENA

### PITCH A SECRETARÍA DE MOVILIDAD

```
PROBLEMA:
├─ Accidentalidad vial causando 2,500+ accidentes/año
├─ Sin visibilidad de tendencias en tiempo real
├─ Respuesta operativa lenta (25 min promedio)
└─ No hay medición de impacto de intervenciones viales

SOLUCIÓN (CrashMap):
├─ Plataforma integral de gestión de accidentalidad
├─ Panel operativo en tiempo real con SLA
├─ Predicción IA de zonas de riesgo
├─ Análisis comparativo para medir impacto
└─ Integración con cámaras, externos, apps móviles

VALOR PROPUESTO (ROI):
├─ Reducción de 15-20% de accidentes graves
├─ Mejora de respuesta operativa (25 min → 12 min)
├─ Aumento de reportes ciudadanos (5% → 40%+)
├─ Mejor asignación de recursos viales
└─ Datos para políticas públicas basadas en evidencia

COSTO vs BENEFICIO:
├─ Inversión: USD $10,200/mes (COP $42.8M)
├─ ROI estimado: USD $2-5M/año en reducción de costos sociales
├─ Payback: 3-6 meses en ahorro operativo
└─ CONCLUSIÓN: Altamente rentable para la ciudad

PROPUESTA COMERCIAL:
├─ Contrato 2 años mínimo
├─ Plan INTEGRAL con todas las features
├─ Soporte 24/7 dedicado
├─ 2 desarrolladores dedicados a mantenimiento
└─ Garantía de uptime 99.5%
```

---

## ⚖️ CONSIDERACIONES LEGALES

### Estructura Recomendada
```
OPCIÓN 1: Empresa SAS (Sociedad por Acciones Simplificada)
├─ 2 socios 50%-50%
├─ Facturación a través de empresa
├─ Contabilidad clara para impuestos
└─ Viabilidad legal para contratos públicos

OPCIÓN 2: Cooperativa de Trabajo
├─ Menos burocracia
├─ Ciertos beneficios tributarios
├─ Buena opción para 2 al inicio
└─ Escalabilidad a más socios después

OPCIÓN 3: Freelancers (menos recomendado)
├─ Facturación individual
├─ Mayor carga tributaria
├─ Limitaciones para contratos grandes
└─ No professionaliza el proyecto
```

### Aspectos Legales del Contrato
```
El contrato con la Secretaría debe incluir:
├─ SLAs (99.5% uptime, respuesta <1h emergencias)
├─ Confidencialidad de datos viales
├─ IP del código (propiedad del contratante)
├─ Duración y cláusulas de terminación
├─ Restricción de no competencia (razonable)
├─ Penalidades por incumplimiento
└─ Seguros de responsabilidad civil
```

---

## 🎬 PLAN DE ACCIÓN INMEDIATO

### SEMANAS 1-4:
```
- [ ] Constituir empresa SAS (USD $500-1000)
- [ ] Hacer presupuesto detallado de costos operativos
- [ ] Preparar propuesta profesional (Pitch deck)
- [ ] Contactar Secretaría de Movilidad de Cartagena
- [ ] Presentar MVP/Demo del sistema
```

### SEMANAS 5-8:
```
- [ ] Reuniones con stakeholders clave
- [ ] Refinar propuesta basada en feedback
- [ ] Negociar términos del contrato
- [ ] Establecer cronograma de implementación
```

### SEMANAS 9-12:
```
- [ ] Firmar contrato 2 años
- [ ] Setup de infraestructura en producción
- [ ] Entrenamiento de operadores
- [ ] Go-live en Cartagena
```

---

## 📋 CHECKLIST PARA NEGOCIACIÓN

**Antes de presentar a Cartagena, asegúrate de:**

```
TÉCNICO:
- [ ] Sistema está 100% funcional (sin bugs críticos)
- [ ] Test de carga completado (1000+ usuarios simultáneos)
- [ ] Backup y disaster recovery documentado
- [ ] Security audit realizado
- [ ] Performance optimizado (<500ms respuestas)

COMERCIAL:
- [ ] Propuesta escrita en Spanish professional
- [ ] Presupuesto detallado y transparente
- [ ] Comparativo con soluciones existentes (si hay)
- [ ] Testimonios o casos de referencia (buscar partners)
- [ ] Términos de pago claros (30/60/90 días)

LEGAL:
- [ ] Empresa constituida y legal
- [ ] Seguros de responsabilidad civil
- [ ] NIT y registro tributario
- [ ] Experiencia demostrada (cartera clientes)
- [ ] Contrato template revisado por abogado

EQUIPO:
- [ ] Portafolios profesionales de ambos developers
- [ ] Currículums detallados
- [ ] Certificaciones relevantes
- [ ] LinkedIn perfiles actualizados
- [ ] Plan de capacitación para operadores
```

---

## 💬 PREGUNTAS FRECUENTES

### P: ¿Cuánto es mucho cobrar?
**R:** En el mercado latinoamericano, plataformas similares cobran USD $15,000-20,000/mes. USD $10,200 es COMPETITIVO y JUSTO.

### P: ¿Qué pasa si pierdo el cliente?
**R:** Por eso el modelo hybrid es mejor. Con múltiples ciudades, la pérdida de una no es fatal.

### P: ¿Puedo cobrar menos para ganar el contrato?
**R:** NO. Cobrar menos significa:
- Menor margen → menos dinero para developer #2
- Riesgo de insostenibilidad
- Señal de bajo valor
- Difícil de negociar subidas después

Mejor: Demostrar valor con ROI claro para justificar precio.

### P: ¿Cuándo debería aumentar precios?
**R:** 
- Año 2: +5% anual (inflación)
- Año 3: +10% con nuevas features
- Refinanciamiento de contrato: +15-20% es aceptable

### P: ¿Qué incluye "soporte 24/7"?
**R:** 
- Respuesta a emergencias: <30 minutos
- Bugs críticos: hotfix <4 horas
- Email/teléfono para nivel 1
- Escalación a founder si es grave

---

## 🏁 CONCLUSIÓN

**Para 2 fundadores, recomendó:**

```
Modelo:              HYBRID (Contrato base + expansión)
Precio Cartagena:    USD $10,200-12,000/mes
Ingresos Año 1:      USD $140,000-160,000
Ingresos Año 3+:     USD $400,000-500,000+
Margen por dev:      USD $45,000-70,000 (año 1)
                     USD $140,000+ (año 3+)

CLAVE DEL ÉXITO:
├─ Entregar valor excepcional (99.5% uptime)
├─ Expansión a múltiples ciudades (no depender de 1)
├─ Features roadmap claro y comunicado
├─ Relación client-friendly y responsive
└─ Prepararse para escalar (eventualmente necesitarás equipo)
```

---

**Documento elaborado:** Abril 2026  
**Escenario:** 2 Fundadores - Cartagena + Expansión Caribe Colombiano
