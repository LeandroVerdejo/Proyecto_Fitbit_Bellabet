# 📊 Caso de Estudio: Análisis de datos de Fitbit para Bellabeat

> Proyecto de análisis exploratorio y generación de insights estratégicos para orientar la estrategia de marketing de Bellabeat, empresa tecnológica enfocada en bienestar femenino.

---

## 🗂️ Descripción general

Este proyecto corresponde al análisis de un conjunto de datos simulados de uso de dispositivos Fitbit. El objetivo es entender hábitos de actividad física y descanso de las usuarias y generar recomendaciones de marketing personalizadas para la empresa Bellabeat.

El estudio contempla limpieza de datos, exploración, análisis estadístico y generación de visualizaciones que fundamentan las conclusiones.

---

## 🎯 Objetivos

- Identificar tendencias clave en el comportamiento de usuarias de dispositivos inteligentes (Fitbit).
- Evaluar relación entre actividad física, gasto calórico y sueño.
- Generar recomendaciones accionables para la estrategia de marketing de Bellabeat.

---

## 🧩 Preguntas guía

- ¿Cuáles son las tendencias en la actividad física y el descanso de los usuarios?
- ¿Existen relaciones o patrones entre pasos diarios, calorías quemadas y minutos de sueño?
- ¿Qué insights pueden servir para segmentar y personalizar la comunicación de Bellabeat?
- ¿Qué recomendaciones se pueden proponer para mejorar la estrategia de marketing?

---

## 🗃️ Contenido del repositorio

- 📁 `notebooks/` : notebooks o scripts SQL para limpieza y análisis.
- 📁 `data/` : datasets originales o muestras representativas (respetando licencias).
- 📁 `outputs/` : tablas limpias o vistas generadas en BigQuery.
- 📁 `reports/` : informe final en formato Word/PDF.
- 📁 `visualizations/` : capturas o dashboards de Power BI exportados.
- 📄 `README.md` : este archivo.

---

## 🛠️ Herramientas utilizadas

- Google BigQuery (SQL para limpieza y consultas)
- Microsoft Power BI (visualización de datos)
- Excel (soporte para visuales simples)
- Python (opcional para documentación y exportes)
- Markdown (documentación)

---

## 📈 Principales resultados y hallazgos

- **Relación pasos–calorías:** no lineal, indicando que el gasto calórico depende más de la intensidad de la actividad que del conteo bruto de pasos.
- **Segmentación por nivel de pasos:** las usuarias más activas tienden a dormir menos minutos en promedio (~6.6 hrs) que las menos activas (~7.5 hrs).
- **Sueño vs pasos:** dispersión alta sin correlación lineal clara. Usuarios que duermen mucho (>10 h) suelen ser más sedentarios.
- **Promedio actividad intensa:** ~25 min/día, adecuado pero mejorable.
- **Insight clave:** el bienestar debe abordarse de forma integral, combinando movimiento, intensidad adecuada y descanso.

---

## 💡 Recomendaciones estratégicas para Bellabeat

✅ Promover el descanso como hábito independiente.  
✅ Educar sobre la importancia de la intensidad de la actividad.  
✅ Fomentar un equilibrio entre movimiento y recuperación.  
✅ Segmentar mensajes educativos según nivel de actividad.  

---

## 📌 Cómo replicar este proyecto

1️⃣ Clonar este repositorio.  
2️⃣ Acceder a las consultas SQL en `/notebooks` o en el anexo del informe.  
3️⃣ Ejecutar las vistas en Google BigQuery para limpieza y unión de tablas.  
4️⃣ Conectar BigQuery a Power BI para visualizar dashboards propuestos.  
5️⃣ Revisar el informe final para interpretación de resultados y recomendaciones.

---

## 📜 Licencia

Este proyecto es educativo y está basado en datos públicos simulados (Fitabase/Kaggle). Uso libre para fines académicos o demostrativos.
https://www.kaggle.com/datasets/arashnic/fitbit

---

## 🙋‍♂️ Autor

**Leandro Verdejo Marileo**  
- Ingeniero civil industrial.  
- Análisis de datos, procesos y optimización operacional.  
- https://www.linkedin.com/in/leandro-ariel-verdejo-marileo-11b894229/
---
