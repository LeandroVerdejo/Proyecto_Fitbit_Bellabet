-- Verifica duplicados
SELECT 
  Id,
  ActivityDate,
  COUNT(*) AS cantidad
FROM `caso-de-estudio-463900.caso_de_estudio_463900.daily_activity`
GROUP BY Id, ActivityDate
HAVING COUNT(*) > 1;

-- Verifica valores nulos
SELECT 
  COUNTIF(Id IS NULL) AS id_nulos,
  COUNTIF(ActivityDate IS NULL) AS fecha_nula,
  COUNTIF(TotalSteps IS NULL) AS pasos_nulos,
  COUNTIF(Calories IS NULL) AS calorias_nulas
FROM `caso-de-estudio-463900.caso_de_estudio_463900.daily_activity`;

-- Verifica revisión de formatos y tipos de datos
SELECT
  Id,
  ActivityDate,
  TotalSteps,
  TotalDistance,
  Calories
FROM `caso-de-estudio-463900.caso_de_estudio_463900.daily_activity`
LIMIT 10;

-- Creación de tabla limpia
CREATE OR REPLACE VIEW `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean` AS
SELECT
  Id,
  ActivityDate,
  TotalSteps,
  TotalDistance,
  VeryActiveMinutes,
  SedentaryMinutes,
  Calories
FROM `caso-de-estudio-463900.caso_de_estudio_463900.daily_activity`
GROUP BY Id, ActivityDate, TotalSteps, TotalDistance, VeryActiveMinutes, SedentaryMinutes, Calories;

-- Calculo de pasos promedio
SELECT
  ROUND(AVG(TotalSteps), 0) AS promedio_pasos
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean`;

-- Calculo de minutos activos y sedentarios
SELECT
  ROUND(AVG(VeryActiveMinutes), 1) AS activo_alto,
  ROUND(AVG(SedentaryMinutes), 1) AS sedentario
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean`;

-- Relación entre pasos y calorías
SELECT
  TotalSteps,
  Calories
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean`
ORDER BY TotalSteps DESC
LIMIT 100;

-- Agregar VeryActiveMinutes para comparar
SELECT
  TotalSteps,
  VeryActiveMinutes,
  Calories
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean`
ORDER BY Calories DESC
LIMIT 100;

-- Vista limpia para SleepDay
CREATE OR REPLACE VIEW `caso-de-estudio-463900.caso_de_estudio_463900.vw_sleep_day_clean` AS
SELECT
  Id,
  PARSE_DATE('%m/%d/%Y', REGEXP_EXTRACT(SleepDay, r'(\d+/\d+/\d+)')) AS FechaSueno,
  TotalSleepRecords,
  TotalMinutesAsleep,
  TotalTimeInBed
FROM `caso-de-estudio-463900.caso_de_estudio_463900.sleep_day`;

-- Análisis de sueño promedio
SELECT
  ROUND(AVG(TotalMinutesAsleep), 1) AS promedio_sueno
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_sleep_day_clean`;

-- Unión de tablas
SELECT
  a.Id,
  a.FechaActividad,
  a.TotalSteps,
  a.VeryActiveMinutes,
  a.SedentaryMinutes,
  a.Calories,
  s.TotalMinutesAsleep,
  s.TotalTimeInBed
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean` AS a
LEFT JOIN `caso-de-estudio-463900.caso_de_estudio_463900.vw_sleep_day_clean` AS s
ON a.Id = s.Id AND a.FechaActividad = s.FechaSueno;

-- Sueño promedio por categoría de pasos
SELECT
  CASE
    WHEN TotalSteps < 5000 THEN 'Bajo'
    WHEN TotalSteps BETWEEN 5000 AND 9999 THEN 'Moderado'
    ELSE 'Alto'
  END AS CategoriaPasos,
  ROUND(AVG(TotalMinutesAsleep), 1) AS PromedioSueno
FROM (
  SELECT
    a.Id,
    a.FechaActividad,
    a.TotalSteps,
    s.TotalMinutesAsleep
  FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean` AS a
  LEFT JOIN `caso-de-estudio-463900.caso_de_estudio_463900.vw_sleep_day_clean` AS s
  ON a.Id = s.Id AND a.FechaActividad = s.FechaSueno
  WHERE s.TotalMinutesAsleep IS NOT NULL
)
GROUP BY CategoriaPasos
ORDER BY CategoriaPasos;

-- Sueño vs pasos (scatter plot)
SELECT
  TotalMinutesAsleep,
  TotalSteps
FROM (
  SELECT
    a.Id,
    a.FechaActividad,
    a.TotalSteps,
    s.TotalMinutesAsleep
  FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean` AS a
  LEFT JOIN `caso-de-estudio-463900.caso_de_estudio_463900.vw_sleep_day_clean` AS s
  ON a.Id = s.Id AND a.FechaActividad = s.FechaSueno
  WHERE s.TotalMinutesAsleep IS NOT NULL
);

-- Minutos intensos vs sueño, generación de dato para exportar en formato KPI a PBI
SELECT
  ROUND(AVG(a.VeryActiveMinutes), 1) AS PromedioMinutosIntensos,
  ROUND(AVG(s.TotalMinutesAsleep), 1) AS PromedioSueno
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_daily_activity_clean` AS a
JOIN `caso-de-estudio-463900.caso_de_estudio_463900.vw_sleep_day_clean` AS s
ON a.Id = s.Id AND a.FechaActividad = s.FechaSueno;

-- Vista para KPI de calorías a PBI
CREATE OR REPLACE VIEW `caso-de-estudio-463900.caso_de_estudio_463900.vw_kpi_calorias` AS
SELECT
  ROUND(AVG(Calories), 1) AS PromedioCalorias
FROM `caso-de-estudio-463900.caso_de_estudio_463900.vw_actividad_sueno_unida`;


